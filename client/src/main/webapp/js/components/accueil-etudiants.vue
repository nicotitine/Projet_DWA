<template>
    <div>
        <h1>Liste des diplomes</h1>
        <ul style='margin: 20px 20px;'>
            <li v-for="e in diplomes" style="margin: 5px auto;">
                <detail-etudiant v-on:click-detail="detail(e)" v-bind:code="e.code" v-bind:descriptif="e.descriptif" ></detail-etudiant>
            </li>
        </ul>
    </div>
</template>

<script>
module.exports = {
    data: function() {
        return {
            diplomes: []
        }
    },
    components: {
        'detail-etudiant' : httpVueLoader('js/components/detail-etudiant.vue')
    },
    methods: {
        detail: function(_diplome) {
            this.$router.push({ name: "detail-etudiant", params: {id: _diplome.code}, props: {d: _diplome} })
        }
    },
    created: function() {
        axios.get('http://localhost:9090/diplomes',{withCredentials: false}).then(response => {
            console.log(response.data);
            
            this.diplomes = response.data;
            console.log(this.diplomes);
            
        }, response => {
            // traiter en cas d'erreur
        });
    }
}
</script>
