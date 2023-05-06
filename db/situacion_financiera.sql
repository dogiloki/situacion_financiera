-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 31-03-2022 a las 03:34:53
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `situacion_financiera`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problemas`
--

DROP TABLE IF EXISTS `problemas`;
CREATE TABLE IF NOT EXISTS `problemas` (
  `id` varchar(50) NOT NULL,
  `title` text NOT NULL,
  `text` text NOT NULL,
  `img` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `problemas`
--

INSERT INTO `problemas` (`id`, `title`, `text`, `img`) VALUES
('601bb9de3fa51', 'DULCERÃA DE JOSÃ‰', 'DulcerÃ­a de JosÃ© del aÃ±o 2020.\r\n\r\nÃ‰l se gastÃ³ $70 000 durante todo el aÃ±o en la compra de dulces para su tienda, el cual $10 000 son de Ã©l y $60 000 de un prÃ©stamo al banco el cual debe pagar $1 850 por semana. Ã‰l ya tiene una camioneta donde transporta su mercancÃ­a que le costÃ³ $40 000 con una vida Ãºtil de 6 aÃ±os, este es su cuarto aÃ±o por lo tanto solo le queda 2 aÃ±os de vida Ãºtil y se gasto $9 100 por todo el aÃ±o en gasolina.\r\n\r\nPaga sueldos a 6 empleados. 3 de ellos le paga $5 000 al mes, a uno $3 700 al mes, a 2 le da $3 000, por Ãºltimo se da un sueldo de $7 800 al mes, y calculo que ha pagado durante todo el aÃ±o $5 000 en horas extras (contando todos los empleados).\r\n\r\nTiene un local el cual paga un alquiler de $3 000 al mes.\r\n\r\nÃ‰l tiene un total de 40 tipos de dulces diferentes el cual le da un 5,6% de IVA por cada tipo de dulce y tiene que dar un 35% de ISR de toda su utilizada (despuÃ©s de vender los dulces con el IVA).\r\n\r\nEl mes de marzo sufriÃ³ un robo en el cual perdiÃ³ $5 000 que tenÃ­a en caja en ese momento.', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablas`
--

DROP TABLE IF EXISTS `tablas`;
CREATE TABLE IF NOT EXISTS `tablas` (
  `id` varchar(50) NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `nombre` text NOT NULL,
  `tabla` text NOT NULL,
  `conceptos` varchar(50) NOT NULL,
  `date_register` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tablas`
--

INSERT INTO `tablas` (`id`, `id_user`, `nombre`, `tabla`, `conceptos`, `date_register`) VALUES
('601dfd5c7f8fd', '6155e6880f9f1', '31 DICIEMBRE 2020', '\n\n	<input type=\"text\" id=\"id\" value=\"0\" readonly=\"\" hidden=\"\">\n\n	<section class=\"encabezado\" id=\"encabezado\">\n		<div class=\"block\">\n			<div class=\"empresa\" id=\"empresa_o_persona\" onclick=\"showEncabezado(\'empresa_o_persona\')\">DULCERÃA JOSÃ‰, S.A</div>\n			<div class=\"flex\">\n				<div class=\"titulo\" id=\"titulo\" onclick=\"showEncabezado(\'titulo\')\">ESTADO FINANCIERO (pesos mexicanos)</div>\n				<div class=\"fecha\" id=\"fecha\" onclick=\"showEncabezado(\'fecha\')\">31 DE DICIEMBRE DEL 2020</div>\n			</div>\n		</div>\n	</section>\n\n	<section class=\"cuerpo\">\n\n		<div class=\"flex\">\n			<div class=\"block\">\n				<div class=\"content_activos\">\n					<h2>ACTIVOS</h2>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'activos_corrientes\')\">Activos corrientes</h4>\n						<div class=\"monto\" id=\"total_activos_corrientes\">$15 820 000  </div>\n					</div>\n					<div id=\"activos_corrientes\"><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'3\',\'activos_corrientes\')\"><div class=\"concepto\" id=\"c3\">- Caja y banco</div><div class=\"monto\" id=\"m3\">$4 976 200  </div></div><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'4\',\'activos_corrientes\')\"><div class=\"concepto\" id=\"c4\">- Pago de prestamo</div><div class=\"monto\" id=\"m4\">$96 200  </div></div><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'5\',\'activos_corrientes\')\"><div class=\"concepto\" id=\"c5\">- Equipo de tranporte</div><div class=\"monto\" id=\"m5\">$9 100  </div></div><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'6\',\'activos_corrientes\')\"><div class=\"concepto\" id=\"c6\">- Sueldos</div><div class=\"monto\" id=\"m6\">$395 000  </div></div><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'7\',\'activos_corrientes\')\"><div class=\"concepto\" id=\"c7\">- Local</div><div class=\"monto\" id=\"m7\">$36 000  </div></div><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'10\',\'activos_corrientes\')\"><div class=\"concepto\" id=\"c10\">- Impuestos</div><div class=\"monto\" id=\"m10\">$10 237 500  </div></div><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'11\',\'activos_corrientes\')\"><div class=\"concepto\" id=\"c11\">- Inventario</div><div class=\"monto\" id=\"m11\">$70 000  </div></div></div>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'activos_no_corrientes\')\">Activos no corrientes</h4>\n						<div class=\"monto\" id=\"total_activos_no_corrientes\">$ 0</div>\n					</div>\n					<div id=\"activos_no_corrientes\"></div>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'intangibles\')\">Intangibles</h4>\n						<div class=\"monto\" id=\"total_intangibles\">$ 0</div>\n					</div>\n					<div id=\"intangibles\"></div>\n					<div class=\"flex\">\n						<h2>TOTAL DE ACTIVOS</h2>\n						<div class=\"monto\" id=\"total_activos\">$15 820 000  </div>\n					</div>\n				</div>\n				<div class=\"content_calculo\">\n					<h2>ECUACIÃ“N CONTABLE</h2>\n					<div class=\"formulas\">\n						<div id=\"activos\">Activos: $15 820 000  </div>\n						<div id=\"pasivos\">Pasivos: $60 000  </div>\n						<div id=\"patrimonio_neto\">Patrimonio neto: $15 760 000  </div>\n						<br>\n						<div id=\"formula_activo\" style=\"color: green;\">ACTIVO = PASIVO + PATRIMONIO NETO</div>\n						<div id=\"formula_pasivo\" style=\"color: green;\">PASIVO = ACTIVO - PATRIMONIO NETO</div>\n						<div id=\"formula_patrimonio_neto\" style=\"color: green;\">PATRIMONIO NETO = ACTIVO - PASIVO</div>\n					</div>\n				</div>\n			</div>\n			<div class=\"sepa\"></div>\n			<div class=\"block\">\n				<div class=\"content_pasivos\">\n					<h2>PASIVOS</h2>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'pasivos_corrientes\')\">Pasivos corrientes</h4>\n						<div class=\"monto\" id=\"total_pasivos_corrientes\">$60 000  </div>\n					</div>\n					<div id=\"pasivos_corrientes\"><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'2\',\'pasivos_corrientes\')\"><div class=\"concepto\" id=\"c2\">- Prestamo del banco</div><div class=\"monto\" id=\"m2\">$60 000  </div></div></div>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'pasivos_no_corrientes\')\">Pasivos no corrientes</h4>\n						<div class=\"monto\" id=\"total_pasivos_no_corrientes\">$ 0</div>\n					</div>\n					<div id=\"pasivos_no_corrientes\"></div>\n					<div class=\"flex\">\n						<h2>TOTAL DE PASIVOS</h2>\n						<div class=\"monto\" id=\"total_pasivos\">$60 000  </div>\n					</div>\n				</div>\n				<div class=\"content_patrimonio_neto\">\n					<h2>PATRIMONIO NETO</h2>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'fondos\')\">Fondos</h4>\n						<div class=\"monto\" id=\"total_fondos\">$10 000  </div>\n					</div>\n					<div id=\"fondos\"><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'1\',\'fondos\')\"><div class=\"concepto\" id=\"c1\">- Propios</div><div class=\"monto\" id=\"m1\">$10 000  </div></div></div>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'reservas\')\">Reservas</h4>\n						<div class=\"monto\" id=\"total_reservas\">$10 237 500  </div>\n					</div>\n					<div id=\"reservas\"><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'9\',\'reservas\')\"><div class=\"concepto\" id=\"c9\">- Impuestos</div><div class=\"monto\" id=\"m9\">$10 237 500  </div></div></div>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'utilidades\')\">Utilidades</h4>\n						<div class=\"monto\" id=\"total_utilidades\">$5 512 500  </div>\n					</div>\n					<div id=\"utilidades\"><div class=\"btn_concepto\" title=\"Modificar\" onclick=\"showUpdate(this,\'8\',\'utilidades\')\"><div class=\"concepto\" id=\"c8\">- Venta a clientes</div><div class=\"monto\" id=\"m8\">$5 512 500  </div></div></div>\n					<div class=\"flex\">\n						<h2>TOTAL DE PATRIMONIO NETO</h2>\n						<div class=\"monto\" id=\"total_patrimonio_neto\">$15 760 000  </div>\n					</div>\n				</div>\n			</div>\n		</div>\n\n	</section>\n\n	<section class=\"modal\" id=\"modal_form_encabezado\" style=\"display: none;\" onclick=\"modal(\'modal_form_encabezado\')\">\n		<div class=\"content_form\" onclick=\"modal(\'modal_form_encabezado\')\">\n			<div id=\"title_encabezado\">EMPRESA O PERSONA</div>\n			<input type=\"text\" class=\"caja\" id=\"texto\" placeholder=\"Escribe aquÃ­\">\n			<div class=\"flex\" style=\"justify-content: flex-end;\">\n				<button class=\"btn\" style=\"color: green;\" onclick=\"changeText()\">Aceptar</button>\n			</div>\n		</div>\n	</section>\n\n	<section class=\"modal\" id=\"modal_form_cuerpo\" style=\"display: none;\" onclick=\"modal(\'modal_form_cuerpo\')\">\n		<div class=\"content_form\" onclick=\"modal(\'modal_form_cuerpo\')\">\n			<div id=\"title\">ACTIVOS CORRIENTES</div>\n			<input type=\"text\" class=\"caja\" id=\"concepto\" placeholder=\"Escribe un concepto\">\n			<input type=\"number\" class=\"caja\" id=\"monto\" placeholder=\"Escribe un monto\">\n			<div class=\"flex\" style=\"justify-content: space-between;\">\n				<button class=\"btn\" style=\"color: red;\" onclick=\"modal(\'modal_form_cuerpo\')\">Canclear</button>\n				<button class=\"btn\" style=\"color: green;\" onclick=\"add()\">Aceptar</button>\n			</div>\n		</div>\n	</section>\n\n	<section class=\"modal\" id=\"modal_form_update\" style=\"display: none;\" onclick=\"modal(\'modal_form_update\')\">\n		<div class=\"content_form\" onclick=\"modal(\'modal_form_update\')\">\n			<div id=\"title_update\">CAJA Y BANCO</div>\n			<input type=\"text\" class=\"caja\" id=\"concepto_update\" placeholder=\"Escribe un concepto\">\n			<input type=\"number\" class=\"caja\" id=\"monto_update\" placeholder=\"Escribe un monto\" list=\"1,1,1\">\n			<div class=\"flex\" style=\"justify-content: space-between;\">\n				<button class=\"btn\" style=\"color: red;\" onclick=\"remove()\">Eliminar</button>\n				<button class=\"btn\" style=\"color: green;\" onclick=\"update()\">Guardar</button>\n			</div>\n		</div>\n	</section>\n\n', '11', '2021-02-05 20:22:20'),
('618428eb762fe', '61842894af6bf', 'Prueba', '\n\n	<input type=\"text\" id=\"id\" value=\"0\" readonly=\"\" hidden=\"\">\n\n	<section class=\"encabezado\" id=\"encabezado\">\n		<div class=\"block\">\n			<div class=\"empresa\" id=\"empresa_o_persona\" onclick=\"showEncabezado(\'empresa_o_persona\')\">Empresa X</div>\n			<div class=\"flex\">\n				<div class=\"titulo\" id=\"titulo\" onclick=\"showEncabezado(\'titulo\')\">HOJA CONTABLE</div>\n				<div class=\"fecha\" id=\"fecha\" onclick=\"showEncabezado(\'fecha\')\">04 DE NOVIEMBRE DEL 2021</div>\n			</div>\n		</div>\n	</section>\n\n	<section class=\"cuerpo\">\n\n		<div class=\"flex\">\n			<div class=\"block\">\n				<div class=\"content_activos\">\n					<h2>ACTIVOS</h2>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'activos_corrientes\')\">Activos corrientes</h4>\n						<div class=\"monto\" id=\"total_activos_corrientes\">$ 0</div>\n					</div>\n					<div id=\"activos_corrientes\"></div>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'activos_no_corrientes\')\">Activos no corrientes</h4>\n						<div class=\"monto\" id=\"total_activos_no_corrientes\">$ 0</div>\n					</div>\n					<div id=\"activos_no_corrientes\"></div>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'intangibles\')\">Intangibles</h4>\n						<div class=\"monto\" id=\"total_intangibles\">$ 0</div>\n					</div>\n					<div id=\"intangibles\"></div>\n					<div class=\"flex\">\n						<h2>TOTAL DE ACTIVOS</h2>\n						<div class=\"monto\" id=\"total_activos\">$ 0</div>\n					</div>\n				</div>\n				<div class=\"content_calculo\">\n					<h2>ECUACIÃ“N CONTABLE</h2>\n					<div class=\"formulas\">\n						<div id=\"activos\"></div>\n						<div id=\"pasivos\"></div>\n						<div id=\"patrimonio_neto\"></div>\n						<br>\n						<div id=\"formula_activo\"></div>\n						<div id=\"formula_pasivo\"></div>\n						<div id=\"formula_patrimonio_neto\"></div>\n					</div>\n				</div>\n			</div>\n			<div class=\"sepa\"></div>\n			<div class=\"block\">\n				<div class=\"content_pasivos\">\n					<h2>PASIVOS</h2>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'pasivos_corrientes\')\">Pasivos corrientes</h4>\n						<div class=\"monto\" id=\"total_pasivos_corrientes\">$ 0</div>\n					</div>\n					<div id=\"pasivos_corrientes\"></div>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'pasivos_no_corrientes\')\">Pasivos no corrientes</h4>\n						<div class=\"monto\" id=\"total_pasivos_no_corrientes\">$ 0</div>\n					</div>\n					<div id=\"pasivos_no_corrientes\"></div>\n					<div class=\"flex\">\n						<h2>TOTAL DE PASIVOS</h2>\n						<div class=\"monto\" id=\"total_pasivos\">$ 0</div>\n					</div>\n				</div>\n				<div class=\"content_patrimonio_neto\">\n					<h2>PATRIMONIO NETO</h2>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'fondos\')\">Fondos</h4>\n						<div class=\"monto\" id=\"total_fondos\">$ 0</div>\n					</div>\n					<div id=\"fondos\"></div>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'reservas\')\">Reservas</h4>\n						<div class=\"monto\" id=\"total_reservas\">$ 0</div>\n					</div>\n					<div id=\"reservas\"></div>\n					<div class=\"tr\">\n						<h4 class=\"btn\" title=\"Agregar\" onclick=\"showForm(\'utilidades\')\">Utilidades</h4>\n						<div class=\"monto\" id=\"total_utilidades\">$ 0</div>\n					</div>\n					<div id=\"utilidades\"></div>\n					<div class=\"flex\">\n						<h2>TOTAL DE PATRIMONIO NETO</h2>\n						<div class=\"monto\" id=\"total_patrimonio_neto\">$ 0</div>\n					</div>\n				</div>\n			</div>\n		</div>\n\n	</section>\n\n	<section class=\"modal\" id=\"modal_form_encabezado\" style=\"display: none;\" onclick=\"modal(\'modal_form_encabezado\')\">\n		<div class=\"content_form\" onclick=\"modal(\'modal_form_encabezado\')\">\n			<div id=\"title_encabezado\">TITULO</div>\n			<input type=\"text\" class=\"caja\" id=\"texto\" placeholder=\"Escribe aquÃ­\">\n			<div class=\"flex\" style=\"justify-content: flex-end;\">\n				<button class=\"btn\" style=\"color: green;\" onclick=\"changeText()\">Aceptar</button>\n			</div>\n		</div>\n	</section>\n\n	<section class=\"modal\" id=\"modal_form_cuerpo\" style=\"display: none;\" onclick=\"modal(\'modal_form_cuerpo\')\">\n		<div class=\"content_form\" onclick=\"modal(\'modal_form_cuerpo\')\">\n			<div id=\"title\"></div>\n			<input type=\"text\" class=\"caja\" id=\"concepto\" placeholder=\"Escribe un concepto\">\n			<input type=\"number\" class=\"caja\" id=\"monto\" placeholder=\"Escribe un monto\">\n			<div class=\"flex\" style=\"justify-content: space-between;\">\n				<button class=\"btn\" style=\"color: red;\" onclick=\"modal(\'modal_form_cuerpo\')\">Canclear</button>\n				<button class=\"btn\" style=\"color: green;\" onclick=\"add()\">Aceptar</button>\n			</div>\n		</div>\n	</section>\n\n	<section class=\"modal\" id=\"modal_form_update\" style=\"display: none;\" onclick=\"modal(\'modal_form_update\')\">\n		<div class=\"content_form\" onclick=\"modal(\'modal_form_update\')\">\n			<div id=\"title_update\"></div>\n			<input type=\"text\" class=\"caja\" id=\"concepto_update\" placeholder=\"Escribe un concepto\">\n			<input type=\"number\" class=\"caja\" id=\"monto_update\" placeholder=\"Escribe un monto\" list=\"1,1,1\">\n			<div class=\"flex\" style=\"justify-content: space-between;\">\n				<button class=\"btn\" style=\"color: red;\" onclick=\"remove()\">Eliminar</button>\n				<button class=\"btn\" style=\"color: green;\" onclick=\"update()\">Guardar</button>\n			</div>\n		</div>\n	</section>\n\n', '0', '2021-11-04 12:39:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname1` varchar(100) NOT NULL,
  `surname2` varchar(100) NOT NULL,
  `email` text NOT NULL,
  `user` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `date_register` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `surname1`, `surname2`, `email`, `user`, `password`, `date_register`) VALUES
('6155e6880f9f1', 'Martin', 'Espinosa', 'Gonzales', 'martin@gmail.com', 'martin', '$2y$10$g2OQKLWUU5IKLIC0JBMaS.AI9vWMuSv9XA0G.3Las/dg93rQHae0m', '2021-09-30 11:32:08'),
('61842894af6bf', 'Nombre de prueba', 'Apellido de prueba1', 'Apellido de prueba2', 'email@gmail.com', 'usuario', '$2y$10$Mt6lSHnEYROje0WZN9MM6ObMoOhut3fDiWFYJvksBwPb3fuy2HpVC', '2021-11-04 12:38:12');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
