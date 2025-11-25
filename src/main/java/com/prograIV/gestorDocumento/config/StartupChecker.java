package com.prograIV.gestorDocumento.config;

import com.prograIV.gestorDocumento.model.Usuario;
import com.prograIV.gestorDocumento.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Profile;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@Profile("dev")
@RequiredArgsConstructor
public class StartupChecker implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(StartupChecker.class);

    private final UsuarioRepository usuarioRepo;

    @Override
    public void run(String... args) {
        log.info("StartupChecker (dev): revisando usuarios y formato de password_hash...");
        for (Usuario u : usuarioRepo.findAll()) {
            String hash = u.getPasswordHash();
            int len = hash != null ? hash.length() : 0;
            boolean looksLikeBCrypt = hash != null && (hash.startsWith("$2a$") || hash.startsWith("$2b$") || hash.startsWith("$2y$")) && len >= 59;
            if (looksLikeBCrypt) {
                log.info("Usuario '{}' -> passwordHash looks like BCrypt (len={})", u.getNombreUsuario(), len);
            } else {
                log.warn("Usuario '{}' -> passwordHash DOES NOT look like BCrypt (len={}). If login fails, use /dev/encode-password to create a bcrypt and update DB.", u.getNombreUsuario(), len);
            }
        }
    }
}
