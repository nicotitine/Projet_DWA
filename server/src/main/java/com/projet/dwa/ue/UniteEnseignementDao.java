package com.projet.dwa.ue;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UniteEnseignementDao extends JpaRepository<UniteEnseignement, Integer> {

}