#--PRIMERA ENTREGA DE PROYECTO INTEGRADOR--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 16/03/2022

#Creación de la base de datos "prestamos"
CREATE DATABASE prestamos_personales;

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
                    id_capital INT,
                    id_cliente INT,
                    id_pago INT,
                    monto INT,
                    interes INT,
                    n_cuotas INT,
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
                    id_prestamo INT,
                    direccion BOOL,
                    n_cuota INT,
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
                    id_rol INT,
					FOREIGN KEY (id_rol)
						REFERENCES roles(id)
						ON DELETE CASCADE
);