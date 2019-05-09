  CREATE sequence hibernate_sequence start with 1 increment BY 1;
  CREATE TABLE diplome
    (
      id bigint NOT NULL,
      code                   VARCHAR(6) NOT NULL,
      descriptif             VARCHAR(4000),
      enseignant_responsable VARCHAR(255),
      libelle                VARCHAR(100) NOT NULL,
      type_id                INTEGER NOT NULL,
      PRIMARY KEY (id)
    );
  CREATE TABLE diplome_unites
    (
      diplome_id bigint NOT NULL,
      unites_id bigint NOT NULL
    );
  CREATE TABLE inscription
    (
      id bigint NOT NULL,
      code_postal       VARCHAR(6) NOT NULL,
      commune           VARCHAR(50) NOT NULL,
      numero_et_voie    VARCHAR(100) NOT NULL,
      pays              VARCHAR(50) NOT NULL,
      civilite          VARCHAR(3) NOT NULL,
      date_de_naissance DATE NOT NULL,
      nom               VARCHAR(100) NOT NULL,
      prenom            VARCHAR(100) NOT NULL,
      reference_dossier VARCHAR(6) NOT NULL,
      diplome_id bigint ,
      PRIMARY KEY (id)
    );
  CREATE TABLE inscription_unites_optionnelles
    (
      inscription_id bigint NOT NULL,
      unites_optionnelles_id bigint NOT NULL
    );
  CREATE TABLE type_diplome
    (
      id      INTEGER NOT NULL ,
      libelle VARCHAR(20) NOT NULL,
      PRIMARY KEY (id)
    );
  CREATE TABLE unite_enseignement
    (
      id bigint NOT NULL,
      code        VARCHAR(6) NOT NULL,
      libelle     VARCHAR(100) NOT NULL,
      obligatoire BOOLEAN NOT NULL,
      PRIMARY KEY (id)
    );
  ALTER TABLE diplome_unites ADD CONSTRAINT UK_a272bciijdl83lp9hx3237udy UNIQUE (unites_id);
  ALTER TABLE diplome ADD CONSTRAINT FKf70vl715qfrwbxycx7v78x07q FOREIGN KEY (type_id) REFERENCES type_diplome;
  ALTER TABLE diplome_unites ADD CONSTRAINT FKdm6b6rsali91kroryswm5ylr8 FOREIGN KEY (unites_id) REFERENCES unite_enseignement;
  ALTER TABLE diplome_unites ADD CONSTRAINT FKm17vjrobwhc0p7p6o55fqiius FOREIGN KEY (diplome_id) REFERENCES diplome;
  ALTER TABLE inscription ADD CONSTRAINT FK1cs09uemq3yr3rleq7f9lv8g3 FOREIGN KEY (diplome_id) REFERENCES diplome;
  ALTER TABLE inscription_unites_optionnelles ADD CONSTRAINT FKjp8cj42ruvp2prv005mobw3k6 FOREIGN KEY (unites_optionnelles_id) REFERENCES unite_enseignement;
  ALTER TABLE inscription_unites_optionnelles ADD CONSTRAINT FK8dh4u5yovx5a52nwqr05x9020 FOREIGN KEY (inscription_id) REFERENCES inscription;
