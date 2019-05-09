<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf8">
        <link rel='stylesheet' href='webjars/bootstrap/4.2.1/css/bootstrap.min.css'>
        <title>Portail d'inscription</title>
    </head>
    <body class="bg-dark" style="padding-top: 75px;">
        <div id="vue">
            <nav class="fixed-top navbar navbar-expand-lg navbar-dark bg-white" style="box-shadow: 0px 0px 10px black" id="navVue">
                <div class="collapse navbar-collapse fixed justify-content-md-center">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <h1 class="text-dark">Portail d'inscription</h1>
                        </li>
                    </ul>
                </div>
            </nav>

            <div v-if="!isInscriptionCommencee" class="jumbotron pt-4 pb-4" style="width: 80%; margin: 40px auto;">
                <h2 class="text-center">Bienvenue sur le portail d'inscription</h2>
                <h4 class="text-center" v-if="isInscriptionsOuvertes">Deux choix s'offrent à vous : </h4>
                <br/>
                <div class="text-center" v-if="!isInscriptionsOuvertes">
                    Les inscriptions sont actuellement fermées. <br/>
                    Merci de réessayer plus tard...
                </div>
                <div v-else style="display: flex">
                    <div style="flex: 1" class="pl-4 pr-4">
                        <h4 class="text-center">C'est la première fois que vous venez</h4>
                        <br/>
                        <div class="text-center">
                            <button class='btn btn-primary' v-on:click="commencerInscription">Démarrer une nouvelle inscription</button>
                        </div>
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
                        <p style="font-size: 14px; color: grey;" class="ml-4">
                           - Vous pouvez modifier votre inscription à tout moment avant de l'avoir soumise.<br/>
                           - Pour cela, munissez vous de votre numéro d'inscription (sous la forme IE1234)
                        </p>
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
                        
                    </div>
                </div>
            </div>
                
            <div v-if="isInscriptionCommencee" class="jumbotron pt-4 pb-4" style="width: 80%; margin: 40px auto;">
                <h2></h2>
                <br/>
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
            var vue = new Vue( {
                el: "#vue",
                data: {
                    isInscriptionsOuvertes: false,
                    isInscriptionCommencee: false,
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
                    axios.get('http://localhost:9090/generateNewInscription', {withCredentials: false}).then(reponse => {
                            console.log(reponse.data);
                        }, response => {
                            console.log(response.data);
                            
                        })
                },
                methods: {
                    commencerInscription(e) {
                        this.isInscriptionCommencee = true;
                        
                    }
                }
            });
        </script>
    </body>
</html>