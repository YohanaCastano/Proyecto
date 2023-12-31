<html>
<head>
	
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
					<li><a href="index.html">Inicio</a></li>
					
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
		</header><br><br><br><br><br>
		 <link rel="stylesheet" href="style.css">
	<title>Formulario y mapa</title>
	
</head>
<body>
	<div class="formulario">
		<h1>Formulario de contacto</h1>
		<h3>Escríbenos y nos pondremos en contacto contigo</h3>
		<form>
			
			<input type="text"id="nombre" name="nombre" placeholder="Escribe tu nombre" pattern="[a-zA-Z ]{2,}"
			title="Ingresa un nombre válido (solo letras y espacios)" required> 

			<input type="text" id ="apellido"name="apellido" placeholder="Escribe tu apellido" pattern="[a-zA-Z ]{2,}"
			title="Ingresa un apellido válido (solo letras y espacios)" required> 

			<input type="text"id="email" name="email" placeholder="E-mail" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" required>

			<input type="text"id="asunto" name="asunto" placeholder="Escribe un asunto" pattern="[a-zA-Z ]{100,}"
			title="Ingresa un asunto válido (solo letras y espacios)" required> 

			<textarea id="mensaje" name="mensaje" placeholder="Escribe un mensaje" pattern=""[a-zA-Z ]{2,}"
			title="Ingresa un asunto válido (solo letras y espacios)" required rows="5" cols="30"></textarea><br><br>

			<button type="submit">Enviar</button>
		</form>
	</div>
	<div class="mapa">
		<iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3977.3881287483246!2d-74.12146092405966!3d4.523897943162908!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sCALLE%2069f%20%23%2014a%20-%2037%20sUR%20aURORA%201!5e0!3m2!1ses!2sco!4v1683238402949!5m2!1ses!2sco" allowfullscreen=""></iframe>
	</div><br><br><br><br>
	<footer>
		<p>Derechos reservados Cusmetichi; 2023 - Nuestra empresa</p>
	</footer>
</body>
</html>
<style>
		
	body {
		background-color: #ffffff;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		background-attachment: fixed;
		}
	.formulario {
		display: inline-block;
		vertical-align: top;
		width: 40%;
		padding: 20px;
		box-sizing: border-box;
		background-color: #FFB7C2 ;
	}
	input[type="text"],input[type="password"]{
	width: 80%;
	margin: 10px;
	padding: 10px;
	border-radius:8px;
	border:none;
	box-sizing: border-box;
}
	.mapa {
		display: inline-block;
		vertical-align: top;
		width: 50%;
		padding: 20px;
		box-sizing: border-box;
	}
	iframe {
		width: 100%;
		height: 400px;
		border: 0;
	}
	#mensaje {
    width: 450px;
    height: 100px;
    background-color: #ffffff;
    border: 1px solid #ffffff;
    padding: 5px;
    font-size: 14px;
    font-family: Arial, sans-serif;
  }
</style>