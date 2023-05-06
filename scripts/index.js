var op="";
var id=0;
var sele_caja="";
var sele_monto=0;
var sele_encabezado="";

function formatNumber(monto){
	let result="";
	let conta=0,aux=0;
	monto=monto.toString();
	if(monto.length<3){
		return monto;
	}
	for(let a=monto.length; a>=0; a--){
		if(conta%3==0){
			aux=a;
			result=monto.substr(a,3)+" "+result;
		}else{
			if(a==0){
				result=monto.substr(0,aux)+" "+result;	
			}
		}
		conta++;
	}
	return result;
}

function getTabla(id_tabla){
	$("#tabla").html("Cargando datos...");
	$.ajax({
		url:"controllers/situacion_financiera.php?v=getTabla",
		method:"post",
		data:{
			'id_tabla':id_tabla
		},
		success:function(value){
			if(value=="500"){
				alert("ERROR EN SERVIDOR, INTENTE MÁS TARDE");
			}
			let json=eval("("+value+")");
			if(json.existe==true){
				$("#tabla").html(json.tabla);
				$("#nombre").val(json.nombre);
				$("#id").val(json.id);
			}else{
				window.location='login';
			}
		}
	})
}

function sendTabla(){
	if($("#nombre").val().replace(/ /g,"")==""){
		return 0;
	}
	$.ajax({
		url:"controllers/situacion_financiera.php?v=send",
		method:"post",
		data:{
			'nombre':$("#nombre").val(),
			'tabla':$("#tabla").html(),
			'conceptos':$("#id").val()
		},
		success:function(value){
			if(value=="500"){
				alert("ERROR EN SERVIDOR, INTENTE MÁS TARDE");
			}else{
				window.location='index';
			}
		}
	})
}

function saveTabla(id_tabla){
	if($("#nombre").val().replace(/ /g,"")==""){
		return 0;
	}
	$.ajax({
		url:"controllers/situacion_financiera.php?v=save",
		method:"post",
		data:{
			'id_tabla':id_tabla,
			'nombre':$("#nombre").val(),
			'tabla':$("#tabla").html(),
			'conceptos':$("#id").val()
		},
		success:function(value){
			if(value=="500"){
				alert("ERROR EN SERVIDOR, INTENTE MÁS TARDE");
			}else{
				window.location='index';
			}
		}
	})
}

function deleteTabla(id_tabla){
	$.ajax({
		url:"controllers/situacion_financiera.php?v=delete",
		method:"post",
		data:{
			'id_tabla':id_tabla
		},
		success:function(value){
			if(value=="500"){
				alert("ERROR EN SERVIDOR, INTENTE MÁS TARDE");
			}else{
				window.location='index';
			}
		}
	})
}

function showEncabezado(op){
	this.sele_encabezado=op;
	$("#title_encabezado").html(op.replace(/_/g," ").toUpperCase());
	$("#texto").val("");
	modal('modal_form_encabezado');
}

function changeText(){
	$("#"+this.sele_encabezado).html($("#texto").val());
	modal('modal_form_encabezado');
}

function showForm(op){
	this.op=op;
	$("#concepto").val("");
	$("#monto").val("");
	$("#title").html(op.replace(/_/g," ").toUpperCase());
	modal('modal_form_cuerpo');
}

function subTotal(monto,operador){
	let total_old=$("#total_"+this.op).html();
	total_old=total_old.replace("$","");
	total_old=total_old.replace(/ /g,"");
	let total=0;
	if(operador=="+"){
		total=Number(total_old)+Number(monto);
	}
	if(operador=="-"){
		total=Number(total_old)-Number(monto);
	}
	if(operador=="*"){
		total=Number(total_old)*Number(monto);
	}
	if(operador=="/"){
		total=Number(total_old)/Number(monto);
	}
	$("#total_"+this.op).html("$"+formatNumber(total));
	totalActivos();
	totalPasivos();
	totalPatrimonioNeto();
	ecuacionContable();
}

function totalActivos(){
	let ac=$("#total_activos_corrientes").html().replace("$","").replace(/ /g,"");
	let anc=$("#total_activos_no_corrientes").html().replace("$","").replace(/ /g,"");
	let i=$("#total_intangibles").html().replace("$","").replace(/ /g,"");
	$("#total_activos").html("$"+formatNumber((Number(ac)+Number(anc)+Number(i))));
}

function totalPasivos(){
	let pc=$("#total_pasivos_corrientes").html().replace("$","").replace(/ /g,"");
	let pnc=$("#total_pasivos_no_corrientes").html().replace("$","").replace(/ /g,"");
	$("#total_pasivos").html("$"+formatNumber((Number(pc)+Number(pnc))));
}

function totalPatrimonioNeto(){
	let f=$("#total_fondos").html().replace("$","").replace(/ /g,"");
	let r=$("#total_reservas").html().replace("$","").replace(/ /g,"");
	let u=$("#total_utilidades").html().replace("$","").replace(/ /g,"");
	$("#total_patrimonio_neto").html("$"+formatNumber((Number(f)+Number(r)+Number(u))));
}

function ecuacionContable(){
	let a=$("#total_activos").html().replace("$","").replace(/ /g,"");
	let p=$("#total_pasivos").html().replace("$","").replace(/ /g,"");
	let pn=$("#total_patrimonio_neto").html().replace("$","").replace(/ /g,"");
	$("#activos").html("Activos: $"+formatNumber(a));
	$("#pasivos").html("Pasivos: $"+formatNumber(p));
	$("#patrimonio_neto").html("Patrimonio neto: $"+formatNumber(pn));

	$("#formula_activo").html("ACTIVO = PASIVO + PATRIMONIO NETO");
	$("#formula_pasivo").html("PASIVO = ACTIVO - PATRIMONIO NETO");
	$("#formula_patrimonio_neto").html("PATRIMONIO NETO = ACTIVO - PASIVO");

	if(a==(Number(p)+Number(pn))){
		$("#formula_activo").css("color","green");
	}else{
		$("#formula_activo").css("color","red");
	}
	if(p==(Number(a)-Number(pn))){
		$("#formula_pasivo").css("color","green");
	}else{
		$("#formula_pasivo").css("color","red");
	}
	if(pn==(Number(a)-Number(p))){
		$("#formula_patrimonio_neto").css("color","green");
	}else{
		$("#formula_patrimonio_neto").css("color","red");
	}
}

function add(){
	this.id=Number($("#id").val());
	this.id++;
	$("#id").val(this.id);
	let result="<div class='btn_concepto' title='Modificar' onclick=\"showUpdate(this,'"+this.id+"','"+this.op+"')\">";
	result+="<div class='concepto' id='c"+this.id+"'>- "+$("#concepto").val()+"</div>";
	result+="<div class='monto' id='m"+this.id+"'>$"+formatNumber($("#monto").val())+"</div class='monto'>";
	result+="</div>";
	$("#"+this.op).html($("#"+this.op).html()+result);
	subTotal($("#monto").val().replace(/ /g,""),"+");
	modal('modal_form_cuerpo');
}

function showUpdate(caja,id,op){
	$("#concepto_update").val("");
	$("#monto_update").val("");
	this.op=op;
	this.id=id;
	this.sele_caja=caja;
	let concepto=$("#c"+id).html().replace("- ","");
	let monto=$("#m"+id).html().replace("$","").replace(/ /g,"");
	this.sele_monto=monto;
	$("#concepto_update").val(concepto);
	$("#title_update").html(concepto.toUpperCase());
	modal('modal_form_update');
}

function update(){
	let concepto=$("#concepto_update").val();
	let monto_old=$("#m"+this.id).html().replace("$","").replace(/ /g,"");
	let monto=$("#monto_update").val().replace("$","").replace(/ /g,"");
	let operador="";
	if(monto.substr(0,1)=="+"){
		operador="+";
	}
	if(monto.substr(0,1)=="-"){
		operador="-";
	}
	if(monto.substr(0,1)=="*"){
		operador="*";
	}
	if(monto.substr(0,1)=="/"){
		operador="/";
	}
	if(operador==""){
		$("#c"+this.id).html("- "+concepto);
		modal('modal_form_update');
		return 0;
	}
	monto=monto.replace("+","").replace("-","").replace("x","").replace("/","");
	$("#c"+this.id).html("- "+concepto);
	if(operador=="+"){
		$("#m"+this.id).html("$"+formatNumber(Number(monto_old)+Number(monto)));
	}
	if(operador=="-"){
		$("#m"+this.id).html("$"+formatNumber(Number(monto_old)-Number(monto)));
	}

	if(operador=="*"){
		$("#m"+this.id).html("$"+formatNumber(Number(monto_old)*Number(monto)));
	}
	if(operador=="/"){
		$("#m"+this.id).html("$"+formatNumber(Number(monto_old)/Number(monto)));
	}
	subTotal(monto,operador);
	modal('modal_form_update');
}

function remove(){
	subTotal(this.sele_monto,"-");
	$(this.sele_caja).remove();
	modal('modal_form_update');
}