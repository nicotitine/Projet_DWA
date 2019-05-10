package com.projet.dwa.inscription;

import java.sql.Date;

public class InscriptionParams {

    private Long id;
    private String codePostal;
    private String commune;
    private String numeroEtVoie;
    private String pays;
    private String civilite;
    private Date dateDeNaissance;
    private String nom;
    private String prenom;
    private String referenceDossier;
    private Long diplomeId;
    private Boolean validee;

    public InscriptionParams() {
        this.validee = false;
    }

    public InscriptionParams(Long id, String codePostal, String commune, String numeroEtVoie, String pays, String civilite, Date dateDeNaissance, String nom, String prenom, String referenceDossier, Long diplomeId, Boolean validee) {
        this.id = id;
        this.codePostal = codePostal;
        this.commune = commune;
        this.numeroEtVoie = numeroEtVoie;
        this.pays = pays;
        this.civilite = civilite;
        this.dateDeNaissance = dateDeNaissance;
        this.nom = nom;
        this.prenom = prenom;
        this.referenceDossier = referenceDossier;
        this.diplomeId = diplomeId;
        this.validee = validee;
    }

    public Long getId() {
        return id;
    }

    public String getCodePostal() {
        return codePostal;
    }

    public String getCommune() {
        return commune;
    }

    public String getNumeroEtVoie() {
        return numeroEtVoie;
    }

    public String getPays() {
        return pays;
    }

    public String getCivilite() {
        return civilite;
    }

    public Date getDateDeNaissance() {
        return dateDeNaissance;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getReferenceDossier() {
        return referenceDossier;
    }

    public Long getDiplomeId() {
        return diplomeId;
    }

    public Boolean getValidee() {
        return validee;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public void setNumeroEtVoie(String numeroEtVoie) {
        this.numeroEtVoie = numeroEtVoie;
    }

    public void setPays(String pays) {
        this.pays = pays;
    }

    public void setCivilite(String civilite) {
        this.civilite = civilite;
    }

    public void setDateDeNaissance(Date dateDeNaissance) {
        this.dateDeNaissance = dateDeNaissance;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setReferenceDossier(String referenceDossier) {
        this.referenceDossier = referenceDossier;
    }

    public void setDiplomeId(Long diplomeId) {
        this.diplomeId = diplomeId;
    }

    public void setValidee(Boolean validee) {
        this.validee = validee;
    }
}