<?php

	session_start();

	static $host="localhost";
	static $name_db="situacion_financiera";
	static $user="root";
	static $password="Caoblctd1911";

	$connection=mysqli_connect($host,$user,$password) or die ("500");
	mysqli_select_db($connection,$name_db) or die ("500");

	function getDir(){
		return str_replace("\\","/","http://".$_SERVER["HTTP_HOST"]."/situacion_financiera");
	}

	function getProblemaImg($connection,$id_problema){
		$rs=mysqli_query($connection,"SELECT * FROM problemas WHERE id='".$id_problema."'") or die ("500");
		while($row=mysqli_fetch_array($rs)){
			return $row['img'];
		}
	}

	function getProblemaTitle($connection,$id_problema){
		$rs=mysqli_query($connection,"SELECT * FROM problemas WHERE id='".$id_problema."'") or die ("500");
		while($row=mysqli_fetch_array($rs)){
			return $row['title'];
		}
	}

	function getProblemaText($connection,$id_problema){
		$rs=mysqli_query($connection,"SELECT * FROM problemas WHERE id='".$id_problema."'") or die ("500");
		while($row=mysqli_fetch_array($rs)){
			return $row['text'];
		}
	}
	
?>