package com.projet.dwa.diplome;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DiplomeDao extends JpaRepository<Diplome, Integer> {
    
}