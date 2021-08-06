<template>
<div>
    <p>
    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        Add New Beer
    </button>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="card card-body">
            <form v-on:submit.prevent="handleSave">
                <div class="mb-3">
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBeer.name"
                        required 
                        placeholder="Beer name">
                </div>
                <!-- <div class="mb-3">
                        <div class="btn-group">
                        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Select Brewery
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#" v-for="brewery of displayAllBreweries" v-bind:key="brewery.id"> {{brewery.name}} </a>
                        </div>
                    </div>
                </div> -->
                <div class="mb-3">
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBeer.style"
                        required 
                        placeholder="Style">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBeer.abv"
                        required 
                        placeholder="ABV">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBeer.ibu"
                        placeholder="IBU">
                </div>
                <div class="mb-3">
                    <textarea class="form-control" id="description" rows="3"
                            v-model.trim="newBeer.description" placeholder="Description"></textarea>
                </div>
                <button data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" type="submit" class="btn btn-success" 
                        v-bind:disabled="isSaving">
                    <span v-if="isSaving" 
                        class="spinner-border spinner-border-sm" 
                        role="status" 
                        aria-hidden="true"
                        ></span>
                    Add
                </button>
            </form>
            </div>
        </div>
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService.js';

export default {
    computed: {
        displayAllBreweries() {
        return this.$store.state.breweries;
        },
    },
    data() {
        return {
            newBeer: {
                // beerId: 0,
                name: '',
                style: '',
                breweryId: 0,
                description: '',
                abv: '',
                ibu: ''
            },
            isSaving: false
        }
    },
    methods: {
        handleSave(event) {
            console.log('Save was clicked!', event);
            // Don't allow double click on save
            if (this.isSaving) return;
            this.isSaving = true;
            this.newBeer.breweryId = +this.$route.params.id;
            this.newBeer.abv = +this.newBeer.abv;
            this.newBeer.ibu = +this.newBeer.ibu;

            BreweryService.addBeer(this.newBeer);

            this.isSaving = false;
            

            this.newBeer = {
                // beerId: 0,
                name: '',
                style: '',
                breweryId: 0,
                description: '',
                abv: '',
                ibu: ''
            }


              /*   .then(response => {
                    // We want the ID of the item from the server
                    this.$store.commit('ADD_BEER', response.data);

                    this.$router.push({name: 'BeerList'});
                })
                .catch(response => {
                    console.error(response);
                    alert('Could not save the item. Contact support for more information.');
                    this.isSaving = false;
                }) */
            
        },
        
    }
}
</script>

<style lang="scss">
@import "../styles/colors.scss";
.btn-primary{
    background-color: $orangepeel;
}
.btn-primary:hover{
    background-color:$babypowder;
    color: $orangepeel;
}
.btn-success{
    background-color: $orangepeel;
}
.btn-success:hover{
    background-color:$babypowder;
    color: $orangepeel;
}
.dropdown-item{
    font-size: 15px;
    color: black;
}
.dropdown-toggle{
    background-color: white;
    width: 29rem;
    text-align: left;
}
.dropdown-menu{
    width: 29rem;
    max-height: 280px;
    overflow-y:auto;
}
</style>