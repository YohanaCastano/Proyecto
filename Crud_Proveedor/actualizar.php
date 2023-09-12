<?php
$usuario = "root";
$pass = "";
$dbname = "bd_cusmetichi"; // nombre de la base de datos

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $pkidProveedor = $_POST['pkidProveedor'];
    $NombreProveedor = $_POST['NombreProveedor'];
    $ApellidoProveedor = $_POST['ApellidoProveedor'];
    $IdentificacionProveedor = $_POST['IdentificacionProveedor'];
    $EmailProveedor = $_POST['EmailProveedor'];
    $TelProveedor = $_POST['TelProveedor'];
    $EmpresaProveedor = $_POST['EmpresaProveedor'];

    try {
        $mibd = new PDO('mysql:host=localhost;dbname=' . $dbname, $usuario, $pass);
        $mibd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Actualiza el registro del proveedor
        $stmt = $mibd->prepare("UPDATE proveedor SET NombreProveedor = :NombreProveedor, ApellidoProveedor = :ApellidoProveedor, IdentificacionProveedor = :IdentificacionProveedor, EmailProveedor = :EmailProveedor, TelProveedor = :TelProveedor, EmpresaProveedor = :EmpresaProveedor WHERE pkidProveedor = :pkidProveedor");
        
        $stmt->bindParam(':pkidProveedor', $pkidProveedor, PDO::PARAM_INT);
        $stmt->bindParam(':NombreProveedor', $NombreProveedor, PDO::PARAM_STR);
        $stmt->bindParam(':ApellidoProveedor', $ApellidoProveedor, PDO::PARAM_STR);
        $stmt->bindParam(':IdentificacionProveedor', $IdentificacionProveedor, PDO::PARAM_INT);
        $stmt->bindParam(':EmailProveedor', $EmailProveedor, PDO::PARAM_STR);
        $stmt->bindParam(':TelProveedor', $TelProveedor, PDO::PARAM_INT);
        $stmt->bindParam(':EmpresaProveedor', $EmpresaProveedor, PDO::PARAM_STR);

        $stmt->execute();

        echo "Registro actualizado exitosamente.";

        // Redirige a la pagina donde mostrara los datos actualizados
        header("Location: mostrar_datos.php");

        $mibd = null;
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>
?>