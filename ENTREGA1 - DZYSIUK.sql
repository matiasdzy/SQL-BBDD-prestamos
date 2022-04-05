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
#Inserción de datos en tabla forma de pago
INSERT INTO modo_pagos VALUES 
							(NULL,"EFECTIVO"),
                            (NULL, "MERCADO PAGO");

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
