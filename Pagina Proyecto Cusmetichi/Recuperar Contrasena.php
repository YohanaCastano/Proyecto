<!DOCTYPE html>
<html>
<head>
       <meta charset="UTF-8">

<style>
    body {
        background-color: #ADD8E6;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
        }
</style>
        <header class="header">
        <div class="logo-header">
            <a href=""><img src="Logo.png" alt=""></a>
        </div>
        <div class="nav-menu">
            <input type="checkbox" id="check">    
            <label for="check" class="checkbtn">
                <i class="menu-icon"><img src="hamburguesa.png" alt=""></i>
            </label>
            <ul>
                <li><a href="index.php">Inicio</a></li>
                <li><a href="quienesSomos.php">Quienes somos</a></li>
                <li><a href="productos.php">Productos</a></li>
                <li><a href=" formularioContactenos.php">Contactanos</a></li>
                <li><a href="formularioRegistrarse.php">Registrarse</a></li>
                <li><a href="formularioLogin.php">Iniciar sesion</a></li>
            </ul>
        </div>
    </header>
            
        </ul>

        <link rel="stylesheet" href="estilos.css">

  <title>Recuperar Contraseña</title>
  <style>

    /* Recuperar Contraseña */

    .container{  /*Margen Formato*/
        max-width: 330px;
        margin: 20% auto;
        padding: 80px;
        background: #76acf3;
        border-radius: 15px;
    }

    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    h2 {
      text-align: center;
      margin-top: 40px;
    }

    form {
      max-width: 400px;
      margin: 0 auto;
      padding: 20px;
      background: #76acf3;
      border-radius: 10px;
    }

    label {
      display: block;
      margin-bottom: 10px;
    }

    input[type="email"], /*Cajones de Texto*/
    input[type="password"] {
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 7px;
      margin-bottom: 8px;
    }

    input[type="submit"] { /*Boton*/
      width: 50%;
      padding: 3px;
      background-color: #4857c4;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
  </style>
</head>
<body>
    <div class="container">
    <h2>Recuperar Contraseña</h2>

    <form>
      <input type="email" id="email" name="email" placeholder= "Ingrese su Correo Electrónico"  required>
      <input type="password" id="contrasenaAntigua" name="contrasenaAntigua" placeholder= "Ingrese su Contraseña Antigua" required>
      <input type="password" id="contrasenaNueva" name="contrasenaNueva" placeholder= "Ingrese su Contraseña Nueva" required>

      <center>
      <br>
      <input type="submit" value="Recuperar Contraseña"><br>
      <input type="submit" value="Limpiar">
      </center>


    </form>
  </div>
</body>
</html>
