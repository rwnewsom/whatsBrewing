<template>
    <div id="brewery-details">
        <div class="brewery">
            <div class="breweryDetails">
                <h2 class="name"><span>{{currentBrewery.name}}</span></h2>
                <p class="description">{{currentBrewery.description}}</p>
                <div class="address">
                    <p>Street Address:</p>
                    <p>{{currentBrewery.streetNumber}} {{currentBrewery.streetName}}</p>
                    <p>{{currentBrewery.cityName}}, {{currentBrewery.state}} {{currentBrewery.zipCode}}</p>
                    <p>{{currentBrewery.phoneNumber}}</p>
                </div>
                <p class="url"><a v-bind:href="currentBrewery.url" > Website </a></p>
                <div class="map" v-if="renderMap">
                        <iframe id="map-iframe" v-bind:src="currentBrewery.mapUrl" loading="lazy"></iframe>
                </div>
            </div>

            
            <div class="beerDetails">
                <h4>Current Beers</h4>
                <div class="line" />
                <div id="beer">
                    <!-- all the beers show on the line below-->
                    <router-link 
                        v-for="beer of allBeers" 
                        v-bind:key="beer.id" 
                        v-bind:to="{name: 'beerDetails', 
                            params: {id: beer.breweryId, beerId: beer.beerId}}"
                        class="noline beer-card">
                        <img class="beer-card-img" src="../assets/proriat-hospitality-unsplash.jpg" />
                        <div class="beer-card-title">{{beer.name}}</div>
                    </router-link>
                </div>
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
//import BeerList from '../components/BeerList.vue'
import Ad from "../components/Ad.vue"
import AddBeer from "../views/AddBeer.vue";


export default {
    name: 'BreweryDetails',
    components: {
        //BeerList,
        AddBeer,
        Ad
    },

    computed: {
        currentBrewery(){
            return this.$store.state.breweries;
        },
        allBeers(){
            return this.$store.state.beer;
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

.beerDetails{
    padding-left: 2rem;
    padding-top: 1rem;
    margin-top: 2rem;
}

.breweryDetails{
    padding-left: 2rem;
    padding-top: 1rem;
    display: grid;
    grid-template-areas: 
        "name name name"
        "dsc dsc dsc"
        "adr map map"
        "url map map";
    margin-top: 4rem;
    grid-template-rows: auto auto 1fr 1fr;
}

.address{
    grid-area: adr;
    font-size: large
}

.map{
    grid-area: map;
    display: flex;
    justify-content: center;
}

#map-iframe {
    width: 80%;
    border: 2px solid $black;
    height: 100%;
}

.address p:first-child{
    border-top: 1px solid $black;
    border-bottom: 1px solid black;
    text-align: center;
    margin-bottom: 1rem;
    font-style: oblique;
    font-weight: 500;
}

.name{
    grid-area: name;
    margin-bottom: 2rem;
    padding: 2rem;
    height: 3rem;
    background-color: $blue;
    display: flex;
    align-items: center;
    justify-content: center;
}

.url{
    padding-top: 1rem;
    grid-area: url;
}

.description{
    grid-area: dsc;
    margin-bottom: 2rem;
    text-align: left;
    font-size: large;
}

#brewery-details {
    display: grid;
    grid-template-areas: "details ad";
    grid-template-columns: 4fr 1fr;
    height: 100%;
    background: $white;
}

.brewery {
    grid-area: details;
    border: 1px solid $black;
    background-color: $white;
    margin: 1rem;
    padding: 1rem;
    filter: drop-shadow(0.25rem 0.1rem 0.5rem $black);
    border-radius: 5px;
}

#beer {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  width: 100%;
}

.beer-card-img {
  width: 100%;
  height: 300px;
  object-fit: cover;
  border-top-right-radius: 20px;
  border-top-left-radius: 20px;
}

.beer-card-title {
  color: $white;
  text-transform: uppercase;
}

.beer-card {
  color: $white;
  background: $blue;
  text-align: center;
  width: 20rem;
  height: 355px;
  margin: 1rem;
  margin-top: 2rem;
  font-size: 2rem;
  font-weight: bold;
  font-family: sans-serif;
  border-radius: 20px;
  margin-bottom: 2rem;
}

.line {
    height: .5rem;
    background: $blue;
    border-radius: 2rem;
}
</style>