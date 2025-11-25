-- Base de datos

DROP DATABASE IF EXISTS springboot;

CREATE DATABASE springboot CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE springboot;
 
-- ===========================

-- Tabla: usuarios

-- ===========================

CREATE TABLE usuarios (

  id_usuario BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

  nombre_usuario VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL UNIQUE,

  password_hash VARCHAR(255) NOT NULL,

  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  KEY idx_nombre_usuario (nombre_usuario)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- ===========================

-- Tabla: usuario_datos

-- ===========================

CREATE TABLE usuario_datos (

  id_usuario BIGINT UNSIGNED PRIMARY KEY,

  nombre VARCHAR(100) NOT NULL,

  apellido VARCHAR(100) NOT NULL,

  correo VARCHAR(255) NOT NULL UNIQUE,

  foto VARCHAR(255) NULL,

  telefono VARCHAR(50) NULL,

  rol VARCHAR(50) NOT NULL,         -- IMPORTANTE para Spring Security

  activo BOOLEAN DEFAULT TRUE,

  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- ===========================

-- Tabla: roles

-- ===========================

CREATE TABLE roles (

  id_rol INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

  nombre VARCHAR(50) NOT NULL UNIQUE,

  descripcion VARCHAR(255)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- ===========================

-- Tabla: permisos

-- ===========================

CREATE TABLE permisos (

  id_permiso INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

  nombre VARCHAR(100) NOT NULL UNIQUE,

  descripcion VARCHAR(255)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- ===========================

-- Tabla: rol_permiso

-- ===========================

CREATE TABLE rol_permiso (

  id_rol INT UNSIGNED NOT NULL,

  id_permiso INT UNSIGNED NOT NULL,

  PRIMARY KEY (id_rol, id_permiso),

  FOREIGN KEY (id_rol) REFERENCES roles(id_rol) ON DELETE CASCADE,

  FOREIGN KEY (id_permiso) REFERENCES permisos(id_permiso) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- ===========================

-- Tabla: usuario_rol

-- ===========================

CREATE TABLE usuario_rol (

  id_usuario BIGINT UNSIGNED NOT NULL,

  id_rol INT UNSIGNED NOT NULL,

  PRIMARY KEY (id_usuario, id_rol),

  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,

  FOREIGN KEY (id_rol) REFERENCES roles(id_rol) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- ===========================

-- Tabla: estados

-- ===========================

CREATE TABLE estados (

  id_estado VARCHAR(30) PRIMARY KEY,

  descripcion VARCHAR(255),

  es_final BOOLEAN DEFAULT FALSE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- ===========================

-- Tabla: documentos

-- ===========================

CREATE TABLE documentos (

  id_doc BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

  creado_por BIGINT UNSIGNED NOT NULL,

  titulo VARCHAR(255) NOT NULL,

  ubicacion VARCHAR(500) NOT NULL,

  estado_actual VARCHAR(30) NOT NULL,

  version INT UNSIGNED DEFAULT 1,

  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,

  actualizado_en DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  INDEX idx_estado (estado_actual),

  INDEX idx_creado_por (creado_por),

  FOREIGN KEY (creado_por) REFERENCES usuarios(id_usuario) ON DELETE RESTRICT,

  FOREIGN KEY (estado_actual) REFERENCES estados(id_estado) ON DELETE RESTRICT

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- ===========================

-- Tabla: transiciones

-- ===========================

CREATE TABLE transiciones (

  id_transicion INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

  desde VARCHAR(30) NOT NULL,

  hacia VARCHAR(30) NOT NULL,

  requiere_firma BOOLEAN DEFAULT FALSE,

  activo BOOLEAN DEFAULT TRUE,

  UNIQUE KEY uniq_transicion (desde, hacia),

  FOREIGN KEY (desde) REFERENCES estados(id_estado) ON DELETE RESTRICT,

  FOREIGN KEY (hacia) REFERENCES estados(id_estado) ON DELETE RESTRICT

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- ===========================

-- Tabla: transicion_autorizada

-- ===========================

CREATE TABLE transicion_autorizada (

  id_rol INT UNSIGNED NOT NULL,

  id_transicion INT UNSIGNED NOT NULL,

  PRIMARY KEY (id_rol, id_transicion),

  INDEX idx_transicion (id_transicion),

  FOREIGN KEY (id_rol) REFERENCES roles(id_rol) ON DELETE CASCADE,

  FOREIGN KEY (id_transicion) REFERENCES transiciones(id_transicion) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- ===========================

-- Tabla: historial_documento

-- ===========================

CREATE TABLE historial_documento (

  id_hist BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

  id_doc BIGINT UNSIGNED NOT NULL,

  id_transicion INT UNSIGNED NOT NULL,

  estado_anterior VARCHAR(30) NOT NULL,

  estado_nuevo VARCHAR(30) NOT NULL,

  cambiado_por BIGINT UNSIGNED NOT NULL,

  cambiado_en DATETIME DEFAULT CURRENT_TIMESTAMP,

  comentario TEXT,

  FOREIGN KEY (id_doc) REFERENCES documentos(id_doc) ON DELETE CASCADE,

  FOREIGN KEY (id_transicion) REFERENCES transiciones(id_transicion) ON DELETE RESTRICT,

  FOREIGN KEY (estado_anterior) REFERENCES estados(id_estado) ON DELETE RESTRICT,

  FOREIGN KEY (estado_nuevo) REFERENCES estados(id_estado) ON DELETE RESTRICT,

  FOREIGN KEY (cambiado_por) REFERENCES usuarios(id_usuario) ON DELETE RESTRICT

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
 
-- ======================================

-- INSERTS INICIALES

-- ======================================
 
-- Estados

INSERT INTO estados (id_estado, descripcion, es_final) VALUES

('primera_vista', 'Documento recién subido', FALSE),

('verificado', 'Revisado y correcto', FALSE),

('firmado', 'Firmado digitalmente', TRUE),

('rechazado', 'Rechazado', TRUE);
 
-- Roles del sistema

INSERT INTO roles (nombre, descripcion) VALUES

('admin', 'Administrador del sistema'),

('firmante', 'Puede firmar documentos'),

('revisor', 'Puede verificar documentos'),

('usuario', 'Usuario normal');
 
-- ======================================

-- USUARIO ADMIN (listo para iniciar sesión)

-- Usuario: admin

-- Contraseña real: 1234

-- ======================================
 
INSERT INTO usuarios (nombre_usuario, password_hash)

VALUES ('admin', '$2a$10$Buo0Ul3tDoC2WwyE4bbBoOUIJmQn4lS21iYPj8TDIrS9KuXKFQyez');
 
INSERT INTO usuario_datos (id_usuario, nombre, apellido, correo, telefono, foto, rol, activo)

VALUES (1, 'Administrador', 'Principal', 'admin@mail.com', '0000-0000', NULL, 'admin', TRUE);


 