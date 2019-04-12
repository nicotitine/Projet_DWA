package com.example.demo.modele;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Etudiant {

    @Id
    @GeneratedValue
    private Integer id;

    private String nom;
    private String prenom;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer _id) {
        this.id = _id;
    }

    public String getNom() {
        return this.nom;
    }

    public void setNom(String _nom) {
        this.nom = _nom;
    }

    public String getPrenom() {
        return this.prenom;
    }

    public void setPrenom(String _prenom) {
        this.prenom = _prenom;
    }
}