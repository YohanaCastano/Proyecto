<?php


$host = "127.0.0.1";
$port = "3306";
$dbname = "bd_cusmetichi";
$usuario = "root";
$contrasena = "";

try {
    // Crear una conexión PDO
    $conexion = new PDO("mysql:host={$host};port={$port};dbname={$dbname}", $usuario, $contrasena);
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Verificar si se proporcionó un ID de proveedor para eliminar
    if (isset($_GET['pkidProveedor'])) {
        $pkidProveedor = $_GET['pkidProveedor'];
        $conexion->beginTransaction();

        try {
            // Preparar la consulta SQL para eliminar el proveedor
            $consulta = $conexion->prepare("DELETE FROM Proveedor WHERE pkidProveedor = :pkidProveedor");
            $consulta->bindParam(':pkidProveedor', $pkidProveedor);
            

            // Ejecutar la consulta para eliminar el proveedor
            if ($consulta->execute()) {
                
                echo "¡Proveedor eliminado correctamente!.";

                // consulta las compras relacionadas con el proveedor
                $stmtDeleteCompraProveedor = $conexion->prepare("DELETE FROM compraproveedor WHERE fkidProveedor = :pkidProveedor");
                $stmtDeleteCompraProveedor->bindParam(':pkidProveedor', $pkidProveedor, PDO::PARAM_INT);

                // Elimina las compras relacionadas con el proveedor
            
                $stmtDeleteCompraProveedor->execute();

                // Confirmar la transacción
                $conexion->commit();
            } else {
                echo "¡Error al eliminar el proveedor!.";
            }
        } catch (PDOException $e) {
            // En caso de error, revertir la transacción
            $conexion->rollBack();
            throw $e;
        }
    } 
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
} finally {
    // Cerrar la conexión a la base de datos
    $conexion = null;
}
?><br><br><br><br><br><br>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="estilos.css">
    
</head>
<body>
<button id="submitButton" type="button" onclick="window.location.href = 'mostrar_datos.php'">Volver a la Pagina Registrar Proveedores</button>
</body>
</html>



