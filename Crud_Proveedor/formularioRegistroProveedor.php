<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilos.css">
   
    <title>Validacion Formulario</title>
</head>
<body>
    <div class="contenedor-principal">
        <form method="post" action="mostrar_datos.php" class="formulario" id="formulario">
            <h2>registro proveedor</h2>
           
            <div class ="formulario_grupo">

            <input type="int" class="formulario_grupo_input" name ="pkidProveedor" id="pkidProveedor" placeholder="IdProveedor"  ><br><br>
            <input type="text" class="formulario_grupo_input" name ="NombreProveedor" id="NombreProveedor" placeholder="nombre" required ><br><br>
            <input type="text" class="formulario_grupo_input" name ="ApellidoProveedor" id="ApellidoProveedor" placeholder="apellido" required ><br><br>
            <input type="int" class="formulario_grupo_input" name ="IdentificacionProveedor" id="IdentificacionProveedor" placeholder="documento" required ><br><br>
            <input type="text" class="formulario_grupo_input" name ="EmailProveedor" id="EmailProveedor" placeholder="Email" required ><br><br>
            <input type="int" class="formulario_grupo_input" name ="TelProveedor" id="TelProveedor" placeholder="celular" required ><br><br>
            <input type="text" class="formulario_grupo_input" name ="EmpresaProveedor" id="EmpresaProveedor" placeholder="Nombre Empresa" required ><br><br>
                
      
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