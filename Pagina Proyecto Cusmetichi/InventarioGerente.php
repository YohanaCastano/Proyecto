session_start();
if (!isset($_SESSION['usuario'])) {
    //si no existe usuario
    header('Location: ../view/AccesoDenegado.php');
}else { ?>

<!DOCTYPE html>

<html>
<head>

<header class="header">
  <nav id="menu">
  <li>
    <div class="usuario">
<img src="imagenes/yohana.jpg" alt="Foto de perfil"><br><br><br>
<span>Yohana Casta&nacute;o</span><br>
</div
  
</li>
  </nav>
  </header>
  </head>
  <body>
  <link rel="stylesheet" href="estilos.css">

  <h1>Bienvenido a la p&aacute;gina de inventarios</h1><br><br><br><br>

<div class="container">
  <a href="Crud_Proveedor/formularioRegistroProveedor.php">
    <img src="imagenes/registrar proveedor.jpg" alt="Registrar proveedor">
    <figcaption>Registrar Proveedor</figcaption>
    </a>

<a href="formularioRegistrocompraPorveedor.php">
  <img src="imagenes/compra a proveedor.jpg" alt="Registrar proveedor">
  <figcaption>Registrar Compra a Proveedor</figcaption>
</a>
<a href="formularioRegistroProductos.php">
  <img src="imagenes/registrar productos.jpg" alt="Registrar proveedor">
        <figcaption>Registrar Productos</figcaption>
        </a>
        <a href="formularioDevolucion.php">
          <img src="imagenes/registrar devolucion.jpg" alt="Registrar proveedor">
          <figcaption>Registrar Devolucion</figcaption>
          </a>
          <a href="Crud_Proveedor/mostrar_datos.php">
            <img src="imagenes/consultar proveedor.jpg" alt="Registrar proveedor">
            <figcaption>Consultar Proveedor</figcaption>
            </a>
            <a href="ConsultarInventario.php">
              <img src="imagenes/registrar devolucion.jpg" alt="Registrar proveedor">
              <figcaption>Consultar Inventario</figcaption>
              </a>
        </div><br><br><br>
        <button class="button" onclick="redireccionarPagina()">Volver a la página principal</button><br><br>
       <a href="cerrarSesion.php">Cerrar sesión</a>

  <script>
    function redireccionarPagina() {
      window.location.href = "gestionInventario.php"; // Reemplaza "pagina_principal.html" con la URL de la página principal
    }
  </script>
</body>

</html>

<style>
  
  /* menu */
  body {
background-color: #ffffff;
background-position: center;
background-repeat: no-repeat;
background-size: cover;
background-attachment: fixed;
}
  .usuario {
  
  display: flex;
  align-items: center;
  }
  
  .usuario img {
  width: 60px;
  height: 60px;
  border-radius: 50%;
    margin-right: 5px;
  }
  
  .usuario span {
    font-size: 16px;
    font-weight: bold;
  }
  


body {
font-family: Arial, sans-serif;
margin: 0;
padding: 20px;
}

h1 {
text-align: center;
}
body {
background-color: #ffffff;
background-position: center;
background-repeat: no-repeat;
background-size: cover;
background-attachment: fixed;
}
.container {
max-width: 800px;
margin: 0 auto;
padding: .4rem 3rem;
}

.button {
display: inline-block;
padding: 10px 20px;
background-color: #4857c4;
color: white;
text-decoration: none;
border-radius: 4px;
}
</style>
</head>
<body>
