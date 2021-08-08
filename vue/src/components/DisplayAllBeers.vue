<template>
<div class="beer-display">

    <div class="search-field">
        <span>
            <label for="searchBrewery">Search Brewery</label>
            <input id="searchBrewery" type="text" v-model="searchBrewery">
        </span>
        <span>
            <label for="searchName">Search Name</label>
            <input id="searchName" type="text" v-model="searchName">
        </span>
        <span>
            <label for="searchStyle">Search by Style</label>
            <input id="searchStyle" type="text" v-model="searchStyle">
        </span>


    </div> 

    <div class="beer-list">
        <table>
            <thead>
                <tr>
                    <th>Brewery</th>
                    <th>Name</th>
                    <th>Style</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="beer of filteredBeers" v-bind:key="beer.beerId">
                    <td> <router-link class="beerlink" v-bind:to="{name:'breweryDetails', params: {id: beer.breweryId}}"> {{ beer.breweryName }} </router-link></td>
                    <td> <router-link class="beerlink" v-bind:to="{name:'beerDetails', params: {id: beer.breweryId, beerId: beer.beerId}}"> {{beer.name}} </router-link></td>
                    <td>{{beer.style}}</td>
                </tr>
            </tbody>
        </table>
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

</style>