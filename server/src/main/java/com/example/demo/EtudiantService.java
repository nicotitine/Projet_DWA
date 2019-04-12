package com.example.demo;

import com.example.demo.dao.EtudiantsRepository;
import com.example.demo.modele.Etudiant;
import com.example.demo.modele.EtudiantNonTrouveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class EtudiantService {
    @Autowired
    private EtudiantsRepository dao;

    public Iterable<Etudiant> findAllEtudiants() {
        return dao.findAll();
    }

    public Etudiant findEtudiant(Integer id) throws EtudiantNonTrouveException {
        Optional<Etudiant> optional = dao.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            throw new EtudiantNonTrouveException("Non trouvé");
        }
    }

    public Etudiant creerEtudiant(Etudiant etudiant) {
        return dao.save(etudiant);
    }

    public void supprimerEtudiant(Etudiant etudiant) {
        dao.delete(etudiant);
    }
}