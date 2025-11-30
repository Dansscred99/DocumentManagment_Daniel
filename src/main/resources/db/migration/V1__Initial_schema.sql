-- V1__Initial_schema.sql
-- Initial database schema for usuarios and usuario_datos tables

DROP TABLE IF EXISTS `usuario_datos`;
DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(100) NOT NULL UNIQUE,
  `password_hash` VARCHAR(255) NOT NULL,
  `creado_en` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  KEY `idx_nombre_usuario` (`nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `usuario_datos` (
  `id_usuario` BIGINT NOT NULL,
  `nombre` VARCHAR(100) DEFAULT NULL,
  `apellido` VARCHAR(100) DEFAULT NULL,
  `correo` VARCHAR(100) DEFAULT NULL,
  `telefono` VARCHAR(20) DEFAULT NULL,
  `foto` VARCHAR(255) DEFAULT NULL,
  `rol` VARCHAR(50) NOT NULL DEFAULT 'user',
  `activo` BOOLEAN DEFAULT TRUE,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `fk_usuario_datos_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert default admin user (password: 1234)
INSERT INTO `usuarios` (`nombre_usuario`, `password_hash`, `creado_en`) 
VALUES ('admin', '$2a$10$slYQmyNdGzin7olVN3fh2OPST9/PgBkqquzi.Ue5KO5KLSan.Fvz2', CURRENT_TIMESTAMP);

INSERT INTO `usuario_datos` (`id_usuario`, `nombre`, `apellido`, `correo`, `telefono`, `rol`, `activo`) 
VALUES (1, 'Administrador', 'Sistema', 'admin@gestor.local', NULL, 'admin', TRUE);
