package com.prograIV.gestorDocumento.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("titulo", "Inicio de sesión");
        model.addAttribute("contenido", "index :: contenido");
        return "login";
    }

   
}