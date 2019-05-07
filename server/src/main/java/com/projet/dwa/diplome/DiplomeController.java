package com.projet.dwa.diplome;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DiplomeController {

    @Autowired
    DiplomeDao diplomeDao;

    @RequestMapping(name="/diplomes")
    @CrossOrigin(origins = "http://localhost:8080")
    public List<Diplome> getDiplomes() {
        return diplomeDao.findAll();
    }
}