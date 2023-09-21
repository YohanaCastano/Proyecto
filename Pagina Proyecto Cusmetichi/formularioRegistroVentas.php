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
        <form action="" class="formulario" id="formulario">
            
<h2>Registro de Venta</h2>
           
            <div class="formulario_grupo">
                
               
<input type="text" class="formulario_grupo_input" name="nombre" id="nombre" placeholder="Nombre" required><br><br>
                <input type="int" class="formulario_grupo_input" name="cantidad" id="cantidad" placeholder="Cantidad" required><br>
                <select id="metodo_pago" name="metodo_pago" required>
                    <option value="">Seleccione un método de pago</option>
                    <option value="efectivo">Efectivo</option>
                    <option value="tarjeta">Tarjeta de Crédito</option>
                
</select>
                
<input type="int"  class="formulario_grupo_input" name="precio" id="precio" placeholder="Precio" required><br><br>
<select id="producto" name="producto" required>
                    
<option value="">Seleccione una categoría</option>
                    <option value="shampoo">Shampoo</option>
                    <option value="tratamiento">Tratamiento Capilar</option>
                    <option value="esmalte">Esmalte</option>
                    <option value="tinte">Tinte</option>
                </select>
                <span class="mensajeError" id="mensajeError"></span><br>
            </div> 
            <button id="submitButton" type="submit">Registrar</button>  
        </form>
        
<div class="imagen">
            <img src="https://www.proacciona.es/wp-content/uploads/2021/05/obtener_registro_sanitario_alimentos.jpg" alt="Imagen Registrarse">
        </div>
    </div>
    <script src="JS/validarRegistroVentas.js"></script>
</body>
</html>
  
    