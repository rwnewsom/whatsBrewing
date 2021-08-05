<template>
  <div id="beer-details">
      <div>
        <h1> Beer: The Devil is in the Details.... </h1>
        <!-- if not working check case -->
        <h2>Name: {{currentBeer.name}}</h2>
        <h3>Style: {{currentBeer.style}}</h3>
        <h4>Description: {{currentBeer.description}}</h4>
        <h3>ABV: {{currentBeer.abv}}</h3>
        <h3 v-if="currentBeer.ibu">IBU: {{currentBeer.ibu}}</h3>
        <h3 v-if="!currentBeer.ibu">IBU: Not Listed</h3>
         <div class="ReviewDetails">
                <review-list />

        </div>
      </div>
  <Ad />    
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService.js'
import Ad from "../components/Ad.vue";
import ReviewList from '../components/ReviewList.vue';

export default {
    computed: {
        currentBeer(){
            return this.$store.state.beerDetails;
        }
    },
      components: {
        Ad,
        ReviewList,
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

<style lang="scss">
@import "../styles/colors.scss";

/* .beerDeets{
    padding-left: 2rem;
} */

#beer-details {
    display: grid;
    grid-template-areas: "details ad";
    grid-template-columns: 4fr 1fr;
    height: 100%;
    padding-top: 2rem;
    padding-left: 2rem;
}

</style>