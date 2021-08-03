<template>
    <div>
        <h1>{{currentBrewery.name}}</h1>
        <h2>{{currentBrewery.description}}</h2>
        <p>{{currentBrewery.streetNumber}} {{currentBrewery.streetName}}</p>
        <p>{{currentBrewery.cityName}}, {{currentBrewery.state}} {{currentBrewery.zipCode}}</p>
        <p>{{currentBrewery.phoneNumber}}</p>
        <p>{{currentBrewery.url}}</p>
        
    </div>
</template>

<script>
import BreweryService from '../services/BreweryService.js'

export default {
    computed: {
        currentBrewery(){
            return this.$store.state.breweries;
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

</style>