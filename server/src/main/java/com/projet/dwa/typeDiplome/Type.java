package com.projet.dwa.typeDiplome;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="type_diplome")
public class Type implements Serializable {

    // Generated by VSCode
    private static final long serialVersionUID = -364449938735174537L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "hibernate_sequence")
    private Long id;

    private String libelle;

    public Type() {

    }

    public Type(String libelle) {
        this.libelle = libelle;
    }

    public Type(Long id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }


    public String getLibelle() {
        return this.libelle;
    }

    public Long getId() {
        return this.id;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public void setId(Long id) {
        this.id = id;
    }

}
