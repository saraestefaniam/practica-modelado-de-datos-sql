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

insert into socios (nombre, apellido, fecha_nacimiento, dni)
values
('Juan', 'Pérez', '1985-03-25', '12345678'),
('María', 'Gómez', '1990-07-12', '98765432'),
('Sabrina', 'Carpenter', '1999-05-11', '45547895'),
('Carlos', 'López', '1978-11-05', '11223344'),
('Ana', 'Martínez', '2000-02-17', '55667788'),
('Lizzy', 'Grant', '1985-06-21', '12367788'),
('Mindy', 'Kaling', '1979-06-24', '78253698'),
('Joe', 'Jonas', '1989-08-15', '25447718'),
('Nick', 'Jonas', '1992-09-16', '35887433'),
('Kevin', 'Jonas', '1987-11-05', '12488433'),
('Taylor', 'Swift', '1989-12-13', '41885513');

insert into peliculas (titulo, genero, director, sinopsis)
values
('Taxi Driver', 'Drama, Thriller', 'Martin Scorsese', 'Un veterano de Vietnam se convierte en un taxista solitario en Nueva York, donde se enfrenta a la corrupción y la violencia de la ciudad mientras trata de encontrar su propósito en la vida.'),
('A Real Pain', 'Drama, Comedia', 'John Doe', 'La vida de una persona común da un giro cuando se enfrenta a desafíos imprevistos, mezclando humor y dolor en un viaje de autodescubrimiento.'),
('The Florida Project', 'Drama', 'Sean Baker', 'Una niña y su madre viven en un motel cerca de Disneyland, mientras lidian con la pobreza, pero la niña busca la magia de la infancia.'),
('Inside Out', 'Animación, Aventura, Comedia', 'Pete Docter', 'Riley, una niña de 11 años, enfrenta los desafíos de mudarse a una nueva ciudad mientras sus emociones internas luchan por mantener el equilibrio.'),
('Inside Out 2', 'Animación, Aventura, Comedia', 'Pete Docter', 'Las emociones de Riley siguen evolucionando mientras la niña enfrenta nuevos cambios y retos en la adolescencia.'),
('Soul', 'Animación, Comedia, Drama', 'Pete Docter', 'Un músico de jazz que no ha alcanzado su sueño experimenta una segunda oportunidad en el más allá, donde aprende lo que realmente importa en la vida.'),
('Inglourious Basterds', 'Drama, Guerra, Acción', 'Quentin Tarantino', 'Un grupo de soldados judíos en la Segunda Guerra Mundial buscan vengarse de los nazis, enfrentándose a escenas violentas y momentos de tensión.'),
('Pulp Fiction', 'Crimen, Drama', 'Quentin Tarantino', 'Una serie de historias interconectadas que exploran la vida de criminales en Los Ángeles, con giros inesperados y un enfoque no lineal.'),
('Fight Club', 'Drama, Acción', 'David Fincher', 'Un hombre desencantado con su vida encuentra un escape a través de un club secreto de peleas, pero pronto la violencia se descontrola.'),
('American History X', 'Drama, Crimen', 'Tony Kaye', 'Un ex neonazi intenta redimir sus acciones tras salir de prisión, mientras su hermano lucha por evitar el mismo destino.'),
('Goodfellas', 'Crimen, Drama', 'Martin Scorsese', 'La vida de un joven que se involucra en el crimen organizado y cómo la violencia y la traición lo afectan a lo largo de los años.');
