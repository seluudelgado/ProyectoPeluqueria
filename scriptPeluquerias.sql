CREATE DATABASE IF NOT EXISTS Peluqueria DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE Peluqueria;

CREATE TABLE Usuarios(
	idUsuario smallint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email varchar(60) NOT NULL UNIQUE,
	password varchar(255) NOT NULL,
	nombre varchar(20) NOT NULL,
	apellidos varchar(30) NOT NULL,
	tipo enum('cliente','trabajador') NOT NULL
);

CREATE TABLE UsuarioClientes(
	idCliente tinyint NOT NULL AUTO_INCREMENT PRIMARY KEY,
	telefono char(9) NOT NULL,
	CONSTRAINT Usuarios_Clientes FOREIGN KEY(idCliente) REFERENCES Usuarios(idUsuario)
	ON DELETE CASCADE
);

CREATE TABLE Servicios(
	idServicio int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(20) NOT NULL,
	precio varchar(30) NULL,
	duracion datetime NOT NULL
);

CREATE TABLE Reservas(
	codReserva smallint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fechaHora datetime NOT NULL default NOW(),
	idServicio int unsigned NOT NULL, 
	idPeluquero tinyint NOT NULL, 
	idCliente smallint unsigned NOT NULL,
	CONSTRAINT Servicio_Reserva FOREIGN	KEY (idServicio) REFERENCES Servicios(idServicio)
	ON DELETE CASCADE,
	CONSTRAINT Peluquero_Reserva FOREIGN KEY (idPeluquero) REFERENCES Peluqueros(idPeluquero)
	ON DELETE CASCADE,
	CONSTRAINT Cliente_Reserva FOREIGN KEY (idCliente) REFERENCES UsuarioClientes(idCliente)
	ON DELETE CASCADE
);
ALTER TABLE Servicios 
ADD CONSTRAINT Servicios_Reserva FOREIGN KEY (idServicio) REFERENCES Servicios(idServicio);
ALTER TABLE Peluqueros 
ADD CONSTRAINT Peluqueros_Reserva FOREIGN KEY (idPeluquero) REFERENCES Peluqueros(idPeluquero);
ALTER TABLE UsuarioClientes 
ADD CONSTRAINT Clientes_Reserva FOREIGN KEY (idCliente) REFERENCES UsuarioClientes(idCliente);

CREATE TABLE Peluqueros_Servicios(
	idServicio int unsigned NOT NULL,
	idPeluquero tinyint NOT NULL,
	PRIMARY KEY (idServicio, idPeluquero),
	CONSTRAINT Peluqueros_Servicios_Servicio FOREIGN KEY(idServicio) REFERENCES Servicios(idServicio)
	ON DELETE CASCADE,
	CONSTRAINT Peluqueros_Servicios_Peluquero FOREIGN KEY(idPeluquero) REFERENCES Peluqueros(idPeluquero)
	ON DELETE CASCADE
);


CREATE TABLE Administrador(
	email varchar(60) NOT NULL PRIMARY KEY,
	password varchar(255) NOT NULL
);
UuH=3sLGG4E}