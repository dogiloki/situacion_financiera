<link rel="stylesheet" type="text/css" href="styles/header.css">
<script type="text/javascript" src="scripts/header.js"></script>

<?php
	include("controllers/config.php");
	if(!isset($_SESSION['login']['id'])){
		return 0;
	}
?>

<header>
	<h1><a href="<?php echo getDir(); ?>">SITUACIÓN FINANCIERA</a></h1>
	<?php
	if((isset($_GET['id_tabla']) || isset($_GET['v'])) && isset($_SESSION['login']['id'])){
		?>
		<div class="content_info">
			<div class="flex">
				<input type="text" style="margin: 10px;" class="caja" id="nombre" placeholder="Nombre" value="">
				<?php
				if(isset($_GET['id_tabla'])){
					?>
					<button class="btn" style="color: green; margin: 10px;" onclick="saveTabla('<?php echo $_GET['id_tabla']; ?>')">GUARDAR</button>
					<button class="btn" style="color: red; margin: 10px;" onclick="deleteTabla('<?php echo $_GET['id_tabla']; ?>')">ELIMINAR</button>
					<?php
				}else{
					?>
					<button class="btn" style="color: green; margin: 10px;" onclick="sendTabla()">ENVIAR</button>
					<?php
				}
				?>
			</div>
		</div>
		<?php
	}
	?>
</header>