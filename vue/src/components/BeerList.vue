<template>
<div class="beer-display">

    <div class="beer-list">
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Style</th>
                    <th>Description</th>
                    <th>ABV</th>
                    <th>IBU</th>
                </tr>
            </thead>

            <tbody>
                <tr v-for="beer of allBeers" v-bind:key="beer.breweryId">
                    <td>{{beer.Name}}</td>
                    <td>{{beer.Style}}</td>
                    <td>{{beer.Description}}</td>
                    <td>{{beer.ABV}}</td>
                    <td>{{beer.IBU}}</td>
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

        BreweryService.beer()
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