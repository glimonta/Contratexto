-- Tablas de la base de datos ------------------------------------------------

create table usuario(
  nombre_cuenta varchar(20) not null primary key,
  contrasenia   varchar(15) not null,
  correo        varchar(50) not null,
  nombre        varchar(30) not null,
  apellido      varchar(30) not null
);

create table miembro(
  cedula        int         not null primary key check(cedula>0),
  foto          image       not null, --Creo que image deberia ser cambiado a varbinary(max) segun la documentacion de sql server
  telefono      bigint      not null check(telefono>0),
  carnet        varchar(8)  not null check(carnet like '[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]'),
  nombre_cuenta varchar(20) not null foreign key references usuario(nombre_cuenta)
);

create table noticia(
  id          int           not null primary key check(id>0),
  titulo      varchar(20)   not null,
  tipo        varchar(12)   not null check(tipo in ('Presentacion','Audicion','Taller','Otros')),
  descripcion nvarchar(max) not null,
  fecha       date          not null,
  cedula      int           not null foreign key references miembro(cedula) check(cedula>0)
);

create table foto(
  id      int         not null primary key check(id>0),
  archivo image       not null, --Creo que image deberia ser cambiado a varbinary(max) segun la documentacion de sql server
  fecha   date        not null,
  evento  varchar(30) not null,
  cedula  int         not null foreign key references miembro(cedula) check(cedula>0)
);

create table funcion(
  id    int not null primary key check(id>0),
  fecha date not null
);

create table entrada(
  codigo int not null primary key check(codigo>0),
  numero int not null check(numero>0),
  precio int not null check(precio>0),
  id     int not null check(id>0) foreign key references funcion(id),
  cedula int not null check(cedula>0) foreign key references miembro(cedula)
);

create table registra(
  nombre_cuenta varchar(20) not null foreign key references usuario(nombre_cuenta),
  codigo        int         not null foreign key references entrada(codigo),
  constraint pk_registra primary key (nombre_cuenta, codigo)
);

create table obra(
  id     int         not null primary key check(id>0),
  titulo varchar(40) not null,
  autor  varchar(40) not null
);

create table tiene(
  idFuncion int not null foreign key references funcion(id) check(idFuncion>0),
  idObra    int not null foreign key references obra(id) check(idObra>0),
  constraint pk_tiene primary key (idFuncion, idObra)
);

create table personaje(
  id     int not null primary key check(id>0),
  nombre varchar(30) not null,
  idObra int not null foreign key references obra(id)
);

create table interpreta(
  idFuncion   int not null foreign key references funcion(id) check(idFuncion>0),
  idPersonaje int not null foreign key references personaje(id) check(idPersonaje>0),
  cedula  int         not null foreign key references miembro(cedula) check(cedula>0),
  constraint pk_interpreta primary key (idFuncion, idPersonaje, cedula)
);

create table item(
  id     int         not null primary key check(id>0),
  color  varchar(8)  not null,
  tipo   varchar(12) not null,
  estado varchar(10) not null,
  constraint dom_color check(color in ('Rojo', 'Azul', 'Amarillo', 'Verde', 'Fucsia', 'Marron', 'Turquesa', 'Morado', 'Naranja', 'Dorado', 'Plateado', 'Gris', 'Negro', 'Blanco')),
  constraint dom_tipo check(tipo in ('Superior', 'Inferior', 'Accesorio', 'Calzado', 'Tela', 'Escenografia', 'Vestido', 'Maquillaje', 'Miscelaneo')),
  constraint dom_estado check(estado in ('Bueno', 'Malo', 'Regular', 'Destruido'))
);
