<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = "root";
    $pass = "";
    $dbname = "bd_cusmetichi";  // Conexión con la base de datos

    try {
        $mibd = new PDO('mysql:host=localhost;dbname=' . $dbname, $usuario, $pass);
        $mibd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $pkidProveedor =$_POST['pkidProveedor'];
        $NombreProveedor = $_POST['NombreProveedor'];
        $ApellidoProveedor = $_POST['ApellidoProveedor'];
        $IdentificacionProveedor = $_POST['IdentificacionProveedor'];
        $EmailProveedor = $_POST['EmailProveedor'];
        $TelProveedor = $_POST['TelProveedor'];
        $EmpresaProveedor = $_POST['EmpresaProveedor'];

$stmt = $mibd->prepare("INSERT INTO Proveedor (pkidProveedor,NombreProveedor, ApellidoProveedor, IdentificacionProveedor, EmailProveedor, TelProveedor, EmpresaProveedor) VALUES (:pkidProveedor,:NombreProveedor, :ApellidoProveedor, :IdentificacionProveedor, :EmailProveedor, :TelProveedor, :EmpresaProveedor)");
$stmt->bindParam(':pkidProveedor', $pkidProveedor, PDO::PARAM_INT);
$stmt->bindParam(':NombreProveedor', $NombreProveedor, PDO::PARAM_STR);
$stmt->bindParam(':ApellidoProveedor', $ApellidoProveedor, PDO::PARAM_STR);
$stmt->bindParam(':IdentificacionProveedor', $IdentificacionProveedor, PDO::PARAM_INT);
$stmt->bindParam(':EmailProveedor', $EmailProveedor, PDO::PARAM_STR);
$stmt->bindParam(':TelProveedor', $TelProveedor, PDO::PARAM_INT);
$stmt->bindParam(':EmpresaProveedor', $EmpresaProveedor, PDO::PARAM_STR);
$stmt->execute(); 
$mibd = null;

        echo "Registro agregado exitosamente.";
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}

$usuario = "root";
$pass = "";
$dbname = "bd_cusmetichi"; // Nombre de la base de datos

try {
    $mibd = new PDO('mysql:host=localhost;dbname=' . $dbname, $usuario, $pass);
    $mibd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    
$stmt = $mibd->query("SELECT * FROM Proveedor");

echo "<h1 class='titulo'>LISTADO DE PROVEEDORES</h1>";
echo "<a href='InventarioGerente.php' class='edit-button'>Regresar</a>";
echo "<a href='formularioRegistroProveedor.php?=" .  "' class='delete-button'>Agregar Proveedor</a>";
echo "<a href='informe.php?=" .  "' class='edit-button excel-link'>Ver Reporte en excel</a>";
echo "<table style='border: 1px solid #000; width: 100%; border-collapse: collapse; padding: 15px; margin-top: 20px;'>";
echo "<tr style='background-color: #ffb7c2; border: 1px solid #000; height: 50px;'>";
echo "<th>Id Proveedor</th><th>Nombres Proveedor</th><th>Apellidos Proveedor</th><th>documento</th><th>email</th><th>celular</th><th>Nombre Empresa</th><th>Acciones</th>";
echo "</tr>";

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    
echo "<tr style='border-bottom: 1px solid #f2f2f2;'>";
echo "<td style='padding: 8px; text-align: left;'>" . $row['pkidProveedor'] . "</td>";
echo "<td style='padding: 8px; text-align: left;'>" . $row['NombreProveedor'] . "</td>";
echo "<td style='padding: 8px; text-align: left;'>" . $row['ApellidoProveedor'] . "</td>";
echo "<td style='padding: 8px; text-align: left;'>" . $row['IdentificacionProveedor'] . "</td>";
echo "<td style='padding: 8px; text-align: left;'>" . $row['EmailProveedor'] . "</td>";
echo "<td style='padding: 8px; text-align: left;'>" . $row['TelProveedor'] . "</td>";
echo "<td style='padding: 8px; text-align: left;'>" . $row['EmpresaProveedor'] . "</td>";
echo "<td style='padding: 8px; text-align: left;'>";

echo "<a href='Editar.php?pkidProveedor=" . $row['pkidProveedor'] . "' class='edit-button'>Editar</a> | ";
echo "<a href='eliminar.php?pkidProveedor=" . $row['pkidProveedor'] . "' class='delete-button'>Eliminar</a>";
echo "</td>";
echo "</tr>";
}
echo "</table>";
        
    $mibd = null;
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>

<style>
    .edit-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #009929; /* color para el boton editar*/

color: #fff;
    text-decoration: none;
    border: 1px solid #007bff;
    border-radius: 5px;
    cursor: pointer;
}

.delete-button {
    display: inline-block;
    padding: 10px 20px; 
    background-color: #dc3545; /* Color para el boton eliminar */
    color: #fff;
    text-decoration: none;
    border: 1px solid #dc3545;
    border-radius: 5px;
    cursor: pointer;
}
.excel-link {
        position: absolute; /* Esto permite el posicionamiento absoluto */
        top: 10px; /* Ajusta la distancia desde la parte superior */
        right: 10px; /* Ajusta la distancia desde la derecha */
        
    }

/* Estilos para el estado hover (cuando se pasa el mouse sobre los botones) */
.edit-button:hover {
    background-color: #0056b3; /* Cambiar el color azul al pasar el mouse */
}

.delete-button:hover {
    background-color: #c82333; /* Cambiar el color rojo al pasar el mouse */
}
.titulo {
    text-align: center;
    border: #0075ff;
    background-color: #FFB7C2;
}

</style>
