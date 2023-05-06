<?php

include("config.php");

if(isset($_POST['name']) && isset($_POST['surname1']) && isset($_POST['surname1']) &&
	isset($_POST['email']) && isset($_POST['user']) && isset($_POST['password'])){

	if(str_replace(" ","",$_POST['name'])=="" || str_replace(" ","",$_POST['surname1'])=="" ||
		str_replace(" ","",$_POST['surname2'])=="" || str_replace(" ","",$_POST['email'])=="" ||
		str_replace(" ","",$_POST['user'])=="" || str_replace(" ","",$_POST['password'])==""){
		return header("location:../register.php?v=datos_vacios");
	}else{
		$name=$_POST['name'];
		$surname1=$_POST['surname1'];
		$surname2=$_POST['surname2'];
		$email=$_POST['email'];
		$user=$_POST['user'];
		$password=password_hash($_POST['password'],PASSWORD_DEFAULT,array("cost"=>10));
		$id=uniqid();
		$rs=mysqli_query($connection,"SELECT user FROM users WHERE user='".$user."'");
		if(mysqli_num_rows($rs)!=0){
			return header("location:../register.php?v=user");
		}else{
			mysqli_query($connection,"INSERT INTO users VALUES ('".$id."','".$name."','".$surname1."','".$surname2."','".$email."','".$user."','".$password."',now())");
			return header("location:../login.php");
		}
	}
}

return header("location:../register.php");

?>