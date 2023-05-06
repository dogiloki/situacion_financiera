<link rel="stylesheet" type="text/css" href="styles/options.css">

<?php

if(!isset($_SESSION['login']['id'])){
	return 0;
}

// RPROBLEMA DE PRUEBA

/*$title="DULCERÍA DE JOSÉ";
$text="Dulcería de José del año 2020.

Él se gastó $70 000 durante todo el año en la compra de dulces para su tienda, el cual $10 000 son de él y $60 000 de un préstamo al banco el cual debe pagar $1 850 por semana. Él ya tiene una camioneta donde transporta su mercancía que le costó $40 000 con una vida útil de 6 años, este es su cuarto año por lo tanto solo le queda 2 años de vida útil y se gasto $9 100 por todo el año en gasolina.

Paga sueldos a 6 empleados. 3 de ellos le paga $5 000 al mes, a uno $3 700 al mes, a 2 le da $3 000, por último se da un sueldo de $7 800 al mes, y calculo que ha pagado durante todo el año $5 000 en horas extras (contando todos los empleados).

Tiene un local el cual paga un alquiler de $3 000 al mes.

Él tiene un total de 40 tipos de dulces diferentes el cual le da un 5,6% de IVA por cada tipo de dulce y tiene que dar un 35% de ISR de toda su utilizada (después de vender los dulces con el IVA).

El mes de marzo sufrió un robo en el cual perdió $5 000 que tenía en caja en ese momento.";

mysqli_query($connection,"INSERT INTO problemas VALUES ('".uniqid()."','".$title."','".$text."','')");*/

?>

<table class="content_info_user">
	<tr>
		<th align="left">Nombre(s)</th>
		<td align="left"><?php echo $_SESSION['login']['name'] ?></td>
	</tr>
	<tr>
		<th align="left">Apellidos</th>
		<td align="left"><?php echo $_SESSION['login']['surname1']." ".$_SESSION['login']['surname2'] ?></td>
	</tr>
	<tr>
		<th align="left">Email</th>
		<td align="left"><?php echo $_SESSION['login']['email'] ?></td>
	</tr>
	<tr>
		<th align="left">Fecha de registro</th>
		<td align="left"><?php echo $_SESSION['login']['date_register'] ?></td>
	</tr>
</table>
<button onclick="window.location='close.php'" style="margin: 10px">Cerrar sesión</button>

<hr>
<main class="content_options">
<b>CONTABILIDAD</b><br>
<a href='?v=add'>
	<li>NUEVO ( + )</li>
</a>
<?php

	$rs_name=mysqli_query($connection,"SELECT * FROM tablas WHERE id_user='".$_SESSION['login']['id']."' ORDER BY nombre") or die ("500");
	while($row_name=mysqli_fetch_array($rs_name)){
		echo "<a href='?id_tabla=".$row_name['id']."'>
					<li>".$row_name['nombre']."<br><br></li>
					<li style='font-size: 14px;'>Registro: ".$row_name['date_register']."</li>
				</a>";
	}
//$row_name['empresa']
?>

</main>