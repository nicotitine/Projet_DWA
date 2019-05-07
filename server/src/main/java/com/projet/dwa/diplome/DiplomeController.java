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
    public Diplome addDiplome(@RequestParam("libelle") String libelle, @RequestParam("typeId") Long typeId) {
        Diplome newDiplome = new Diplome();
        newDiplome.setCode("0.212");
        newDiplome.setResponsable("test resp");
        newDiplome.setLibelle(libelle);
        newDiplome.setDescriptif("test descri");
        Type newType = new Type();
        newType.setId(typeId);
        newDiplome.setType(newType);



        em.persist(newDiplome);

        return newDiplome;
    }
}
