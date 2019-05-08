package com.projet.dwa.diplome;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import com.projet.dwa.typeDiplome.*;

@Entity
public class Diplome implements Serializable {

    private static final long serialVersionUID = -3282201885115928765L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "hibernate_sequence")
    private Long id;

    private String code;
    private String libelle;
    private String descriptif;
    @ManyToOne
    private Type type;
    @Column(name="enseignant_responsable")
    private String responsable;

    public Diplome() {

    }

    public Diplome(String code, String libelle, String descriptif, Type type, String responsable) {
        this.code = code;
        this.libelle = libelle;
        this.descriptif = descriptif;
        this.type = type;
        this.responsable = responsable;
    }

    public Diplome(Long id, String code, String libelle, String descriptif, Type type, String responsable) {
        this.id = id;
        this.code = code;
        this.libelle = libelle;
        this.descriptif = descriptif;
        this.type = type;
        this.responsable = responsable;
    }



    public Long getId() {
        return this.id;
    }

    public String getCode() {
        return this.code;
    }

    public String getLibelle() {
        return this.libelle;
    }

    public String getDescriptif() {
        return this.descriptif;
    }

    public Type getType() {
        return this.type;
    }

    public String getResponsable() {
        return this.responsable;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public void setDescriptif(String descriptif) {
        this.descriptif = descriptif;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }
}
