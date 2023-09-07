<?php
// Datos de conexión a la base de datos
$host = "127.0.0.1"; // Cambia esto si tu base de datos no está en localhos
$port = "3306"; // Cambia esto si tu puerto no es el predeterminado (3306)
$dbname = "bd_cusmetichi";
$usuario = "root";
$contrasena = "";

try {
    // Crear una conexión PDO
    $conexion = new PDO("mysql:host={$host};port={$port};dbname={$dbname}", $usuario, $contrasena);

    // Establecer el modo de error de PDO a excepciones
    
   
$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    
$consulta = $conexion->prepare("DELETE FROM Proveedor WHERE id = :id");
        $consulta->bindParam(':id', $idProveedor);

        // Ejecuta la consulta
        if ($consulta->execute()) {
            echo "Proveedor eliminado correctamente.";
        } else {
            echo "Error al eliminar el proveedor.";
        }
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }

    // Cierra la conexión a la base de datos
    $conexion = null;
} else {
    echo "ID de proveedor no proporcionado.";
}

?>