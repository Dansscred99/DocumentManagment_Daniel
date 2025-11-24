package com.prograIV.gestorDocumento.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.prograIV.gestorDocumento.model.UsuarioDatos;

public interface UsuarioDatosRepository extends JpaRepository<UsuarioDatos, Long> {
}
