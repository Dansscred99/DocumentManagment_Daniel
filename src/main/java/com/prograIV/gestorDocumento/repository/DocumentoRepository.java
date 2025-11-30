package com.prograIV.gestorDocumento.repository;

import com.prograIV.gestorDocumento.model.Documento;
import com.prograIV.gestorDocumento.model.Estado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DocumentoRepository extends JpaRepository<Documento, Long> {
    
    /**
     * Find all documents created by a specific user
     */
    List<Documento> findByCreadoPor_IdUsuario(Long idUsuario);
    
    /**
     * Find all documents with a specific status
     */
    List<Documento> findByEstado(Estado estado);
    
    /**
     * Find documents for a specific user with a specific status
     */
    @Query("SELECT d FROM Documento d WHERE d.creadoPor.idUsuario = :idUsuario AND d.estado.idEstado = :idEstado")
    List<Documento> findByUsuarioAndEstado(@Param("idUsuario") Long idUsuario, @Param("idEstado") Long idEstado);
    
    /**
     * Find all pending documents (for admin approval)
     */
    @Query("SELECT d FROM Documento d WHERE d.estado.nombre = 'primera_vista' ORDER BY d.creadoEn DESC")
    List<Documento> findAllPending();
    
    /**
     * Find a document by ID with eager loading
     */
    Optional<Documento> findById(Long id);
}
