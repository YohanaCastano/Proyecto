<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilos.css">
    <title>Formulario Login</title>
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
                <li><a href="quienesSomos.php">Quiénes somos</a></li>
                <li><a href="productos.php">Productos</a></li>
                <li><a href="formularioContactenos.php">Contáctanos</a></li>
                <li><a href="formularioRegistro.php">Registrarse</a></li>
                <li><a href="formularioLogin.php">Iniciar sesión</a></li>
                <li><a href="gestionInventario.php">Inventario</a></li>
            </ul>
            <form>
                <div class="buscar-btn">
                    <input type="search" name="buscar" placeholder="Buscar...">
                    <input type="submit" value="Buscar" class="buscar-btn">
                </div>
            </form>
        </div>
    </header>
    
    <div class="contenedor-principal">
        <form action="validar.php" method="post" class="formulario" id="formulario">
            <h2>Login</h2>
           
            <div class="formulario_grupo">
            <input type="email" class="formulario_grupo_input" name="Email" id="Email" placeholder="Email" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"><br><br>
            <input type="password" class="formulario_grupo_input" name="Contraseña" id="Contraseña" placeholder="Contraseña" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$">
                <span class="mensajeError" id="mensajeError"></span>
            </div> 
            <button id="submitButton" type="submit">Ingresar</button>
            <p>¿Olvidó su contraseña?<a href="RecuperarContrasena.html"> - Recuperar Contraseña</a></p>
            <p>¿Necesitas una cuenta?<a href="registrarse.html"> - Registrarse</a></p>
            <p class="sign-up-divider">O inicia con</p>
            <div class="iconos-sociales"> 
                <center>
                    <a href="https://www.facebook.com/?stype=lo&jlou=Aff4QEHywvD6pdvv5alIsBlr3YTpOKC9soOQ5d7tzsz35VK5csKkBXn9_E7ANi7EOMPzPy2K18aWmKjslhm0IErVLrpnCmMsGogn1x32XHQxcw&smuh=4583&lh=Ac_qPbfuMneurnEyFlg" target="_blank"><img loading="lazy" alt="Sígueme en Facebook" height="35" width="35" src=" https://1.bp.blogspot.com/-Pop-U7OywXs/YPhkfrImyiI/AAAAAAAAA1Y/UBnVfTK9j2U-bIUqwZYMNSQPvz_l06mbwCPcBGAYYCw/s0/facebook-icono.png" title="Sígueme en Facebook"/></a>
                    <a href="Error404.html" target="_blank"><img loading="lazy" alt="Sígueme en Instagram" height="35" width="35" src="https://1.bp.blogspot.com/-VFfOISywV0c/YPhkeRXuRQI/AAAAAAAAA1M/L75S9Usg5AovunH2Y-VzqJbaaY1LuK3eACPcBGAYYCw/s0/Instagram-icono.png" title="Sígueme en Instagram"/></a>      
                    <a href="Error500.html" target="_blank"><img loading="lazy" alt="Sígueme en Twitter" height="35" width="35" src=" https://1.bp.blogspot.com/-2JwTJZxg1AU/YPhkfB0DdjI/AAAAAAAAA1c/tDKdU6tS0A0lt4YegGUVd7k-9hguYz82ACPcBGAYYCw/s0/Twitter-icono.png" title="Sígueme en Twitter"/></a>
                </center>
            </div>
        </form>
        <div class="imagen">
            <img src="https://img.freepik.com/vector-gratis/ilustracion-concepto-abstracto-control-contenido-medios_335657-3688.jpg?w=740&t=st=1688018125~exp=1688018725~hmac=79ea9fa901221c8c55ebc0bfa3722f16527c5e73c0053a1a5d41067dff2f0f76" alt="Imagen Registrarse">
        </div>
        <script src="JS/validarLogin.js"></script>
    </div>
</body>
</html>
  
    