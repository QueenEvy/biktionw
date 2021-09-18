-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-08-2021 a las 03:37:34
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shopping`
--

-- --------------------------------------------------------
create database `shopping`;
--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', '2017-01-24 16:21:18', '22-06-2020 10:14:35 PM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Chaquetas', 'Chaquetas', '2021-07-24 19:17:37', '30-07-2021 12:22:24 AM'),
(4, 'Guantes', 'Guantes Motociclista', '2021-07-24 19:19:32', ''),
(5, 'Botas', 'Botas', '2021-07-24 19:19:54', ''),
(6, 'Pantalones', 'Pantalones', '2021-07-20 19:18:52', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', 'Entregado'),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL),
(7, 1, '2', 1, '2020-06-22 13:58:56', 'Internet Banking', NULL),
(8, 1, '1', 1, '2020-06-22 14:06:25', 'COD', NULL),
(9, 1, '12', 1, '2020-06-22 14:06:25', 'COD', NULL),
(10, 4, '2', 3, '2020-06-23 00:58:37', 'Debit / Credit card', NULL),
(11, 4, '18', 1, '2020-06-23 01:54:11', 'Internet Banking', NULL),
(12, 4, '20', 1, '2020-06-23 03:02:41', 'Internet Banking', NULL),
(13, 4, '15', 1, '2020-06-23 03:04:45', 'COD', NULL),
(14, 4, '12', 1, '2020-06-23 03:07:50', NULL, NULL),
(15, 4, '15', 1, '2020-06-23 03:07:50', NULL, NULL),
(16, 4, '2', 1, '2020-06-23 03:23:40', NULL, NULL),
(17, 5, '2', 1, '2021-07-26 01:17:30', 'Debit / Credit card', NULL),
(18, 5, '11', 1, '2021-07-26 01:17:30', 'Debit / Credit card', NULL),
(19, 6, '2', 1, '2021-07-31 19:54:46', 'Internet Banking', NULL),
(20, 7, '13', 1, '2021-08-07 01:27:47', 'COD', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36'),
(5, 1, 'Entregado', 'OK', '2021-07-31 11:32:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 3, 13, 'CHAQUETA DE CUERO', 'ALPINE', 250000, 250000, 'Chaqueta de protección para motociclista fabricada en cuero y lona 18 mts de arrastre en caso de caída forro interno en nylon, cremalleras impermeables 3 bolsillo uno interno, ajuste con riatas en cintura, protecciones en codos hombros y espalda, reflective frontal y trasero según la norma, cuello tipo piloto<br>', 'chaqueta-shaft-colt.jpeg', 'chaqueta-shaft-colt1.jpeg', 'chaqueta-shaft-colt2.jpeg', 0, 'En Stock', '2021-07-31 10:28:58', NULL),
(2, 3, 13, 'CHAQUETA DE PROTECCIÓN SHAFT NOVA', 'SHAFT', 225000, 250000, '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Sus características principales son:</span></p><ul style=\"box-sizing: border-box; margin-bottom: 0px; list-style-position: initial; list-style-image: initial; padding: 0.6rem 0.6rem 0.6rem 2rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><li style=\"box-sizing: border-box;\">Fabricada 100% en Poliéster en su interior y exterior</li><li style=\"box-sizing: border-box;\">Detalles lineales con costuras reflectivas en la parte frontal y posterior</li><li style=\"box-sizing: border-box;\">Bolsillo para capucha</li><li style=\"box-sizing: border-box;\">Bolsillos con cierre en cintura, manga lateral y parte posterior - Bolsillo Interno (Porta-documentos)</li><li style=\"box-sizing: border-box;\">Protección en espalda, codos y hombres</li><li style=\"box-sizing: border-box;\">Correa ajustable en muñecas con velcro</li><li style=\"box-sizing: border-box;\">Ajuste en cintura elástico</li></ul>', 'chaqueta-de-proteccion-shaft-nova.jpg', 'chaqueta-de-proteccion-shaft-nova (1).jpg', 'chaqueta-de-proteccion-shaft-nova (2).jpg', 0, 'En Stock', '2021-07-31 10:36:59', NULL),
(3, 3, 13, 'CHAQUETA DE PROTECCIÓN LS2 VESTA MAN', 'LS2 HELMETS', 650000, 650000, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; list-style-position: initial; list-style-image: initial; padding: 0.6rem 0.6rem 0.6rem 2rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><li style=\"box-sizing: border-box;\">Vesta cuenta con cerraduras de dos vías ajustables en los brazos, las muñecas, el cuello y la espalda</li><li style=\"box-sizing: border-box;\">Tiene cierre YKK para que puedas ajustarlo a tus pantalones.</li><li style=\"box-sizing: border-box;\">Especial énfasis en la ventilación frontal y la extracción de la espalda para una conducción más cómoda y fresca.</li><li style=\"box-sizing: border-box;\">El collar está hecho de material suave al tacto para mayor comodidad al usar la chaqueta.</li><li style=\"box-sizing: border-box;\">Equipada con protectores de hombros y codos certificados y aprobados por el CE.</li><li style=\"box-sizing: border-box;\">Es 100% lavable sin degradar los colores.</li><li style=\"box-sizing: border-box;\">Hecha de una membrana impermeable,</li></ul>', 'chaqueta-de-proteccion-ls2-vesta-man.jpg', 'chaqueta-de-proteccion-ls2-vesta-man (1).jpg', 'chaqueta-de-proteccion-ls2-vesta-man (2).jpg', 0, 'En Stock', '2021-07-31 10:39:15', NULL),
(4, 3, 13, 'CHAQUETA DE PROTECCIÓN LS2 DIANE MUJER', 'LS2 HELMETS', 350000, 350000, '<span style=\"box-sizing: border-box; font-weight: bolder; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Fabricación:&nbsp;</span><span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">600D Oxford Fabric (100% Poliester)</span><span style=\"box-sizing: border-box; font-weight: bolder; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><br style=\"box-sizing: border-box;\">Revestimiento:</span><span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">&nbsp;Capa exterior + Liner ?jo en malla + Membrana impermeable fija +Liner para invierno removible.</span><span style=\"box-sizing: border-box; font-weight: bolder; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><br style=\"box-sizing: border-box;\">Seguridad:</span><span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">&nbsp;Protección CE en codos y hombros removible, protector de espalda removible, Alta capacidad de abrasión, re?ectivos</span><span style=\"box-sizing: border-box; font-weight: bolder; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">.<br style=\"box-sizing: border-box;\">Otras especificaciones:&nbsp;</span><span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Ajuste de velcro en cuello, Cintura y brazos regulables, puño ajustable, bolsillos</span><br style=\"box-sizing: border-box; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">laterales con cierre, apertura frontal de ventilación, bolsillos en torso, apertura trasera de ventilación, bolsillos internos, cierre para pantalón.</span><br>', 'chaqueta-de-proteccion-ls2-diane-mujer.jpg', 'chaqueta-de-proteccion-ls2-diane-mujer (1).jpg', 'chaqueta-de-proteccion-ls2-diane-mujer (2).jpg', 0, 'En Stock', '2021-07-31 10:40:33', NULL),
(5, 3, 13, 'CHAQUETA DE PROTECCIÓN LS2 METROPOLIS MAN', 'LS2 HELMETS', 700000, 700000, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; list-style-position: initial; list-style-image: initial; padding: 0.6rem 0.6rem 0.6rem 2rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><li style=\"box-sizing: border-box;\">Construcción de poliéster Ripstop 500D.</li><li style=\"box-sizing: border-box;\">Forro fijo de malla. Membrana extraíble transpirable e impermeable. Forro térmico desmontable.</li><li style=\"box-sizing: border-box;\">Puntos de ajuste en cuello, puños, brazos y dobladillo.</li><li style=\"box-sizing: border-box;\">Armadura CE aprobada en hombros y codos.</li><li style=\"box-sizing: border-box;\">Bolsillo protector trasero (protector disponible por separado).</li><li style=\"box-sizing: border-box;\">Almohadilla de confort en el cuello.</li><li style=\"box-sizing: border-box;\">Múltiples bolsillos (incluido un bolsillo interno para teléfono inteligente a prueba de agua).</li><li style=\"box-sizing: border-box;\">Detalles reflectantes.</li><li style=\"box-sizing: border-box;\">Cremalleras YKK</li></ul>', 'chaqueta-de-proteccion-ls2-metropolis-man.jpg', 'chaqueta-de-proteccion-ls2-metropolis-man (1).jpg', 'chaqueta-de-proteccion-ls2-metropolis-man (2).jpg', 0, 'En Stock', '2021-07-31 10:41:44', NULL),
(6, 3, 13, 'CHAQUETA DE PROTECCIÓN LS2 SERRA MUJER', 'LS2 HELMETS', 435000, 435000, '<span style=\"box-sizing: border-box; font-weight: bolder; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Fabricación:&nbsp;</span><span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">600D Oxford Fabric (100% Poliester)</span><span style=\"box-sizing: border-box; font-weight: bolder; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><br style=\"box-sizing: border-box;\">Revestimiento:</span><span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">&nbsp;Capa exterior + Liner ?jo en malla + Membrana impermeable fija +Liner para invierno removible.</span><span style=\"box-sizing: border-box; font-weight: bolder; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><br style=\"box-sizing: border-box;\">Seguridad:</span><span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">&nbsp;Protección CE en codos y hombros removible, protector de espalda removible, Alta capacidad de abrasión, re?ectivos</span><span style=\"box-sizing: border-box; font-weight: bolder; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">.<br style=\"box-sizing: border-box;\">Otras especificaciones:&nbsp;</span><span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Ajuste de velcro en cuello, Cintura y brazos regulables, puño ajustable, bolsillos</span><br style=\"box-sizing: border-box; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">laterales con cierre, apertura frontal de ventilación, bolsillos en torso, apertura trasera de ventilación, bolsillos internos, cierre para pantalón, incluye cortavientos.</span><br>', 'chaqueta-de-proteccion-ls2-serra-mujer.jpg', 'chaqueta-de-proteccion-ls2-serra-mujer (1).jpg', 'chaqueta-de-proteccion-ls2-serra-mujer (2).jpg', 0, 'En Stock', '2021-07-31 10:42:58', NULL),
(7, 4, 14, 'GUANTE TECH 170', 'TECH', 30000, 30000, '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Sus principales características son:</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"></p><ul style=\"box-sizing: border-box; margin-bottom: 0px; list-style-position: initial; list-style-image: initial; padding: 0.6rem 0.6rem 0.6rem 2rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><li style=\"box-sizing: border-box;\">Protección en la palma y el los nudillos</li><li style=\"box-sizing: border-box;\">Ajuste en velcro</li><li style=\"box-sizing: border-box;\">Textura en la palma que mejora el agarre</li><li style=\"box-sizing: border-box;\">Protección y ventilación en los dedos</li><li style=\"box-sizing: border-box;\">Refuerzo en el pulgar</li></ul>', 'guante-tech-170.jpg', 'guante-tech-170.jpg', 'guante-tech-170.jpg', 0, 'En Stock', '2021-07-31 10:44:21', NULL),
(8, 4, 14, 'GUANTES BULLET 270 RT', 'NULLET', 38000, 38000, '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Sus características principales son:&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Fabricado en polyester 100%</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Accesorio para limpiar el visor cuando este expuesto al agua.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Protección en los nudillos y aplicaciones en silicona en la palma de la mano.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"></p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Elige la talla midiendo el ancho y largo de la mano: S (Ancho: 8 - 8,5 cm. Largo: 16,4 - 17,2 cm), M (Ancho: 8,5 - 9 cm. Largo: 17,2 - 18,2 cm), L (Ancho: 9 - 9,5 cm. Largo: 18,2 - 19.1 cm), XL (Ancho: 9 - 9,5 cm. Largo: 19,1 - 20,1 cm), XXL (Ancho: 10 - 11 cm. Largo: 20,1 - 21,1 cm).</p>', 'guantes-bullet-270-rt.jpg', 'guantes-bullet-270-rt (2).jpg', 'guantes-bullet-270-rt (1).jpg', 0, 'En Stock', '2021-07-31 10:48:39', NULL),
(9, 4, 14, 'GUANTES SHAFT STUNT CAMO', 'SHAFT', 80000, 80000, '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Sus características principales:&nbsp;</span></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Ajuste en velcro</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Protección en palma</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Punta en dedo táctil</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Protección rígida en nudillos&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Grip antideslizante en la palma</p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Refuerzo en costuras en palma y meñique</p>', 'guantes-shaft-stunt-camo (1).jpg', 'guantes-shaft-stunt-camo.jpg', 'guantes-shaft-stunt-camo (2).jpg', 0, 'En Stock', '2021-07-31 10:51:01', NULL),
(11, 4, 14, 'GUANTES SHAFT PISTA', 'SHAFT', 195000, 195000, '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Sus características principales son:</span></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Ajuste en velcro</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Protección en palma</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Punta en dedo táctil</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Protección rígida en nudillos&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Refuerzo en costuras en palma y meñique</p>', 'guantes-shaft-pista.jpg', 'guantes-shaft-pista (1).jpg', 'guantes-shaft-pista (2).jpg', 0, 'En Stock', '2021-07-31 10:53:31', NULL),
(12, 6, 16, 'PANTALON DE PROTECCIÓN LS2 CHART MUJER', 'LS2 HELMETS', 360000, 360000, '<p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Características principales:</span></p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Confección en poliéster.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Forro en poliéster.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Paneles elásticos en entrepierna y rodillas.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Panel antideslizante en la zona de asiento.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Refuerzo en material resistente a la abrasión en las rodillas.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Ventilaciones regulables con cremallera.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Apertura de la pierna regulable con cremallera y velcro.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Membrana impermeable (5000 mm de columna) y transpirable (3000 g/m2/24h).</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Forro térmico extraíble 90 g/m2.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Correas de ajuste en la cintura.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Elementos reflectantes.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Cremallera frontal YKK.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Cremallera para conexión con chaqueta YKK.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">2 bolsillos laterales con cremallera.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Protecciones homologadas CE EN 1621-1:2012 Nivel 1 en caderas y rodillas.</p><p style=\"box-sizing: border-box; margin-bottom: 0.8rem; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Posición de las protecciones de rodilla ajustable (3 posiciones).</p><p style=\"box-sizing: border-box; margin-bottom: 0px; font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">Homologación prEN 17092-3:2018 Class AA.</p>', 'pantalon-de-proteccion-ls2-chart-mujer.jpg', 'pantalon-de-proteccion-ls2-chart-mujer (1).jpg', 'pantalon-de-proteccion-ls2-chart-mujer (2).jpg', 0, 'En Stock', '2021-07-31 10:54:52', NULL),
(13, 6, 16, 'PANTALÓN DE PROTECCIÓN SH PRO 280', 'SHAFT', 300000, 300000, '<span style=\"font-family: Conv_GalanoGrotesque-Medium; font-size: 14px;\">El pantalón de protección SHAFT PRO 280 será tu favorito en tu próximo viaje. Este accesorio semi impermeable cuenta con protecciones en las rodillas, certificadas con la norma CE, para que rodar sea tan seguro como divertido. Cuenta con una capa térmico removible, adaptándolo a cualquier clima al que vayas. Además, sus prácticos bolsillos te darán la posibilidad de llevar todo cerca de ti.</span><br>', 'pantalon-de-proteccion-sh-pro-280 (1).jpg', 'pantalon-de-proteccion-sh-pro-280.jpg', 'pantalon-de-proteccion-sh-pro-280 (2).jpg', 0, 'En Stock', '2021-07-31 10:55:56', NULL),
(14, 5, 15, 'BOTA SPARK', 'SPARK', 650000, 650000, '<span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Características técnicas:</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Larga tipo Racer con diseño ergonómico.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Refuerzos externos en TPU posicionados estratégicamente para una mayor protección.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Membrana semi-impermeable.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Sistema de cierre con cremallera y velcro.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">La suela de caucho mejora la sensación y ofrece excelente agarre.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Deslizadores de TPU en la puntera.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Protector de cambios en material anti desgaste.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Plantilla anatómica.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Diseños reflectivos.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Capellada : MICROFIBRA</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Forro : SINTETICO</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Suela : CAUCHO</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">País de origen : CHINA</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Registro SIC : 860520243</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">*Este producto&nbsp;</span><b style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">no es</b><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">&nbsp;100% impermeable.</span><br>', 'Calzado-BKP1YA-NGxAM_4.jpg', 'Calzado-BKP1YA-NGxAM_2.jpg', 'Calzado-BKP1YA-NGxAM_1.jpg', 0, 'En Stock', '2021-07-31 10:59:33', NULL),
(15, 5, 15, 'BOTA HOMBRE SILVERSTONE', 'SPARK', 360000, 360000, '<span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Bota corta con diseño ergonómico.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Plantilla anatómica.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Sistema de cierre con velcro y cremallera.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Refuerzo interno en puntera y talón.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Suela antideslizante.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Banda trasera reflectiva.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Capellada : CUERO/CAUCHO</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Forro : TEXTIL</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Suela : CAUCHO</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">País de origen : COLOMBIA</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Registro SIC : 800196632</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">*Este producto&nbsp;</span><b style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">no es</b><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">&nbsp;100% impermeable.</span><br>', 'Calzado-BKFPNG-NEGRO_2.jpg', 'Calzado-BKFPNG-NEGRO_3.jpg', 'Calzado-BKFPNG-NEGRO_1.jpg', 0, 'En Stock', '2021-07-31 11:01:00', NULL),
(16, 5, 15, 'BOTA HOMBRE MAYORKA', 'SPARK', 360000, 360000, '<span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Corta urbana con diseño ergonómico.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Doble cierre: Cordones que se adaptan perfecto a cualquier tipo de empeine y correa de velcro para un ajuste óptimo.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Protecciones internas incorporadas en los tobillos, refuerzo en la puntera y el área del talón.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">La suela de caucho mejora la sensación y ofrece excelente agarre.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Plantilla anatómica.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Diseños reflectivos.</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Capellada : MICROFIBRA/TEXTIL/TPU/CUERO</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Forro : POLIESTER</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Suela : CAUCHO</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">País de origen : COLOMBIA</span><br style=\"box-sizing: border-box; color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: Lato; font-size: 16px; letter-spacing: 0.32px; text-align: justify;\">Registro SIC : 800196632</span><br>', 'Calzado-BHDLNR-NGxRJ_2.jpg', 'Calzado-BHDLNR-NGxRJ_3.jpg', 'Calzado-BHDLNR-NGxRJ_4.jpg', 0, 'En Stock', '2021-07-31 11:02:02', NULL),
(17, 3, 0, 'CHAQUETA DE PROTECCIÓN SHAFT NOVA', 'SHAFT', 360000, 250000, 'xxxxxxxx', 'Diploma William Quiceno.pdf', 'GPU-Z.2.41.0.exe', 'Diploma William Quiceno.pdf', 0, 'En Stock', '2021-08-07 01:32:38', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1),
(24, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-22 13:49:46', NULL, 0),
(25, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-22 13:54:27', '22-06-2020 07:42:06 PM', 1),
(26, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-22 20:37:14', NULL, 1),
(27, 'platea21@platea21.com', 0x3a3a3100000000000000000000000000, '2020-06-23 00:58:24', '22-06-2020 08:40:53 PM', 1),
(28, 'platea21@platea21.com', 0x3a3a3100000000000000000000000000, '2020-06-23 01:45:10', NULL, 1),
(29, 'platea21@platea21.com', 0x3a3a3100000000000000000000000000, '2020-06-23 03:23:26', NULL, 0),
(30, 'platea21@platea21.com', 0x3a3a3100000000000000000000000000, '2020-06-23 03:23:36', NULL, 1),
(31, 'wquiceno@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-26 01:16:57', NULL, 1),
(32, 'wquiceno@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-31 10:03:07', NULL, 1),
(33, 'wquiceno@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-31 19:54:41', '31-07-2021 02:56:55 PM', 1),
(34, 'wquiceno@gmail.com', 0x3a3a3100000000000000000000000000, '2021-08-07 01:03:24', NULL, 0),
(35, 'wquiceno@gmail.com', 0x3a3a3100000000000000000000000000, '2021-08-07 01:04:51', NULL, 0),
(36, 'wquiceno@correo.com', 0x3a3a3100000000000000000000000000, '2021-08-07 01:05:57', NULL, 1),
(37, 'wquiceno@correo.com', 0x3a3a3100000000000000000000000000, '2021-08-07 01:27:24', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'CS New Delhi', 'New Delhi', 'Delhi', 110001, 'New Delhi', 'New Delhi', 'Delhi', 110092, '2017-02-04 19:30:50', ''),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', ''),
(4, 'Platea21', 'platea21@platea21.com', 948445199, '77821d6f09aad66ace339068f6b7f61c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-23 00:58:07', NULL),
(6, 'william', 'wquiceno@gmail.com', 3053996614, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-31 09:59:26', NULL),
(7, 'William Quiceno CA14222', 'wquiceno@correo.com', 3053996614, '202cb962ac59075b964b07152d234b70', '11355 SW 152nd Terr', 'FL - Florida', 'miami', 33157, NULL, NULL, NULL, NULL, '2021-08-07 01:05:17', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
