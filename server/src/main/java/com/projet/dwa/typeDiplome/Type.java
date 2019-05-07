package com.projet.dwa.typeDiplome;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="type_diplome")
public class Type implements Serializable {

    private static final long serialVersionUID = -364449938735174537L;

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false, unique = true)
    private Integer id;

    private String libelle;

    public Type() {

    }

    public Type(String libelle) {
        this.libelle = libelle;
    }


    public String getLibelle() {
        return this.libelle;
    }

    public Integer getId() {
        return this.id;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public void setId(Integer id) {
        this.id = id;
    }

}

