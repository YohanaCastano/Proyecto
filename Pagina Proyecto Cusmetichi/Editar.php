<?php
$usuario = "root";
$pass = "";
$dbname = "bd_cusmetichi"; // nombre de la base de datos

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['pkidProveedor'])) {
    $pkidProveedor = $_GET['pkidProveedor'];

    try {
        $mibd = new PDO('mysql:host=localhost;dbname=' . $dbname, $usuario, $pass);
        $mibd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $mibd->prepare("SELECT * FROM proveedor WHERE pkidProveedor = :pkidProveedor");
        $stmt->bindParam(':pkidProveedor', $pkidProveedor, PDO::PARAM_STR);
        $stmt->execute();
        $prop = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($prop) {
            // Mostrar el formulario de edición
            ?>
            <!DOCTYPE html>
            <html>
            <head>
                <title>Editar Propietario</title>
                <link rel="stylesheet" type="text/css" href="estilo.css">
            </head>
            <body>
                <h1>Adriana</h1>
                <form method="post" action="actualizar.php">
                <h1>Editar Propietario</h1>
                    <input type="hidden" name="pkidproveedor" value="<?php echo $prop['PkidProveedor']; ?>">
                    <input type="text" id="NombreProveedor" name="NombreProveedor" value="<?php echo $prop['NombreProveedor']; ?>" required><br><br>
                    <input type="text" id="ApellidoProveedor" name="ApellidoProveedor" value="<?php echo $prop['ApellidoProveedor']; ?>" required><br><br>
                    <input type="number" id="IdentificacionProveedor" name="IdentificacionProveedor" value="<?php echo $prop['IdentificacionProveedor']; ?>" required><br><br>
                    <input type="hidden" name="EmailProveedor" value="<?php echo $prop['EmailProveedor']; ?>">
                    <input type="text" id="TelProveedor" name="TelProveedor" value="<?php echo $prop['TelProveedor']; ?>" required><br><br>
                    <input type="text" id="EmpresaProveedor" name="EmpresaProveedor" value="<?php echo $prop['EmpresaProveedor']; ?>" required><br><br>

                    <input type="submit" value="Actualizar">
                </form>
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