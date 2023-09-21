<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilos.css">
   
    <title>Validacion Formulario</title>
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
                <li><a href="gestionInventario.php">Inventario</a></li>
    
                <form>
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
        <br><br><br><BR><BR><BR>
    <div class="contenedor-principal">
        <form action="" class="formulario" id="formulario">
            <h2>Formulario de Contacto</h2>
           
            <div class ="formulario_grupo">

                <input type="text" class="formulario_grupo_input" name ="nombre" id="nombre" placeholder="nombre" required ><br><br>
                <input type="text" class="formulario_grupo_input" name ="apellido" id="apellido" placeholder="apellido" required ><br><br>
                <input type="text" class="formulario_grupo_input" name ="email" id="email" placeholder="Email" required ><br><br>
                <input type="text" class="formulario_grupo_input" name ="asunto" id="asunto" placeholder="asunto" required ><br><br>
                <input type="texttarea" class="formulario_grupo_input" name ="mensaje" id="mensaje" placeholder="Escribe un mensaje" required ><br><br>

                <span class="mensajeError" id="mensajeError"></span><br>
                <button id="submitButton" type="submit">Registrar</button> 
            </div> 

            <div class="mapa">
                <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3977.3881287483246!2d-74.12146092405966!3d4.523897943162908!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sCALLE%2069f%20%23%2014a%20-%2037%20sUR%20aURORA%201!5e0!3m2!1ses!2sco!4v1683238402949!5m2!1ses!2sco" allowfullscreen="" style="width: 100%; height: 500px;"></iframe>
            </div><br><br><br>
        </form>
        <script src="js/validarContactenos.js"></script>
    </body>
    </html>
    