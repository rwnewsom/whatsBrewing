<template>
<div class="beer-display">

    <div class="container">
        <h3>Search by:</h3>
        <div class="row">
            <div class="col-25">
                <label for="searchBrewery">Brewery: </label>
            </div>
            <div class="col-75">
                <input id="searchBrewery" type="text" v-model="searchBrewery">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="searchName">Beer Name: </label>
            </div>
            <div class="col-75">
                <input id="searchName" type="text" v-model="searchName">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="searchStyle">Beer Style: </label>
            </div>
            <div class="col-75">
                <input id="searchStyle" type="text" v-model="searchStyle">
            </div>
        </div>


    </div> 

    <div class="beer-list">
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
    </div>
</div>
</template>

<script>
import BreweryService from '../services/BreweryService.js'
export default {
    name: 'DisplayAllBeers',

    data(){
        return {
            searchBrewery: '',
            searchName: '',
            searchStyle:'',
        };

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
    width: 80%;
    padding: 2rem;
}



.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
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

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
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

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75 {
    width: 100%;
    margin-top: 0;
  }
}

</style>