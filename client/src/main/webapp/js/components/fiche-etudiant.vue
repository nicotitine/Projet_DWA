<template>
    <div>

    <detail-etudiant v-bind:nom="e.nom" v-bind:prenom="e.prenom" v-bind:annee-de-naissance="1980"></detail-etudiant>
    </div>
</template>
<script>
module.exports = {
    methods: {},
    components: {
        'detail-etudiant' : httpVueLoader('js/components/detail-etudiant.vue')
    },    
    data: function() {
        return {
            e: {
                nom: "Foo",
                prenom: "Bar"
            }
        }
    },
    created: function() {
        var id = this.$route.params.id;
        axios.get('http://localhost:8180/etudiants/' + id).then(response => {
            this.e = response.data;
        }, response => {
            // traiter en cas d'erreur
        });
    }  
}
</script>