<?php


echo '<h3>Si desea descargar el informe en Excel, haga clic en el botón "GENERAR_XLS".</h3>';

$conexion = mysqli_connect('127.0.0.1', 'root', '', 'bd_cusmetichi');

// Verificar la conexión
if (!$conexion) {
    die('Error de conexión: ' . mysqli_connect_error());
}

$consulta = "call ListarEntradaSalida ('Andre', 'Ortiz')";
$resultado = mysqli_query($conexion, $consulta);

if (!$resultado) {
    die('Error en la consulta: ' . mysqli_error($conexion));
}

    
echo '<table border="1">
        <caption>Datos Registrados</caption>
        <tr>
            <th>CantidadEntradas</th>
            <th>fecha_entrada</th>
            <th>CantidadSalidas</th>
            <th>fecha_salida</th>
            <th>NombreProducto</th>
            <th>StockProducto</th>
            <th>NombreProveedor</th>
            <th>ApellidoProveedor</th>

        </tr>';

while ($fila = mysqli_fetch_assoc($resultado)) {
    echo '<tr>';
    echo '<td>' . $fila['CantidadEntradas'] . '</td>';
    echo '<td>' . $fila['fecha_entrada'] . '</td>';
    echo '<td>' . $fila['CantidadSalidas'] . '</td>';
    echo '<td>' . $fila['fecha_salida'] . '</td>';
    echo '<td>' . $fila['NombreProducto'] . '</td>';
    echo '<td>' . $fila['StockProducto'] . '</td>';
    echo '<td>' . $fila['NombreProveedor'] . '</td>';    
    echo '<td>' . $fila['ApellidoProveedor'] . '</td>';

    
   

}

echo '</table>';

// Cerrar la conexión
mysqli_close($conexion);

?>

<!-- Botón para generar el archivo Excel -->
<form action="informe1.php" method="post"><br><br>
    <input type="submit" name="GENERAR_XLS" value="GENERAR_XLS">
</form>