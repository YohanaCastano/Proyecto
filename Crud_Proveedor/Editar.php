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
        $stmt->bindParam(':pkidProveedor', $pkidProveedor, PDO::PARAM_INT);
        $stmt->execute();
        $prop = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($prop) {
            //formulario para editar campos
            ?>
            <!DOCTYPE html>
            <html>
            <head>
                <link rel="stylesheet" type="text/css" href="estilos.css">
            </head>
            <body>
                <div 
class="container">
<div class="formulario-container">
    <h1>Editar Proveedor</h1>
    <form method="post" action="actualizar.php" class="formulario" id="formulario">
    <h1>Editar Proveedor</h1><br>
        <input type="hidden" class="formulario_grupo_input" name="pkidProveedor" value="<?php echo $prop['pkidProveedor']; ?>">
        <input type="text" class="formulario_grupo_input" id="NombreProveedor" name="NombreProveedor" value="<?php echo $prop['NombreProveedor']; ?>" required><br><br>
        <input type="text" class="formulario_grupo_input" id="ApellidoProveedor" name="ApellidoProveedor" value="<?php echo $prop['ApellidoProveedor']; ?>" required><br><br>
        <input type="text" class="formulario_grupo_input" id="IdentificacionProveedor" name="IdentificacionProveedor" value="<?php echo $prop['IdentificacionProveedor']; ?>" required><br><br>
        <input type="text" class="formulario_grupo_input" id="EmailProveedor" name="EmailProveedor" value="<?php echo $prop['EmailProveedor']; ?>" required><br><br>
        <input type="text" class="formulario_grupo_input" id="TelProveedor" name="TelProveedor" value="<?php echo $prop['TelProveedor']; ?>" required><br><br>
        <input type="text" class="formulario_grupo_input" id="EmpresaProveedor" name="EmpresaProveedor" value="<?php echo $prop['EmpresaProveedor']; ?>" required><br><br>
        <button type="submit" value="Actualizar">Actualizar</button>

        </form><br><br>
        <button type="submit"<a href='paginaA/Inventario Empleado.php?=" .  "' class='delete-button'>Regresar a listado Proveedores</a></button><br><br>";
        </div>
        <div class="imagen-container">
            <img src="https://proveedor.mercadopublico.cl/assets/img/steps/index-registro.svg" alt="Imagen Registrarse">
            </div>
                </div>
                <script src="JS/validarRegistroProveedor.js"></script>
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