package com.prograIV.gestorDocumento.repository;

import com.prograIV.gestorDocumento.model.HistorialDocumento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HistorialDocumentoRepository extends JpaRepository<HistorialDocumento, Long> {
    
    /**
     * Find all history entries for a specific document
     */
    List<HistorialDocumento> findByDocumento_IdDocumentoOrderByCambiadoEnDesc(Long idDocumento);
}
