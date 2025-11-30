package com.prograIV.gestorDocumento.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Entity
@Table(name = "historial_documento")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HistorialDocumento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_historial")
    private Long idHistorial;

    @ManyToOne
    @JoinColumn(name = "id_documento", nullable = false)
    private Documento documento;

    @Column(name = "estado_anterior", length = 50)
    private String estadoAnterior;

    @Column(name = "estado_nuevo", nullable = false, length = 50)
    private String estadoNuevo;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario cambiadoPor;

    @Column(name = "cambiado_en", nullable = false, updatable = false)
    private LocalDateTime cambiadoEn;

    @Column(name = "comentario", columnDefinition = "TEXT")
    private String comentario;

    @PrePersist
    protected void onCreate() {
        cambiadoEn = LocalDateTime.now();
    }
}
