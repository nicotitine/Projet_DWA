package com.example.demo.dao;

import com.example.demo.modele.Etudiant;
import org.springframework.data.repository.CrudRepository;

public interface EtudiantsRepository extends CrudRepository<Etudiant, Integer> {
    
}