<template>
    <div>
        {{ code }} - {{ descriptif }}
        
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
