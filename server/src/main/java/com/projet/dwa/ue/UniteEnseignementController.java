package com.projet.dwa.ue;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UniteEnseignementController {

    @PersistenceContext(name="projectPU")
    private EntityManager em;

    @Autowired
    private UniteEnseignementDao uniteEnseignementDao;

    @RequestMapping(value="/ues")
    @CrossOrigin(origins = "http://localhost:8080")
    public List<UniteEnseignement> getUes(){
        return uniteEnseignementDao.findAll();
    }

    @RequestMapping(value="/addUe")
    @Transactional
    @CrossOrigin(origins = "http://localhost:8080")
    public UniteEnseignement addUe(@RequestParam String code, @RequestParam String libelle, @RequestParam boolean obligatoire) {
        UniteEnseignement newUe = new UniteEnseignement(code, libelle, obligatoire);
        em.persist(newUe);
        
        return newUe;
    }
}