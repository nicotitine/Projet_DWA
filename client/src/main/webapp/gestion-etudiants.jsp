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
        <div id="gestionEtudiants" class='jumbotron' style="width: 80%; margin: 40px auto; box-shadow: 0px 0px 20px black; border-radius: 10px;">
            <router-view></router-view>
        </div>
        <script src="<c:url value = '/webjars/vue/2.5.16/vue.js'/>"></script>
        <script src="<c:url value = '/webjars/vue-router/3.0.2/dist/vue-router.js'/>"></script>
        <script src="<c:url value = '/webjars/axios/0.18.0/dist/axios.js'/>"></script>  
        <script src="<c:url value = '/webjars/http-vue-loader/1.3.5/src/httpVueLoader.js'/>"></script>                      
        <script src="<c:url value = '/js/gestion-etudiants.js'/>"></script>
    </body>
</html>