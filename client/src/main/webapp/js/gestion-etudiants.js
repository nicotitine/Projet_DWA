const routes = [
    { path: '/', component:  httpVueLoader('js/components/accueil-etudiants.vue') },
    { name: "detail-etudiant", path: '/detail/:id', component: httpVueLoader('js/components/fiche-etudiant.vue') },
]

const router = new VueRouter({
    routes: routes
})


const gestionEtudiants = new Vue({
    router: router
}).$mount('#gestionEtudiants')