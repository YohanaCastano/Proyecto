<?php
$usuario = "root";
$pass = "";
$dbname = "bd_cusmetichi"; // nombre de la base de datos

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $NombreProveedor = $_POST['NombreProveedor'];
    $ApellidoProveedor = $_POST['ApellidoProveedor'];
    $IdentificacionProveedor = $_POST['IdentificacionProveedor'];
    $EmailProveedor = $_POST['EmailProveedor'];
    $TelProveedor= $_POST['TelProveedor'];
    $EmpresaProveedor = $_POST['EmpresaProveedor'];

    try {
        $mibd = new PDO('mysql:host=localhost;dbname=' . $dbname, $usuario, $pass);
        $mibd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $mibd->prepare("UPDATE Proveedor SET id = :id, NombreProveedor = :NombreProveedor, EmailProveedor = :EmailProveedor WHERE NombreProveedor = :id");
        $stmt->bindParam(':NombreProveedor', $NombreProveedor, PDO::PARAM_STR);
        $stmt->bindParam(':ApellidoProveedor', $ApellidoProveedor, PDO::PARAM_STR);
        $stmt->bindParam(':IdentificacionProveedor', $IdentificacionProveedor, PDO::PARAM_INT);
        $stmt->bindParam(':EmailProveedor', $EmailProveedor, PDO::PARAM_STR);
        $stmt->bindParam(':TelProveedor', $TelProveedor, PDO::PARAM_INT);
        $stmt->bindParam(':EmpresaProveedor', $EmpresaProveedor, PDO::PARAM_STR);
        $stmt->bindParam(':id', $id, PDO::PARAM_STR);
        
        $stmt->execute();

        echo "Registro actualizado exitosamente.";

        $mibd = null;
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>