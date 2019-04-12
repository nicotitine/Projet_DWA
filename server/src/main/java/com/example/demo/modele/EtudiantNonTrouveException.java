package com.example.demo.modele;


public class EtudiantNonTrouveException extends Exception {
    private static final long serialVersionUID = 8437471959485339991L;

    public EtudiantNonTrouveException(String _message) {
        super(_message);
    }
}