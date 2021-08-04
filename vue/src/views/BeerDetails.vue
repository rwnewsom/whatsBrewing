<template>
  <div>
      <h1> The Deets </h1>
      <!-- if not working check case -->
      <h2>{{currentBeer.name}}</h2>
      <h3>{{currentBeer.style}}</h3>
      <h4>{{currentBeer.description}}</h4>
      <h3>ABV: {{currentBeer.abv}}</h3>
      <h3 v-if="currentBeer.ibu">IBU: {{currentBeer.ibu}}</h3>
      <h3 v-if="!currentBeer.ibu">IBU: Not Listed</h3>
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService.js'
export default {
    computed: {
        currentBeer(){
            return this.$store.state.beerDetails;
        }
    },
    created(){
        console.log('Requesting beer details...');

        let breweryId = parseInt(this.$route.params.id);
        let beerId = parseInt(this.$route.params.beerId);

        BreweryService.beerDetails(breweryId, beerId)
        .then(result => {
            console.log('Promise resolved.', result);
            if(result.status === 200){
                this.$store.commit('LOADED_BEER_DETAILS', result.data);
            }
        });
    }

}
</script>

<style>

</style>