<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="utf8">
    </head>
    <body>
        <div id="app">
          <input v-model="message"><br/>
          {{ message }}
        </div>

        ---------------
        
        <div id="compteur">
        <button v-on:click="tick += 1">{{ tick }}</button>
        </div>
        
        ---------------
        
        <div id='choices'>
            <page-title>Choices</page-title>
            <div  v-for="c in choices">
                <input type="checkbox" v-bind:value="c" v-model="technos">
                <label>{{c}}</label>
                <retour-ligne></retour-ligne>
            </div>
            <span>Technos: {{ technos }}</span>
        </div>  

        ---------------

  
        <script src="<c:url value = '/webjars/vue/2.5.16/vue.js'/>"></script>
        <script src="<c:url value = '/webjars/vue-router/3.0.2/dist/vue-router.js'/>"></script>
        <script src="<c:url value = '/webjars/vue-resource/1.5.1/dist/vue-resource.js'/>"></script>

        <script>

            Vue.component("retour-ligne", {
                data : function() {
                    return {
                        foo : "Bar"
                    }
                },
                template: "<br/>"
            })

            Vue.component('page-title', {
                template: '<h1><slot></slot></h1>'
            });

            var app = new Vue({
                el: '#app',
                data: {
                    message: 'Hello Vue!'
                }
            })

            var compteur = new Vue({
                el: '#compteur',
                data: {
                    tick: 0
                }
            })


            var dynamicChoices = new Vue({
                el: '#choices',
                data: {
                    technos: [],
                    choices: ["Servlet/JSP", "Spring", "Vue.js"]
                },
                methods: {
                    test: value => {}
                }
            })
        </script>
    </body>
</html>