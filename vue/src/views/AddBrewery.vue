<template>
  <div>
    <p>
    <button class="btn btn-primary" id="addBreweryButton" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        Add New Brewery
    </button>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="card card-body" id="addBreweryDiv">
            <form v-on:submit.prevent="handleSave" id="addBreweryForm">
                <div class="mb-3">Brewery Name
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBrewery.name"
                        required 
                        placeholder="Brewery Name">
                </div>
                <div class="mb-3">Image URL
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBrewery.imageURL"
                        required 
                        placeholder="Image URL">
                </div>
                <div class="mb-3">Description
                    <textarea class="form-control" id="description" rows="3"
                            v-model.trim="newBrewery.description" placeholder="Description"></textarea>
                </div>
                <button type="submit" class="btn btn-success" id="addBreweryAddButton" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"
                        v-bind:disabled="isSaving">
                    <span v-if="isSaving" 
                        class="spinner-border spinner-border-sm" 
                        role="status" 
                        aria-hidden="true"
                        ></span>
                    Add
                </button>
                <input type="cancel" value="Cancel" id="addBreweryCancelButton" class="btn btn-primary pull-down" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
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
#addBreweryButton{
    background-color: $blue;
}
#addBreweryButton:hover{
    background-color:$white;
    color: $blue;
}
#addBreweryAddButton{
    background-color: $blue;
    width: 6rem;
}
#addBreweryAddButton:hover{
    background-color:$white;
    color: $blue;
}
#addBreweryCancelButton{
    background-color: $blue;
    width: 6rem;
    margin-top: 1rem;
    margin-left: 1rem;
    margin-bottom: 1rem;
}
#addBreweryCancelButton:hover{
    background-color:$white;
    color: $blue;
}
#addBreweryForm{
    width: 13rem;
    padding-top: 1rem;
}
#addBreweryDiv{
    width: 15rem;
    border-left: 1rem;
}
#description{
    margin-left:-2px;
    margin-top: 0;
    margin-bottom: 0%;
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