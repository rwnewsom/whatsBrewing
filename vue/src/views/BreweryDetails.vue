<template>
    <div id="brewery-details">
        <div class="brewery">
            <div class="breweryDetails">
                <h2 class="name">{{currentBrewery.name}}</h2>
                <h4 class="description">{{currentBrewery.description}}</h4>
                <div class="address">
                    <p>Street Address:</p>
                    <p>{{currentBrewery.streetNumber}} {{currentBrewery.streetName}}</p>
                    <p>{{currentBrewery.cityName}}, {{currentBrewery.state}} {{currentBrewery.zipCode}}</p>
                    <p>{{currentBrewery.phoneNumber}}</p>
                </div>
                <p class="url"><a v-bind:href="currentBrewery.url" > Visit Website for {{currentBrewery.name}} </a></p>
                
                <div class="map" v-if="renderMap">
                        <iframe v-bind:src="currentBrewery.mapUrl" width="300" height="225" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>

            
            <div class="beerDetails">
                <h4>Current Beers</h4>
                <beer-list />
                <div v-if="deleteOrAddAuth">
                    <add-beer />
                </div>
                <div v-else>
                    <p>If you are a brewer and would like edit privileges, please contact support.</p>
                </div>
            </div>
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
    name: 'BreweryDetails',
    components: {
        BeerList,
        AddBeer,
        Ad
    },

    computed: {
        currentBrewery(){
            return this.$store.state.breweries;
        },

        renderMap(){
            if(this.currentBrewery.mapUrl){
                return true;
            }
            return false;
        },

        
        deleteOrAddAuth(){
            if (this.$store.state.user.role == "admin" ||this.$store.state.user.role == "brewer"){
                return true;
            } return false;
        },
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

<style lang="scss">
@import "../styles/colors.scss";

.beerDetails{
    padding-left: 2rem;
    padding-top: 1rem;
}

.breweryDetails{
    padding-left: 2rem;
    padding-top: 1rem;
    display: grid;
    grid-template-areas: 
        "name name name "
        "dsc dsc dsc"
        "adr . map"
        "url url url";
    grid-template-rows: max-content;
}

.address{
    grid-area: adr;
    padding-left: 1rem;
    
}

.map{
    grid-area: map;
    border: 1px solid $black;
    border-radius: 5px;
    filter: drop-shadow(0.25rem 0.1rem 0.5rem $blue);
}

.address p{
    margin: 0;
    padding: 0;
}

.address p:first-child{
    border-top: 1px solid $black;
    border-bottom: 1px solid $black;
    text-align: center;
    margin-bottom: 1rem;
    font-style: oblique;
}

.name{
    grid-area: name;
    text-align: center;
    
}

.url{
    padding-top: 1rem;
    padding-left: 1rem;
    grid-area: url;
}

.description{
    grid-area: dsc;
    padding: 1rem;
}

#brewery-details {
    display: grid;
    grid-template-areas: "details ad";
    grid-template-columns: 4fr 1fr;
    height: 100%;
}



.brewery {
    grid-area: details;
    border: 1px solid $black;
    background-color: $white;
    margin: 1rem;
    padding: 1rem;
    filter: drop-shadow(0.25rem 0.1rem 0.5rem $blue);
    border-radius: 5px;
}

</style>