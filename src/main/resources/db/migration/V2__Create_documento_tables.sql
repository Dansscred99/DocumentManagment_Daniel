-- V2__Create_documento_tables.sql
-- Create tables for document management system

CREATE TABLE `estados` (
  `id_estado` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL UNIQUE,
  `descripcion` VARCHAR(255) DEFAULT NULL,
  `es_final` BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `documentos` (
  `id_documento` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `descripcion` TEXT DEFAULT NULL,
  `ruta_archivo` VARCHAR(500) NOT NULL,
  `id_usuario` BIGINT NOT NULL,
  `id_estado` BIGINT NOT NULL,
  `version` INT NOT NULL DEFAULT 1,
  `tamano_bytes` BIGINT DEFAULT NULL,
  `creado_en` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actualizado_en` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_documento`),
  KEY `idx_id_usuario` (`id_usuario`),
  KEY `idx_id_estado` (`id_estado`),
  KEY `idx_creado_en` (`creado_en`),
  CONSTRAINT `fk_documentos_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `fk_documentos_id_estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `historial_documento` (
  `id_historial` BIGINT NOT NULL AUTO_INCREMENT,
  `id_documento` BIGINT NOT NULL,
  `estado_anterior` VARCHAR(50) DEFAULT NULL,
  `estado_nuevo` VARCHAR(50) NOT NULL,
  `id_usuario` BIGINT NOT NULL,
  `cambiado_en` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comentario` TEXT DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `idx_id_documento` (`id_documento`),
  KEY `idx_id_usuario` (`id_usuario`),
  KEY `idx_cambiado_en` (`cambiado_en`),
  CONSTRAINT `fk_historial_id_documento` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id_documento`) ON DELETE CASCADE,
  CONSTRAINT `fk_historial_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
