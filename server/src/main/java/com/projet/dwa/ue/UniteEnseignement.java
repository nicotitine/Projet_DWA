package com.projet.dwa.ue;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import com.projet.dwa.diplome.Diplome;

@Entity
public class UniteEnseignement implements Serializable {

    private static final long serialVersionUID = -8842097378115751532L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "hibernate_sequence")
    private Long id;

    private String code;

    private String libelle;

    private boolean obligatoire;

    @ManyToMany(mappedBy = "ues", cascade = CascadeType.ALL)
    private Set<Diplome> diplomes;

    public UniteEnseignement() {

    }

    public UniteEnseignement(String code, String libelle, boolean obligatoire) {
        this.code = code;
        this.libelle = libelle;
        this.obligatoire = obligatoire;
    }

    public String getCode() {
        return this.code;
    }

    public String getLibelle() {
        return this.libelle;
    }

    public boolean getObligatoire() {
        return this.obligatoire;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public void setObligatoire(boolean obligatoire) {
        this.obligatoire = obligatoire;
    }

}