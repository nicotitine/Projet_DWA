<template>
    <div>

    <detail-etudiant v-bind:code="e.code" v-bind:descriptif="e.descriptif"></detail-etudiant>
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