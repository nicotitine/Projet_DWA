package com.projet.dwa.diplome;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.projet.dwa.DwaApplication;
import com.projet.dwa.typeDiplome.Type;

@RestController
public class DiplomeController {

    @PersistenceContext(name="projectPU")
    private EntityManager em;

    @Autowired
    DiplomeDao diplomeDao;

    @RequestMapping(value="/diplomes")
    @CrossOrigin(origins = "http://localhost:8080")
    public List<Diplome> getDiplomes() {
        System.out.println(DwaApplication.isInscriptionOpened);
        DwaApplication.isInscriptionOpened = true;
        System.out.println(DwaApplication.isInscriptionOpened);
        return diplomeDao.findAll();
    }

    // @RequestMapping(name="/diplomes/"+ id)
    // @CrossOrigin(origins = "http://localhost:8080")
    // public Diplome getDiplome(id) {
    //     return diplomeDao.find(id);
    // }

    @RequestMapping(value="/addDiplome", method = RequestMethod.POST)
    @Transactional
    @CrossOrigin(origins = "http://localhost:8080")
    public Diplome addDiplome(@RequestParam("code") String code, @RequestParam("libelle") String libelle, @RequestParam("descriptif") String descriptif, @RequestParam("typeId") Long typeId, @RequestParam("typeLibelle") String typeLibelle, @RequestParam("responsable") String responsable) {
        Diplome newDiplome = new Diplome(code, libelle, descriptif, new Type(typeId, typeLibelle), responsable);


        em.persist(newDiplome);

        return newDiplome;
    }
}
