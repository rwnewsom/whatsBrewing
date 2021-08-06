<template>
    <div id="brewery-details">
        <div class="brewery">
            <div class="beerDeets">
                <h1>{{currentBrewery.name}}</h1>
                <h2>{{currentBrewery.description}}</h2>
                <p>{{currentBrewery.streetNumber}} {{currentBrewery.streetName}}</p>
                <p>{{currentBrewery.cityName}}, {{currentBrewery.state}} {{currentBrewery.zipCode}}</p>
                <p>{{currentBrewery.phoneNumber}}</p>
                <p>{{currentBrewery.url}}</p>
            </div>
            <div class="beerDeets">
                <h4>Current Beers</h4>
                <beer-list />
                <add-beer />
            </div>
           

         <!--    <div class="mapouter">
                <div class="gmap_canvas">
                    <iframe width="600" height="500" id="gmap_canvas" src = {currentMapUrl}  frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://123movies-to.org">123movies</a><br><a href="https://www.embedgooglemap.net">embedgooglemap.net</a>
                </div>
            </div> -->
        </div>
        <Ad />
    </div>

</template>

<script>
import BreweryService from '../services/BreweryService.js'
import BeerList from '../components/BeerList.vue'
import Ad from "../components/Ad.vue"
import AddBeer from "../views/AddBeer.vue";


export default {
    components: {
        BeerList,
        AddBeer,
        Ad
    },
    computed: {
        currentBrewery(){
            return this.$store.state.breweries;
        },

        currentMapUrl(){
            return '"' +this.currentBrewery.mapUrl+'"';
        }
    },
    created(){
        console.log('Requesting brewery details.');

        let breweryId = parseInt(this.$route.params.id);

        BreweryService.detail(breweryId)
        .then(result => {
            console.log('Promise resolved.', result);
            if(result.status === 200){
                this.$store.commit('LOADED_BREWERIES', result.data);
            }
        });
    }
}
</script>

<style>

.beerDeets{
    padding-left: 2rem;
}

#brewery-details {
    display: grid;
    grid-template-areas: "details ad";
    grid-template-columns: 4fr 1fr;
    height: 100%;
}

.brewery {
    grid-area: details;
}

/* .mapouter{
    position:relative;
    text-align:right;
    height:500px;
    width:600px;
} */

/* .gmap_canvas{
    overflow:hidden;
    background:none!important;
    height:500px;
    width:600px;
    } */

</style>