package com.projet.dwa.diplome;

import java.util.Set;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import com.projet.dwa.typeDiplome.Type;
import com.projet.dwa.ue.UniteEnseignement;

public class DiplomeParams {

    private String code;
    private String libelle;
    private String descriptif;
    @NotNull
    @Valid
    private Type type;
    private String responsable;

    private Set<UniteEnseignement> ues;
    

    public DiplomeParams() {

    }

    public DiplomeParams(String code, String libelle, String descriptif, Type type, String responsable, Set<UniteEnseignement> ues) {
        this.code = code;
        this.libelle = libelle;
        this.descriptif = descriptif;
        this.responsable = responsable;
        this.type = type;
        this.ues = ues;
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

    public String getResponnsable() {
        return this.responsable;
    }

    public Type getType() {
        return this.type;
    }

    public Set<UniteEnseignement> getUes() {
        return this.ues;
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

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public void setUes(Set<UniteEnseignement> ues) {
        this.ues = ues;
    }
}