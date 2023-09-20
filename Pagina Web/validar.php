<?php
$Email = $_POST['Email'];
$Contraseña = $_POST['Contraseña'];

$conexion = mysqli_connect('127.0.0.1','root','','bd_cusmetichi');	
$consulta = "SELECT * FROM usuarios WHERE Email='$Email' AND Contraseña = '$Contraseña';";
$resultado = mysqli_query($conexion, $consulta);



$filas=mysqli_num_rows($resultado);
if ($filas>0)
{
	while($filas=$resultado->fetch_array())
	{
		$rol=$filas['fkidRol'];
	}
	switch ($rol)
	{
		case 1:
			echo "<script>alert('Bienvenido EMPLEADO al sistema');
				location.href='InventarioEmpleado.php';
			</script>";
		break;
		case 2:
			echo "<script>alert('Bienvenido GERENTE al sistema');
				location.href='InventarioGerente.php';
			</script>";
		break;
		case 3:
			echo "<script>alert('Bienvenido CLIENTE al sistema');
				location.href='productos.php';
			</script>";
		break;
		default:
			echo "<script>alert('Usuario y/o contraseña incorrectos');
				location.href='formularioLogin.php';
			</script>";
		break;
	}
}
else
{
	echo "<script>alert('Eamil y/o contraseña incorrectos');
				location.href='formularioLogin.php';
			</script>";
}

?>