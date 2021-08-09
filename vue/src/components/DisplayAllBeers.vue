<template>
<div class="beer-display">

    <div class="container">
        <h3>Search by:</h3>
        <div class="row">
            <div>
                <label for="searchBrewery">Brewery: </label>
            </div>
            <div class>
                <input id="searchBrewery" type="text" v-model="searchBrewery">
            </div>
        </div>
        <div class="row">
            <div>
                <label for="searchName">Beer Name: </label>
            </div>
            <div>
                <input id="searchName" type="text" v-model="searchName">
            </div>
        </div>
        <div class="row">
            <div>
                <label for="searchStyle">Beer Style: </label>
            </div>
            <div>
                <input id="searchStyle" type="text" v-model="searchStyle">
            </div>
        </div>


    </div> 

        <div class="beer-list">
        <div class="line" />
            <div id="beer">
            <!-- all the beers show on the line below-->
                <router-link 
                        v-for="beer of filteredBeers" 
                        v-bind:key="beer.id" 
                        v-bind:to="{name: 'beerDetails', 
                            params: {id: beer.breweryId, beerId: beer.beerId}}"
                        class="noline beers-card">
                    <img class="beers-card-img" src="../assets/proriat-hospitality-unsplash.jpg" />
                    <div class="beers-card-title">{{beer.name}}</div>
                    <div class="beers-card-style">{{beer.style}}</div>
                </router-link>
            </div>
        </div>
    <Ad />
</div>
</template>

<script>
import BreweryService from '../services/BreweryService.js'
import Ad from "../components/Ad.vue";

export default {
    name: 'DisplayAllBeers',

    data(){
        return {
            searchBrewery: '',
            searchName: '',
            searchStyle:'',
        };

    },

    components: {
        Ad,
    },

    computed: {
        allBeers(){
            return this.$store.state.beer;
        },

        filteredBeers(){
            let result = this.allBeers.slice();

            if(this.searchBrewery || this.searchName || this.searchStyle){
                result = result.filter(beer => beer.breweryName.toLowerCase().includes(this.searchBrewery.toLowerCase()) && beer.name.toLowerCase().includes(this.searchName.toLowerCase()) && beer.style.toLowerCase().includes(this.searchStyle.toLowerCase()) );
            }

            return result;
        }
        
    },

    created(){
        console.log('Attempting beer request...');

        BreweryService.listAllBeers()
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

.beerlink{
    color: $white
}

tr:nth-child(even){
    background-color: $blue;
    color: $black;
}

.beer-list{
    border: 1px solid $yellow;
    width: 100%;
    padding: 2rem;
    grid-area: main;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}

.beers-card-style {
    font-size: medium;
    font-weight: normal;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
  margin-bottom: 0;
  padding-bottom: 0;
  font-weight: bold;
  font-style: oblique;
}

input[type=text] {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}


.beer-display {
  display: grid;
  grid-template-areas: "filt main ad";
  grid-template-columns: 1fr 3fr 1fr;
}

.beers-card-img {
  width: 100%;
  height: 250px;
  object-fit: cover;
  border-top-right-radius: 20px;
  border-top-left-radius: 20px;
}

.beers-card-title {
  color: $white;
  text-transform: uppercase;
  font-size: x-large;
}

.beers-card {
  color: $white;
  background: $blue;
  text-align: center;
  width: 15rem;
  min-height: 300;
  margin: 1rem;
  margin-top: 2rem;
  font-size: 2rem;
  font-weight: bold;
  font-family: sans-serif;
  border-radius: 20px;
  margin-bottom: 2rem;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75 {
    width: 100%;
    margin-top: 0;
  }
}


</style>