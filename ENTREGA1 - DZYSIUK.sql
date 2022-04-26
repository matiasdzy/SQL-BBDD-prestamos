#--PRIMERA ENTREGA DE PROYECTO INTEGRADOR--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 28/03/2022
/*
#Creación de la base de datos "prestamos"
CREATE DATABASE prestamos_personales;
USE prestamos_personales;

#Creación de tabla clientes
CREATE TABLE clientes (
					id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    nombre VARCHAR(50) NOT NULL,
                    apellido VARCHAR(50) NOT NULL,
                    dni INT NOT NULL,
                    tel_pri VARCHAR(20) NOT NULL,
                    tel_sec VARCHAR(20) NOT NULL,
                    dir_pri VARCHAR(50) NOT NULL,
                    n_calle_pri INT NOT NULL,
                    n_km_pri TINYINT(50),
					dir_sec VARCHAR(50) NOT NULL,
                    n_calle_sec INT NOT NULL,
                    n_km_sec TINYINT(50),
                    hora_visita TIME,
                    coment VARCHAR(150)
);

#Creación de tabla capitales
CREATE TABLE capitales (
					id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    nombre VARCHAR(50) NOT NULL,
                    apellido VARCHAR(50) NOT NULL,
                    dni INT NOT NULL,
                    monto INT,
                    tel_pri VARCHAR(20) NOT NULL,
                    tel_sec VARCHAR(20) NOT NULL,
                    dir_pri VARCHAR(50) NOT NULL,
                    n_calle_pri INT NOT NULL,
                    n_km_pri TINYINT(50),
					dir_sec VARCHAR(50) NOT NULL,
                    n_calle_sec INT NOT NULL,
                    n_km_sec TINYINT(50),
                    hora_visita TIME,
                    coment VARCHAR(150)
);

#Creación de tabla forma de pago
CREATE TABLE modo_pagos (
					id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    modo TINYTEXT
);

#Creación de tabla prestamos
CREATE TABLE prestamos (
					id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    id_capital INT NOT NULL,
                    id_cliente INT NOT NULL,
                    id_pago INT NOT NULL,
                    monto INT NOT NULL,
                    interes INT NOT NULL,
                    n_cuotas INT NOT NULL,
                    refinanciacion BOOL,
                    coment VARCHAR(150),
					FOREIGN KEY (id_capital)
						REFERENCES capitales(id)
						ON DELETE CASCADE,
					FOREIGN KEY (id_cliente)
						REFERENCES clientes(id)
						ON DELETE CASCADE,
					FOREIGN KEY (id_pago)
						REFERENCES modo_pagos(id)
						ON DELETE CASCADE
);

#Creación de tabla detalles
CREATE TABLE detalles (
					id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    id_prestamo INT NOT NULL,
                    direccion BOOL,
                    n_cuota INT NOT NULL,
                    fecha_p DATE,
                    estado BOOL,
                    dent_mes BOOL,
                    fecha_rp DATE,
                    hora_p TIME,
                    coment VARCHAR(150),
                    FOREIGN KEY (id_prestamo)
						REFERENCES prestamos(id)
						ON DELETE CASCADE
);

#Creación de tabla roles
CREATE TABLE roles (
					id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    rol TINYTEXT
);

#Creación de tabla usuarios
CREATE TABLE usuarios (
					id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                    id_rol INT NOT NULL,
					FOREIGN KEY (id_rol)
						REFERENCES roles(id)
						ON DELETE CASCADE
);
*/

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#--DESAFIO INSERCION DE DATOS--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 28/03/2022
/*
#Inserción de datos en tabla clientes

INSERT INTO `clientes` VALUES ('1', ' Nicolas', 'Arbeta', '45167879', '35964954', '42575719', 'BEREGUESTEIN ', '125', '8', 'AVELLANEDA', '188', '10', '23:39:00', 'REJAS NEGRAS' );
INSERT INTO `clientes` VALUES ('2', ' Celeste', 'Escobar', '54679340', '13187329', '42120055', 'ALBERTI ', '696', '2', 'CORONEL BRANDSEN', '307', '7', '03:38:00', 'PREGUNTAR POR MARIO' );
INSERT INTO `clientes` VALUES ('3', ' Mabel', 'Flamini', '32151651', '14605758', '42122764', 'MORENO ', '81', '4', 'CAMPANA', '164', '9', '05:07:00', 'CARNICERIA' );
INSERT INTO `clientes` VALUES ('4', ' Adrian', 'Guillen', '40696260', '37333084', '42575679', 'PTE. PERON ', '297', '5', 'VALENTIN ALSINA', '914', '10', '03:47:00', NULL );
INSERT INTO `clientes` VALUES ('5', ' Hernan', 'Lago', '40312929', '12524289', '42525610', 'AVDA. PEDRO PEREYRA ', '79', '1', 'LAPRIDA', '506', '10', '05:30:00', NULL );
INSERT INTO `clientes` VALUES ('6', ' Daniel', 'Martearena', '40368326', '41575750', '42531817', 'LOPE DE VEGA ', '812', '11', 'BOCA DE ATENCION MONTE CASTRO', '856', '5', '08:17:00', 'LUGAR DE TRABAJO' );
INSERT INTO `clientes` VALUES ('7', ' Graciela', 'Navarro', '31897183', '25223776', '42808094', 'SANTA ROSA ', '194', '14', 'USHUAIA', '720', '7', '00:05:00', 'AVISAR ANTES' );
INSERT INTO `clientes` VALUES ('8', ' Carlos', 'Ojeda', '23626470', '1246092', '42575728', 'SANTA ROSA ', '522', '9', 'CORDOBA', '734', '3', '18:52:00', NULL );
INSERT INTO `clientes` VALUES ('9', ' Carolina', 'Pasos', '34308731', '34876911', '42541576', 'JUAN B. JUSTO ', '806', '9', 'MENDOZA', '350', '4', '08:03:00', NULL );
INSERT INTO `clientes` VALUES ('10', ' Viviana', 'Pisano', '34484594', '19506819', '42123277', 'CORDOBA ', '829', '4', 'MIRANDA', '920', '5', '22:00:00', 'CASA CON MUCHOS PERROS' );
INSERT INTO `clientes` VALUES ('11', ' Dario', 'Salinas', '44636874', '43081635', '42246026', 'VICEALTE O CONNOR ', '321', '3', 'SAN CARLOS DE BARILOCHE', '948', '1', '22:37:00', 'AUTO GRIS AFUERA' );
INSERT INTO `clientes` VALUES ('12', ' Sandra', 'Silva', '53756599', '26328692', '42532696', 'SAN MARTIN ', '808', '6', 'ROSARIO', '31', '1', '12:31:00', 'FRENTE A CASA DE DOS PISOS' );
INSERT INTO `clientes` VALUES ('13', ' Marcela', 'Soler', '19139881', '28470578', '42265215', 'SANTIAGO DEL ESTERO ', '659', '6', 'SAN MIGUEL DE TUCUMAN', '626', '6', '23:23:00', 'PREGUNTAR POR MIRTA' );
INSERT INTO `clientes` VALUES ('14', ' Martin', 'Soto', '28334334', '46742173', '42518982', 'BELGRANO ', '17', '2', 'MONTEROS', '453', '3', '12:21:00', NULL );
INSERT INTO `clientes` VALUES ('15', ' Claudio', 'Volpi', '31633441', '2489900', '42532906', 'PERITO MORENO', '459', '8', 'JOSE HERNANDEZ', '612', '8', '13:32:00', NULL );
INSERT INTO `clientes` VALUES ('16', 'Juan', 'Domingo', '49753991', '35578633', '47811245', 'PUEYRREDON', '342', '7', 'FORMOSA', '858', '2', '10:39:00', 'AUTO ROJO' );

#Inserción de datos en tabla capitales

INSERT INTO `capitales` VALUES ('1', ' Daniel', 'Escobar', '45167879', '790000', '23118344', '42575719', 'AVDA. PEDRO PEREYRA ', '781', '8', 'SANTA ROSA ', '349', '3', '23:39:00', 'MANTENER INFORMADO' );
INSERT INTO `capitales` VALUES ('2', ' Nicolas', 'Martearena', '54679340', '150000', '30909028', '42120055', 'ALBERTI ', '127', '2', 'CORONEL BRANDSEN', '709', '1', '03:38:00', NULL );
INSERT INTO `capitales` VALUES ('3', ' Mabel', 'Guillen', '32151651', '350000', '28945124', '42122764', 'BEREGUESTEIN ', '852', '4', 'CAMPANA', '978', '1', '05:07:00', 'CARNICERIA' );
INSERT INTO `capitales` VALUES ('4', ' Carlos', 'Arbeta', '40696260', '400000', '44981128', '42575679', 'PTE. PERON ', '930', '5', 'VALENTIN ALSINA', '273', '8', '03:47:00', NULL );
INSERT INTO `capitales` VALUES ('5', ' Adrian', 'Ojeda', '40312929', '100000', '6467891', '42525610', 'BOCA DE ATENCION MONTE CASTRO', '289', '1', 'LAPRIDA', '983', '4', '05:30:00', 'PREGUNTAR POR MARIO' );
INSERT INTO `capitales` VALUES ('6', ' Daniel', 'Pisano', '40368326', '600000', '1498839', '42531817', 'LOPE DE VEGA ', '147', '11', 'AVELLANEDA', '760', '10', '08:17:00', NULL );
INSERT INTO `capitales` VALUES ('7', ' Adrian', 'Navarro', '31897183', '500000', '28797806', '42808094', 'MORENO ', '538', '14', 'USHUAIA', '597', '2', '00:05:00', NULL );
INSERT INTO `capitales` VALUES ('8', ' Carlos', 'Pasos', '23626470', '800000', '6093367', '42575728', 'SANTA ROSA ', '459', '9', 'JUAN B. JUSTO ', '11', '10', '18:52:00', 'LUGAR DE TRABAJO' );
INSERT INTO `capitales` VALUES ('9', ' Celeste', 'Flamini', '34308731', '100000', '3557381', '42541576', 'MENDOZA', '252', '9', 'MIRANDA', '578', '3', '08:03:00', NULL );
INSERT INTO `capitales` VALUES ('10', ' Viviana', 'Lago', '34484594', '200000', '38763720', '42123277', 'CORDOBA ', '505', '4', 'CORDOBA', '945', '8', '22:00:00', NULL );

#Inserción de datos en tabla forma de pago
INSERT INTO modo_pagos VALUES 
							(NULL,"EFECTIVO"),
                            (NULL, "MERCADO PAGO");

#Inserción de datos en tabla prestamos

INSERT INTO `prestamos` VALUES ('1', '2', '5', '1', '15000', '30', '3', '0', NULL );
INSERT INTO `prestamos` VALUES ('2', '3', '6', '1', '15000', '20', '5', '0', NULL );
INSERT INTO `prestamos` VALUES ('3', '8', '11', '1', '50000', '40', '28', '0', NULL );
INSERT INTO `prestamos` VALUES ('4', '1', '4', '2', '40000', '30', '20', '1', 'RETIRAR TARJETA' );
INSERT INTO `prestamos` VALUES ('5', '4', '15', '2', '100000', '30', '10', '0', NULL );
INSERT INTO `prestamos` VALUES ('6', '4', '2', '1', '20000', '30', '30', '1', 'RETIRAR TARJETA' );
INSERT INTO `prestamos` VALUES ('7', '8', '11', '2', '30000', '40', '20', '0', NULL );
INSERT INTO `prestamos` VALUES ('8', '1', '4', '1', '15000', '30', '15', '0', NULL );
INSERT INTO `prestamos` VALUES ('9', '5', '8', '2', '20000', '30', '20', '1', 'RETIRAR TARJETA' );
INSERT INTO `prestamos` VALUES ('10', '6', '9', '1', '70000', '30', '20', '0', NULL );

#Inserción de datos en tabla detalles

INSERT INTO `detalles` VALUES ('1', '1', '0', '1', '2016-01-04', '1', '1', NULL, '23:39:00', NULL );
INSERT INTO `detalles` VALUES ('2', '1', '0', '2', '2016-04-20', '1', '1', NULL, '03:38:00', NULL );
INSERT INTO `detalles` VALUES ('3', '2', '1', '5', '2015-10-18', '1', '1', NULL, '05:07:00', NULL );
INSERT INTO `detalles` VALUES ('4', '3', '0', '18', '2016-07-28', '0', '0', '2016-08-05', '03:47:00', 'RETIRAR TARJETA' );
INSERT INTO `detalles` VALUES ('5', '8', '0', '8', '2016-12-26', '1', '1', NULL, '05:30:00', NULL );
INSERT INTO `detalles` VALUES ('6', '6', '1', '22', '2017-02-07', '0', '0', '2017-02-17', '08:17:00', 'RETIRAR TARJETA' );
INSERT INTO `detalles` VALUES ('7', '10', '0', '15', '2016-05-04', '1', '1', NULL, '00:05:00', NULL );
INSERT INTO `detalles` VALUES ('8', '4', '1', '11', '2016-09-08', '1', '1', NULL, '18:52:00', NULL );
INSERT INTO `detalles` VALUES ('9', '4', '1', '12', '2016-10-08', '0', '0', '2016-10-18', '08:03:00', 'RETIRAR TARJETA' );
INSERT INTO `detalles` VALUES ('10', '7', '0', '7', '2015-11-27', '1', '1', NULL, '22:00:00', NULL );
INSERT INTO `detalles` VALUES ('11', '5', '1', '8', '2017-03-26', '1', '1', NULL, '18:52:00', NULL );
INSERT INTO `detalles` VALUES ('12', '9', '0', '9', '2017-02-05', '1', '1', NULL, '05:07:00', NULL );
INSERT INTO `detalles` VALUES ('13', '9', '0', '10', '2017-06-18', '0', '0', '2017-06-28', '03:38:00', NULL );

#Inserción de datos en tabla roles
INSERT INTO roles VALUES 
							(NULL,"ADMINISTRADOR"),
                            (NULL,"VENDEDOR"),
                            (NULL, "CAPITAL");

#Inserción de datos en tabla usuarios
INSERT INTO usuarios VALUES 
							(NULL,1),
                            (NULL, 2);
  
 */ 

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#--DESAFIO CREACION DE VISTAS--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 30/03/2022
/*
# 1- View que permite conocer cuanto dinero aporto el capital, cuanto dinero se presto y cual es el porcentaje disponible para seguir prestando
CREATE OR REPLACE VIEW prestamos_por_capital AS
SELECT CONCAT(c.nombre, " ", c.apellido) AS CAPITAL,
	   c.monto AS "MONTO INICIAL [$]",
       p.monto AS "MONTO PRESTADO [$]",
       ROUND(((((c.monto - p.monto)/c.monto))*100), 2) AS "DISPONIBLE %"
FROM prestamos AS p
INNER JOIN capitales AS c
	ON p.id_capital = c.id
GROUP BY CAPITAL
ORDER BY p.monto DESC;


# 2- View que permite conocer los clientes que mas dinero solicitaron 
CREATE OR REPLACE VIEW mejores_clientes AS
SELECT CONCAT(c.nombre, " ", c.apellido) AS CLIENTES,
	   p.monto AS "MONTO PRESTADO [$]"
FROM clientes AS c
INNER JOIN prestamos AS p
	ON p.id_cliente = c.id
ORDER BY monto DESC;


# 3- View que permite conocer los clientes que estan activos, es decir,aquellos que pagaron menos cuotas de las que le corresponde
CREATE OR REPLACE VIEW clientes_activos AS
SELECT DISTINCT(p.id_cliente) AS ID,
	   CONCAT(c.nombre, " ", c.apellido) AS NOMBRE
FROM prestamos AS p
RIGHT JOIN detalles AS d
	ON p.id = d.id_prestamo
INNER JOIN clientes AS c
	ON p.id_cliente = c.id
WHERE p.n_cuotas > d.n_cuota
ORDER BY id ASC;

# 4- View que permite conocer cuantas cuotas fueron abonadas por los clientes y cuantas le faltan para cerras su prestamo
CREATE OR REPLACE VIEW cuotas_abonadas AS
SELECT  CONCAT(c.nombre, " ", c.apellido) AS NOMBRE,
		id_prestamo AS "ID DE PRESTAMO",
        MAX(d.n_cuota) AS "CUOTAS PAGADAS",
        (p.n_cuotas-MAX(d.n_cuota)) AS "CUOTAS RESTANTES",
        p.n_cuotas AS "TOTAL DE CUOTAS"
FROM detalles AS d
INNER JOIN prestamos AS p
	ON d.id_prestamo = p.id
INNER JOIN clientes AS c
	ON p.id_cliente = c.id
GROUP BY id_prestamo;

# 5- View que permite conocer la ficha de un cliente
CREATE OR REPLACE VIEW ficha_cliente AS
SELECT  CONCAT(c.nombre, " ", c.apellido) AS NOMBRE,
		id_prestamo AS "ID DE PRESTAMO",
        p.monto AS "MONTO PRESTADO [$]",
        p.interes AS "INTERÉS [%]",
        p.n_cuotas AS "CUOTA TOTAL",
        MAX(d.n_cuota) AS "CUOTAS PAGADAS",
        ROUND((((p.monto * p.interes)/p.n_cuotas)*MAX(d.n_cuota)), 0) AS "MONTO PAGADO [$]"
FROM detalles AS d
INNER JOIN prestamos AS p
	ON d.id_prestamo = p.id
INNER JOIN clientes AS c
	ON p.id_cliente = c.id
GROUP BY id_prestamo;
*/

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#--DESAFIO CREACION DE FUNCIONES--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 04/04/2022
/*
# 1- Funcion para ver cuantos prestamos se cobraron en los ultimos N dias (Ultima fecha 2017 => mas de 1900 dias)
DROP FUNCTION IF EXISTS prestamos_n_dias;
DELIMITER $$
CREATE FUNCTION prestamos_n_dias (N INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE output INT;
    SET output = (SELECT COUNT(DISTINCT id) 
				  FROM detalles
				  WHERE fecha_p >= DATE_ADD(CURDATE(), INTERVAL -N DAY));
    RETURN output;
END $$ 
DELIMITER ;


# 2- #Función para ver cuantas veces un cliente paga antes de la hora de visita estimada y cuantas veces despues del horario estimado
DROP FUNCTION IF EXISTS control_visitas;
DELIMITER $$
CREATE FUNCTION control_visitas (cli INT, estado VARCHAR(10))
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE output INT;
    DECLARE h_teorica TIME;
	SET h_teorica = (SELECT c.hora_visita 
					 FROM clientes AS c
					 WHERE id = cli);
    SET output =              
	CASE 
		WHEN estado ="ANTES" THEN (SELECT COUNT(d.id) FROM detalles AS d WHERE h_teorica < d.hora_p AND id_prestamo IN (SELECT p.id FROM prestamos AS p WHERE id_cliente = cli))
		WHEN estado="DESPUES" THEN (SELECT COUNT(d.id) FROM detalles AS d WHERE h_teorica < d.hora_p AND id_prestamo IN (SELECT p.id FROM prestamos AS p WHERE id_cliente = cli))
	END;
    RETURN output;
END $$ 
DELIMITER ;

*/

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#--DESAFIO CREACION DE STORE PROCEDURES--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 11/04/2022
/*
#------------------SP1------------------
#Este Store procedure se encarga de cargar un nuevo cliente
#Se debe pasar como parámetros todos los datos del cliente.
DELIMITER $$
DROP PROCEDURE IF EXISTS `add_client`;
CREATE PROCEDURE `add_client` (IN p_nombre varchar(50), 
							   IN p_apellido varchar(50), 
							   IN p_dni int, 
							   IN p_tel_pri varchar(20),
							   IN p_tel_sec varchar(20),
							   IN p_dir_pri varchar(50),
							   IN p_n_calle_pri int,
							   IN p_n_km_pri tinyint,
							   IN p_dir_sec varchar(50),
							   IN p_n_calle_sec int,
							   IN p_n_km_sec tinyint,
							   IN p_hora_visita time,
							   IN p_coment varchar(150))
BEGIN
	INSERT INTO clientes (  nombre, 
							apellido, 
							dni, 
							tel_pri,  
							tel_sec, 
							dir_pri,
							n_calle_pri, 
							n_km_pri, 
							dir_sec, 
							n_calle_sec, 
							n_km_sec, 
							hora_visita, 
							coment ) 
                            
				VALUES (    p_nombre,
							p_apellido, 
							p_dni, 
							p_tel_pri,
							p_tel_sec,
							p_dir_pri,
							p_n_calle_pri,
							p_n_km_pri,
							p_dir_sec,
							p_n_calle_sec,
							p_n_km_sec,
							p_hora_visita,
							p_coment);
END$$
DELIMITER ;

#Prueba store add_client
#CALL add_client('Florencia', 'Lugo', '48853991', '53578633', '47911255', 'CORDOBA', '778', '2', 'FORMOSA', '256', '1', '15:15:00', 'PREGUNTAR POR FLOR');


#------------------SP2------------------
#Este Store Procedure se encarga de presentar los detalles de prestamos donde
#a través de un parámetro se puede ordenar por numero de cuotas o montos y se puede indicar si 
#se presenta de forma ascendente o descendente
DELIMITER $$
DROP PROCEDURE IF EXISTS `detalles_orden`;
CREATE PROCEDURE `detalles_orden` (IN campo_orden varchar(10), IN tipo_orden varchar(4))
BEGIN
	IF campo_orden = 'monto' OR campo_orden = 'n_cuotas'  THEN		#Se controla el campo a ordenar
		SET	@campo = CONCAT('ORDER BY ', campo_orden);
    ELSE
		SET	@campo = CONCAT('ORDER BY ', 'id');						#Por defecto se ordena por id
    END IF;
    
    IF tipo_orden = '' OR tipo_orden = 'ASC'  THEN					#Se evalua el tipo de ordenamiento
		SET @orden = 'ASC';
	ELSE
		SET @orden = 'DESC';										#Por defecto descendiente
    END IF;
																	#Se realiza la consulta, se agregan nombre y apellido
    SET @consulta = CONCAT('SELECT p.id, 
								   p.id_capital, 
								   p.id_cliente, 
                                   c.nombre, 
                                   c.apellido, 
                                   p.id_pago, 
                                   p.monto, 
                                   p.interes, 
                                   p.n_cuotas, 
                                   p.refinanciacion, 
                                   p.coment
							FROM prestamos AS p
							LEFT JOIN clientes AS c
							ON p.id_cliente = c.id ', @campo, ' ',@orden);
    
																	#Se ejecuta la consulta creada anteriormente
    PREPARE ejecutarSQL FROM @consulta;
    EXECUTE ejecutarSQL;
    DEALLOCATE PREPARE ejecutarSQL;
    
END$$
DELIMITER ;
*/

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#--DESAFIO CREACION DE TRIGGERS--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 13/04/2022

/*
#Se crea la una tabla de auditoria, relacionada a la tabla prestamos
CREATE TABLE IF NOT EXISTS  `log_prestamos` (
											id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                                            fecha date NOT NULL,
											hora time NOT NULL,
											usuario varchar(50) NOT NULL,
											id_capital INT NOT NULL,
											id_cliente INT NOT NULL,
											id_pago INT NOT NULL,
											monto INT NOT NULL,
											interes INT NOT NULL,
											n_cuotas INT NOT NULL,
											refinanciacion BOOL,
                                            coment varchar(50) NOT NULL );

# Este trigger se utiliza para registrar los datos previos a la refinanciacion de prestamos en la tabla de prestamos.
DELIMITER $$
CREATE TRIGGER `ref_prestamos` 
BEFORE UPDATE 
ON `prestamos` FOR EACH ROW
BEGIN
		IF OLD.refinanciacion <> NEW.refinanciacion THEN
		INSERT INTO log_prestamos
						   (fecha,
							hora,
							usuario,
							id_capital,
							id_cliente,
							id_pago,
							monto,
							interes,
							n_cuotas,
							refinanciacion,
                            coment)
		VALUES (CURDATE(), CURTIME(), SESSION_USER(), OLD.id_capital, OLD.id_cliente, old.id_pago, OLD.monto, OLD.interes, old.n_cuotas, OLD.refinanciacion, 'PRESTAMO REFINANCIADO' ) ;
	END IF;
END$$
DELIMITER ;

# Este trigger se utiliza para auditar los cambios de la tabla de prestamos.
DELIMITER $$
CREATE TRIGGER `hist_prestamos` 
AFTER UPDATE 
ON `prestamos` FOR EACH ROW
BEGIN
		INSERT INTO log_prestamos
						   (fecha,
							hora,
							usuario,
							id_capital,
							id_cliente,
							id_pago,
							monto,
							interes,
							n_cuotas,
							refinanciacion,
                            coment)
		VALUES (CURDATE(), CURTIME(), SESSION_USER(), OLD.id_capital, OLD.id_cliente, old.id_pago, OLD.monto, OLD.interes, old.n_cuotas, OLD.refinanciacion, '-' ) ;
END$$
DELIMITER ;

#Se crea la una tabla de auditoria, relacionada a la tabla clientes
CREATE TABLE IF NOT EXISTS  `historico_clientes` (
											id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
											fecha date NOT NULL,
											hora time NOT NULL,
											nombre VARCHAR(50) NOT NULL,
											apellido VARCHAR(50) NOT NULL,
											dni INT NOT NULL,
											tel_pri VARCHAR(20) NOT NULL,
											tel_sec VARCHAR(20) NOT NULL,
											dir_pri VARCHAR(50) NOT NULL,
											n_calle_pri INT NOT NULL,
											n_km_pri TINYINT(50),
											dir_sec VARCHAR(50) NOT NULL,
											n_calle_sec INT NOT NULL,
											n_km_sec TINYINT(50),
											hora_visita TIME,
											coment VARCHAR(150) );
                                            
# Este trigger nos permite mantener una copia de todos los clientes que se inserten en la base de datos.
DELIMITER $$
CREATE TRIGGER `hist_clientes` 
AFTER INSERT
ON `clientes` FOR EACH ROW
BEGIN
		INSERT INTO historico_clientes
									   (fecha,
										hora,
										nombre,
										apellido,
										dni,
										tel_pri,
										tel_sec,
										dir_pri,
										n_calle_pri,
										n_km_pri,
										dir_sec,
										n_calle_sec,
										n_km_sec,
										hora_visita,
										coment)
		VALUES (CURDATE(), CURTIME(), NEW.nombre, NEW.apellido, NEW.dni, NEW.tel_pri, NEW.tel_sec, NEW.dir_pri, NEW.n_calle_pri, NEW.n_km_pri, NEW.dir_sec, NEW.n_calle_sec, NEW.n_km_sec, NEW.hora_visita, NEW.coment);
END$$
DELIMITER ;

# Este trigger nos permite registrar antes de borrar de la tabla principal clientes, se indique en la tabla historico.
DELIMITER $$
CREATE TRIGGER `save_clientes` 
BEFORE DELETE
ON `clientes` FOR EACH ROW
BEGIN
		INSERT INTO historico_clientes
									   (fecha,
										hora,
										nombre,
										apellido,
										dni,
										tel_pri,
										tel_sec,
										dir_pri,
										n_calle_pri,
										n_km_pri,
										dir_sec,
										n_calle_sec,
										n_km_sec,
										hora_visita,
										coment)
		VALUES (CURDATE(), CURTIME(), OLD.nombre, OLD.apellido, OLD.dni, OLD.tel_pri, OLD.tel_sec, OLD.dir_pri, OLD.n_calle_pri, OLD.n_km_pri, OLD.dir_sec, OLD.n_calle_sec, OLD.n_km_sec, OLD.hora_visita, 'CLIENTE ELIMINADO');
END$$
DELIMITER ;
*/

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#--DESAFIO SENTENCIAS DCL--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 20/04/2022

/*
#Creacion de usuario "capital" que poseerá permisos de lectura en todas las tablas
CREATE USER 'capital'@'localhost' IDENTIFIED BY 'cap2099';			#Usuario, dominio y contrasenia
GRANT SELECT ON *.* TO 'administrador'@'localhost';			#Puede leer datos de todos los objetos del dominio localhost

#Verificamos al usuario administrador
USE mysql;
SELECT * FROM USER WHERE user = 'capital';

#Creacion de usuario "administrador" que poseerá los permisos de lectura, inserción y modificación de los datos
CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'admin2099';			#Usuario, dominio y contrasenia
GRANT SELECT, INSERT, UPDATE ON *.* TO 'administrador'@'localhost';			#Puede leer, insertar y modificar datos de todos los objetos del dominio localhost

#Verificamos al usuario administrador
USE mysql;
SELECT * FROM USER WHERE user = 'administrador';
*/

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#--DESAFIO SENTENCIAS TCL--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 25/04/2022

/*
#Primera tabla clientes
START TRANSACTION;
DELETE FROM
	prestamos_personales.clientes
WHERE
	id > 13;										#Se eliminan los ultimos 3 registros.
SELECT * FROM prestamos_personales.clientes;		#Observamos la eliminación.
#ROLLBACK;											#Volvemos atrás.
#SELECT * FROM prestamos_personales.clientes;		#Observamos que no se eliminó nada.
#COMMIT;

#----------Sentencia para re-insertar----------
#INSERT INTO `clientes` VALUES ('14', ' Martin', 'Soto', '28334334', '46742173', '42518982', 'BELGRANO ', '17', '2', 'MONTEROS', '453', '3', '12:21:00', NULL );
#INSERT INTO `clientes` VALUES ('15', ' Claudio', 'Volpi', '31633441', '2489900', '42532906', 'PERITO MORENO', '459', '8', 'JOSE HERNANDEZ', '612', '8', '13:32:00', NULL );
#INSERT INTO `clientes` VALUES ('16', 'Juan', 'Domingo', '49753991', '35578633', '47811245', 'PUEYRREDON', '342', '7', 'FORMOSA', '858', '2', '10:39:00', 'AUTO ROJO' );

#Segunda tabla clientes
START TRANSACTION;
#Ingresamos primer lote
INSERT INTO `clientes` VALUES ('17', 'Lucas', 'Martinez', '54753258', '36678633', '54871245', 'PUEYRREDON', '587', '7', 'CORDOBA', '332', '1', '11:20:00', 'AUTO ROJO' );
INSERT INTO `clientes` VALUES ('18', 'Silvia', 'Olivera', '22752292', '35249633', '42581345', 'HERNANDEZ', '632', '6', 'MIRANDA', '758', '1', '08:32:00', 'PERROS GRANDES' );
INSERT INTO `clientes` VALUES ('19', 'Teresa', 'Gonzalez', '42543992', '36524533', '32112245', 'MIRANDA', '996', '10', 'ALEMANIA', '213', '6', '14:30:00', 'ARBUSTOS' );
INSERT INTO `clientes` VALUES ('20', 'Pedro', 'Sanchez', '57452921', '65478633', '42578125', 'LUGABO', '114', '1', 'SAN MARTIN', '456', '9', '18:39:00', 'REJA NEGRA' );
SAVEPOINT LOTE_1_4;

#Ingresamos segundo lote
INSERT INTO `clientes` VALUES ('21', ' Hernan', 'Navarro', '40312929', '1246092', '62125620', 'AVDA. PEREYRA ', '78', '1', 'USHUAIA', '506', '10', '06:30:00', NULL );
INSERT INTO `clientes` VALUES ('22', ' Daniel', 'Ojeda', '31857183''40368326', '22475850', '42531817', 'LOPEZ DE VEGAS ', '254', '11', 'MONTE CASTRO', '866', '2', '14:17:00', 'LUGAR DE TRABAJO' );
INSERT INTO `clientes` VALUES ('23', ' Graciela', 'Lago', '40368326', '25563776', '56708094', 'JM ROSAS', '194', '45', 'LAPRIDA', '720', '7', '10:05:00', 'AVISAR ANTES' );
INSERT INTO `clientes` VALUES ('24', ' Carlos', 'Martearena', '23626470', '12824289', '85245728', 'SANTA', '522', '6', 'CORDOBA', '734', '3', '09:52:00', NULL );
SAVEPOINT LOTE_5_8;

#Eliminamos el primer SAVEPOINT
#RELEASE SAVEPOINT LOTE_1_4;

