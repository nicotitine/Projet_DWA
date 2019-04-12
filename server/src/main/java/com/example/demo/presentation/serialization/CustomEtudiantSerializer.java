package com.example.demo.presentation.serialization;

import com.example.demo.modele.Etudiant;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import org.springframework.boot.jackson.JsonComponent;
import java.io.IOException;

@JsonComponent
public class CustomEtudiantSerializer extends JsonSerializer<Etudiant> {
    @Override
    public void serialize( Etudiant e, JsonGenerator jsonGenerator, SerializerProvider serializer) throws IOException, JsonProcessingException {
        jsonGenerator.writeStartObject();
        jsonGenerator.writeStringField("nom_prenom", e.getNom() + " " + e.getPrenom());
        jsonGenerator.writeEndObject();
    }
}