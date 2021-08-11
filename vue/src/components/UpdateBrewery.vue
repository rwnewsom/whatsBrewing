<template>
  <div>
    <p>
    <button class="btn btn-primary" type="button" id="updateBreweryButton" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        Update Brewery
    </button>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="card card-body" id="updateBreweryDiv">
            <form v-on:submit.prevent="handleSave" id="updateBreweryForm">
                <div class="mb-3">Brewery Name
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="updatedBrewery.name"
                        required 
                        placeholder="Brewery Name">
                </div>
                <div class="mb-3">Image URL
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="updatedBrewery.imageURL"
                        required 
                        placeholder="Image URL">
                </div>
                <div class="mb-3">Description
                    <textarea class="form-control" id="description" rows="3"
                            v-model.trim="updatedBrewery.description" placeholder="Description"></textarea>
                </div>
                <button type="submit" class="btn btn-success" id="updateBreweryAddButton" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"
                        v-bind:disabled="isSaving">
                    <span v-if="isSaving" 
                        class="spinner-border spinner-border-sm" 
                        role="status" 
                        aria-hidden="true"
                        ></span>
                    Add
                </button>
                <input type="cancel" id="updateBreweryCancelButton" value="Cancel" class="btn btn-primary pull-down" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            </form>
            </div>
        </div>
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService.js';

export default {
    name: 'UpdateBrewery',
    computed: {
        displayAllBreweries() {
        return this.$store.state.breweries;
        },
    },
    data() {
        return {
            updatedBrewery: {
                name: '',
                description: '',
                imageURL: '',
                id: this.$route.params.id,

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
            BreweryService.updateBrewery(this.updatedBrewery);

            this.isSaving = false;
            

            this.updatedBrewery = {
                name: '',
                description: '',
                imageURL: '',
                id: null
            }
            
        },
        
    }
}
</script>

<style lang="scss">
@import "../styles/colors.scss";
#updateBreweryButton{
    background-color: $blue;
    margin-top: 1rem;
    margin-left: 2rem;
}
#updateBreweryButton:hover{
    background-color:$white;
    color: $blue;
}
#updateBreweryAddButton{
    background-color: $blue;
    width: 6rem;
}
#updateBreweryAddButton:hover{
    background-color:$white;
    color: $blue;
}
#updateBreweryCancelButton{
    background-color: $blue;
    width: 6rem;
    margin-top: 1rem;
    margin-left: 1rem;
    margin-bottom: 1rem;
}
#updateBreweryCancelButton:hover{
    background-color:$white;
    color: $blue;
}
#updateBreweryForm{
    width: 39rem;
    padding-top: 1rem;
}
#updateBreweryDiv{
    width: 41rem;
    border-left: 1rem;
}


// .btn-primary{
//     background-color: $yellow;
// }
// .btn-primary:hover{
//     background-color:$white;
//     color: $yellow;
// }
// .btn-success{
//     background-color: $yellow;
// }
// .btn-success:hover{
//     background-color:$white;
//     color: $yellow;
// }
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