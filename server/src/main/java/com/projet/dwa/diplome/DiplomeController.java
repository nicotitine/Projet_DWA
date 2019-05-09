package com.projet.dwa.diplome;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
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
    public Diplome addDiplome(@Valid DiplomeParams params) {
        System.out.println(params.getUes().size());
        Diplome newDiplome = new Diplome(params.getCode(), params.getLibelle(), params.getDescriptif(), new Type(params.getType().getId(), params.getType().getLibelle()), params.getResponnsable());


        em.persist(newDiplome);

        return newDiplome;
    }
}
