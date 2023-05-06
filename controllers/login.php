<?php

include("config.php");

if(isset($_POST['user']) && isset($_POST['password'])){

	if(str_replace(" ","",$_POST['user'])=="" || str_replace(" ","",$_POST['password'])==""){
		return header("location:../login.php?v=datos_vacios");
	}else{
		$user=$_POST['user'];
		$password=$_POST['password'];
		$rs=mysqli_query($connection,"SELECT * FROM users WHERE user='".$user."'");
		if(mysqli_num_rows($rs)==0){
			return header("location:../login.php?v=user");
		}else{
			while($row=mysqli_fetch_array($rs)){
				if(password_verify($password,$row['password'])){
					session_start();
					$_SESSION['login']=array(
						'id'=>$row['id'],
						'name'=>$row['name'],
						'surname1'=>$row['surname1'],
						'surname2'=>$row['surname2'],
						'email'=>$row['email'],
						'date_register'=>$row['date_register']
					);
				}else{
					return header("location:../login.php?v=user");
				}
			}
		}
	}
}
return header("location:../index.php");

?>