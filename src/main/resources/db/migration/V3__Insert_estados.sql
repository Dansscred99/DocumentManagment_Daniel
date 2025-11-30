-- V3__Insert_estados.sql
-- Insert default document states

INSERT INTO `estados` (`nombre`, `descripcion`, `es_final`) VALUES
('primera_vista', 'Documento pendiente de revisión', FALSE),
('aprobado', 'Documento aprobado por administrador', FALSE),
('rechazado', 'Documento rechazado', TRUE),
('firmado', 'Documento firmado y finalizado', TRUE),
('eliminado', 'Documento eliminado', TRUE);
