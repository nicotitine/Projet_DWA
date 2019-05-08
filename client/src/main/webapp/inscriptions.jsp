<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf8">
        <link rel='stylesheet' href='webjars/bootstrap/4.2.1/css/bootstrap.min.css'>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
              
                    <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
                      <ul class="navbar-nav">
                        <li class="nav-item active">
                          <h2 class="text-white">Gestion étudiants</h2>
                        </li>
                      </ul>
                    </div>
                  </nav>
        
        <div id="gestionEtudiants" class='jumbotron' style="width: 80%; margin: 40px auto;">
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
                        <td>{{d.descriptif}}</td>
                        <td>{{d.type.libelle}}</td>
                        <td>{{d.responsable}}</td>
                        <td><button class="btn btn-link">détails</button></td>
                    </tr>
                </tbody>
            </table>

            <button class='btn btn-primary' v-on:click="ajouterNouveauDiplome">Ajouter un diplome</button>

            <div class="modal fade" id="nouveauDiplomeModale" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Ajouter un diplome</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div style="display: flex; flex-direction: row">
                                        <form style='flex: 2'>
                                                <div class="form-row">
                                                  <div class="form-group  ">
                                                    <label for="inputEmail4">Code</label>
                                                    <input class="form-control" id="inputEmail4" v-model="diplomeNouveauCode" placeholder="6 caractères">
                                                  </div>
                                                  <div class="form-group col-md-6">
                                                    <label for="inputPassword4">Libellé</label>
                                                    <input class="form-control" id="inputPassword4" v-model="diplomeNouveauLibelle" placeholder="Libellé...">
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <label for="inputAddress">Descriptif</label>
                                                  <textarea type="text" class="form-control" id="inputAddress" v-model="diplomeNouveauDescriptif" placeholder="Cours descriptif du diplome..."></textarea>
                                                </div>
                                                
                                                <div class="form-row">
                                                  <div class="form-group col-md-6">
                                                    <label for="inputCity">Responsable</label>
                                                    <input type="text" class="form-control" id="inputCity" v-model="diplomeNouveauResponsable" placeholder="Enseignant responsable...">
                                                  </div>
                                                </div>
                                                <div class="form-row">
                                                  <div class="form-group col-md-12">
                                                    <label for="inputState">Type</label>
                                                    <div class="form-row form-group">
                                                        <select id="inputState" class="form-control custom-select col-md-8" v-model="diplomeNouveauType">
                                                            <option selected>Choisir un type...</option>
                                                            <option v-for="t in typesDiplomes"  v-bind:value="t">
                                                                {{t.id}} - {{t.libelle}}
                                                            </option>
                                                        </select>
                                                        <button class='form-control btn btn-link col-md-4' v-on:click="ajouterNouveauType">Ajouter un type</button>
                                                    </div>
                                                    
                                                   
                                                    <div class='form-row' v-if='ajoutTypeEnCours' style="margin-top: 20px">
                                                        <div class="form-group col-md-8">
                                                            <input class="form-control" v-model="libelleNouveauType" placeholder="Libelle du type de diplome...">
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <button class="btn btn-primary" v-on:click="envoyerNouveauType">Ajouter type</button>
                                                        </div>
                                                    </div>

                                                  </div>                                             
                                                </div>
                                                
                                                <div>
                                                    <h5>Les UEs du diplome</h5>
                                                </div>
                                              </form>

                                              <div style="flex: 1; border-left: 1px solid #E9ECEF; margin: 20px; padding: 20px;">
                                                  <h5>Liste des UEs</h5>
                                                  <table class="table">
                                                      <thead>
                                                          <tr>
                                                              <th>Code</th>
                                                              <th>Libellé</th>
                                                              <th>Obligatoire</th>
                                                              <th>Action</th>
                                                          </tr>
                                                      </thead>
                                                      <tbody>
                                                          <tr v-for="u in ues">
                                                              <td>{{u.code}}</td>
                                                              <td>{{u.libelle}}</td>
                                                              <td>{{u.obligatoire}}</td>
                                                              <td><button class="btn btn-link">Ajouter</button></td>
                                                          </tr>
                                                      </tbody>
                                                  </table>
                                                  <div class="jumbotron pt-2 pb-2">
                                                    <h5>Ajouter une UE</h5>
                                                    <div class="form-group">
                                                        <label for="ajouterUECodeInput">Code</label>
                                                        <input class="form-control" id="ajouterUECodeInput" placeholder="6 caractères">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="ajouterUELibelleInput">Libellé</label>
                                                        <input class="form-control" id="ajouterUELibelleInput" placeholder="Libellé...">
                                                    </div>
                                                    <div class="form-group col-auto">
                                                            <div class="custom-control custom-checkbox">
                                                              <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
                                                              <label class="custom-control-label" for="customControlAutosizing">Remember my preference</label>
                                                            </div>
                                                          </div>
                                                    <button class='btn btn-primary'>Valider</button>
                                                  </div>

                                              </div>
                                </div>
                                    
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                <button type="button" class="btn btn-primary" v-on:click="envoyerNouveauDiplome">Ajouter</button>
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
        
        <script>
            var vue = new Vue({
                el: '#gestionEtudiants',
                data: {
                    diplomes : [],
                    typesDiplomes : [],
                    ues : [],
                    ajoutTypeEnCours: false,
                    libelleNouveauType : "",
                    diplomeNouveauCode : "",
                    diplomeNouveauLibelle : "",
                    diplomeNouveauDescriptif : "",
                    diplomeNouveauType : null,
                    diplomeNouveauResponsable : ""
                },
                mounted: function() {
                    axios.get('http://localhost:9090/diplomes',{withCredentials: false}).then(response => {
                        console.log(response.data);
            
                        this.diplomes = response.data;
            
                    }, response => {
                        // traiter en cas d'erreur
                    });

                    axios.get('http://localhost:9090/typesDiplomes',{withCredentials: false}).then(response => {
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
                    ajouterNouveauDiplome() {
                        $("#nouveauDiplomeModale").modal('show');
                        
                    },

                    ajouterNouveauType(e) {
                        e.preventDefault();
                        if(this.ajoutTypeEnCours) {
                            this.ajoutTypeEnCours = false;
                        } else {
                            this.ajoutTypeEnCours = true;
                        }
                        
                    },

                    envoyerNouveauType(e) {
                        axios.post('http://localhost:9090/addType?libelle=' + this.libelleNouveauType, {withCredentials: false}).then(response => {
                            console.log(response.data);
                            this.typesDiplomes.push(response.data);
                            
                        })
                        e.preventDefault();
                    },

                    envoyerNouveauDiplome(e) {
                        console.log(this.diplomeNouveauCode, this.diplomeNouveauLibelle, this.diplomeNouveauDescriptif, this.diplomeNouveauType.id, this.diplomeNouveauType.libelle);
                        axios.post("http://localhost:9090/addDiplome?code=" + this.diplomeNouveauCode + "&libelle=" + this.diplomeNouveauLibelle + "&descriptif=" + this.diplomeNouveauDescriptif + "&typeId=" + this.diplomeNouveauType.id + "&typeLibelle=" + this.diplomeNouveauType.libelle + "&responsable=" + this.diplomeNouveauResponsable, {withCredentials: false}).then(response => {
                            console.log(response.data);
                            this.diplomes.push(response.data); 
                            
                        });
                    }
                }
            })
        </script>
    </body>
</html>