package com.projet.dwa.typeDiplome;

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

@RestController
public class TypeController {

    @PersistenceContext(name="projectPU")
    private EntityManager em;

    @Autowired
    TypeDao typeDao;

    @RequestMapping(value="addType", method = RequestMethod.POST)
    @Transactional
    @CrossOrigin(origins = "http://localhost:8080")
    public Type addType(@RequestParam("id") Long id, @RequestParam("libelle") String libelle) {
        Type newType = new Type(libelle);
        em.persist(newType);

        return newType;
    }

    @RequestMapping(value="/typesDiplome")
    @CrossOrigin(origins = "http://localhost:8080")
    public List<Type> getTypes() {
        return typeDao.findAll();
    }

}