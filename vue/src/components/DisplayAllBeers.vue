<template>
<div class="beer-display">

    <div class="beer-list">
        <table>
            <thead>
                <tr>
                    <th>Brewery</th>
                    <th>Name</th>
                    <th>Style</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="beer of allBeers" v-bind:key="beer.beerId">
                    <td> <router-link class="beerlink" v-bind:to="{name:'breweryDetails', params: {id: beer.breweryId}}"> {{ beer.breweryName }} </router-link></td>
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

        BreweryService.listAllBeers()
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

.beerlink{
    color: #E5DADA
}

tr:nth-child(even){
    background-color: $tiffanyblue;
    color: $richblack;
}
.beer-list{
    border: 1px solid $orangepeel;
    width: 80%;
    padding: 2rem;
}

</style>