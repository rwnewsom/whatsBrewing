<template>
<div>
    <p>
    <button class="btn btn-primary" id="addBeerButton" type="button" data-toggle="collapse" data-target="#collapseAddBeer" aria-expanded="false" aria-controls="collapseExample">
        Add New Beer
    </button>
    </p>
    <div class="collapse" id="collapseAddBeer">
        <div class="card card-body" id="addBeerDiv">
            <form v-on:submit.prevent="handleSave" id="addBeerForm">
                <div class="mb-3">Beer Name
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="newBeer.name"
                        required 
                        placeholder="Beer name">
                </div>

                <div class="mb-3">Image Url
                    <input type="text" class="form-control" 
                            v-model.trim="newBeer.beerImageUrl" 
                        placeholder="data:image/png;base64,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">
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
                <button type="submit" class="btn btn-success" id="addBeerAddButton" data-toggle="collapse" data-target="#collapseAddBeer" aria-expanded="false" aria-controls="collapseExample"
                        v-bind:disabled="isSaving">
                    <span v-if="isSaving" 
                        class="spinner-border spinner-border-sm" 
                        role="status" 
                        aria-hidden="true"
                        ></span>
                    Add
                </button>
                <input type="cancel" id="addBeerCancelButton" value="Cancel" class="btn btn-primary" data-toggle="collapse" data-target="#collapseAddBeer" aria-expanded="false" aria-controls="collapseExample">
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
                beerImageUrl: '',
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