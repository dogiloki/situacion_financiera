<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="styles/from.css">
</head>
<body>

	<?php

		include("models/header.php");

		if(isset($_SESSION['login']['id'])){
			return header("location:index.php");
		}
		if(isset($_GET['v'])){
			if($_GET['v']=='user'){
				echo "<script>alert('El usuario ya existe');</script>";
			}
			if($_GET['v']=='datos_vacios'){
				echo "<script>alert('Los campos estan vacios');</script>";
			}
		}

	?>

	<section class="content_formu">
		<form action="controllers/register.php" method="POST">
			<h1>REGISTRARSE</h1><br>
			<input type="text" class="caja" name="name" placeholder="Nombre">
			<input type="text" class="caja" name="surname1" placeholder="Apellido paterno">
			<input type="text" class="caja" name="surname2" placeholder="Apellido materno">
			<input type="email" class="caja" name="email" placeholder="Email">
			<input type="text" class="caja" name="user" placeholder="Usuario">
			<input type="password" class="caja" name="password" placeholder="Contraseña">
			<input type="submit" class="btn" value="Registrarse">
			<a href="login.php">Iniciar sesión</a>
		</form>
	</section>

</body>
</html>