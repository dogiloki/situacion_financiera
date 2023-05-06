<?php

include("config.php");

if(isset($_GET['v'])){
	$return="";
	$return_json=[];

	if($_GET['v']=='send'){
		mysqli_query($connection,"INSERT INTO tablas VALUES ('".uniqid()."','".$_SESSION['login']['id']."','".$_POST['nombre']."','".str_replace("'","\'",$_POST['tabla'])."','".$_POST['conceptos']."',now())") or die ("500");
		setcookie("nombre",$_POST['nombre'],time()+(60*60*24*365),"/");
	}

	if($_GET['v']=='save'){
		mysqli_query($connection,"UPDATE tablas SET id_user='".$_SESSION['login']['id']."', nombre='".$_POST['nombre']."', tabla='".str_replace("'","\'",$_POST['tabla'])."', conceptos='".$_POST['conceptos']."' WHERE id='".$_POST['id_tabla']."' AND id_user='".$_SESSION['login']['id']."'") or die ("500");
		setcookie("nombre",$_POST['nombre'],time()+(60*60*24*365),"/");
	}

	if($_GET['v']=='delete'){
		mysqli_query($connection,"DELETE FROM tablas WHERE id='".$_POST['id_tabla']."' AND id_user='".$_SESSION['login']['id']."'") or die ("500");
	}

	if($_GET['v']=='getTabla'){
		$rs=mysqli_query($connection,"SELECT * FROM tablas WHERE id='".$_POST['id_tabla']."' AND id_user='".$_SESSION['login']['id']."'") or die ("500");
		$return_json['existe']=false;
		while($row=mysqli_fetch_array($rs)){
			$return_json['existe']=true;
			$return_json['id']=$row['conceptos'];
			$return_json['tabla']=str_replace("\'","'",$row['tabla']);
			$return_json['nombre']=$row['nombre'];
		}
		echo json_encode($return_json);
		return 0;
	}

	echo $return;
	return 0;
}

?>