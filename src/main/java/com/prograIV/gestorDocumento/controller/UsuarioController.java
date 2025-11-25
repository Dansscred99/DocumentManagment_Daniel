package com.prograIV.gestorDocumento.controller;

import com.prograIV.gestorDocumento.model.Usuario;
import com.prograIV.gestorDocumento.model.UsuarioDatos;
import com.prograIV.gestorDocumento.repository.UsuarioDatosRepository;
import com.prograIV.gestorDocumento.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/usuarios")
public class UsuarioController {

    private final UsuarioRepository usuarioRepository;
    private final UsuarioDatosRepository usuarioDatosRepository;
    private final PasswordEncoder passwordEncoder;


    @PostMapping("/crear")
    public String crearUsuario(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam(value = "nombre", required = false) String nombre,
            @RequestParam(value = "rol", required = false, defaultValue = "user") String rol,
            RedirectAttributes attrs
    ) {
        if (usuarioRepository.existsByNombreUsuario(username)) {
            attrs.addFlashAttribute("error", "Usuario ya existe");
            return "redirect:/login";
        }

        Usuario u = new Usuario();
        u.setNombreUsuario(username);
        u.setPasswordHash(passwordEncoder.encode(password));
        usuarioRepository.save(u);

        UsuarioDatos datos = new UsuarioDatos();
        datos.setUsuario(u);
        datos.setIdUsuario(u.getIdUsuario());
        datos.setNombre(nombre != null ? nombre : username);
        datos.setRol(rol != null ? rol : "user");
        datos.setActivo(true);
        usuarioDatosRepository.save(datos);

        attrs.addFlashAttribute("created", "Usuario creado. Por favor inicie sesión.");
        return "redirect:/login";
    }
}

