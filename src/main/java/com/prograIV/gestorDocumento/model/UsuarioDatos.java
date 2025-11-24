package com.prograIV.gestorDocumento.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "usuario_datos")
@Data
public class UsuarioDatos {

    @Id
    @Column(name = "id_usuario")
    private Long idUsuario;

    @Column(nullable = false)
    private String nombre;

    @Column(nullable = false)
    private String apellido;

    private String foto;
    private String correo;
    private String telefono;

    @Column(nullable = false)
    private String rol;

    private Boolean activo = true;

    @OneToOne
    @MapsId
    @JoinColumn(name = "id_usuario")
    private Usuario usuario;
}
