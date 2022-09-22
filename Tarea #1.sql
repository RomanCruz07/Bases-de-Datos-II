create database tarea#1;
use tarea#1


create table aerolinea (
	codigo int primary key not null,
	descuento money check (descuento >= 10)
)





create table boleto (
	codigo int primary key not null,
	no_vuelo int not null,
	fecha date not null,
	destino varchar (25) not null check (destino in ('Mexico', 'Guatemala', 'Panama')),
	identidad int not null,
	codigoAerolinea int not null,
	constraint codigoAero foreign key (codigoAerolinea) references aerolinea (codigo)
)
create table cliente (
	identidad int primary key not null,
	nombre varchar(50) not null,
	telefono varchar (8) not null,
	codigo int not null,
	constraint boletoCliente foreign key (codigo) references boleto (codigo)
)

create table hotel (
	codigo int primary key not null,
	nombre varchar (20) not null,
	direccion varchar (100) not null
)

create table reserva (
	fechain date not null,
	fechaout date not null,
	cantidad_personas int not null default 0,
	codigo int not null,
	identidad int not null,

	constraint codigoHotel foreign key (codigo) references hotel (codigo),
	constraint identidadCliente foreign key (identidad) references cliente (identidad)
)