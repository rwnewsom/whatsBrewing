<template>
  <div class="beerDeets">
      <h1> Beer: The Devil is in the Details.... </h1>
      <!-- if not working check case -->
      <h2>Name: {{currentBeer.name}}</h2>
      <h3>Style: {{currentBeer.style}}</h3>
      <h4>Description: {{currentBeer.description}}</h4>
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

.beerDeets{
    padding-left: 2rem;
}

</style>