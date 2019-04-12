<template>
    <div>
        <h1>Liste des étudiants</h1>
        <ul style='margin: 20px 20px;'>
            <li v-for="e in etudiants" style="margin: 5px auto;">
                <detail-etudiant v-on:click-detail="detail(e)" v-bind:nom="e.nom" v-bind:prenom="e.prenom" v-bind:annee-de-naissance="1980"></detail-etudiant>
            </li>
        </ul>
    </div>
</template>

<script>
module.exports = {
    data: function() {
        return {
            etudiants: [{
                id: 1,
                nom: "Doe",
                prenom: "Jane"
            },
            {
                id: 2,
                nom: "Doe",
                prenom: "John"
            }]
        }
    },
    components: {
        'detail-etudiant' : httpVueLoader('js/components/detail-etudiant.vue')
    },
    methods: {
        detail: function(etudiant) {
            this.$router.push({ name: "detail-etudiant", params: {id: etudiant.id}, props: {e: etudiant} })
        }
    },
    created: function() {
        axios.get('http://localhost:8180/etudiants',{withCredentials: true}).then(response => {
            this.etudiants = response.data;
        }, response => {
            // traiter en cas d'erreur
        });
    }
}
</script>
