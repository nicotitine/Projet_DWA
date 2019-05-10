<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf8">
        <link rel='stylesheet' href='webjars/bootstrap/4.2.1/css/bootstrap.min.css'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Portail d'inscription</title>
        <style>
            .has-search .form-control {
              padding-left: 2.375rem;
            }

            .has-search .form-control-feedback {
              position: absolute;
              z-index: 2;
              display: block;
              width: 2.375rem;
              height: 2.375rem;
              line-height: 2.375rem;
              text-align: center;
              pointer-events: none;
              color: #aaa;
            }
        </style>
    </head>
    <body class="" style="padding-top: 100px; background: url(./images/background3.jpg) fixed no-repeat">

        <div id="vue">

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
                                        <table class="table table-striped mt-3 ml-4 mr-4" style="width: 90%;">
                                            <thead class="">
                                                <tr>
                                                    <th>Code</th>
                                                    <th>Libellé</th>
                                                    <th>Obligatoire</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="u in selectedDiplome.ues">
                                                    <td class="align-middle"> {{u.code}} </td>
                                                    <td class="align-middle"> {{u.libelle}} </td>
                                                    <td class="align-middle" v-if="u.obligatoire">oui</td>
                                                    <td class="align-middle" v-else>non</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                            <button class="btn btn-primary" data-dismiss="modal" v-on:click="commencerInscription($event, selectedDiplome)">Choisir</button>
                        </div>
                    </div>
                </div>
            </div>

            <div v-if="!isInscriptionsOuvertes" class="jumbotron pt-4 pb-4 " style="width: 80%; margin: 40px auto; box-shadow: 0px 0px 15px black">
                <br/>
                <h2 class="text-center">Bienvenue sur le portail d'inscription</h2>
                <br/>
                <br/>
                <div class="text-center">
                    Les inscriptions sont actuellement fermées. <br/>
                    Merci de réessayer plus tard...
                </div>
            </div>

            <div v-if="isInscriptionsOuvertes" class="fixed-top bg-white p-3" style="box-shadow: 0px 0px 15px black; display: flex; flex-direction: row; align-items: center">
                <h3 style="flex: 1" class="text-center ">Reprendre une inscription en cours</h3>
                <form v-on:submit="recupererInscription" class="" style="flex: .5">
                    <div class="form-group" style="margin: 0px auto !important; align-items: center; display:flex; align-items:center">
                        <label for="numeroInscriInput" style="flex: 1" class="text-right">Numéro d'inscription</label>
                        <input id="numeroInscriInput" style="flex: .1" class='form-control ml-4 mr-4' placeholder="Ex : IE1234" minlength="6" maxlength="6" required v-model="numeroRecupererInscription">
                        <button style="flex: .3"class="btn btn-primary">Valider</button>
                    </div>
                </form>
            </div>

            <div v-if="isInscriptionsOuvertes && !isInscriptionCommencee" class="jumbotron pt-4 pb-4" style="width: 80%; margin: 40px auto; box-shadow: 0px 0px 15px black">
                <div class="d-flex" style="align-items: center; justify-content: space-between">
                    <h2 class="mr-4">Catalogue des diplomes</h2>
                    <div class="form-group has-search ml-4 mt-4" id="search" style="width: 250px;">
                        <span class="fa fa-search form-control-feedback"></span>
                        <input type="text" class="form-control" placeholder="Chercher un diplome"/>
                    </div>
                </div>
                <p style="font-size: 14px; color: grey;" class="mt-4">
                    - La liste des UEs par diplome est visible en cliquant sur le bouton "détails".<br/>
                    - Une fois que vous avez choisi votre diplome, quelques renseignements supplémentaires vous seront demandés. <br/>
                    - Vous pourrez toujours laisser de côté votre inscription pour y revenir plus tard. Pour cela, notez bien votre référence de dossier.
                </p>

                <div style="overflow-y: auto">
                    <table class="table mt-4 table-striped " id="tableDiplomes">
                        <thead>
                            <tr class="text-center">
                                <th>Code</th>
                                <th>Libellé</th>
                                <th>Description</th>
                                <th>Type</th>
                                <th>Responsable</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="d in diplomes">
                                <td class="align-middle">{{d.code}}</td>
                                <td class="align-middle">{{d.libelle}}</td>
                                <td class="align-middle" v-if="d.descriptif.length > 50">{{d.descriptif.substring(0,50) + "..."}}</td>
                                <td class="align-middle" v-else>{{d.descriptif}}</td>
                                <td class="align-middle">{{d.type.libelle}}</td>
                                <td class="align-middle">{{d.responsable}}</td>
                                <td class="align-middle"><button class="btn btn-link" v-on:click="afficherDetailsDiplome($event, d)">détails</button><button class="btn btn-link" v-on:click="commencerInscription($event, d)">choisir</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div v-if="isInscriptionCommencee" class="jumbotron pt-4 pb-4" style="width: 60%; margin: 40px auto; box-shadow: 0px 0px 15px black">
                <h2>Informations obligatoires</h2>
                <br/>
                <div v-if="nouvelleInscription.validee" class="alert text-white" role="alert" style="background: #00B462;">
                    Votre inscription est déjà validée. Vous ne pouvez donc que la consulter.
                </div>
                <form v-on:submit="validerInscription">
                        <div class="form-row">
                          <div class="form-group col-md-4">
                            <label for="inputEmail4">Code de référence dossier (<strong>A conserver !</strong>)</label>
                            <input disabled v-model="nouvelleInscription.referenceDossier" class="form-control" id="inputEmail4">
                          </div>
                          <br/>
                        </div>
                        <h4 class="mt-4">Identité</h4>
                        <div class="form-row">
                                <div class="form-group col-md-3">
                                        <label for="inputCivilite">Civilité</label>
                                        <select v-bind:disabled="nouvelleInscription.validee" class="form-control custom-select" v-model="nouvelleInscription.civilite" required>
                                            <option>MME</option>
                                            <option>MR</option>
                                        </select>
                                    </div>
                            <div class="form-group col-md-3">
                                <label for="inputPassword4">Nom</label>
                                <input v-bind:disabled="nouvelleInscription.validee" class="form-control" id="inputPassword4" placeholder="Ex : Durand" v-model="nouvelleInscription.nom" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="inputPassword4">Prénom</label>
                                <input v-bind:disabled="nouvelleInscription.validee" class="form-control" id="inputPassword4" placeholder="Ex : Damien" v-model="nouvelleInscription.prenom" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="inputPassword4">Date de naissance</label>
                                <input v-bind:disabled="nouvelleInscription.validee" class="form-control" type="date" id="inputPassword4" placeholder="Ex : 10/10/1996" v-model="nouvelleInscription.dateDeNaissance" required>
                            </div>

                        </div>
                        <h4 class='mt-4'>Adresse</h4>
                        <div class="form-group">
                          <label for="inputAddress">Numéro et voie</label>
                          <input v-bind:disabled="nouvelleInscription.validee" type="text" class="form-control" id="inputAddress" placeholder="Ex : 5 avenue des Champs-Elysées" v-model="nouvelleInscription.numeroEtVoie" required>
                        </div>

                        <div class="form-row">
                          <div class="form-group col-md-5">
                            <label for="inputCity">Ville</label>
                            <input v-bind:disabled="nouvelleInscription.validee" type="text" class="form-control" id="inputCity" placeholder="Ex : Paris" v-model="nouvelleInscription.commune" required>
                          </div>
                          <div class="form-group col-md-2">
                            <label for="inputZip">Code postal</label>
                            <input v-bind:disabled="nouvelleInscription.validee" minlength="5"  maxlength="5" class="form-control custom-input" id="inputZip" v-model="nouvelleInscription.codePostal" placeholder="Ex : 75000" required>
                          </div>
                          <div class="form-group col-md-5">
                            <label for="inputState">Pays</label>
                            <input v-bind:disabled="nouvelleInscription.validee" type="text" class="form-control" id="inputState" placeholder="Ex : France" v-model="nouvelleInscription.pays" required>
                          </div>

                        </div>
                        <br/>
                        <div class="text-right">
                            <button class="btn btn-secondary" v-on:click="revenirPlusTard">Revenir plus tard</button>
                            <button v-if="!nouvelleInscription.validee" type="submit" class="btn btn-primary ml-2">Confirmer l'inscription</button>
                        </div>
                      </form>
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
            // Chercher dans le tableau des diplomes
            $(document).ready(function(){
                $("#search input").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#tableDiplomes tbody tr").filter(function() {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });

            Notiflix.Notify.Init({position: "left-bottom", plainText: false, width: "470px"});
            var vue = new Vue( {
                el: "#vue",
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
                    isInscriptionCommencee: false,
                    nouvelleInscription: {
                        id: 0,
                        codePostal: "",
                        commune: "",
                        numeroEtVoie : "",
                        pays: "",
                        civilite: "",
                        dateDeNaissance: null,
                        nom: "",
                        prenom: "",
                        referenceDossier: "000000",
                        diplomeId: null,
                        validee: false
                    },
                    diplomes: [],
                    numeroRecupererInscription: ""
                },
                mounted: function() {
                    axios.get('http://localhost:9090/isInscriptionsOuvertes', {withCredentials: false}).then(response => {
                        console.log(response.data);

                        this.isInscriptionsOuvertes = response.data;

                    }, response => {
                        // traiter en cas d'erreur
                    })

                    window.setInterval(() => {
                        axios.get('http://localhost:9090/isInscriptionsOuvertes', {withCredentials: false}).then(response => {
                            console.log(response.data);

                            this.isInscriptionsOuvertes = response.data

                        }, response => {
                            // traiter en cas d'erreur
                        });
                    }, 3000);

                    axios.get('http://localhost:9090/diplomes', {withCredentials: false}).then(response => {
                        console.log(response.data);

                        this.diplomes = response.data;
                    }, response => {
                        // traiter en cas d'erreur
                    });
                },
                methods: {
                    afficherDetailsDiplome(e, diplome) {
                        this.selectedDiplome = diplome;
                        $("#diplomeDetailModale").modal('show');
                    },

                    commencerInscription(e, diplome) {
                        this.isInscriptionCommencee = true;
                        console.log(diplome);
                        axios.get('http://localhost:9090/generateNewInscription?referenceDossier=' + diplome.id, {withCredentials: false}).then(response => {
                            console.log(response.data);
                            this.nouvelleInscription = response.data;
                            Notiflix.Notify.Success('Génération de l\'inscription réussie !');
                        }, response => {
                            console.log(response.data);
                        })
                    },

                    revenirPlusTard(e) {
                        e.preventDefault();
                        console.log(JSON.stringify(this.nouvelleInscription));

                        axios({
                            method: 'post',
                            url: 'http://localhost:9090/saveInscription',
                            headers:{'Content-Type': 'application/json; charset=utf-8'},
                            data: JSON.stringify(this.nouvelleInscription)
                        }).then((response) => {
                            console.log(response.data);

                            Notiflix.Notify.Success('L\'inscription a été sauvegardée avec succès');

                            this.isInscriptionCommencee = false;
                        }).catch((error) => {
                            Notiflix.Notify.Failure('La nouvelle inscription n\'a pas pu être sauvegardée. <br/>Cause : ' + error );
                        });
                    },

                    recupererInscription(e) {
                        e.preventDefault();
                        axios.get('http://localhost:9090/getInscription?referenceDossier=' + this.numeroRecupererInscription, {withCredentials: false}).then(response => {
                            console.log(response.data);

                            this.nouvelleInscription = response.data;
                            this.isInscriptionCommencee = true;

                            Notiflix.Notify.Success('Votre inscription a bien été retrouvée !');
                        }, response => {
                            Notiflix.Notify.Failure('Votre inscription n\'a pas pu être retrouvée. Est ce le bon code ?');
                        });
                    },

                    validerInscription(e) {
                        console.log("validation en cours");
                        console.log();
                        this.nouvelleInscription.validee = true;
                        axios({
                            method: 'post',
                            url: 'http://localhost:9090/saveInscription',
                            headers:{'Content-Type': 'application/json; charset=utf-8'},
                            data: JSON.stringify(this.nouvelleInscription)
                        }).then((response) => {
                            console.log(response.data);

                            Notiflix.Notify.Success('L\'inscription a été confirmée avec succès');

                            this.isInscriptionCommencee = false;
                        }).catch((error) => {
                            Notiflix.Notify.Failure('La nouvelle inscription n\'a pas pu être confirmée. <br/>Cause : ' + error );
                        });
                        e.preventDefault();
                    }
                }
            });
        </script>
    </body>
</html>
