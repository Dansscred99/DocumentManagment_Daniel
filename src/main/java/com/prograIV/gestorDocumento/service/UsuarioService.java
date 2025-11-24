package com.prograIV.gestorDocumento.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.prograIV.gestorDocumento.model.*;
import com.prograIV.gestorDocumento.repository.*;

@Service
@RequiredArgsConstructor
public class UsuarioService {

    private final UsuarioRepository repoUsuario;
    private final UsuarioDatosRepository repoDatos;
    private final PasswordEncoder encoder;

    public void crearUsuarioCompleto(
            String nombreCompleto,
            String nombreUsuario,
            String clave,
            String correo,
            String telefono,
            String rol
    ) {
        if (repoUsuario.existsByNombreUsuario(nombreUsuario)) {
            throw new RuntimeException("El nombre de usuario ya existe");
        }

        Usuario u = new Usuario();
        u.setNombreUsuario(nombreUsuario);
        u.setPasswordHash(encoder.encode(clave));
        u = repoUsuario.save(u);

        UsuarioDatos datos = new UsuarioDatos();
        datos.setUsuario(u);
        datos.setNombre(nombreCompleto);
        datos.setCorreo(correo);
        datos.setTelefono(telefono);
        datos.setRol(rol);
        datos.setActivo(true);

        repoDatos.save(datos);
    }
}