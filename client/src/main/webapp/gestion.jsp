<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf8"/>
        <link rel='stylesheet' href='webjars/bootstrap/4.2.1/css/bootstrap.min.css'/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <title>Gestion des diplomes</title>
    </head>

    <body style="padding-top: 75px; background: url(./images/background3.jpg) fixed no-repeat">
        <div id="vue">
            <!-- MODALE POUR CONFIRMER L'OUVERTURE DES INSCRIPTIONS -->
            <div class="modal fade" role="dialog" id="confirmerInscriptionsModale">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Confirmation</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Êtes vous sûr de vouloir ouvrir les inscriptions ?<br/>Aucune modification ne pourra être effectuée par la suite.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                            <button type="button" class="btn btn-success" v-on:click="confirmerOuvertureInscriptions" data-dismiss="modal">Confirmer</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- MODALE POUR AJOUT DE DIPLOME -->
            <div class="modal fade" id="nouveauDiplomeModale" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="modal-title" id="exampleModalLabel">Ajouter un diplome</h2>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div style="display: flex; flex-direction: row">
                                <form style='flex: 2' v-on:submit="envoyerNouveauDiplome">
                                    <h5 class="mb-4">Informations sur le diplome</h5>

                                    <div class="form-row ml-4 mr-4">
                                        <div class="form-group">
                                            <label for="inputEmail4">Code</label>
                                            <input class="form-control" id="inputEmail4" v-model="nouveauDiplome.code" minlength="6" maxlength="6" placeholder="6 caractères" required="required"/></div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">Libellé</label>
                                            <input class="form-control" id="inputPassword4" v-model="nouveauDiplome.libelle" placeholder="Libellé..." required="required"/></div>
                                    </div>

                                    <div class="form-group ml-4 mr-4">
                                        <label for="inputAddress">Descriptif</label>
                                        <textarea type="text" class="form-control" id="inputAddress" v-model="nouveauDiplome.descriptif" placeholder="Cours descriptif du diplome..." required="required"></textarea>
                                    </div>

                                    <div class="form-row ml-4 mr-4">
                                        <div class="form-group col-md-6">
                                            <label for="inputCity">Responsable</label>
                                            <input type="text" class="form-control" id="inputCity" v-model="nouveauDiplome.responsable" placeholder="Enseignant responsable..." required="required"/></div>
                                    </div>

                                    <div class="form-row ml-4 mr-4">
                                        <div class="form-group col-md-12">
                                            <label for="inputState">Type</label>
                                            <div class="form-row form-group">
                                                <select id="inputState" placeholder="Choisir un type..." class="form-control custom-select col-md-8" v-model="nouveauDiplome.type" required="required">
                                                    <option v-for="t in typesDiplomes" v-bind:value="t">
                                                        {{t.id}}
                                                        -
                                                        {{t.libelle}}
                                                    </option>
                                                </select>
                                                <button class='form-control btn btn-link col-md-4' v-on:click="ajouterNouveauType">Ajouter un type</button>
                                            </div>

                                            <div class='form-row' v-if='ajoutTypeEnCours' style="margin-top: 20px">
                                                <div class="form-group col-md-8">
                                                    <input class="form-control" v-model="libelleNouveauType" placeholder="Libellé du type de diplome..."/></div>
                                                <div class="form-group col-md-4">
                                                    <button class="btn btn-primary" v-on:click="envoyerNouveauType">Ajouter type</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <h5 class="mb-4">Les UEs du diplome</h5>
                                        <table class="table mt-3 ml-4 mr-4" style="width: 90%;">
                                            <thead>
                                                <tr>
                                                    <th>Code</th>
                                                    <th>Libellé</th>
                                                    <th>Obligatoire</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="u in nouveauDiplome.ues">
                                                    <td>
                                                        {{u.code}}
                                                    </td>
                                                    <td>
                                                        {{u.libelle}}
                                                    </td>
                                                    <td>
                                                        {{u.obligatoire}}
                                                    </td>
                                                    <td>
                                                        <button class='btn btn-link' v-on:click="supprimerUeAuDiplome($event, u)">Supprimer</button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                    <button type="submit" class="btn btn-primary">Ajouter</button>
                                </form>

                                <div class="" style="flex: 1; border-left: 2px solid #E9ECEF; margin: 20px; padding: 00px 20px;">
                                    <h3>Liste des UEs</h3>
                                    <div style="overflow-y: auto; overflow-x: hidden; max-height: 400px">
                                        <table class="table mt-3">
                                            <thead>
                                                <tr>
                                                    <th>Code</th>
                                                    <th>Libellé</th>
                                                    <th>Obligatoire</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <div>
                                                <tbody>
                                                    <tr v-for="u in ues">
                                                        <td>{{u.code}}</td>
                                                        <td>{{u.libelle}}</td>
                                                        <td>{{u.obligatoire}}</td>
                                                        <td>
                                                            <button class="btn btn-link" v-on:click="ajouterUeAuDiplome($event, u)">Ajouter</button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </div>
                                        </table>
                                    </div>
                                    <div class="jumbotron pt-2 pb-2 pl-2 mt-4">
                                        <h5>Ajouter une UE</h5>
                                        <div class="form-group ml-4">
                                            <label for="ajouterUECodeInput">Code</label>
                                            <input class="form-control" id="ajouterUECodeInput" placeholder="6 caractères" v-model="nouvelleUE.code"/></div>
                                        <div class="form-group ml-4">
                                            <label for="ajouterUELibelleInput">Libellé</label>
                                            <input class="form-control" id="ajouterUELibelleInput" placeholder="Libellé..." v-model="nouvelleUE.libelle"/></div>
                                        <div class="form-group col-auto ml-4">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="customControlAutosizing" v-model="nouvelleUE.obligatoire"/>
                                                <label class="custom-control-label" for="customControlAutosizing">est obligatoire</label>
                                            </div>
                                        </div>
                                        <button class='btn btn-primary ml-4' v-on:click="envoyerNouvelleUE">Ajouter l'UE</button>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- NAVIGATION -->
            <nav class="fixed-top navbar navbar-expand-lg navbar-dark bg-dark" style="box-shadow: 0px 0px 10px black" id="navVue">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse fixed justify-content-md-center" id="navbarsExample08">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <h1 v-if="!isInscriptionsOuvertes" class="text-white">Gestion des diplômes</h1>
                            <h1 v-else="v-else" class="text-white">Gestion des inscriptions</h1>
                        </li>
                        <li v-if="!isInscriptionsOuvertes" class="text-white" style="position: fixed; top: 18px; right:20px;">
                            Les insctiptions ne sont pas ouvertes.
                            <button class="btn btn-primary ml-4" v-on:click="ouvrirConfirmationInscriptions">Ouvrir les inscriptions</button>
                        </li>
                    </ul>
                </div>

            </nav>

            <!-- LISTE DES DIPLOMES DISPONIBLES -->
            <div id="gestionEtudiants" class='jumbotron pt-4 pb-4' style="width: 80%; margin: 40px auto; box-shadow: 0px 0px 15px black" v-if="!isInscriptionsOuvertes">
                <h2>Liste des diplomes</h2>
                <br/>
                <table class='table'>
                    <thead>
                        <tr>
                            <th>Code</th>
                            <th>Libellé</th>
                            <th>Description</th>
                            <th>Type</th>
                            <th>Responsable</th>
                            <th>Détails</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="d in diplomes">
                            <td>{{d.code}}</td>
                            <td>{{d.libelle}}</td>
                            <td v-if="d.descriptif.length > 50">{{d.descriptif.substring(0,50) + "..."}}</td>
                            <td v-else="v-else">{{d.descriptif}}</td>
                            <td>{{d.type.libelle}}</td>
                            <td>{{d.responsable}}</td>
                            <td>
                                <button class="btn btn-link" v-on:click="afficherDetailsDiplome($event, d)">détails</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button class='btn btn-primary' v-on:click="ajouterNouveauDiplome">Ajouter un diplome</button>
            </div>

            <div id="gestionInsription" class='jumbotron pt-4 pb-4' style="overflow-x: auto ;width: 80%; margin: 40px auto; box-shadow: 0px 0px 15px black" v-if="isInscriptionsOuvertes">
                <h2>Liste des inscriptions</h2>
                <table class="table mt-4">
                    <thead>
                        <tr>
                            <th>Code</th>
                            <th>Civilité</th>
                            <th>Nom</th>
                            <th>Prenom</th>
                            <th>Date de naissance</th>
                            <th>Numéro et voie</th>
                            <th>Ville</th>
                            <th>Code postal</th>
                            <th>Pays</th>
                            <th>Diplome</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="i in inscriptions">
                            <td>{{i.referenceDossier}}</td>
                            <td>
                                {{i.civilite}}
                            </td>
                            <td>
                                {{i.nom}}
                            </td>
                            <td>
                                {{i.prenom}}
                            </td>
                            <td>
                                {{i.dateDeNaissance}}
                            </td>
                            <td>
                                {{i.numeroEtVoie}}
                            </td>
                            <td>
                                {{i.ville}}
                            </td>
                            <td>
                                {{i.codePostal}}
                            </td>
                            <td>
                                {{i.pays}}
                            </td>
                            <td>
                                {{i.diplomeId}}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="modal fade" id="diplomeDetailModale" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-xl" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="modal-title" id="exampleModalLabel">Détail du diplome {{selectedDiplome.libelle}}</h2>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div style="display: flex; flex-direction: row">
                                <form style='flex: 2'>
                                    <h5 class="mb-4">Informations sur le diplome</h5>
                                    <div class="form-row ml-4 mr-4">
                                        <div class="form-group  col-md-6">
                                            <label for="inputEmail4">Code</label>
                                            <input class="form-control" id="inputEmail4" v-model="selectedDiplome.code" disabled/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">Libellé</label>
                                            <input class="form-control" id="inputPassword4" v-model="selectedDiplome.libelle" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group ml-4 mr-4">
                                        <label for="inputAddress">Descriptif</label>
                                        <textarea type="text" class="form-control" id="inputAddress" v-model="selectedDiplome.descriptif" disabled></textarea>
                                    </div>

                                    <div class="form-row ml-4 mr-4">
                                        <div class="form-group col-md-6">
                                            <label for="inputCity">Responsable</label>
                                            <input type="text" class="form-control" id="inputCity" v-model="selectedDiplome.responsable" disabled/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputState">Type</label>
                                            <input type="text" class="form-control" id="inputState" v-model="selectedDiplome.type.libelle" disabled/>
                                        </div>
                                    </div>

                                    <div>
                                        <h5 class="mb-4 mt-4">Les UEs du diplome</h5>
                                        <table class="table mt-3 ml-4 mr-4" style="width: 90%;">
                                            <thead>
                                                <tr>
                                                    <th>Code</th>
                                                    <th>Libellé</th>
                                                    <th>Obligatoire</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="u in selectedDiplome.ues">
                                                    <td> {{u.code}} </td>
                                                    <td> {{u.libelle}} </td>
                                                    <td> {{u.obligatoire}} </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="<c:url value = '/webjars/vue/2.5.16/vue.js'/>"></script>
        <script src="<c:url value = '/webjars/vue-router/3.0.2/dist/vue-router.js'/>"></script>
        <script src="<c:url value = '/webjars/axios/0.18.0/dist/axios.js'/>"></script>
        <script src="<c:url value = '/webjars/http-vue-loader/1.3.5/src/httpVueLoader.js'/>"></script>
        <script src="<c:url value = '/webjars/jquery/3.4.1/jquery.js'/>"></script>
        <script src="<c:url value = '/webjars/bootstrap/4.2.1/js/bootstrap.js'/>"></script>
        <script src="lib/notiflix.min.js"></script>

        <script>
            Notiflix.Notify.Init({position: "left-bottom", plainText: false, width: "400px"});

            var vue = new Vue({
                el: '#vue',
                data: {
                    selectedDiplome: {
                        code: "",
                        libelle: "",
                        descriptif: "",
                        type: {
                            id: null,
                            libelle: ""
                        },
                        responsable: "",
                        ues: []
                    },
                    isInscriptionsOuvertes: false,
                    diplomes: [],
                    typesDiplomes: [],
                    ues: [],
                    inscriptions: [],
                    ajoutTypeEnCours: false,
                    libelleNouveauType: "",
                    nouveauDiplome: {
                        code: "",
                        libelle: "",
                        descriptif: "",
                        type: null,
                        responsable: "",
                        ues: []
                    },
                    nouvelleUE: {
                        code: null,
                        libelle: "",
                        obligatoire: false
                    }
                },
                mounted: function () {
                    $.ajaxSetup({traditional: true});

                    window.setInterval(() => {
                        axios.get('http://localhost:9090/getInscriptions', {withCredentials: false}).then(response => {
                            console.log(response.data);

                            this.inscriptions = response.data

                        }, response => {
                            // traiter en cas d'erreur
                        });
                    }, 3000);

                    axios.get('http://localhost:9090/getInscriptions', {withCredentials: false}).then(response => {
                        console.log(response.data);

                        this.inscriptions = response.data

                    }, response => {
                        // traiter en cas d'erreur
                    });

                    axios.get('http://localhost:9090/isInscriptionsOuvertes', {withCredentials: false}).then(response => {
                        console.log(response.data);

                        this.isInscriptionsOuvertes = response.data;

                    }, response => {
                        // traiter en cas d'erreur
                    })

                    axios.get('http://localhost:9090/diplomes', {withCredentials: false}).then(response => {
                        console.log(response.data);

                        this.diplomes = response.data;

                    }, response => {
                        // traiter en cas d'erreur
                    });

                    axios.get('http://localhost:9090/typesDiplomes', {withCredentials: false}).then(response => {
                        console.log(response.data);

                        this.typesDiplomes = response.data;

                    }, response => {
                        // traiter en cas d'erreur
                    });

                    axios.get('http://localhost:9090/ues', {withCredentials: false}).then(response => {
                        console.log(response.data);

                        this.ues = response.data;

                    }, response => {
                        // traiter en cas d'erreur
                    });
                },
                methods: {
                    afficherDetailsDiplome(e, diplome) {
                        this.selectedDiplome = diplome;
                        $("#diplomeDetailModale").modal('show');
                    },

                    ouvrirConfirmationInscriptions(e) {
                        $("#confirmerInscriptionsModale").modal('show');

                        e.preventDefault();
                    },

                    confirmerOuvertureInscriptions(e) {
                        e.preventDefault();

                        axios.post('http://localhost:9090/openInscriptions', {withCredentials: false}).then(response => {
                            console.log(response.data);
                            this.isInscriptionsOuvertes = response.data;

                            Notiflix.Notify.Success('Les insriptions sont ouvertes !');
                        });
                    },

                    ajouterNouveauDiplome() {
                        $("#nouveauDiplomeModale").modal('show');

                    },

                    ajouterNouveauType(e) {
                        e.preventDefault();
                        this.ajoutTypeEnCours = !this.ajoutTypeEnCours

                    },

                    envoyerNouveauType(e) {
                        e.preventDefault();
                        axios.post('http://localhost:9090/addType?libelle=' + this.libelleNouveauType, {withCredentials: false}).then(response => {
                            console.log(response.data);
                            this.typesDiplomes.push(response.data);
                            Notiflix.Notify.Success('Le nouveau type de diplôme a été ajouté avec succès.');
                            this.ajoutTypeEnCours = false;

                        }, response => {
                            Notiflix.Notify.Failure('Le nouveau type n\'a pas pu être ajouté. Cause : \n' + response);
                        });
                    },

                    envoyerNouveauDiplome(e) {

                        e.preventDefault();
                        $("#nouveauDiplomeModale").modal('hide');
                        axios({
                            method: 'post',
                            url: 'http://localhost:9090/addDiplome',
                            headers: {
                                'Content-Type': 'application/json; charset=utf-8'
                            },
                            data: JSON.stringify(this.nouveauDiplome)
                        }).then((response) => {
                            console.log(response.data);
                            this.diplomes.push(response.data);
                            Notiflix.Notify.Success('Le nouveau diplome a été ajouté avec succès.');
                        }).catch((error) => {
                            Notiflix.Notify.Failure('Le nouveau diplome n\'a pas pu être ajouté. <br/>Cause : ' + error);

                        });
                    },

                    envoyerNouvelleUE(e) {
                        e.preventDefault();
                        let params = jQuery.param(this.nouvelleUE);
                        axios.post("http://localhost:9090/addUe?" + params, {withCredentials: false}).then(response => {
                            console.log(response.data);

                            this.ues.push(response.data);
                            Notiflix.Notify.Success('La nouvelle UE a été ajoutée avec succès.');
                        }, response => {
                            // traiter en cas d'erreur
                        });
                    },

                    ajouterUeAuDiplome(e, ue) {
                        this.nouveauDiplome.ues.push(ue)

                        e.preventDefault();
                    },

                    supprimerUeAuDiplome(e, ue) {
                        let index = this.nouveauDiplome.ues.indexOf(ue);
                        this.nouveauDiplome.ues.splice(index, 1);

                        e.preventDefault();
                    }
                }
            })
        </script>
    </body>
</html>
