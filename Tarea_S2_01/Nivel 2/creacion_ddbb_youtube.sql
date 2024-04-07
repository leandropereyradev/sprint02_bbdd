DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
USE youtube;

CREATE TABLE usuario(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasenya VARCHAR(50) NOT NULL,
    nombre_usuario VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    pais VARCHAR(50) NOT NULL,
    cod_postal VARCHAR(20) NOT NULL
	);

CREATE TABLE video(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT NOT NULL,
    tamanyo INTEGER NOT NULL,
    nombre_archivo VARCHAR(50) NOT NULL,
    duracion VARCHAR(10) NOT NULL,
    thumbnail VARCHAR(10) NOT NULL,
    reproducciones INTEGER DEFAULT(0),
    likes INTEGER DEFAULT(0),
    dislike INTEGER DEFAULT(0),
    estado ENUM('publico', 'oculto', 'privado')
    );
    
CREATE TABLE etiqueta(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
    );

CREATE TABLE video_etiqueta (
    id_video INTEGER NOT NULL,
    id_etiqueta INTEGER NOT NULL,
    PRIMARY KEY (id_video, id_etiqueta),
    FOREIGN KEY (id_video) REFERENCES video(id),
    FOREIGN KEY (id_etiqueta) REFERENCES etiqueta(id)
);

CREATE TABLE usuario_video(
	id_usuario INTEGER NOT NULL,
    id_video INTEGER NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY(id_usuario, id_video),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_video) REFERENCES video(id)
    );
    
CREATE TABLE canal(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_usuario INTEGER UNIQUE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
    );
    
CREATE TABLE suscripcion(
	id_usuario INTEGER NOT NULL,
    id_canal INTEGER NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY(id_usuario, id_canal),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_canal) REFERENCES canal(id)
    );

CREATE TABLE me_gusta(
	id_usuario INTEGER NOT NULL,
    id_video INTEGER NOT NULL UNIQUE,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY(id_usuario, id_video),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_video) REFERENCES video(id)
    );
    
CREATE TABLE no_me_gusta(
	id_usuario INTEGER NOT NULL,
    id_video INTEGER NOT NULL UNIQUE,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY(id_usuario, id_video),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_video) REFERENCES video(id)
    );
    
CREATE TABLE playlist(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('publico', 'privado')
    );
    
CREATE TABLE usuario_playlist(
	id_playlist INTEGER NOT NULL,
	id_usuario INTEGER NOT NULL,
    id_video INTEGER NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY(id_playlist, id_usuario, id_video),
    FOREIGN KEY (id_playlist) REFERENCES playlist(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_video) REFERENCES video(id)
    );

CREATE TABLE comentario(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_usuario INTEGER NOT NULL,
    id_video INTEGER NOT NULL,
    comentario TEXT NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_video) REFERENCES video(id)
    );