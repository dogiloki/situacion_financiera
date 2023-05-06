<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Situación fiananciera</title>
	<link rel="stylesheet" type="text/css" href="styles/index.css">
	<link rel="stylesheet" type="text/css" href="styles/from.css">
	<script type="text/javascript" src="scripts/index.js"></script>
</head>
<body>

<?php

	include("models/header.php");

	if(!isset($_SESSION['login']['id'])){
		return header("location:login.php");
	}

?>

<?php

	
	if(isset($_GET['id_tabla'])){
		echo "<script>getTabla('".$_GET['id_tabla']."');</script>";
	}else{
		if(isset($_GET['v'])){
			if(!$_GET['v']=='add'){
				include("models/options.php");
				return 0;
			}
		}else{
			include("models/options.php");
			return 0;
		}
	}

?>

<main id="tabla">

	<input type="text" id="id" value="0" readonly hidden>

	<section class="encabezado" id="encabezado">
		<div class="block">
			<div class="empresa" id="empresa_o_persona" onclick="showEncabezado('empresa_o_persona')">EMPRESA O PERSONA</div>
			<div class="flex">
				<div class="titulo" id="titulo" onclick="showEncabezado('titulo')">TÍTULO</div>
				<div class="fecha" id="fecha" onclick="showEncabezado('fecha')">FECHA</div>
			</div>
		</div>
	</section>

	<section class="cuerpo">

		<div class="flex">
			<div class="block">
				<div class="content_activos">
					<h2>ACTIVOS</h2>
					<div class="tr">
						<h4 class="btn" title="Agregar" onclick="showForm('activos_corrientes')">Activos corrientes</h4>
						<div class="monto" id="total_activos_corrientes">$ 0</div>
					</div>
					<div id="activos_corrientes"></div>
					<div class="tr">
						<h4 class="btn" title="Agregar" onclick="showForm('activos_no_corrientes')">Activos no corrientes</h4>
						<div class="monto" id="total_activos_no_corrientes">$ 0</div>
					</div>
					<div id="activos_no_corrientes"></div>
					<div class="tr">
						<h4 class="btn" title="Agregar" onclick="showForm('intangibles')">Intangibles</h4>
						<div class="monto" id="total_intangibles">$ 0</div>
					</div>
					<div id="intangibles"></div>
					<div class="flex">
						<h2>TOTAL DE ACTIVOS</h2>
						<div class="monto" id="total_activos">$ 0</div>
					</div>
				</div>
				<div class="content_calculo">
					<h2>ECUACIÓN CONTABLE</h2>
					<div class="formulas">
						<div id="activos"></div>
						<div id="pasivos"></div>
						<div id="patrimonio_neto"></div>
						<br>
						<div id="formula_activo"></div>
						<div id="formula_pasivo"></div>
						<div id="formula_patrimonio_neto"></div>
					</div>
				</div>
			</div>
			<div class="sepa"></div>
			<div class="block">
				<div class="content_pasivos">
					<h2>PASIVOS</h2>
					<div class="tr">
						<h4 class="btn" title="Agregar" onclick="showForm('pasivos_corrientes')">Pasivos corrientes</h4>
						<div class="monto" id="total_pasivos_corrientes">$ 0</div>
					</div>
					<div id="pasivos_corrientes"></div>
					<div class="tr">
						<h4 class="btn" title="Agregar" onclick="showForm('pasivos_no_corrientes')">Pasivos no corrientes</h4>
						<div class="monto" id="total_pasivos_no_corrientes">$ 0</div>
					</div>
					<div id="pasivos_no_corrientes"></div>
					<div class="flex">
						<h2>TOTAL DE PASIVOS</h2>
						<div class="monto" id="total_pasivos">$ 0</div>
					</div>
				</div>
				<div class="content_patrimonio_neto">
					<h2>PATRIMONIO NETO</h2>
					<div class="tr">
						<h4 class="btn" title="Agregar" onclick="showForm('fondos')">Fondos</h4>
						<div class="monto" id="total_fondos">$ 0</div>
					</div>
					<div id="fondos"></div>
					<div class="tr">
						<h4 class="btn" title="Agregar" onclick="showForm('reservas')">Reservas</h4>
						<div class="monto" id="total_reservas">$ 0</div>
					</div>
					<div id="reservas"></div>
					<div class="tr">
						<h4 class="btn" title="Agregar" onclick="showForm('utilidades')">Utilidades</h4>
						<div class="monto" id="total_utilidades">$ 0</div>
					</div>
					<div id="utilidades"></div>
					<div class="flex">
						<h2>TOTAL DE PATRIMONIO NETO</h2>
						<div class="monto" id="total_patrimonio_neto">$ 0</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<section class="modal" id="modal_form_encabezado" style="display: none;" onclick="modal('modal_form_encabezado')">
		<div class="content_form" onclick="modal('modal_form_encabezado')">
			<div id="title_encabezado"></div>
			<input type="text" class="caja" id="texto" placeholder="Escribe aquí">
			<div class="flex" style="justify-content: flex-end;">
				<button class="btn" style="color: green;" onclick="changeText()">Aceptar</button>
			</div>
		</div>
	</section>

	<section class="modal" id="modal_form_cuerpo" style="display: none;" onclick="modal('modal_form_cuerpo')">
		<div class="content_form" onclick="modal('modal_form_cuerpo')">
			<div id="title"></div>
			<input type="text" class="caja" id="concepto" placeholder="Escribe un concepto">
			<input type="number" class="caja" id="monto" placeholder="Escribe un monto">
			<div class="flex" style="justify-content: space-between;">
				<button class="btn" style="color: red;" onclick="modal('modal_form_cuerpo')">Canclear</button>
				<button class="btn" style="color: green;" onclick="add()">Aceptar</button>
			</div>
		</div>
	</section>

	<section class="modal" id="modal_form_update" style="display: none;" onclick="modal('modal_form_update')">
		<div class="content_form" onclick="modal('modal_form_update')">
			<div id="title_update"></div>
			<input type="text" class="caja" id="concepto_update" placeholder="Escribe un concepto">
			<input type="number" class="caja" id="monto_update" placeholder="Escribe un monto" list="1,1,1">
			<div class="flex" style="justify-content: space-between;">
				<button class="btn" style="color: red;" onclick="remove()">Eliminar</button>
				<button class="btn" style="color: green;" onclick="update()">Guardar</button>
			</div>
		</div>
	</section>

</main>

</body>
</html>