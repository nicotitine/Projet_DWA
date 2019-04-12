package com.example.demo.presentation;

import com.example.demo.EtudiantService;
import com.example.demo.modele.Etudiant;
import com.example.demo.modele.EtudiantNonTrouveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;
import java.util.stream.IntStream;

@RestController
@RequestMapping("/etudiants")
public class EtudiantsController {
    @Autowired
    private EtudiantService service;

    @PostConstruct
    public void populate() {
        IntStream.range(1, 13).forEach(id -> {
            Etudiant e = new Etudiant();
            e.setNom("Nom " + id);
            e.setPrenom("Prenom " + id);
            service.creerEtudiant(e);
        });
    }

    @GetMapping
    public Iterable<Etudiant> getAllEtudiants(HttpSession session) {
        session.getId();
        return service.findAllEtudiants();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getEtudiant(@PathVariable Integer id) {
        try {
            return ResponseEntity.ok(service.findEtudiant(id));
        } catch(EtudiantNonTrouveException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @PostMapping
    public Etudiant creerEtudiant(@RequestBody Etudiant etudiant) {
        return service.creerEtudiant(etudiant);
    }

    @DeleteMapping
    public void deleteEtudiant(@RequestBody Etudiant etudiant) {
        service.supprimerEtudiant(etudiant);
    }


}