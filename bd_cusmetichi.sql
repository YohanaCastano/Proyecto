-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost: 3306
-- Tiempo de generación: 21-09-2023 a las 02:50:26
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_cusmetichi`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarEmpleados` (IN `NombreProducto` VARCHAR(50))   BEGIN
	SELECT
	  e.NombreEmpleado,
	  e.ApellidoEmpleado,
	  v.FechaVenta,
	  p.PrecioProducto,
	  c.NombreClientes,
	  c.ApellidoClientes
	FROM
	  empleados e
	INNER JOIN ventas v ON v.fkidEmpleado = e.pkidEmpleado
	INNER JOIN producto_venta pv ON pv.pkidVentas = v.pkidVentas
	INNER JOIN producto p ON pv.pkidProducto = p.pkidProducto
	INNER JOIN clientes c ON p.pkidProducto = c.fkidProducto
	WHERE
	  p.NombreProducto = NombreProducto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarEntradaSalida` (IN `NombreProveedor` VARCHAR(20), IN `ApellidoProveedor` VARCHAR(20))   BEGIN
	SELECT
	  en.CantidadEntradas,
	  en.fecha_entrada,
      s.CantidadSalidas,
	  s.fecha_salida,
      p.NombreProducto,
      p.StockProducto,
      pr.NombreProveedor,
      pr.ApellidoProveedor
	  
	FROM 
	  entradas en
     
	INNER JOIN inventario i ON i.fkidEntradas = en.pkidEntradas
	INNER JOIN salidas s ON  s.pkidSalidas = i.fkidSalidas
	INNER JOIN producto p ON p.fkidInventario = i.pkidInventario
	INNER JOIN proveedor pr ON pr.pkidProveedor = p.fkidProveedor
	WHERE
	  pr.NombreProveedor = NombreProveedor AND pr.ApellidoProveedor = ApellidoProveedor;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `pkidCategorias` int(11) NOT NULL,
  `NombreCategorias` varchar(45) NOT NULL,
  `fkidProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`pkidCategorias`, `NombreCategorias`, `fkidProducto`) VALUES
(3, 'Herbacol', 1),
(4, 'Duvyclass', 2),
(5, 'Igora', 3),
(6, 'Admis', 4),
(7, 'Checo', 5),
(8, 'Admis', 6),
(9, 'Checo', 7),
(10, 'Herbacol', 8),
(11, 'Herbacol', 9),
(12, 'Admis', 10),
(13, 'Duvyclass', 11),
(14, 'Checo', 12),
(15, 'Duvyclass', 13),
(16, 'Admis', 14),
(17, 'Admis', 15),
(18, 'Checo', 16),
(19, 'Igora', 17),
(20, 'Igora', 18),
(21, 'Igora', 19),
(22, 'Checo', 20),
(23, 'Checo', 21),
(24, 'Admis', 22),
(25, 'Admis', 23),
(26, 'Checo', 24),
(27, 'Checo', 25),
(28, 'Duvyclass', 26),
(29, 'Duvyclass', 27),
(30, 'Herbacol', 28),
(31, 'Herbacol', 29),
(32, 'Herbacol', 30),
(33, 'Admis', 31),
(34, 'Admis', 32),
(35, 'Igora', 33),
(36, 'Checo', 34),
(37, 'Admis', 35),
(38, 'Checo', 36),
(39, 'Igora', 37),
(40, 'Admis', 38),
(41, 'Herbacol', 39),
(42, 'Igora', 40),
(43, 'Admis', 41),
(44, 'Admis', 42),
(45, 'Duvyclass', 43),
(46, 'Duvyclass', 44),
(47, 'Herbacol', 45),
(48, 'Igora', 46),
(49, 'Checo', 47),
(50, 'Herbacol', 48),
(51, 'Duvyclass1', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `pkidClientes` int(11) NOT NULL,
  `NombreClientes` varchar(45) NOT NULL,
  `ApellidoClientes` varchar(45) NOT NULL,
  `IdentificacionClientes` int(11) NOT NULL,
  `EmailClientes` varchar(45) NOT NULL,
  `TelClientes` int(11) NOT NULL,
  `DireccionClientes` varchar(45) NOT NULL,
  `fkidProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`pkidClientes`, `NombreClientes`, `ApellidoClientes`, `IdentificacionClientes`, `EmailClientes`, `TelClientes`, `DireccionClientes`, `fkidProducto`) VALUES
(1, 'Luis', 'Ortiz', 1223632012, 'luisortiz01@hotmail.com', 2147483647, 'Cll.58B#32A-02', 1),
(2, 'Raul', 'Quintero', 23698523, 'raulquintero03@yahoo.es', 2147483647, 'Cll.65H#45R-08', 2),
(3, 'Lorena', 'Ruiz', 1012569896, 'lorenaruiz04@gmail.com', 2147483647, 'Cll.20H#63C-20', 3),
(4, 'Mia', 'Lopez', 1236230012, 'mialopez05@hotmail.com', 2147483647, 'Cll.20H#63C-20', 4),
(5, 'Johana', 'Jimenez', 1325698012, 'johanajimenez@gmail.com', 2147483647, 'Cll.56D#12N-25', 5),
(6, 'Carol', 'Diaz', 1000326123, 'caroldiaz07@hotmail.com', 2147483647, 'Cra.24I#56D-21', 6),
(7, 'Fernando', 'Diaz', 25698563, 'ferdias008@gmail.com', 2147483647, 'Cll.25Z#89C-10', 7),
(8, 'Mia', 'Rincon', 1023652333, 'miaroncon09@yahoo.es', 2147483647, 'Cll.36C#10C-12', 8),
(9, 'Adriana', 'Ortiz', 1360222569, 'adrianaortiz10@hotmail.com', 315698441, 'Cra.50T#12A-23', 9),
(10, 'Liz', 'Quintero', 2147483647, 'lizquintero11@gmail.com', 2147483647, 'Cra.30D#20A-20', 10),
(11, 'Paola', 'Ruiz', 36598421, 'paolaruiz12@hotmail.com', 2147483647, 'Cll.36C#10C-12', 11),
(12, 'Kimberly', 'Arias', 1203652899, 'kimberlyarias13@yahoo.es', 2147483647, 'Cll.30V#15F-12', 12),
(13, 'Manuel', 'Osorio', 26523120, 'manuelorosio14@hotmail.com', 2147483647, 'Cra.24B#50G-45', 13),
(14, 'Marisol', 'Ospina', 1032002654, 'marizolospina15@gmail.com', 2147483647, 'Cra.26N#20C-02', 14),
(15, 'Carlos', 'Jimenez', 16236548, 'carlosjimenez16@gmail.com', 2147483647, 'Cll.65C#23H-45', 15),
(16, 'Maria', 'Rivera', 26541001, 'mariarivera17@hotmail.com', 2147483647, 'Cra.02J#01I-04', 16),
(17, 'Fabian', 'Arenas', 1654896231, 'fabianarenas18@gmail.com', 2147483647, 'Cra.56H#15L-22', 17),
(18, 'Paula', 'Zapata', 1542652100, 'paulazapata19@gmail.com', 2147483647, 'Av.Cra.23Y#12G-12', 18),
(19, 'Ana', 'Aristizabal', 23659874, 'anariztizabal20@yahoo.es', 2147483647, 'Cll.12I#05C-56', 19),
(20, 'Carla', 'Soler', 1698542101, 'carlacoler21@hotmail.com', 2147483647, 'Cra.54J#24D-32', 20),
(21, 'Alberto', 'Giraldo', 12652320, 'albertogiraldo22@hotmail.com', 2147483647, 'Av.Cra.48L#89J-04', 21),
(22, 'Loren', 'Muñoz', 1332232123, 'loremunoz23@hotmail.com', 2147483647, 'Cll.9G#100K-08', 20),
(23, 'Luis', 'Fonseca', 16542101, 'luisfonseca24@gmail.com', 2147483647, 'Cll.23F#98P-12', 23),
(24, 'Andres', 'Rincon', 23623121, 'andresrincon25@hotmail.com', 2147483647, 'Cra.5G#01T-36', 24),
(25, 'Julio', 'Coy', 1032698745, 'juliocoy026@hotmail.com', 2147483647, 'Cll.89L#56Q-89', 25),
(26, 'Juan', 'Perez', 16542103, 'juanperez27@gmail.com', 2147483647, 'Cll.100N#12C-20', 26),
(27, 'Emilse', 'Ruiz', 1987456321, 'emilseruiz028@hotmail.es', 2147483647, 'Cll.23F#23C-30', 27),
(28, 'Diana', 'Tellez', 24895632, 'dianatellez029@gmail.com', 2147483647, 'Av.Cra.45C#25V-48', 28),
(29, 'Dania', 'Gonzalez', 27897542, 'dianagonzalez30@hotmail.com', 2147483647, 'Cll.56C#48H-02', 29),
(30, 'Dairon', 'Rico', 1012554899, 'darionrico31@hotmail.com', 2147483647, 'Cll.80D#80Y-75', 30),
(31, 'Milena', 'Muñoz', 1369542012, 'milenamunoz21@gmail.com', 2147483647, 'Cll.102B#12C-03', 31),
(32, 'Eduardo', 'Cubillos', 26541158, 'eduardocubillos33@hotmail.com', 2147483647, 'Cll.54D#23J-12', 32),
(33, 'Jhon', 'Ramirez', 23698521, 'jhonramirez34@gmail.com', 2147483647, 'Cra.12I#69C-45', 33),
(34, 'Paola', 'Puentes', 16665696, 'paolapuentes35@yahoo.es', 2147483647, 'Cll.23K#102I-36', 34),
(35, 'Karen', 'Castaño', 1012556987, 'karencastano36@hotmail.com', 2147483647, 'Cll.26Q#03D-12', 35),
(36, 'Valentina', 'Rampla', 1236023652, 'valentinarampla37@yahoo.es', 2147483647, 'Av.Cll.23I#45L-17', 36),
(37, 'Andres', 'Diaz', 12588785, 'andresdiaz038@hotmail.com', 2147483647, 'Cra.89O#89J-58', 37),
(38, 'Jesus', 'Olmos', 1023632015, 'jesusolmos39@hotmail.com', 2147483647, 'Cll.95P#32N-03', 38),
(39, 'Emiliano', 'Guerrero', 12332023, 'emilianoguerrero40@gmail.com', 2147483647, 'Cll.89M#21V-15', 39),
(40, 'Emmanuel', 'Gonzalez', 80563112, 'emmanuelgonzalez41@hotmail.com', 2147483647, 'Cll.24T#55C-56', 40),
(41, 'Lucas', 'Jimenez', 82523125, 'lucasjimenez42@gmail.com', 2147483647, 'Cll.23O#01L-87', 41),
(42, 'Diana', 'Ruiz', 1023998745, 'dianaruiz043@hotmail.com', 2147483647, 'Cra.02C#87O-99', 42),
(43, 'Marcela', 'Torres', 78985632, 'marcelatorres44@hotmail.com', 2147483647, 'Cll.15D#08P-00', 43),
(44, 'Sol', 'Moreno', 1023652123, 'solmoreno0045@hotmail.com', 2147483647, 'Cll.80D#23C-12', 44),
(45, 'Dulce', 'Rojas', 1116562365, 'dulcerojas046@gamil.com', 2147483647, 'Cll.80V#03C-56', 45),
(46, 'Princesa', 'Castro', 24789741, 'princesacastro47@gmail.com', 2147483647, 'Cll.12P#56C-78', 46),
(47, 'Nahir', 'Vargas', 1129874121, 'nahirvargas48@hotmail.com', 2147483647, 'Cra.56O#06L-23', 47),
(48, 'Jenny', 'Romero', 27896547, 'jennyromero49@hotmail.com', 2147483647, 'Cra.15Q#78I-12', 48),
(49, 'Laura', 'Gomez', 1238582565, 'lauragomez50@gmail.com', 2147483647, 'Cra.89L#02J-03', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraproveedor`
--

CREATE TABLE `compraproveedor` (
  `pkidCompraProveedor` int(11) NOT NULL,
  `cantidadProducto` int(11) NOT NULL,
  `estadoCompra` varchar(45) NOT NULL,
  `FechaCompra` date NOT NULL,
  `costoProducto` float NOT NULL,
  `fkidEmpleado` int(11) DEFAULT NULL,
  `fkidProveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compraproveedor`
--

INSERT INTO `compraproveedor` (`pkidCompraProveedor`, `cantidadProducto`, `estadoCompra`, `FechaCompra`, `costoProducto`, `fkidEmpleado`, `fkidProveedor`) VALUES
(2, 250, 'Aceptado', '2023-05-31', 2000000, 2, 2),
(3, 250, 'Aceptado', '2023-06-03', 2000000, 3, 3),
(4, 50, 'Aceptado', '2023-05-26', 3000000, 4, 4),
(5, 80, 'EnEspera', '2023-05-26', 2500000, 5, 5),
(6, 50, 'EnEspera', '2023-05-31', 2500000, 6, 6),
(7, 120, 'EnProceso', '2023-06-03', 1300000, 7, 7),
(8, 120, 'EnProceso', '2023-06-03', 1300000, 8, 8),
(9, 250, 'Aceptado', '2023-05-26', 3000000, 9, 9),
(10, 50, 'EnProceso', '2023-06-06', 2000000, 10, 10),
(11, 50, 'EnEspera', '2023-06-06', 3000000, 12, 12),
(12, 80, 'EnEspera', '2023-06-06', 2500000, 13, 13),
(13, 80, 'EnProceso', '2023-05-26', 2500000, 14, 14),
(14, 120, 'EnProceso', '2023-05-26', 1300000, 15, 15),
(15, 120, 'Aceptado', '2023-06-06', 3000000, 16, 16),
(16, 180, 'Aceptado', '2023-06-06', 3000000, 17, 17),
(17, 180, 'EnProceso', '2023-05-31', 1300000, 18, 18),
(18, 50, 'EnProceso', '2023-05-31', 1300000, 19, 19),
(19, 50, 'EnEspera', '2023-06-06', 3000000, 20, 21),
(20, 120, 'EnProceso', '2023-06-06', 3800000, 22, 22),
(21, 180, 'EnCamino', '2023-05-26', 2500000, 23, 23),
(22, 120, 'EnCamino', '2023-05-26', 3800000, 24, 24),
(23, 250, 'EnBodega', '2023-06-03', 3000000, 25, 25),
(24, 250, 'EnBodega', '2023-05-31', 1300000, 26, 26),
(25, 80, 'EnProceso', '2023-05-31', 3800000, 27, 27),
(26, 50, 'EnProceso', '2023-06-03', 3000000, 28, 28),
(27, 50, 'EnEspera', '2023-05-26', 3000000, 29, 29),
(28, 50, 'EnCamino', '2023-06-03', 1300000, 30, 30),
(29, 80, 'EnCamino', '2023-05-31', 3800000, 31, 31),
(30, 80, 'EnBodega', '2023-05-31', 4000000, 32, 32),
(31, 80, 'EnCamino', '2023-05-26', 3000000, 33, 33),
(32, 120, 'Aceptado', '2023-05-26', 3800000, 34, 34),
(33, 120, 'Aceptado', '2023-06-03', 2000000, 35, 35),
(34, 50, 'EnBodega', '2023-06-03', 3800000, 36, 36),
(35, 50, 'EnCamino', '2023-05-31', 4000000, 37, 37),
(36, 250, 'EnCamino', '2023-06-03', 3800000, 38, 38),
(37, 180, 'EnEspera', '2023-05-26', 2000000, 39, 39),
(38, 80, 'EnEspera', '2023-05-26', 2000000, 40, 40),
(39, 180, 'EnProceso', '2023-06-03', 2500000, 41, 41),
(40, 50, 'EnProceso', '2023-06-03', 3800000, 42, 42),
(41, 80, 'Aceptado', '2023-05-31', 2000000, 43, 43),
(42, 80, 'EnCamino', '2023-05-26', 2000000, 44, 44),
(43, 120, 'EnCamino', '2023-06-03', 3000000, 45, 45),
(44, 120, 'Aceptado', '2023-06-03', 3800000, 46, 46),
(45, 250, 'EnCamino', '2023-05-31', 3800000, 47, 47),
(46, 250, 'EnProceso', '2023-05-26', 1300000, 48, 48),
(47, 50, 'EnProceso', '2023-05-26', 1300000, 49, 49),
(48, 50, 'Aceptado', '2023-05-31', 2500000, 50, 50),
(49, 250, 'Aceptado', '2023-05-31', 2500000, 11, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `pkidEmpleado` int(11) NOT NULL,
  `NombreEmpleado` varchar(45) NOT NULL,
  `ApellidoEmpleado` varchar(45) NOT NULL,
  `identificacionEmpleado` int(11) NOT NULL,
  `EmailEmpleado` varchar(45) NOT NULL,
  `telEmpleado` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`pkidEmpleado`, `NombreEmpleado`, `ApellidoEmpleado`, `identificacionEmpleado`, `EmailEmpleado`, `telEmpleado`) VALUES
(1, 'Andres', 'Arias', 1236023512, 'andresarias1@hotmail.com', 3112454810),
(2, 'Felipe', 'Castro', 1023652987, 'felipecastro2@gmail.com', 3104587310),
(3, 'Pedro', 'Perez', 1023632056, 'pedroperez3@hotmail.com', 3148721005),
(4, 'Lucas', 'Diaz', 24652987, 'lucasdias4@hotmail.com', 3114582101),
(5, 'Ana', 'Diaz', 1023652985, 'anadiaz05@yahoo.es', 3104587985),
(6, 'Maria', 'Castro', 26369589, 'mariacastro6@hotmail.com', 3124685210),
(7, 'Pedro', 'Perez', 16236589, 'pedroperez7@hotmail.com', 3114852104),
(8, 'Raul', 'Rincon', 16555635, 'raulrincon8@gmail.com', 3214854788),
(9, 'Amanda', 'Castro', 24565231, 'amandacastro9@hotmail.com', 3114897851),
(10, 'Luz', 'Arias', 1023632123, 'luzarias010@hotmail.com', 3124587987),
(11, 'Marcela', 'Perez', 24789562, 'marcelaperez11@gmail.com', 3114587980),
(12, 'Paula', 'Rincon', 23654785, 'paularincon12@hotmail.com', 3114587922),
(13, 'Karen', 'Perez', 24152523, 'karenperez13@yahoo.es', 3224587988),
(14, 'Valentina', 'Arias', 23698452, 'valentinarias14@hotmail.com', 3154864874),
(15, 'Amanda', 'Ruiz', 23652123, 'amandaruiz15@hotmail.com', 3123548979),
(16, 'Camilo', 'Perez', 16598785, 'camiloperez16@gmail.com', 3134879850),
(17, 'Liz', 'Arias', 16023332, 'lizarias017@gmail.com', 3154898795),
(18, 'Dario', 'Arias', 24563213, 'darioarias018@hotmail.com', 3154987220),
(19, 'Esteban', 'Ruiz', 1023632012, 'estebanruiz19@hotmail.com', 3154698201),
(20, 'Sergio', 'Perez', 12569805, 'sergioperez20@gmail.com', 3114598792),
(21, 'Valeria', 'Ruiz', 1236632210, 'valeriaruiz21@gmail.com', 3001452194),
(22, 'Dayana', 'Perez', 1236456952, 'dayanaperez22@hotmail.com', 3154521120),
(23, 'Monica', 'Perez', 16565236, 'monicaperez23@hotmail.com', 3134857988),
(24, 'Juan', 'Arias', 16589988, 'juanrias0024@hotmail.com', 3154878889),
(25, 'Juan Andres', 'Castillo', 25896320, 'juanandrescastillo25@hotmail.com', 3124678411),
(26, 'Mario', 'Ruiz', 26541023, 'marioruiz026@gmail.com', 3125454744),
(27, 'Martin', 'Ruiz', 16223036, 'martinruiz27@hotmail.com', 3124547885),
(28, 'Pedro', 'Arias', 16588956, 'pedroarias28@hotmail.com', 3124578875),
(29, 'Claudia', 'Rincon', 1023632985, 'claudiarincon29@yahoo.es', 3124578534),
(30, 'Fernanda', 'Rincon', 16889598, 'fernandarincon30@hotmail.com', 3014512457),
(31, 'Luna', 'Arias', 1026523236, 'lunaarias031@hotmail.com', 3112002457),
(32, 'Mariela', 'Diaz', 26589963, 'marieladias32@gmail.com', 3124578521),
(33, 'Fernando', 'Ruiz', 16325985, 'fernandoruiz33@gmail.com', 3104512480),
(34, 'Vicente', 'Castillo', 8942012, 'vicentecastillo34@gmail.com', 3114521478),
(35, 'Patricia', 'Ruiz', 12562023, 'patriciaruiz35@gmail.com', 3124578552),
(36, 'Andres', 'Arias', 1236023512, 'andresarias1@hotmail.com', 3112454810),
(37, 'Felipe', 'Castro', 1023652987, 'felipecastro2@gmail.com', 3104587310),
(38, 'Pedro', 'Perez', 1023632056, 'pedroperez3@hotmail.com', 3148721005),
(39, 'Lucas', 'Diaz', 24652987, 'lucasdias4@hotmail.com', 3114582101),
(40, 'Ana', 'Diaz', 1023652985, 'anadiaz05@yahoo.es', 3104587985),
(41, 'Maria', 'Castro', 26369589, 'mariacastro6@hotmail.com', 3124685210),
(42, 'Pedro', 'Perez', 16236589, 'pedroperez7@hotmail.com', 3114852104),
(43, 'Raul', 'Rincon', 16555635, 'raulrincon8@gmail.com', 3214854788),
(44, 'Amanda', 'Castro', 24565231, 'amandacastro9@hotmail.com', 3114897851),
(45, 'Luz', 'Arias', 1023632123, 'luzarias010@hotmail.com', 3124587987),
(46, 'Marcela', 'Perez', 24789562, 'marcelaperez11@gmail.com', 3114587980),
(47, 'Paula', 'Rincon', 23654785, 'paularincon12@hotmail.com', 3114587922),
(48, 'Karen', 'Perez', 24152523, 'karenperez13@yahoo.es', 3224587988),
(49, 'Valentina', 'Arias', 23698452, 'valentinarias14@hotmail.com', 3154864874),
(50, 'Amanda', 'Ruiz', 23652123, 'amandaruiz15@hotmail.com', 3123548979),
(52, 'Camilo', 'Perez', 16598785, 'camiloperez16@gmail.com', 3134879850),
(53, 'Liz', 'Arias', 16023332, 'lizarias017@gmail.com', 3154898795),
(54, 'Dario', 'Arias', 24563213, 'darioarias018@hotmail.com', 3154987220),
(55, 'Esteban', 'Ruiz', 1023632012, 'estebanruiz19@hotmail.com', 315469821),
(56, 'Sergio', 'Perez', 12569805, 'sergioperez20@gmail.com', 3114598792),
(57, 'Valeria', 'Ruiz', 1236632210, 'valeriaruiz21@gmail.com', 3001452194),
(58, 'Dayana', 'Perez', 1236456952, 'dayanaperez22@hotmail.com', 3154521120),
(59, 'Monica', 'Perez', 16565236, 'monicaperez23@hotmail.com', 3134857988),
(60, 'Juan', 'Arias', 16589988, 'juanrias0024@hotmail.com', 2147483647),
(61, 'Juan Andres', 'Castillo', 25896320, 'juanandrescastillo25@hotmail.com', 3124678411),
(62, 'Mario', 'Ruiz', 26541023, 'marioruiz026@gmail.com', 2147483647),
(63, 'Martin', 'Ruiz', 16223036, 'martinruiz27@hotmail.com', 2147483647),
(64, 'Pedro', 'Arias', 16588956, 'pedroarias28@hotmail.com', 2147483647),
(65, 'Claudia', 'Rincon', 1023632985, 'claudiarincon29@yahoo.es', 2147483647),
(66, 'Fernanda', 'Rincon', 16889598, 'fernandarincon30@hotmail.com', 2147483647),
(67, 'Luna', 'Arias', 1026523236, 'lunaarias031@hotmail.com', 2147483647),
(68, 'Mariela', 'Diaz', 26589963, 'marieladias32@gmail.com', 2147483647),
(69, 'Fernando', 'Ruiz', 16325985, 'fernandoruiz33@gmail.com', 2147483647),
(70, 'Vicente', 'Castillo', 8942012, 'vicentecastillo34@gmail.com', 2147483647),
(71, 'Patricia', 'Ruiz', 12562023, 'patriciaruiz35@gmail.com', 2147483647),
(72, 'Alexandra', 'Perez', 1012565352, 'alexandraperez36@hotmail.com', 2147483647),
(73, 'Juan', 'Perez', 1320658889, 'juanperez37@hotmail.com', 2147483647),
(74, 'German', 'Rincon', 16995632, 'germanrincon38@gmail.com', 2147483647),
(75, 'Maria Paula', 'Rincon', 1002223632, 'mariapaularincon39@hotmail.com', 2147483647),
(76, 'Jose Maria', 'Arias', 1048752125, 'josemariarias40@hotmail.com', 2147483647),
(77, 'Geraldine', 'Diaz', 1652987421, 'geraldinedias41@hotmail.com', 2147483647),
(78, 'Octavio', 'Castro', 16588520, 'octaviocastro42@gmail.com', 2147483647),
(79, 'Monica', 'Castro', 1236652330, 'monicacastro43@yahoo.es', 2147483647),
(80, 'Mario', 'Rincon', 16023365, 'mariorincon44@gmail.com', 2147483647),
(81, 'Jhoanny', 'Perez', 25632012, 'jhoannyperez45@hotmail.com', 2147483647),
(82, 'Lucas', 'Arias', 16589256, 'lucasarias46@gmail.com', 2147483647),
(83, 'Gabriela', 'Arias', 24789652, 'gabrielarias47@gmail.com', 2147483647),
(84, 'Gabriel', 'Perez', 26542123, 'gabrielperez48@yahoo.es', 2147483647),
(85, 'Sebastian', 'Castro', 16023365, 'sebastiancastro49@gmail.com', 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `pkidEntradas` int(11) NOT NULL,
  `CantidadEntradas` int(11) NOT NULL,
  `fecha_entrada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`pkidEntradas`, `CantidadEntradas`, `fecha_entrada`) VALUES
(1, 100, '2023-03-01'),
(2, 120, '2023-03-05'),
(3, 90, '2023-03-07'),
(4, 150, '2023-03-09'),
(5, 130, '2023-03-11'),
(6, 120, '2023-03-13'),
(7, 90, '2023-03-15'),
(8, 100, '2023-03-17'),
(9, 130, '2023-03-19'),
(10, 150, '2023-03-21'),
(11, 100, '2023-03-23'),
(12, 100, '2023-03-25'),
(13, 120, '2023-03-27'),
(14, 100, '2023-03-29'),
(15, 130, '2023-03-31'),
(16, 150, '2023-04-02'),
(17, 150, '2023-04-04'),
(18, 120, '2023-04-06'),
(19, 90, '2023-04-08'),
(20, 100, '2023-04-10'),
(21, 130, '2023-04-12'),
(22, 150, '2023-04-14'),
(23, 90, '2023-04-16'),
(24, 120, '2023-04-18'),
(25, 150, '2023-04-20'),
(26, 90, '2023-04-22'),
(27, 120, '2023-04-24'),
(28, 100, '2023-04-26'),
(29, 130, '2023-04-28'),
(30, 130, '2023-04-30'),
(31, 150, '2023-05-02'),
(32, 150, '2023-05-04'),
(33, 100, '2023-05-06'),
(34, 130, '2023-05-08'),
(35, 110, '2023-05-10'),
(36, 100, '2023-05-12'),
(37, 130, '2023-05-14'),
(38, 100, '2023-05-16'),
(39, 130, '2023-05-18'),
(40, 120, '2023-05-20'),
(41, 130, '2023-05-22'),
(42, 90, '2023-05-24'),
(43, 90, '2023-05-26'),
(44, 120, '2023-05-28'),
(45, 100, '2023-05-30'),
(46, 130, '2023-06-01'),
(47, 150, '2023-06-03'),
(48, 100, '2023-06-05'),
(49, 120, '2023-06-07'),
(50, 90, '2023-06-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `pkidInventario` int(11) NOT NULL,
  `CantProducto` int(11) NOT NULL,
  `fkidEntradas` int(11) DEFAULT NULL,
  `fkidSalidas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`pkidInventario`, `CantProducto`, `fkidEntradas`, `fkidSalidas`) VALUES
(1, 100, 1, 1),
(2, 120, 2, 2),
(3, 150, 3, 3),
(4, 80, 4, 4),
(5, 130, 5, 5),
(6, 100, 6, 6),
(7, 120, 7, 7),
(8, 150, 8, 8),
(9, 130, 9, 9),
(10, 120, 10, 10),
(11, 80, 11, 11),
(12, 150, 12, 12),
(13, 120, 13, 13),
(14, 130, 14, 14),
(15, 100, 15, 15),
(16, 180, 16, 16),
(17, 120, 17, 17),
(18, 110, 18, 18),
(19, 80, 19, 19),
(20, 160, 20, 20),
(21, 140, 21, 21),
(22, 80, 22, 22),
(23, 120, 23, 23),
(24, 100, 24, 24),
(25, 60, 25, 25),
(26, 150, 26, 26),
(27, 160, 27, 27),
(28, 100, 28, 28),
(29, 130, 29, 29),
(30, 120, 30, 30),
(31, 90, 31, 31),
(32, 120, 32, 32),
(33, 160, 33, 33),
(34, 200, 34, 34),
(35, 140, 35, 35),
(36, 140, 36, 36),
(37, 80, 37, 37),
(38, 120, 38, 38),
(39, 80, 39, 39),
(40, 230, 40, 40),
(41, 120, 41, 41),
(42, 110, 42, 42),
(43, 140, 43, 43),
(44, 170, 44, 44),
(45, 130, 45, 45),
(46, 80, 46, 46),
(47, 120, 47, 47),
(48, 110, 48, 48),
(49, 80, 49, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `pkidMarca` int(11) NOT NULL,
  `NombreMarca` varchar(45) NOT NULL,
  `fkidProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`pkidMarca`, `NombreMarca`, `fkidProducto`) VALUES
(1, 'Admis', 1),
(2, 'Duvyclass', 3),
(3, 'Herbacol', 4),
(4, 'Igora', 5),
(5, 'Duvyclass', 6),
(6, 'Herbacol', 7),
(7, 'Checo', 8),
(8, 'Duvyclass', 9),
(9, 'Igora', 10),
(10, 'Herbacol', 11),
(11, 'Checo', 12),
(12, 'Admis', 13),
(13, 'Duvyclass', 14),
(14, 'Checo', 15),
(15, 'Igora', 16),
(16, 'Duvyclass', 17),
(17, 'Checo', 18),
(18, 'Herbacol', 19),
(19, 'Admis', 20),
(20, 'Checo', 21),
(21, 'Duvyclass', 22),
(22, 'Igora', 23),
(23, 'Checo', 24),
(24, 'Admis', 25),
(25, 'Duvyclass', 26),
(26, 'Herbacol', 27),
(27, 'Checo', 28),
(28, 'Admis', 29),
(29, 'Igora', 30),
(30, 'Herbacol', 31),
(31, 'Duvyclass', 32),
(32, 'Admis', 33),
(33, 'Herbacol', 34),
(34, 'Igora', 35),
(35, 'Admis', 36),
(36, 'Duvyclass', 37),
(37, 'Igora', 38),
(38, 'Admis', 39),
(39, 'Igora', 40),
(40, 'Herbacol', 41),
(41, 'Admis', 42),
(42, 'Checo', 43),
(43, 'Igora', 44),
(44, 'Admis', 45),
(45, 'Duvyclass', 46),
(46, 'Checo', 47),
(47, 'Duvyclass', 48),
(48, 'Checo', 49),
(50, 'Admis', 1),
(51, 'Duvyclass', 3),
(52, 'Herbacol', 4),
(53, 'Igora', 5),
(54, 'Duvyclass', 6),
(55, 'Herbacol', 7),
(56, 'Checo', 8),
(57, 'Duvyclass', 9),
(58, 'Igora', 10),
(59, 'Herbacol', 11),
(60, 'Checo', 12),
(61, 'Admis', 13),
(62, 'Duvyclass', 14),
(63, 'Checo', 15),
(64, 'Igora', 16),
(65, 'Duvyclass', 17),
(66, 'Checo', 18),
(67, 'Herbacol', 19),
(68, 'Admis', 20),
(69, 'Checo', 21),
(70, 'Duvyclass', 22),
(71, 'Igora', 23),
(72, 'Checo', 24),
(73, 'Admis', 25),
(74, 'Duvyclass', 26),
(75, 'Herbacol', 27),
(76, 'Checo', 28),
(77, 'Admis', 29),
(78, 'Igora', 30),
(79, 'Herbacol', 31),
(80, 'Duvyclass', 32),
(81, 'Admis', 33),
(82, 'Herbacol', 34),
(83, 'Igora', 35),
(84, 'Admis', 36),
(85, 'Duvyclass', 37),
(86, 'Igora', 38),
(87, 'Admis', 39),
(88, 'Igora', 40),
(89, 'Herbacol', 41),
(90, 'Admis', 42),
(91, 'Checo', 43),
(92, 'Igora', 44),
(93, 'Admis', 45),
(94, 'Duvyclass', 46),
(95, 'Checo', 47),
(96, 'Duvyclass', 48),
(97, 'Checo', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `pkidProducto` int(11) NOT NULL,
  `NombreProducto` varchar(45) NOT NULL,
  `TamanoProducto` varchar(45) NOT NULL,
  `DescProducto` varchar(65) NOT NULL,
  `PrecioProducto` float NOT NULL,
  `IVAProducto` float NOT NULL,
  `StockProducto` int(11) NOT NULL,
  `fkidProveedor` int(11) NOT NULL,
  `fkidInventario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`pkidProducto`, `NombreProducto`, `TamanoProducto`, `DescProducto`, `PrecioProducto`, `IVAProducto`, `StockProducto`, `fkidProveedor`, `fkidInventario`) VALUES
(1, 'Tinte', '60ml', 'd1', 12500, 0.19, 10, 1, 1),
(2, 'Esmalte', '10ml', 'd1', 5500, 0.19, 15, 2, 2),
(3, 'Shampoo', '1000ml', 'd1', 27000, 0.19, 5, 3, 3),
(4, 'ControlCaida', '240ml', 'd1', 27000, 0.19, 8, 4, 4),
(5, 'Tinte', '60ml', 'd1', 12500, 0.19, 9, 5, 5),
(6, 'TratamientoCapilar', '240ml', 'd1', 26000, 0.19, 6, 6, 6),
(7, 'Esmalte', '10ml', 'd1', 5500, 0.19, 4, 7, 7),
(8, 'Shampoo', '240ml', 'd1', 27000, 0.19, 5, 8, 8),
(9, 'TratamientoCapilar', '240ml', 'd1', 26000, 0.19, 12, 9, 9),
(10, 'Tinte', '60ml', 'd1', 12500, 0.19, 2, 10, 10),
(11, 'Esmalte', '10ml', 'd1', 5500, 0.19, 3, 11, 11),
(12, 'Shampoo', '1000ml', 'd1', 27000, 0.19, 6, 12, 12),
(13, 'TratamientoCapilar', '240ml', 'd1', 26000, 0.19, 1, 13, 13),
(14, 'Esmalte', '10ml', 'd1', 5500, 0.19, 15, 14, 14),
(15, 'ControlCaida', '240ml', 'd1', 27000, 0.19, 3, 15, 15),
(16, 'Shampoo', '240ml', 'd1', 27000, 0.19, 3, 16, 16),
(17, 'ControlCaida', '240ml', 'd1', 27000, 0.192, 33, 17, 17),
(18, 'ControlCaida', '240ml', 'd1', 27000, 0.19, 5, 18, 18),
(19, 'TratamientoCapilar', '240ml', 'd1', 26000, 0.19, 6, 19, 19),
(20, 'Esmalte', '10ml', 'd1', 5500, 0.19, 10, 20, 20),
(21, 'Shampoo', '1000ml', 'd1', 27000, 0.19, 5, 21, 21),
(22, 'ControlCaida', '240ml', 'd1', 27000, 0.19, 3, 22, 22),
(23, 'ControlCaida', '240ml', 'd1', 27000, 0.19, 6, 23, 23),
(24, 'TratamientoCapilar', '240ml', 'd1', 26000, 0, 6, 24, 24),
(25, 'Esmalte', '10ml', 'd1', 5500, 0.193, 25, 25, 25),
(26, 'Shampoo', '1000ml', 'd1', 27000, 0.19, 12, 26, 26),
(27, 'Tinte', '60ml', 'd1', 12500, 0.19, 11, 27, 27),
(28, 'ControlCaida', '240ml', 'd1', 27000, 0.19, 2, 28, 28),
(29, 'TratamientoCapilar', '240ml', 'd1', 26000, 0.19, 3, 29, 29),
(30, 'Esmalte', '10ml', 'd1', 5500, 0.19, 5, 30, 30),
(31, 'Shampoo', '1000ml', 'd1', 27000, 0.19, 8, 31, 31),
(32, 'ControlCaida', '240ml', 'd1', 27000, 0.19, 6, 32, 32),
(33, 'TratamientoCapilar', '240ml', 'd1', 26000, 0.19, 3, 33, 33),
(34, 'Esmalte', '10ml', 'd1', 5500, 0.19, 20, 34, 34),
(35, 'Shampoo', '240ml', 'd1', 27000, 0.19, 7, 35, 35),
(36, 'Tinte', '60ml', 'd1', 12500, 0.19, 8, 36, 36),
(37, 'ControlCaida', '240ml', 'd1', 27000, 0.19, 6, 37, 37),
(38, 'TratamientoCapilar', '240ml', 'd1', 26000, 0.19, 4, 38, 38),
(39, 'Esmalte', '10ml', 'd1', 5500, 0.19, 2, 39, 39),
(40, 'Shampoo', '1000ml', 'd1', 27000, 0.19, 5, 40, 40),
(41, 'Tinte', '60ml', 'd1', 12500, 0.19, 4, 41, 41),
(42, 'TratamientoCapilar', '240ml', 'd1', 26000, 0.19, 9, 42, 42),
(43, 'Shampoo', '240ml', 'd1', 27000, 0.19, 12, 43, 43),
(44, 'Tinte', '60ml', 'd1', 12500, 0.19, 5, 44, 44),
(45, 'ControlCaida', '240ml', 'd1', 27000, 0.19, 6, 45, 45),
(46, 'Tinte', '60ml', 'd1', 12500, 0.19, 5, 46, 46),
(47, 'TratamientoCapilar', '240ml', 'd1', 26000, 0.19, 2, 47, 47),
(48, 'Shampoo', '1000ml', 'd1', 27000, 0.19, 10, 48, 48),
(49, 'Esmalte', '10ml', 'd1', 5500, 0.19, 20, 49, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_venta`
--

CREATE TABLE `producto_venta` (
  `cantidadProducto` int(11) NOT NULL,
  `subTotal` float NOT NULL,
  `pkidProducto` int(11) NOT NULL,
  `pkidVentas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto_venta`
--

INSERT INTO `producto_venta` (`cantidadProducto`, `subTotal`, `pkidProducto`, `pkidVentas`) VALUES
(150, 51000, 1, 1),
(120, 13000, 2, 2),
(90, 11000, 3, 3),
(80, 12000, 4, 4),
(50, 15000, 5, 5),
(100, 22000, 6, 6),
(25, 22000, 7, 7),
(85, 51000, 8, 8),
(65, 21000, 9, 9),
(60, 22000, 10, 10),
(20, 11000, 11, 11),
(85, 12000, 12, 12),
(70, 22000, 13, 13),
(55, 21000, 14, 14),
(20, 15000, 15, 15),
(180, 13000, 16, 16),
(160, 51000, 17, 17),
(130, 15000, 18, 18),
(90, 11000, 19, 19),
(80, 13000, 20, 20),
(70, 12000, 21, 21),
(60, 22000, 22, 22),
(80, 15000, 23, 23),
(150, 21000, 24, 24),
(120, 13000, 25, 25),
(90, 11000, 26, 26),
(80, 15000, 27, 27),
(50, 21000, 28, 28),
(100, 22000, 29, 29),
(25, 13000, 30, 30),
(85, 12000, 31, 31),
(65, 15000, 32, 32),
(60, 21000, 33, 33),
(20, 11000, 34, 34),
(85, 11000, 35, 35),
(70, 15000, 36, 36),
(55, 51000, 37, 37),
(20, 13000, 38, 38),
(180, 13000, 39, 39),
(160, 51000, 40, 40),
(130, 15000, 41, 41),
(90, 62000, 42, 42),
(80, 52000, 43, 43),
(70, 13000, 44, 44),
(60, 35000, 45, 45),
(80, 27000, 46, 46),
(90, 22000, 47, 47),
(150, 15000, 48, 48),
(120, 13000, 49, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `pkidProveedor` int(11) NOT NULL,
  `NombreProveedor` varchar(45) NOT NULL,
  `ApellidoProveedor` varchar(45) NOT NULL,
  `IdentificacionProveedor` int(11) NOT NULL,
  `EmailProveedor` varchar(45) NOT NULL,
  `TelProveedor` int(11) NOT NULL,
  `EmpresaProveedor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`pkidProveedor`, `NombreProveedor`, `ApellidoProveedor`, `IdentificacionProveedor`, `EmailProveedor`, `TelProveedor`, `EmpresaProveedor`) VALUES
(1, 'Andre', 'Ortiz', 1023023730, 'adnd1405@gmail', 2147483647, 'Herbacol'),
(2, 'Laura Paola', 'Rios', 1025784545, 'laurio@gmail.com', 2147483647, 'masglo'),
(3, 'Carlota', 'perez', 14555777, 'carl12@gmail.com', 2147483647, 'igora'),
(4, 'manuel', 'perez', 3145547, 'manu12@gmail.com', 2147483647, 'admis'),
(5, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(6, 'carlo', ' Osorio', 1523026730, 'car12@gmail.com', 2147483647, 'forex'),
(7, 'Manuel', ' vargas', 2147483647, 'and12@gmail.com', 2147483647, 'marliou'),
(8, 'Andrea', ' rojas', 1023086730, 'andy2612@gmail.com', 2147483647, 'masglo'),
(9, 'Adriana', ' Osorio', 51947763, 'adri12@gmail.com', 2147483647, 'lissia'),
(10, 'Andrea', ' Osorio', 1029426730, 'and12@gmail.com', 2147483647, 'checo'),
(11, 'Maribel', ' Monroy', 1023026730, 'mary2@gmail.com', 2147483647, 'keraton'),
(12, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(13, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(14, 'Andres', ' Campos', 1002026730, 'andy12@gmail.com', 2147483647, 'lissia'),
(15, 'emanuel', ' Rojas', 1023026730, 'emanu20@gmail.com', 2147483647, 'checo'),
(16, 'Elena', ' Rojas', 1023026730, 'rojas2@gmail.com', 2147483647, 'lissia'),
(17, 'Maritza', ' Buitrago', 1023123730, 'mary12@gmail.com', 2147483647, 'keraton'),
(18, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(19, 'Nury', ' Osorio', 1023026730, 'nury12@gmail.com', 2147483647, 'masglo'),
(20, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(21, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(22, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(23, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(24, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(25, 'Carlota', ' Medina', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(26, 'Jhon', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'Arobell'),
(27, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(28, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(29, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(30, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(31, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(32, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(33, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(34, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(35, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(36, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(37, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(38, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(39, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(40, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(41, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(42, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(43, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(44, 'Paola', ' Osorio', 1023026730, 'paoalo16@gmail.com', 2147483647, 'checo'),
(45, 'Luz', ' Campos', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(46, 'Pilar', ' Granados', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(47, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(48, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(49, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(50, 'Andrea', ' Osorio', 1023026730, 'andy12@gmail.com', 2147483647, 'checo'),
(57, 'Adriana', 'Castano', 1012411000, 'ymcastao88@misena.edu.co', 2147483647, 'Cusmetichi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `pkidRol` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`pkidRol`, `Nombre`) VALUES
(1, 'Empleado'),
(2, 'Gerente'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `pkidSalidas` int(11) NOT NULL,
  `CantidadSalidas` int(11) NOT NULL,
  `tipoSalidas` varchar(45) NOT NULL,
  `fecha_salida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salidas`
--

INSERT INTO `salidas` (`pkidSalidas`, `CantidadSalidas`, `tipoSalidas`, `fecha_salida`) VALUES
(1, 80, 'Devolucion', '2023-03-06'),
(2, 90, 'MalEstado', '2023-03-08'),
(3, 75, 'Dañado', '2023-03-10'),
(4, 130, 'PedidoIncompleto', '2023-03-12'),
(5, 120, 'Devolucion', '2023-03-14'),
(6, 110, 'Dañado', '2023-03-16'),
(7, 70, 'PedidoIncompleto', '2023-03-18'),
(8, 80, 'PedidoIncompleto', '2023-03-20'),
(9, 110, 'MalEstado', '2023-03-22'),
(10, 120, 'MalEstado', '2023-03-24'),
(11, 70, 'Dañado', '2023-03-26'),
(12, 80, 'PedidoIncompleto', '2023-03-28'),
(13, 90, 'Dañado', '2023-03-30'),
(14, 60, 'PedidoIncompleto', '2023-04-01'),
(15, 100, 'Devolucion', '2023-04-03'),
(16, 130, 'MalEstado', '2023-04-05'),
(17, 100, 'PedidoIncompleto', '2023-04-07'),
(18, 80, 'MalEstado', '2023-04-09'),
(19, 65, 'PedidoIncompleto', '2023-04-11'),
(20, 65, 'PedidoIncompleto', '2023-04-13'),
(21, 80, 'MalEstado', '2023-04-15'),
(22, 140, 'Devolucion', '2023-04-17'),
(23, 80, 'PedidoIncompleto', '2023-04-19'),
(24, 85, 'Dañado', '2023-04-21'),
(25, 120, 'MalEstado', '2023-04-23'),
(26, 70, 'PedidoIncompleto', '2023-04-25'),
(27, 95, 'Dañado', '2023-04-27'),
(28, 85, 'MalEstado', '2023-04-29'),
(29, 100, 'PedidoIncompleto', '2023-05-01'),
(30, 90, 'Devolucion', '2023-05-03'),
(31, 130, 'PedidoIncompleto', '2023-05-05'),
(32, 140, 'Dañado', '2023-05-07'),
(33, 80, 'PedidoIncompleto', '2023-05-09'),
(34, 110, 'MalEstado', '2023-05-11'),
(35, 90, 'Dañado', '2023-05-13'),
(36, 80, 'PedidoIncompleto', '2023-05-15'),
(37, 110, 'Devolucion', '2023-05-17'),
(38, 85, 'Dañado', '2023-05-19'),
(39, 90, 'MalEstado', '2023-05-21'),
(40, 100, 'Devolucion', '2023-05-21'),
(41, 115, 'Dañado', '2023-05-25'),
(42, 70, 'Dañado', '2023-05-27'),
(43, 75, 'Devolucion', '2023-05-29'),
(44, 95, 'PedidoIncompleto', '2023-05-31'),
(45, 90, 'Dañado', '2023-06-02'),
(46, 115, 'Dañado', '2023-06-04'),
(47, 125, 'PedidoIncompleto', '2023-06-06'),
(48, 80, 'MalEstado', '2023-06-08'),
(49, 95, 'Dañado', '2023-06-10'),
(50, 70, 'Devolucion', '2023-06-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Contraseña` varchar(50) NOT NULL,
  `fkidRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `Nombre`, `Email`, `Contraseña`, `fkidRol`) VALUES
(1, 'Empleado', 'adrianaEmpleado@gmail.com', 'Adriana#3780', 1),
(2, 'Gerente', 'maritzaGerente@gmail.com', 'Maritz42023', 2),
(3, 'Cliente', 'yohanaCliente@gmail.com', 'Y0han42105.', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `pkidVentas` int(11) NOT NULL,
  `Metpago` varchar(45) NOT NULL,
  `IVAto` float NOT NULL,
  `Subtotal` float NOT NULL,
  `totalventas` float NOT NULL,
  `FechaVenta` date NOT NULL,
  `fkidEmpleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`pkidVentas`, `Metpago`, `IVAto`, `Subtotal`, `totalventas`, `FechaVenta`, `fkidEmpleado`) VALUES
(1, 'tarjeta', 0.19, 12000, 14300, '2023-04-20', 1),
(2, 'tarjeta', 0.19, 12000, 14300, '2023-04-26', 2),
(3, 'Nequi', 0.19, 14000, 17850, '2023-04-28', 3),
(4, 'Nequi', 0.19, 20000, 23800, '2023-05-29', 4),
(5, 'tarjeta', 0.19, 25000, 29750, '2023-04-20', 5),
(6, 'tarjeta', 0.19, 32000, 38100, '2023-04-20', 6),
(7, 'efectivo', 0.19, 12000, 14300, '2023-06-06', 7),
(8, 'Nequi', 0.19, 45000, 53550, '2023-04-26', 8),
(9, 'Nequi', 0.19, 54000, 64300, '2023-06-05', 9),
(10, 'tarjeta', 0.19, 14000, 17850, '2023-03-06', 10),
(11, 'efectivo', 0.19, 45000, 53550, '2023-04-20', 11),
(12, 'Nequi', 0.19, 12000, 14300, '2023-06-13', 12),
(13, 'efectivo', 0.19, 12000, 14300, '2023-04-26', 13),
(14, 'Nequi', 0.19, 45000, 53550, '2023-05-29', 14),
(15, 'Nequi', 0.19, 14000, 17850, '2023-06-06', 15),
(16, 'tarjeta', 0.19, 10000, 11900, '2023-04-20', 16),
(17, 'efectivo', 0.19, 10000, 11900, '2023-06-08', 17),
(18, 'Nequi', 0.19, 20000, 23800, '2023-06-03', 18),
(19, 'Nequi', 0.19, 14000, 17850, '2023-06-03', 19),
(20, 'tarjeta', 0.19, 12000, 14300, '2023-05-29', 20),
(21, 'Nequi', 0.19, 12000, 14300, '2023-04-26', 21),
(22, 'Nequi', 0.19, 20000, 23800, '2023-06-03', 22),
(23, 'efectivo', 0.19, 25000, 29750, '2023-06-06', 23),
(24, 'efectivo', 0.19, 10000, 11900, '2023-06-03', 24),
(25, 'Nequi', 0.19, 54000, 64300, '2023-06-13', 25),
(26, 'efectivo', 0.19, 10000, 11900, '2023-04-20', 26),
(27, 'Nequi', 0.19, 12000, 14300, '2023-06-13', 27),
(28, 'Nequi', 0.19, 20000, 23800, '2023-05-29', 28),
(29, 'Nequi', 0.19, 10000, 11900, '2023-06-17', 29),
(30, 'efectivo', 0.19, 45000, 53550, '2023-06-06', 30),
(31, 'Nequi', 0.19, 12000, 14300, '2023-04-20', 31),
(32, 'Nequi', 0.19, 10000, 11900, '2023-06-17', 32),
(33, 'tarjeta', 0.19, 20000, 23800, '2023-06-03', 33),
(34, 'tarjeta', 0.19, 10000, 11900, '2023-06-06', 34),
(35, 'Nequi', 0.19, 12000, 14300, '2023-04-26', 35),
(36, 'efectivo', 0.19, 12000, 14300, '2023-06-13', 36),
(37, 'Nequi', 0.19, 25000, 29750, '2023-06-13', 37),
(38, 'Nequi', 0.19, 20000, 23800, '2023-04-26', 38),
(39, 'efectivo', 0.19, 45000, 53550, '2023-06-13', 39),
(40, 'efectivo', 0.19, 45000, 53550, '2023-05-29', 40),
(41, 'Nequi', 0.19, 10000, 11900, '2023-06-06', 41),
(42, 'Nequi', 0.19, 10000, 11900, '2023-04-26', 42),
(43, 'tarjeta', 0.19, 45000, 53550, '2023-06-17', 43),
(44, 'Nequi', 0.19, 25000, 29750, '2023-04-28', 44),
(45, 'efectivo', 0.19, 14000, 17850, '2023-04-20', 45),
(46, 'efectivo', 0.19, 12000, 14300, '2023-06-03', 46),
(47, 'Nequi', 0.19, 54000, 64300, '2023-04-28', 47),
(48, 'tarjeta', 0.19, 10000, 11900, '2023-06-08', 48),
(49, 'efectivo', 0.19, 10000, 11900, '2023-04-20', 49);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`pkidCategorias`),
  ADD KEY `fkidProducto` (`fkidProducto`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`pkidClientes`),
  ADD KEY `fkidProducto` (`fkidProducto`);

--
-- Indices de la tabla `compraproveedor`
--
ALTER TABLE `compraproveedor`
  ADD PRIMARY KEY (`pkidCompraProveedor`),
  ADD KEY `fkidEmpleado` (`fkidEmpleado`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`pkidEmpleado`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`pkidEntradas`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`pkidInventario`),
  ADD KEY `fkidEntradas` (`fkidEntradas`),
  ADD KEY `fkidSalidas` (`fkidSalidas`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`pkidMarca`),
  ADD KEY `fkidProducto` (`fkidProducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`pkidProducto`),
  ADD KEY `fkidProveedor` (`fkidProveedor`),
  ADD KEY `fkidInventario` (`fkidInventario`);

--
-- Indices de la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD PRIMARY KEY (`pkidProducto`,`pkidVentas`),
  ADD KEY `producto_venta_ibfk_2` (`pkidVentas`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`pkidProveedor`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`pkidRol`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`pkidSalidas`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fkidRol` (`fkidRol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`pkidVentas`),
  ADD KEY `fkidEmpleado` (`fkidEmpleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `pkidCategorias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `pkidClientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `compraproveedor`
--
ALTER TABLE `compraproveedor`
  MODIFY `pkidCompraProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `pkidEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `pkidEntradas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `pkidInventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `pkidMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `pkidProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `pkidProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `pkidRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `pkidSalidas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `pkidVentas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`fkidProducto`) REFERENCES `producto` (`pkidProducto`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`fkidProducto`) REFERENCES `producto` (`pkidProducto`);

--
-- Filtros para la tabla `compraproveedor`
--
ALTER TABLE `compraproveedor`
  ADD CONSTRAINT `compraproveedor_ibfk_1` FOREIGN KEY (`fkidEmpleado`) REFERENCES `empleados` (`pkidEmpleado`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`fkidEntradas`) REFERENCES `entradas` (`pkidEntradas`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`fkidSalidas`) REFERENCES `salidas` (`pkidSalidas`);

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `marca_ibfk_1` FOREIGN KEY (`fkidProducto`) REFERENCES `producto` (`pkidProducto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`fkidProveedor`) REFERENCES `proveedor` (`pkidProveedor`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`fkidInventario`) REFERENCES `inventario` (`pkidInventario`);

--
-- Filtros para la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD CONSTRAINT `producto_venta_ibfk_1` FOREIGN KEY (`pkidProducto`) REFERENCES `producto` (`pkidProducto`),
  ADD CONSTRAINT `producto_venta_ibfk_2` FOREIGN KEY (`pkidVentas`) REFERENCES `ventas` (`pkidVentas`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`fkidEmpleado`) REFERENCES `empleados` (`pkidEmpleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
