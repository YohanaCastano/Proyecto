<?php


echo '<h3>Puede ver la información del proveedor. Si desea descargar el informe en Excel, haga clic en el botón "GENERAR_XLS".</h3>';

$conexion = mysqli_connect('127.0.0.1', 'root', '', 'bd_cusmetichi');

// Verificar la conexión
if (!$conexion) {
    die('Error de conexión: ' . mysqli_connect_error());
}

$consulta = "SELECT * FROM proveedor;";
$resultado = mysqli_query($conexion, $consulta);

if (!$resultado) {
    die('Error en la consulta: ' . mysqli_error($conexion));
}

echo '<table border="1">';
echo '<tr><th>NombreProveedor</th><th>ApellidoProveedor</th><th>IdentificacionProveedor</th><th>EmailProveedor</th><th>TelProveedor</th><th>EmpresaProveedor</th></tr>';

while ($fila = mysqli_fetch_assoc($resultado)) {
    echo '<tr>';
    echo '<td>' . $fila['NombreProveedor'] . '</td>';
    echo '<td>' . $fila['ApellidoProveedor'] . '</td>';
    echo '<td>' . $fila['IdentificacionProveedor'] . '</td>';
    echo '<td>' . $fila['EmailProveedor'] . '</td>';
    echo '<td>' . $fila['TelProveedor'] . '</td>';
    
   
echo '<td>' . $fila['EmpresaProveedor'] . '</td>';
    echo '</tr>';
}

echo '</table>';

// Cerrar la conexión
mysqli_close($conexion);

?>

<!-- Botón para generar el archivo Excel -->
<form action="informe1.php" method="post"><br><br>
    <input type="submit" name="GENERAR_XLS" value="GENERAR_XLS">
</form>