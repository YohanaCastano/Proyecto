<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilos.css">
   
    <title>formulario Registro Proveedor</title>
</head>
<body>
    <div class="contenedor-principal">
        <form method="post" action="mostrar_datos.php" class="formulario" id="formulario">
            <h2>registro proveedor</h2>
           
            <div class ="formulario_grupo">


<input type="number" class="formulario_grupo_input" name="pkidProveedor" id="pkidProveedor" placeholder="IdProveedor" required pattern="[0-9]+"><br><br>
<input type="text" class="formulario_grupo_input" name="NombreProveedor" id="NombreProveedor" placeholder="nombre" required pattern="[a-zA-Záéíóú\s]{3,15}"><br><br>
<input type="text" class="formulario_grupo_input" name="ApellidoProveedor" id="ApellidoProveedor" placeholder="apellido" required pattern="[a-zA-Záéíóú\s]{3,15}"><br><br>
<input type="number" class="formulario_grupo_input" name="IdentificacionProveedor" id="IdentificacionProveedor" placeholder="documento" required pattern= "^[1-9]{8,10}$"><br><br>
<input type="email" class="formulario_grupo_input" name="EmailProveedor" id="EmailProveedor" placeholder="Email" required pattern ="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\.(com|es|co)$"><br><br>
<input type="tel" class="formulario_grupo_input" name="TelProveedor" id="TelProveedor" placeholder="celular" required pattern="^(310|311|312|313|314|320|321|322|323|315|316|317|318|300|301|350|351)\d{7}$"><br><br>
<input type="text" class="formulario_grupo_input" name="EmpresaProveedor" id="EmpresaProveedor" placeholder="Nombre Empresa" required pattern="^[A-Za-záéíóúÁÉÍÓÚñÑ\s]+$"><br><br>
    
                <span class="mensajeError" id="mensajeError"></span><br>

                <input type="checkbox" id="terminos" name="terminos" required>
<label for="terminos">Estoy de acuerdo con los terminos y condiciones</label><br><br>

            </div> 
            <button id="submitButton" type="submit">Registrar</button>  
            </form>
        
        <div class="imagen">
            <img src="https://proveedor.mercadopublico.cl/assets/img/steps/index-registro.svg" alt="Imagen Registrarse">
        </div>
    </div>
    <script src="JS/validarRegistroProveedor.js"></script>
</body>
</html>