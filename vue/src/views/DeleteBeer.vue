<template>
    <div>
        <div class="deleteButton">
            <button type="button" id="deleteButton" class="btn btn-outline-danger" v-on:click="deleteBeer">Delete Beer</button>
        </div>
    </div>
</template>

<script>
import BreweryService from '../services/BreweryService.js';

export default {
    name: 'deleteBeer',
    methods: {
        deleteBeer() {
            let confirmed = confirm('Are you sure you want to delete this beer? This cannot be undone.');

            if (confirmed) {
                // this.$store.commit('DELETE_BEER', this.beer.id);
                // this.$router.push({name: 'breweries'});
                BreweryService.deleteBeer(this.$route.params.beerId)
                .then(this.$router.push({name: 'breweries'}))
            }
        }
    }

}
</script>

<style lang="scss">
@import "../styles/colors.scss";
#deleteButton{
    color: $white;
    background-color: $blue;
    margin-top: 1rem;
}
#deleteButton:hover{
    background-color:$white;
    color: $white;
}
    
</style>