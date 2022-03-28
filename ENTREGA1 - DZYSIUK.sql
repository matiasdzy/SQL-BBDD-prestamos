#--PRIMERA ENTREGA DE PROYECTO INTEGRADOR--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 28/03/2022

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


#--DESAFIO INSERCION DE DATOS--
#Alumno: DZYSIUK, Matías Lucas
#Última modificación: 28/03/2022

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