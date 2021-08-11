<template>
<div class="beer-display">

    <div class="filter-box">
        <h3>Filter by:</h3>
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
            <div v-if="resultCount > 1" id="brewery-result-count">{{resultCount}} results</div>
            <div v-else id="brewery-result-count">{{resultCount}} result</div>
            <div id="beers">

                <!-- all the beers show on the line below-->
                <router-link 
                        v-for="beer of pageBeers" 
                        v-bind:key="beer.id" 
                        v-bind:to="{name: 'beerDetails', 
                            params: {id: beer.breweryId, beerId: beer.beerId}}"
                        class="noline beers-card"
                        :class="(beer.name)? '':'hidden'">
                    <div class="beer-card">
                        <img class="beers-card-img" v-bind:src="beer.beerImageUrl"  />
                        <div class="beers-card-brewery">{{beer.breweryName}}</div>
                        <div class="beers-card-title">{{beer.name}}</div>
                        <div class="beers-card-style">{{beer.style}}</div>
                    </div>
                </router-link>
                <div id="pagination-breweries">
                    <jw-pagination :pageSize="20" :items="filteredBeers" @changePage="onChangePage" />
                </div>
            </div>
        </div>
    <Ad/>   
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
            pageBeers: [],
            resultCount: 0
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
            this.updateResultCount(result.length)

            return result;
        },
        // currentBrewery(){
        //     return this.$store.state.breweries;
        // }
        
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
    },
    methods: {
        onChangePage(pageBeers) {
        this.pageBeers = pageBeers;
        },
        updateResultCount(count) {
        this.resultCount = count;
        },
    }
}
</script>

<style lang="scss">
@import "../styles/colors.scss";

.beerlink{
    color: $white
}

.hidden {
    visibility: hidden;
}

.beer-list{
    border: 1px solid $black;
    padding: 2rem;
    grid-area: main;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    align-items: flex-start;
}

#beers {
    display:flex;
    margin: 0 auto;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: center;
}

.beers-card-style {
    color: $white;
    font-size: medium;
    font-weight: normal;
}

.beers-card-brewery {
    color: $white;
    font-size: medium;
    font-weight: normal;
}

.beers-card-img {
  width: 100%;
  height: 250px;
  object-fit: cover;
  border-top-right-radius: 20px;
  border-top-left-radius: 20px;
}


.filter-box {
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
  grid-template-columns: 17.5rem auto 17.5rem;
}

.beers-card-title {
  color: $white;
  text-transform: uppercase;
  font-size: x-large;
}

.beer-card {
  color: $white;
  background: $blue;
  text-align: center;
  width: 15rem;
  max-height: 350px;
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