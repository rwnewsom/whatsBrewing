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
                <button type="submit" class="btn btn-success" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"
                        v-bind:disabled="isSaving">
                    <span v-if="isSaving" 
                        class="spinner-border spinner-border-sm" 
                        role="status" 
                        aria-hidden="true"
                        ></span>
                    Add
                </button>
                <input type="cancel" value="Cancel" class="btn btn-primary" id="cancel" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
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
        },
    }
}
</script>

<style lang="scss">
@import "../styles/colors.scss";
.btn-primary{
    background-color: $yellow;
}
.btn-primary:hover{
    background-color:$white;
    color: $yellow;
}
.btn-success{
    background-color: $yellow;
}
.btn-success:hover{
    background-color:$white;
    color: $yellow;
}
.dropdown-item{
    font-size: 15px;
    color: $black;
}
.dropdown-toggle{
    background-color: $white;
    width: 29rem;
    text-align: left;
}
.dropdown-menu{
    width: 29rem;
    max-height: 280px;
    overflow-y:auto;
}
#cancel{
    margin-left: 2rem;
    margin-top: 1rem;
    width: 10%;
}
</style>