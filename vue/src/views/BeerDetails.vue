<template>
  <div id="beer-details">
      <div class="capsule">
        <h1 class="header"> Beer: The Devil is in the Details.... </h1>
        <!-- if not working check case -->
        <div class = "detailGroup">
            <div class="row">
                <div class="col-25">
                    <h3>Name:</h3>
                </div>
                <div class="col-75">
                    <h3>{{currentBeer.name}}</h3>
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <h3>Brewery:</h3>
                </div>
                <div class="col-75">
                    <h3>{{currentBrewery.name}}</h3>
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <h3>Style:</h3>
                </div>
                <div class="col-75">
                    <h3>{{currentBeer.style}}</h3>
                </div>
            </div>
        </div>
        
        <h5 class="desc">Description: {{currentBeer.description}}</h5>

        <div class="abv-ibu">   
            <div class="row">
                <div class="col-25">         
                    <h3 class="abv" data-toggle="tooltip" href="#" data-placement="right" title="Alcohol By Volume">ABV:</h3>
                </div>
                <div class="col-75">
                    <h3> {{currentBeer.abv}}</h3>
                </div>
            </div>

            <div class="row">
                <div class="col-25">         
                    <h3 class="ibu" v-if="currentBeer.ibu" data-toggle="tooltip" href="#" data-placement="right" title="International Bitterness Units">IBU:</h3>
                </div>
                <div class="col-75">
                    <h3 v-if="currentBeer.ibu"> {{currentBeer.ibu}}</h3>
                </div>
            </div>

            <div class="row">
                <div class="col-25">         
                    <h3 v-if="!currentBeer.ibu" data-toggle="tooltip" href="#" data-placement="right" title="International Bitterness Units">IBU:</h3>
                </div>
                <div class="col-75">
                    <h3>Not Listed</h3>
                </div>
            </div>


            
            
            
        </div>
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
    name: 'BeerDetails',
    computed: {
        currentBeer(){
            return this.$store.state.beerDetails;
        },
        currentBrewery(){
            return this.$store.state.breweries;
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
        }),
        console.log('Requesting brewery details.');

        let currentBreweryId = parseInt(this.$route.params.id);

        BreweryService.detail(currentBreweryId)
        .then(result => {
            console.log('Promise resolved.', result);
            if(result.status === 200){
                this.$store.commit('LOADED_BREWERIES', result.data);
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

.capsule{
    border: 1px solid $black;
    background-color: $white;
    margin: 1rem;
    padding: 1rem;
    filter: drop-shadow(0.25rem 0.1rem 0.5rem $blue);
    border-radius: 5px;
}

#beer-details {
    display: grid;
    grid-template-areas: "details ad";
    grid-template-columns: 4fr 1fr;
    height: 100%;
    padding-top: 2rem;
    padding-left: 2rem;
}

.header {
    text-align: center;
    text-align: center;
    margin-bottom: 1rem;
    font-style: oblique;
}

.tooltip{
    position:absolute;
    z-index:1020;
    display:block;
    visibility:visible;
    padding:5px;
    font-size:13px;
    opacity:0;
    filter:alpha(opacity=0)
}
.tooltip.in{
    opacity:.8;
    filter:alpha(opacity=80)
}

.tooltip.right .tooltip-inner{ 
width:310px; 
height: 30px;
padding:3px 8px; 
text-align:center; 
background-color:#CC0000; 
-webkit-border-radius:5px; 
-moz-border-radius:5px; 
border-radius:15px 
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

.detailGroup {
    margin: 0;
    padding: 0;
}

.abv-ibu{
    margin-top: 2rem;
    margin-bottom: 2rem;
}

.abv-ibu h3{
    margin: 0;
    padding: 0;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75 {
    width: 100%;
    margin-top: 0;
  }
}



</style>