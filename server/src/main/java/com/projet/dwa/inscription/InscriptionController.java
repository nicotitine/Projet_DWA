package com.projet.dwa.inscription;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class InscriptionController {
    @PersistenceContext(name="projectPU")
    private EntityManager em;

    @Autowired
    InscriptionDao inscriptionDao;

    @RequestMapping(value = "/generateNewInscription")
    @Transactional
    @CrossOrigin(origins = "http://localhost:8080")
    public Inscription generateNewInscription(@RequestParam("referenceDossier") Long referenceDossier) {
        List<Inscription> inscriptions = inscriptionDao.findTopByOrderByIdDesc();
        Inscription last = null;
        if(inscriptions != null && inscriptions.size() > 0) {
            last = inscriptions.get(0);
        }
        String newCode = "IE0000";

        if(last != null) {
            newCode = last.getReferenceDossier().replaceAll("[^\\d.]", "");
            newCode =  "IE" + String.format("%04d", (Integer.parseInt(newCode) + 1));
        }

        Inscription newInscription = new Inscription(newCode, referenceDossier);
        em.persist(newInscription);

        System.out.println(newInscription);

        return newInscription;
    }

    @RequestMapping(value = "/getInscriptions")
    @CrossOrigin(origins = "http://localhost:8080")
    public List<Inscription> getInscriptions() {
        return inscriptionDao.findAll();
    }

    @RequestMapping(value = "/getInscription")
    @CrossOrigin(origins = "http://localhost:8080")
    public Inscription getInscription(@RequestParam("referenceDossier") String referenceDossier) {
        Inscription toReturn = inscriptionDao.findByReferenceDossier(referenceDossier).get(0);
        System.out.println("from getInscription " + toReturn);
        return toReturn;
    }

    @RequestMapping(value = "/confirmInscription")
    @Transactional
    @CrossOrigin(origins = "http://localhost:8080")
    public Inscription confirmInscription(@RequestParam("id") Long id) {
        Inscription inscription = inscriptionDao.getOne(id);
        inscription.setValidee(true);

        inscriptionDao.save(inscription);
        return inscription;
    }

    @RequestMapping(value = "/saveInscription", method = RequestMethod.POST)
    @Transactional
    @CrossOrigin(origins = "http://localhost:8080")
    public Inscription saveInscription(@RequestBody InscriptionParams params) {
        
        Inscription inscriptionToUpdate = inscriptionDao.getOne(params.getId());

        inscriptionToUpdate.setCivilite(params.getCivilite());
        inscriptionToUpdate.setCodePostal(params.getCodePostal());
        inscriptionToUpdate.setCommune(params.getCommune());
        inscriptionToUpdate.setDateDeNaissance(params.getDateDeNaissance());
        inscriptionToUpdate.setDiplomeId(params.getDiplomeId());
        inscriptionToUpdate.setNom(params.getNom());
        inscriptionToUpdate.setNumeroEtVoie(params.getNumeroEtVoie());
        inscriptionToUpdate.setPays(params.getPays());
        inscriptionToUpdate.setPrenom(params.getPrenom());
        inscriptionToUpdate.setReferenceDossier(params.getReferenceDossier());
        inscriptionToUpdate.setValidee(params.getValidee());

        System.out.println("from saveInscription " + inscriptionToUpdate);

        inscriptionDao.save(inscriptionToUpdate);

        return inscriptionToUpdate;
    }
}