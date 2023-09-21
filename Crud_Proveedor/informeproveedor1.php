<?php
$conexion = mysqli_connect('127.0.0.1', 'root', '', 'bd_cusmetichi');

if (!$conexion) {
    die('Error de conexión: ' . mysqli_connect_error());
}

$consulta = "SELECT * FROM proveedor";
$resultado = mysqli_query($conexion, $consulta);

if (!$resultado) {
    die('Error en la consulta: ' . mysqli_error($conexion));
}

// Configuración de encabezados para el archivo Excel
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment; filename=datos-proveedor.xls');

echo '<table border="1">
        <caption>Datos de los Proveedores</caption>
        <tr>
            <th>Nombre del proveedor</th>
            <th>Apellido del proveedor</th>
            <th>Identificación del proveedor</th>
            <th>Correo del proveedor</th>
            <th>Teléfono del proveedor</th>
            <th>Empresa del proveedor</th>
        </tr>';

while ($filas = mysqli_fetch_assoc($resultado)) {
    echo '<tr>
            <td>' . $filas["NombreProveedor"] . '</td>
            <td>' . $filas["ApellidoProveedor"] . '</td>
            <td>' . $filas["IdentificacionProveedor"] . '</td>
            <td>' . $filas["EmailProveedor"] . '</td>
            <td>' . $filas["TelProveedor"] . '</td>
            <td>' . $filas["EmpresaProveedor"] . '</td>
          </tr>';
}

echo '</table>';

mysqli_close($conexion);
?>
