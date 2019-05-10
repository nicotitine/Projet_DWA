insert into type_diplome values(1, 'Licence');
insert into type_diplome values(2, 'Master');
insert into type_diplome values(3, 'Doctorat');


insert into diplome values(1, 'M1TI19', 'Lors de son intégration, l’étudiant choisit un parcours dès le semestre 1 en fonction de ses objectifs personnels et professionnels. Chaque parcours offre un très large choix d’unités d’enseignement (UEs optionnelles, selon les semestres), alliant savoirs théoriques et connaissances métiers. La première année constitue un socle de bases solides en informatique, centré autour du génie logiciel, de la programmation orientée objet, des systèmes répartis et de l''imagerie 3D. La seconde année permet une spécialisation : Les étudiants formés maîtrisent les technologies logicielles les plus récentes et les standards en matière de : réseaux/protocoles, intergiciels, composants/agents logiciels, ingénierie des modèles incluant spécification formelle et semi-formelle, technologies sans fil (architectures matérielles et logicielles, programmation), architectures logicielles de services, informatique dématérialisée (cloud computing), base de données, XML, logiciel open source, ...', 'Cariou', 'Technologies de l''Internet', 2);


insert into unite_enseignement values(1, 'DWA019', 'Développement web', true);
insert into unite_enseignement values(2, 'SIA019', 'Synthèse d''images avancée', true);
insert into unite_enseignement values(3, 'SSD019', 'Spécification des systèmes distribués', true);


insert into diplome_unites values(1, 1);
insert into diplome_unites values(1, 2);
insert into diplome_unites values(1, 3)
