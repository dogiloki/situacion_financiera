<?php

	include("controllers/config.php");

	session_start();
	session_destroy();
	return header("location:".getDir());

?>