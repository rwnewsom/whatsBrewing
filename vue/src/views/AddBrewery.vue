<template>
  <div>
    <p>
    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        Add New Brewery
    </button>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="card card-body">
            <form v-on:submit.prevent="handleSave">
                <div class="mb-3">
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBrewery.name"
                        required 
                        placeholder="Brewery Name">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBrewery.imageURL"
                        required 
                        placeholder="imageURL">
                </div>
                <div class="mb-3">
                    <textarea class="form-control" id="description" rows="3"
                            v-model.trim="newBrewery.description" placeholder="Description"></textarea>
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
                <input type="cancel" value="Cancel" class="btn btn-primary pull-down" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            </form>
            </div>
        </div>
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService.js';

export default {
    name: 'AddBrewery',
    computed: {
        displayAllBreweries() {
        return this.$store.state.breweries;
        },
    },
    data() {
        return {
            newBrewery: {
                name: '',
                description: '',
                imageURL: '',
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
            BreweryService.addBrewery(this.newBrewery);

            this.isSaving = false;
            

            this.newBrewery = {
                name: '',
                description: '',
                imageURL: '',
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
    margin-left: 1rem;
    margin-top: 1rem;
    width: 25%;
}
</style>