package com.projet.dwa.inscription;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class InscriptionController {
    @PersistenceContext(name="projectPU")
    private EntityManager em;

    @Autowired
    InscriptionDao inscriptionDao;

    @RequestMapping(value = "/generateNewInscription")
    @CrossOrigin(origins = "http://localhost:8080")
    public Boolean generateNewInscription() {
        Inscription last = inscriptionDao.findTopByOrderByIdDesc().get(0);
        String newCode = "IE0000";

        if(last != null) {
            newCode = last.getReferenceDossier();
        }


        System.out.println(last.get(0).getReferenceDossier());
        return true;
    }
}