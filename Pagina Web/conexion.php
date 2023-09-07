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

    

   
// Mostrar un mensaje de éxito
    echo "Conexión a la base de datos exitosa";
} catch (PDOException $e) {
    // Mostrar un mensaje de error y salir del script
    echo "Error de conexión: " . $e->getMessage();
    exit;
}
?>