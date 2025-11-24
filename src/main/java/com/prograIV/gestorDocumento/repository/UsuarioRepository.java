package com.prograIV.gestorDocumento.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.prograIV.gestorDocumento.model.Usuario;
import java.util.Optional;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    Optional<Usuario> findByNombreUsuario(String nombreUsuario);
    boolean existsByNombreUsuario(String nombreUsuario);
}

