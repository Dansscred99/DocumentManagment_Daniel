package com.prograIV.gestorDocumento.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.prograIV.gestorDocumento.service.UsuarioDatosService;

@Controller
@RequiredArgsConstructor
public class DashboardController {

    private final UsuarioDatosService datosService;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();

        var datos = datosService.obtenerDatosPorUsername(username);

        model.addAttribute("usuarioNombre", datos.getNombre());
        model.addAttribute("usuarioRol", datos.getRol());
        model.addAttribute("usuarioFoto", datos.getFoto()); // puede ser null
        model.addAttribute("idUsuario", datos.getIdUsuario());
        model.addAttribute("usuarioApellido", datos.getApellido());

        return "dashboard"; // templates/dashboard.html
    }

    // SAP endpoints (load views via AJAX)
    @GetMapping("/sap/documentos")
    public String documentos(Model model) {
        addUserToModel(model);
        return "sap/documentos";
    }

    @GetMapping("/sap/enviar")
    public String enviar(Model model) {
        addUserToModel(model);
        return "sap/enviar";
    }

    @GetMapping("/sap/papelera")
    public String papelera(Model model) {
        addUserToModel(model);
        return "sap/papelera";
    }

    @GetMapping("/sap/aprobacion")
    public String aprobacion(Model model) {
        addUserToModel(model);
        return "sap/aprobacion";
    }

    @GetMapping("/sap/usuarios")
    public String usuarios(Model model) {
        addUserToModel(model);
        return "sap/usuarios";
    }

    // Helper method to add user data to model
    private void addUserToModel(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        var datos = datosService.obtenerDatosPorUsername(username);

        model.addAttribute("usuarioNombre", datos.getNombre());
        model.addAttribute("usuarioRol", datos.getRol());
        model.addAttribute("usuarioFoto", datos.getFoto());
        model.addAttribute("idUsuario", datos.getIdUsuario());
        model.addAttribute("usuarioApellido", datos.getApellido());
    }
}
