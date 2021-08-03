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
                <tr v-for="beer of allBeers" v-bind:key="beer.breweryId">
                    <td>{{beer.name}}</td>
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

<style>

</style>