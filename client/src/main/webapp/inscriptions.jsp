<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf8">
        <link rel='stylesheet' href='webjars/bootstrap/4.2.1/css/bootstrap.min.css'>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Portail d'inscription</title>
    </head>
    <body class="" style="padding-top: 75px; background: url(./images/background3.jpg)">
        <div id="vue">
 

            <div v-if="!isInscriptionCommencee" class="jumbotron pt-4 pb-4 " style="width: 80%; margin: 40px auto; box-shadow: 0px 0px 15px black">
                <br/>
                <h2 class="text-center">Bienvenue sur le portail d'inscription</h2>
                <br/>
                <h4 class="text-center" v-if="isInscriptionsOuvertes">Deux choix s'offrent à vous : </h4>
                <br/>
                <br/> 
                <div class="text-center" v-if="!isInscriptionsOuvertes">
                    Les inscriptions sont actuellement fermées. <br/>
                    Merci de réessayer plus tard...
                </div>
                <div v-else style="display: flex">
                    <div style="flex: 1" class="pl-4 pr-4">
                        <h4 class="text-center">C'est la première fois que vous venez</h4>
                        <br/>
                        <br/>
                        <div class="text-center">
                            <button class='btn btn-primary' v-on:click="commencerInscription">Démarrer une nouvelle inscription</button>
                        </div>
                        <br/>
                        <br/>
                        <br/>
                        <p style="font-size: 14px; color: grey;">
                            - Veuillez préparer tous les documents nécessaires à l'inscription.<br/>
                            - Vous pourrez toujours laisser de côté votre inscription pour y revenir plus tard.<br/>
                            - Veillez à bien noter le numéro d'inscription généré pour y pouvoir la modifier après.
                        </p>
                    </div>
                    <div style="flex: 1; border-left: 2px solid grey" class="pl-4 pr-4">
                        <h4 class="text-center">Poursuivre une inscription</h4>
                        <br/>
                        <br/>
                        <p style="font-size: 14px; color: grey;" class="ml-4">
                           - Vous pouvez modifier votre inscription à tout moment avant de l'avoir soumise.<br/>
                           - Pour cela, munissez vous de votre numéro d'inscription (sous la forme IE1234)
                        </p>
                        <br/>
                        <br/>
                        <form class="form-row" >
                            <div class="form-group" style="margin: 0px auto !important; width: 60%; align-items: center">
                                <label for="numeroInscriInput">Numéro d'inscription : </label>
                                <div class="form-row">
                                    <input id="numeroInscriInput" class='form-control col-md-4' placeholder="Ex : IE1234" minlength="6" maxlength="6" required>
                                    <button type="submit" class="btn btn-primary col-md-7 ml-4">Reprendre votre inscription</button>
                                </div>
                                
                            </div>
                        </form>
                        <br/>
                    </div>
                </div>
            </div>

            <div class="jumbotron pt-4 pb-4" style="width: 80%; margin: 40px auto; box-shadow: 0px 0px 15px black">
                <h2>Catalogue des diplomes</h2>
                <table class="table mt-4">
                    <thead>
                        <tr>
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
                            <td>{{d.code}}</td>
                            <td>{{d.libelle}}</td>
                            <td v-if="d.descriptif.length > 50">{{d.descriptif.substring(0,50) + "..."}}</td>
                            <td v-else>{{d.descriptif}}</td>
                            <td>{{d.type.libelle}}</td>
                            <td>{{d.responsable}}</td>
                            <td><button class="btn btn-link">détails</button><button class="btn btn-link">choisir</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
                
            <div v-if="isInscriptionCommencee" class="jumbotron pt-4 pb-4" style="width: 60%; margin: 40px auto; box-shadow: 0px 0px 15px black">
                <h2>Informations obligatoires</h2>
                <br/>
                <form>
                    
                        <div class="form-row">
                          <div class="form-group col-md-4">
                            <label for="inputEmail4">Code de référence dossier (<strong>A conserver !</strong>)</label>
                            <input disabled v-model="nouvelleInscription.referenceDossier" class= id="inputEmail4">
                          </div>
                          <br/>
                        </div>
                        <h4 class="mt-4">Identité</h4>
                        <div class="form-row">
                                <div class="form-group col-md-3">
                                        <label for="inputCivilite">Civilité</label>
                                        <select class="form-control custom-select" v-model="nouvelleInscription.civilite" required>
                                            <option>MME</option>
                                            <option>MR</option>
                                        </select>
                                    </div>
                            <div class="form-group col-md-3">
                                <label for="inputPassword4">Nom</label>
                                <input class="form-control" id="inputPassword4" placeholder="Ex : Durand" v-model="nouvelleInscription.nom" required>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="inputPassword4">Prénom</label>
                                <input class="form-control" id="inputPassword4" placeholder="Ex : Damien" v-model="nouvelleInscription.prenom" required>
                            </div>
                            <div class="form-group col-md-3">
                                    <label for="inputPassword4">Date de naissance</label>
                                    <input class="form-control" type="date" id="inputPassword4" placeholder="Ex : 10/10/1996" v-model="nouvelleInscription.dateDeNaissance" required>
                            </div>
                           
                        </div>
                        <h4 class='mt-4'>Adresse</h4>
                        <div class="form-group">
                          <label for="inputAddress">Numéro et voie</label>
                          <input type="text" class="form-control" id="inputAddress" placeholder="Ex : 5 avenue des Champs-Elysées" v-model="nouvelleInscription.numeroEtVoie" required>
                        </div>
                        
                        <div class="form-row">
                          <div class="form-group col-md-5">
                            <label for="inputCity">Ville</label>
                            <input type="text" class="form-control" id="inputCity" placeholder="Ex : Paris" v-model="nouvelleInscription.commune" required>
                          </div>
                          <div class="form-group col-md-2">
                                <label for="inputZip">Code postal</label>
                                <input minlength="6"  maxlength="6" class="form-control custom-input" id="inputZip" v-model="nouvelleInscription.codePostal" placeholder="Ex : 75000" required>
                          </div>
                          <div class="form-group col-md-5">
                            <label for="inputState">Pays</label>
                            <input type="text" class="form-control" id="inputState" placeholder="Ex : France" v-model="nouvelleInscription.pays" required>
                          </div>
                          
                        </div>
                        <br/>
                        <div class="text-right">
                                <button class="btn btn-secondary" v-on:click="revenirPlusTard">Revenir plus tard</button>
                                <button type="submit" class="btn btn-primary ml-2">Poursuivre l'inscription</button>
                        </div>
                      </form>
                <!-- <table class='table'>
                    <thead>
                        <tr>
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
                            <td>{{d.code}}</td>
                            <td>{{d.libelle}}</td>
                            <td v-if="d.descriptif.length > 50">{{d.descriptif.substring(0,50) + "..."}}</td>
                            <td v-else>{{d.descriptif}}</td>
                            <td>{{d.type.libelle}}</td>
                            <td>{{d.responsable}}</td>
                            <td><button class="btn btn-link">détails</button><button class="btn btn-link">choisir</button></td>
                        </tr>
                    </tbody>
                </table> -->
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
            var vue = new Vue( {
                el: "#vue",
                data: {
                    isInscriptionsOuvertes: false,
                    isInscriptionCommencee: false,
                    nouvelleInscription: {
                        codePostal: "",
                        commune: "",
                        numeroEtVoie : "",
                        pays: "",
                        civilite: "",
                        dateDeNaissance: null,
                        nom: "",
                        prenom: "",
                        referenceDossier: "000000",
                        diplomeId: null
                    },
                    diplomes: []
                },
                mounted: function() {
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
                },
                methods: {
                    commencerInscription(e) {
                        this.isInscriptionCommencee = true;
                        axios.get('http://localhost:9090/generateNewInscription', {withCredentials: false}).then(response => {
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
                        })
                        .then((response) => {
                            console.log(response.data);
                            this.diplomes.push(response.data);
                            Notiflix.Notify.Success('L\'inscription a été sauvegardée avec succès');
                        })
                        .catch((error) => {
                            Notiflix.Notify.Failure('La nouvelle inscription n\'a pas pu être sauvegardée. <br/>Cause : ' + error );
                            
                        });
                        //window.location.href = "http://localhost:8080/vue-server/inscriptions.jsp";
                    }
                }
            });
        </script>
    </body>
</html>