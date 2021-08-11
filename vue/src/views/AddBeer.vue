<template>
<div>
    <p>
    <button class="btn btn-primary" id="addBeerButton" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        Add New Beer
    </button>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="card card-body" id="addBeerDiv">
            <form v-on:submit.prevent="handleSave" id="addBeerForm">
                <div class="mb-3">Beer Name
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBeer.name"
                        required 
                        placeholder="Beer name">
                </div>
                <div class="mb-3">Style
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBeer.style"
                        required 
                        placeholder="Style">
                </div>
                <div class="mb-3">ABV
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBeer.abv"
                        required 
                        placeholder="ABV">
                </div>
                <div class="mb-3">IBU
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBeer.ibu"
                        placeholder="IBU">
                </div>
                <div class="mb-3">Description
                    <textarea class="form-control" id="description" rows="3"
                            v-model.trim="newBeer.description" placeholder="Description"></textarea>
                </div>
                <button type="submit" class="btn btn-success" id="addBeerAddButton" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"
                        v-bind:disabled="isSaving">
                    <span v-if="isSaving" 
                        class="spinner-border spinner-border-sm" 
                        role="status" 
                        aria-hidden="true"
                        ></span>
                    Add
                </button>
                <input type="cancel" id="addBeerCancelButton" value="Cancel" class="btn btn-primary" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            </form>
            </div>
        </div>
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService.js';

export default {
    name: 'AddBeer',
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

            BreweryService.addBeer(this.newBeer)
            .then(response => {
                this.$store.commit('ADD_BEER', response.data);
            });

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
#addBeerButton{
    background-color: $blue;
    margin-top: 1rem;
    width: 8rem;
}
#addBeerButton:hover{
    background-color:$white;
    color: $blue;
}
#addBeerAddButton{
    background-color: $blue;
    margin-top: 1rem;
    width: 6rem;
}
#addBeerAddButton:hover{
    background-color:$white;
    color: $blue;
}
#addBeerCancelButton{
    background-color: $blue;
    width: 6rem;
    margin-top: 1rem;
    margin-left: 1rem;
}
#addBeerCancelButton:hover{
    background-color:$white;
    color: $blue;
}
#addBeerForm{
    width: 39rem;
    padding-top: 1rem;
}
#addBeerDiv{
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
// #cancel{
//     margin-left: 2rem;
//     margin-top: 1rem;
//     width: 10%;
// }
</style>