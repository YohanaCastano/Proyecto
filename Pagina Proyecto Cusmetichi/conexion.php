<?php

$host = "127.0.0.1"; 
$port = "3306"; 
$dbname = "bd_cusmetichi";
$usuario = "root";
$pass = "";

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