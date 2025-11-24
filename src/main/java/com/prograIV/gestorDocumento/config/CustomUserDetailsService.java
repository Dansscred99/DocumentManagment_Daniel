package com.prograIV.gestorDocumento.config;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;
import com.prograIV.gestorDocumento.model.Usuario;
import com.prograIV.gestorDocumento.model.UsuarioDatos;
import com.prograIV.gestorDocumento.repository.UsuarioRepository;
import com.prograIV.gestorDocumento.repository.UsuarioDatosRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final UsuarioRepository usuarioRepo;
    private final UsuarioDatosRepository datosRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Usuario u = usuarioRepo.findByNombreUsuario(username)
                .orElseThrow(() -> new UsernameNotFoundException("Usuario no existe"));

        UsuarioDatos datos = datosRepo.findById(u.getIdUsuario())
                .orElseThrow(() -> new UsernameNotFoundException("Usuario sin datos"));

        if (Boolean.FALSE.equals(datos.getActivo())) {
            throw new UsernameNotFoundException("Usuario inactivo");
        }

        // Spring Security espera "ROLE_xxx"
        String role = "ROLE_" + datos.getRol().toUpperCase();

        return new org.springframework.security.core.userdetails.User(
                u.getNombreUsuario(),
                u.getPasswordHash(),
                List.of(new SimpleGrantedAuthority(role))
        );
    }
}