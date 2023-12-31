<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="estilos.css">
    <title>Formulario Registro</title>
</head>

    <body>
        <header class="header">
        <div class="logo-header">
            <a href=""><img src="imagenes/logonuevo.jpg" alt=""></a>
        </div>
        <div class="nav-menu">
            <input type="checkbox" id="check">    
            <label for="check" class="checkbtn">
                <i class="menu-icon"><img src="imagenes/hamburguesa.png" alt=""></i>
            </label>
            <ul>
                <li><a href="#"><i class="fas fa-home"></i> Inicio</a></li>
                
                <li><a href="quienesSomos.php">Qui&eacute;nes somos</a></li>
                <li><a href="productos.php">Productos</a></li>
                <li><a href="formularioContactenos.php">Cont&aacute;ctanos</a></li>
                <li><a href="formularioRegistro.php">Registrarse</a></li>
                <li><a href="formularioLogin.php">Iniciar sesi&oacute;n</a></li>
                <li><a href="gestionInventario.php">Inventario</a></li><br><br><br>
        
              
                
                    <form>
        
        <div class="buscar-btn">
                        <input type="search" name="buscar" placeholder="Buscar...">
                        <input type="submit" value="Buscar" class="buscar-btn">
                    </form>
                </div>
            </ul>
        </div>
        </header>
        </body>
        <br><br><br>
        
        
    <div class="contenedor-principal">
        
        <form method="post" action="mostrar_registros.php" class="formulario" id="formulario">
            <h2>registro </h2>
           
            <div class ="formulario_grupo">

                <input type="text" class="formulario_grupo_input" name ="nombre" id="nombre" placeholder="nombre" required ><br><br>
                <input type="text" class="formulario_grupo_input" name ="apellido" id="apellido" placeholder="apellido" required ><br><br>
                <input type="text" class="formulario_grupo_input" name ="email" id="email" placeholder="Email" required ><br><br>
                <input type="password" class="formulario_grupo_input" name ="contraseña" id="contraseña" placeholder="contraseña" required ><br><br>

                <span class="mensajeError" id="mensajeError"></span><br>
                <input type="checkbox" id="terminos" name="terminos" required>

<label for="terminos">Estoy de acuerdo con los terminos y condiciones</label><br><br>
               
            </div> 
            <button id="submitButton" type="submit">Registrar</button>  
            </form>
        
        <div class="imagen">
            <img src="https://proveedor.mercadopublico.cl/assets/img/steps/index-registro.svg" alt="Imagen Registrarse">
        </div>
    <script src="JS/validarRegistro.js"></script>
</body>
</html>
  
    