<template>
    <div id="brewery-details">
        <div class="brewery">
            <div v-if="showUpdate"><update-brewery v-bind:updatedBrewery="currentBrewery" /></div>
                <div id="logoDiv"><img id="breweryLogo" class="beer-card-img" v-bind:src="currentBrewery.logo"  /></div>
            <div class="breweryDetails">
                <h2 class="name"></h2>
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
                <div v-if="deleteOrAddAuth" class="buttonsDiv">
                    <add-beer />
                </div>
                <div v-else>
                    <p>If you are a brewer and would like edit privileges, please contact support.</p>
                </div>
                <div class="line" />
                <div class="beer-background">
                    <div id="beers">
                        <router-link 
                            v-for="beer of allBeers" 
                            v-bind:key="beer.id" 
                            v-bind:to="{name: 'beerDetails', 
                                params: {id: beer.breweryId, beerId: beer.beerId}}"
                            class="noline beers-card"
                            :class="(beer.name)? '':'hidden'">
                        <div class="beer-card">
                            <img class="beers-card-img" v-bind:src="beer.beerImageUrl"  />
                            <div class="beer-card-text">
                                <div class="beers-card-brewery">{{beer.breweryName}}</div>
                                <div class="beers-card-title">{{beer.name}}</div>
                                <div class="beers-card-style">{{beer.style}}</div>
                            </div>
                        </div>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
        <Ad v-bind:numAds="3" />
    </div>

</template>

<script>
import BreweryService from '../services/BreweryService.js'
//import BeerList from '../components/BeerList.vue'
import Ad from "../components/Ad.vue"
import AddBeer from "../views/AddBeer.vue";
import UpdateBrewery from "../components/UpdateBrewery.vue";


export default {
    name: 'BreweryDetails',
    components: {
        //BeerList,
        AddBeer,
        Ad,
        UpdateBrewery
    },

    computed: {
        currentBrewery(){
            return this.$store.state.brewery;
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
        showUpdate(){
        if(this.$store.state.user.role == "admin" || this.$store.state.user.role == "brewer") {
          return true;
        }
        return false;
      }
    },
    mounted () {
        window.scrollTo(0, 0)
    },

    /* watch: {
        allBeers(){
        let breweryId = parseInt(this.$route.params.id);

        BreweryService.beer(breweryId)
        .then(result => {
            console.log('Promise Resolved', result);

            if(result.status === 200) {
                this.$store.commit('LOADED_BEER', result.data);
            }
        });
        }
    }, */



    created(){
        console.log('Requesting brewery details.');

        let breweryId = parseInt(this.$route.params.id);

        BreweryService.detail(breweryId)
        .then(result => {
            console.log('Promise resolved.', result);
            if(result.status === 200){
                this.$store.commit('LOADED_BREWERY', result.data);
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

#logoDiv{
    margin-top: 1rem;
    margin-bottom: -4rem;
    width: 30rem;
    margin-left: auto;
    margin-right: auto;
}

#breweryLogo{
    text-align: center;
    width:100%;
    height: 100%;
    display: block;
    margin: auto;
}

.beerDetails{
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
    border-radius: 2rem;
    grid-area: name;
    margin-bottom: 2rem;
    padding: .5rem;
    height: .5rem;
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

.beer-background {
    background-size: cover;
    background-image: url("../assets/background.jpg");
}

#beers {
    display:flex;
    padding: 0 auto;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: center;
}

#breweryDeetsBeerCardPic{
    background-color: rgba(245, 245, 245, 0.945);
}

.line {
    height: .5rem;
    background: $blue;
    border-radius: 2rem;
}
#deleteButton{
        background-color: $yellow;
        color: white;
        border: 1;
        border-color: black;
}
#deleteButton:hover{
    background-color: red;
    outline-color: black;
}
</style>