-- REGISTRO

CREATE TABLE periodosClases
(
	periodo_id VARCHAR2(10) PRIMARY KEY,
	comentario VARCHAR2(100) NOT NULL,
	anio VARCHAR2(20),
	f_inicio VARCHAR2(20),
	f_fin VARCHAR2(20)
);

CREATE TABLE usuarios
(
	usuario_id VARCHAR2(10) PRIMARY KEY,
	nombre VARCHAR2(30) NOT NULL,
	fecha_nac VARCHAR2(20),
	telefono VARCHAR2(30),
	correo VARCHAR2(30),
	perfil_id_fk VARCHAR2(10) NOT NULL
);

CREATE TABLE perfiles
(
	perfil_id VARCHAR2(10) PRIMARY KEY,
	comentario VARCHAR2(100) NOT NULL,
	accesos VARCHAR2(255)
);

CREATE TABLE carreras
(
	carrera_id VARCHAR2(10) PRIMARY KEY,
	comentario VARCHAR2(100) NOT NULL,
	fecha_fundacion VARCHAR2(20),
	duracion VARCHAR2(20)
);

CREATE TABLE clases
(
	clase_id VARCHAR2(10) PRIMARY KEY,
	carrera_id_fk VARCHAR2(100) NOT NULL,
	comentario VARCHAR2(100) NOT NULL
);

CREATE TABLE servicios
(
	servicio_id VARCHAR2(10) PRIMARY KEY,
	comentario VARCHAR2(100) NOT NULL,
	precio VARCHAR2(100),
	cantidad VARCHAR2(100)
);

CREATE TABLE rutas
(
	ruta_id VARCHAR2(10) PRIMARY KEY,
	comentario VARCHAR2(100) NOT NULL,
	origen VARCHAR2(100) NOT NULL,
	destino VARCHAR2(100) NOT NULL
);

CREATE TABLE ponderacion_clases
(
	clase_id_fk VARCHAR2(100) NOT NULL,
	maestro_id_fk VARCHAR2(10) NOT NULL,
	comentario VARCHAR2(100) NOT NULL,
	acumulativo VARCHAR2(100),
	examen VARCHAR2(100)
);

CREATE TABLE notas_alumnos
(
	clase_id_fk VARCHAR2(10) NOT NULL,
	alumno_id_fk VARCHAR2(100) NOT NULL,
	comentario VARCHAR2(100) NOT NULL,
	nota_final VARCHAR2(100)
);

CREATE TABLE secciones
(
	seccion_id VARCHAR2(10) PRIMARY KEY,
	clase_id_fk VARCHAR2(10) NOT NULL,
	maestro_id_fk VARCHAR2(100) NOT NULL,
	dias VARCHAR2(100),
	hora VARCHAR2(100),
	comentario VARCHAR2(100)
);

CREATE TABLE matricula(
	matricula_id VARCHAR2(10) PRIMARY KEY,
	seccion_id_fk VARCHAR2(10) NOT NULL,
	clase_id_fk VARCHAR2(100) NOT NULL,
    	alumno_id_fk VARCHAR2(100) NOT NULL,
	comentario VARCHAR2(100)
);

CREATE TABLE reclamos
(
	reclamo_id VARCHAR2(10) PRIMARY KEY,
	user_id VARCHAR2(100) NOT NULL,
	comentario VARCHAR2(100) NOT NULL
);

CREATE TABLE INSTITUCION_INFO 
(
	NOMBRE VARCHAR2(20), 
	TELEFONO VARCHAR2(20), 
	CORREO VARCHAR2(20), 
	UBICACION_GEO VARCHAR2(20), 
	DIRECCION_FISICA VARCHAR2(1000), 
	VISION VARCHAR2(1000), 
	MISION VARCHAR2(1000), 
	OBJETIVOS VARCHAR2(1000), 
	POLITICAS VARCHAR2(1000), 
	INSTITUCION_ID VARCHAR2(20) 
);


-- RELACIONES DE TABLAS


ALTER TABLE usuarios ADD CONSTRAINT us_perfil_id_fk foreign key (perfil_id_fk) references perfiles (perfil_id);

ALTER TABLE clases ADD CONSTRAINT cla_carrera_id_fk foreign key (carrera_id_fk) references carreras (carrera_id);

ALTER TABLE ponderacion_clases ADD CONSTRAINT pon_clase_id_fk foreign key (clase_id_fk) references clases (clase_id);
ALTER TABLE ponderacion_clases ADD CONSTRAINT pon_maestro_id_fk foreign key (maestro_id_fk) references usuarios (usuario_id);

ALTER TABLE notas_alumnos ADD CONSTRAINT no_clase_id_fk foreign key (clase_id_fk) references clases (clase_id);
ALTER TABLE notas_alumnos ADD CONSTRAINT no_alumno_id_fk foreign key (alumno_id_fk) references usuarios (usuario_id);

ALTER TABLE secciones ADD CONSTRAINT sec_clase_id_fk foreign key (clase_id_fk) references clases (clase_id);
ALTER TABLE secciones ADD CONSTRAINT sec_maestro_id_fk foreign key (maestro_id_fk) references usuarios (usuario_id);

ALTER TABLE matricula ADD CONSTRAINT mat_clase_id_fk foreign key (clase_id_fk) references clases (clase_id);
ALTER TABLE matricula ADD CONSTRAINT mat_seccion_id_fk foreign key (seccion_id_fk) references secciones (seccion_id);
ALTER TABLE matricula ADD CONSTRAINT mat_alumno_id_fk foreign key (alumno_id_fk) references usuarios (usuario_id);
