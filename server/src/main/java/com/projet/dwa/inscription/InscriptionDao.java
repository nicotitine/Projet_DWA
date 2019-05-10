package com.projet.dwa.inscription;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InscriptionDao extends JpaRepository<Inscription, Long> {
    List<Inscription> findTopByOrderByIdDesc(); 
    List<Inscription> findByReferenceDossier(String referenceDossier);
}