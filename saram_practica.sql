create schema if not exists saram_practica;

set schema 'saram_practica';

create table socios(
	id serial primary key,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	fecha_nacimiento date not null,
	dni varchar(30) not null
);

create table peliculas(
	id serial primary key,
	titulo varchar(100) not null,
	genero varchar(80) not null,
	director varchar(100) not null,
	sinopsis varchar (250) not null
);

create table copias(
	id serial primary key,
	id_pelicula integer not null,
	disponible bool not null,
	constraint copias_peliculas_fk foreign key (id_pelicula) references peliculas(id)
);

create table prestadas(
	id serial primary key,
	id_copia integer not null,
	id_socio integer not null,
	fecha_prestada date not null,
	fecha_devolucion date null,
	constraint prestadas_copias_fk foreign key (id_copia) references copias(id),
	constraint prestadas_socios_fk foreign key (id_socio) references socios(id)
);

create table correspondencia(
	id serial primary key,
	id_socio integer null,
	codigo_postal integer null,
	calle varchar(80) null,
	numero integer null,
	piso integer null,
	constraint correspondencia_socios_fk foreign key (id_socio) references socios(id)
);

