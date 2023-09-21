<?php
$conexion = mysqli_connect('127.0.0.1', 'root', '', 'bd_cusmetichi');

if (!$conexion) {
    die('Error de conexión: ' . mysqli_connect_error());
}

$consulta = "call ListarEntradaSalida ('Andre', 'Ortiz')";
$resultado = mysqli_query($conexion, $consulta);

if (!$resultado) {
    die('Error en la consulta: ' . mysqli_error($conexion));
}

// Configuración de encabezados para el archivo Excel
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment; filename=datos-proveedor.xls');

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
while ($filas = mysqli_fetch_assoc($resultado)) {
    echo '<tr>
            <td>' . $filas["CantidadEntradas"] . '</td>
            <td>' . $filas["fecha_entrada"] . '</td>
            <td>' . $filas["CantidadSalidas"] . '</td>
            <td>' . $filas["fecha_salida"] . '</td>
            <td>' . $filas["NombreProducto"] . '</td>
            <td>' . $filas["StockProducto"] . '</td>
            <td>' . $filas["NombreProveedor"] . '</td>
            <td>' . $filas["ApellidoProveedor"] . '</td>

          </tr>';
}

echo '</table>';

mysqli_close($conexion);
?>