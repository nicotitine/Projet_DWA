<template>
    <div>
        {{ code }} - {{ descriptif }}
        <button class='btn btn-link' v-on:click='sayHello()'>Detail</button>
    </div> 
</template>
<script>
module.exports = {
    props: {
        code: String,
        descriptif: String,
        anneeDeNaissance: Number,
        inscrit: Boolean,
        autresInformations: Object
    },
    methods: {
        sayHello: function() {
            this.$emit('click-detail');
            console.log("clicked");
            
        }
    }
}
</script>