<?php

$usuario = "root";
$pass = "";
$dbname = "bd_cusmetichi"; // Nombre de la base de datos

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['idProveedor'])) {
    
   
$idProveedor = $_GET['idProveedor'];

    try {
    
$mibd = new PDO('mysql:host=localhost;dbname=' . $dbname, $usuario, $pass);
        $mibd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$stmt = $mibd->prepare("SELECT * FROM Proveedor WHERE idProveedor = :idProveedor");
        $stmt->bindParam(':idProveedor', $idProveedor, PDO::PARAM_INT);
        $stmt->execute();
        
$proveedor = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($proveedor) {
            // Mostrar el formulario de edición con los campos prellenados
?>
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href="estilos.css">
                <title>Editar Proveedor</title>
            </head>
            <body>
                <div class="contenedor-principal">
                    <form method="post" action="ActualizarProveedor.php">
                        <h2>Editar Proveedor</h2>
                        <input type="hidden" name="idProveedor" value="<?php echo $proveedor['idProveedor']; ?>">
                        <!-- Agrega aquí los campos de edición -->
                        <input type="text" name="NombreProveedor" value="<?php echo $proveedor['NombreProveedor']; ?>" required><br><br>
                        <input type="text" name="ApellidoProveedor" value="<?php echo $proveedor['ApellidoProveedor']; ?>" required><br><br>
                        <input type="number" name="IdentificacionProveedor" value="<?php echo $proveedor['IdentificacionProveedor']; ?>" required><br><br>
                        <input type="email" name="EmailProveedor" value="<?php echo $proveedor['EmailProveedor']; ?>" required><br><br>
                        <input type="tel" name="TelProveedor" value="<?php echo $proveedor['TelProveedor']; ?>" required><br><br>
                        <input type="text" name="EmpresaProveedor" value="<?php echo $proveedor['EmpresaProveedor']; ?>" required><br><br>
                        <button type="submit">Actualizar</button>
                    </form>
                </div>
            </body>
            </html>
<?php
        } else {
            echo "Proveedor no encontrado.";
        }

    
$mibd = null;
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>