package com.prograIV.gestorDocumento.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "estados")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Estado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_estado")
    private Long idEstado;

    @Column(name = "nombre", unique = true, nullable = false, length = 50)
    private String nombre;

    @Column(name = "descripcion", length = 255)
    private String descripcion;

    @Column(name = "es_final", nullable = false)
    private Boolean esFinal = false;

    public Estado(String nombre, String descripcion, Boolean esFinal) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.esFinal = esFinal;
    }
}
