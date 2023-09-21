<!DOCTYPE html>
<html>
<head>


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
   <nav id="menu">
   <ul>
       <li><a href="index.html">Inicio</a></li>
       <li><a href="#">Proveedor</a>
           <ul>
               <li><a href="registro proveedor.html">Registrar Proveedor</a></li><br>
               <li><a href="Consultar Proveedor.html">Consultar Proveedor</a></li><br>
               <center><li><a href="Registro Compra Proveedor.html">Registrar compra a proveedor</a></li><br></center>
           </ul>
       </li>
       <li><a href="#">Inventario</a><br>
           <ul>
               <li><a href="Consultar Inventario.html">Consultar Inventario</a></li><br>
               <center><li><a href="Registro Devoluciones.html">Registrar devolución</a></li><br></center>
               <li><a href="registrarproducto.html">Agregar productos</a></li><br>
           </ul>
       </li>
       <li><a href="Reporte.html">Reporte</a></li><br>
   </ul>
   </nav>
   </header>
   </head>
   <body>
   <link rel="stylesheet" href="estilos.css">
   
   <style>
   
   /* menu */
   #menu ul {
   list-style:none;
   margin:0;
   padding:0;
   }
   
   /* items del menu */
   #menu ul li {
   background-color:#77ACF2;
   width: 350px;
   height: 25px;
   text-align: center;
   }
   
   /* enlaces del menu */
   #menu ul a {
   display:block;
   color:#fff;
   text-decoration:none;
   font-size:15px;  /*tamaño de letra*/
   padding:5px;
   font-family:"HelveticaNeue", "Helvetica Neue", Helvetica, Arial, sans-serif;
   text-transform:uppercase;
   letter-spacing:3px;
   }
   
   #menu ul li {
   position:relative;
   float:left;
   margin: 0;
   padding:0;
   }
   
   /* efecto al pasar el ratón por los items del menu */
   #menu ul li:hover {
   background:#0c57cf;
   }
   
   #menu ul ul {
   display:none;
   position:absolute;
   top:80%;
   left:0;
   background:#77ACF2;
   padding:0;
   }
   
   #menu ul ul li {
   float:none;
   width:150px
   }
   
   #menu ul ul a {
   line-height:120%;
   padding:0px 0px;
   }
   
   /* items del menu desplegable al pasar el ratón */
   
   #menu ul li:hover > ul {
   display:block;
   }
   
   </style>
   
  
  <title>Tabla de Ventas y Reporte</title>
  <form action="gestion de inventario.html" method="POST">

  <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }
    th, td {
      border: 1px solid black;
      padding: 8px;
    }
    th {
      background-color: #76acf3;
    }
  </style>

  
</head>
<body>
  <h1>Tabla de Ventas y Reporte</h1>

  <table>
    <tr>
      <th>Producto</th>
      <th>Cantidad</th>
      <th>Precio Unitario</th>
      <th>Total</th>
    </tr>
    <tr>
      <td>Producto 1</td>
      <td>10</td>
      <td>$10</td>
      <td>$100</td>
    </tr>
    <tr>
      <td>Producto 2</td>
      <td>5</td>
      <td>$20</td>
      <td>$100</td>
    </tr>
    <tr>
      <td colspan="3">Total Ventas:</td>
      <td>$200</td>
    </tr>
  </table>

  <h2>Reporte</h2>

  <table>
    <tr>
      <th>Mes</th>
      <th>Ventas</th>
    </tr>
    <tr>
      <td>Enero</td>
      <td>$500</td>
    </tr>
    <tr>
      <td>Febrero</td>
      <td>$800</td>
    </tr>
    <tr>
      <td>Marzo</td>
      <td>$650</td>
    </tr>
    <tr>
      <td>Total</td>
      <td>$1950</td>
    </tr>
  </table>
</body>
</html>
