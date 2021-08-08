<template>
<div class="beer-display">

    <div class="beer-list">
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Style</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="beer of allBeers" v-bind:key="beer.beerId">
                    <td> <router-link class="beerlink" v-bind:to="{name:'beerDetails', params: {id: beer.breweryId, beerId: beer.beerId}}"> {{beer.name}} </router-link></td>
                    <td>{{beer.style}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</template>

<script>
import BreweryService from '../services/BreweryService.js'
export default {

    

    computed: {
        allBeers(){
            return this.$store.state.beer;
        }
        
    },

    created(){
        console.log('Attempting beer request...');
        let breweryId = parseInt(this.$route.params.id);

        BreweryService.beer(breweryId)
        .then(result => {
            console.log('Promise Resolved', result);

            if(result.status === 200) {
                this.$store.commit('LOADED_BEER', result.data);
            }
        });
    }

}
</script>

<style lang="scss">
@import "../styles/colors.scss";
.beer-display .beer-list table tbody tr td a:nth-child(odd) {
    // color: #E5DADA changing to close color on colors.scss - RN
    color: $black;
}

.beer-display .beer-list table tbody tr td router-link:nth-child(even) {
    // color: #E5DADA changing to close color on colors.scss - RN
    color: $white;
}

table {
    box-sizing: border-box;
    border: 1px solid $blue;
    width: 100%;
    margin-left: auto;
    margin-right: auto;
}

table tr {
    border: 1px solid $black;
}

table tr td {
    padding-left: 1rem;
}

table tr th {
    padding-left: 1rem;
}



</style>