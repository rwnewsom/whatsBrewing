<template>
  <div>
    <p>
    <button class="btn btn-primary" type="button" id="updateBreweryButton" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        Update Brewery
    </button>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="card card-body">Brewery Name
            <form v-on:submit.prevent="handleSave"> <!--  value="{{this.$store.state.breweries.name}}" -->
                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.name"
                        required >
                </div>

                <div class="mb-3">Description
                    <textarea class="form-control" id="description" rows="3"
                            v-model.trim="updatedBrewery.description" placeholder="Description"></textarea>
                </div>

                <div class="mb-3">Street Number
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.streetNumber"
                        required 
                        placeholder="Street Number">
                </div>

                <div class="mb-3">Street Name
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.streetName"
                        required 
                        placeholder="Street Name">
                </div>

                <div class="mb-3">City
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.cityName"
                        required 
                        placeholder="City Name">
                </div>

                <div class="mb-3">State
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.state"
                        required 
                        placeholder="State">
                </div>

                <div class="mb-3">Zip Code
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.zipCode"
                        required 
                        placeholder="Zip Code">
                </div>

                <div class="mb-3">Phone Number
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.phoneNumber"
                        required 
                        placeholder="Phone Number">
                </div>

                <div class="mb-3">Website
                    <input type="text" class="form-control" 
                            v-model.trim="updatedBrewery.url"
                        required 
                        placeholder="url">
                </div>

                  <div class="mb-3">Image URL
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="updatedBrewery.imageUrl"
                        required 
                        placeholder="Image URL">
                </div>
                
                <button type="submit" id="updateBreweryAddButton" class="btn btn-success" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"
                        v-bind:disabled="isSaving">
                    <span v-if="isSaving" 
                        class="spinner-border spinner-border-sm" 
                        role="status" 
                        aria-hidden="true"
                        ></span>
                    Update
                </button>
                <input v-on:click="handleCancel" type="cancel" id="updateBreweryCancelButton" value="Cancel" class="btn btn-primary pull-down" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
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
        currentBrewery(){
            return this.$store.state.brewery;
        },
        
    },
    props:{
        updatedBrewery: Object
    },

    // created(){
    //     this.updatedBrewery = this.displayAllBreweries
    // },
    
    data() {
        return {
            // updatedBrewery: {
            //     id: this.$route.params.id,
            //     name: '',
            //     description: '',
            //     streetNumber: '',
            //     streetName: '',
            //     cityName: '',
            //     state: '',
            //     zipCode: '',
            //     phoneNumber: '',
            //     url: '',
            //     imageUrl: '',
            //     mapUrl: '',       
            // },
            isSaving: false
        }
    },

    

    methods: {
        handleSave(event) {
            console.log('Save was clicked!', event);
            // Don't allow double click on save
            if (this.isSaving) return;
            this.isSaving = true;
            this.updatedBrewery.id = +this.$route.params.id,
            this.updatedBrewery.streetNumber = +this.updatedBrewery.streetNumber;
            this.updatedBrewery.zipCode = +this.updatedBrewery.zipCode;
            BreweryService.updateBrewery(this.updatedBrewery.id,this.updatedBrewery)
            .then((response) => {
                if(response.status === 200){
                    
                    this.isSaving = false;
                    
        
                    this.updatedBrewery = {
                        id: '',
                        name: '',
                        description: '',
                        streetNumber: '',
                        streetName: '',
                        cityName: '',
                        state: '',
                        zipCode: '',
                        phoneNumber: '',
                        url: '',
                        imageUrl: '',
                        mapUrl: '', 
                        logo: '' 
                    }
                }
            })

            
        },

        handleCancel(event){
            console.log('Cancel was clicked!', event);
            this.updatedBrewery = {
                id: null,
                name: '',
                description: '',
                streetNumber: '',
                streetName: '',
                cityName: '',
                state: '',
                zipCode: '',
                phoneNumber: '',
                url: '',
                imageUrl: '',
                mapUrl: '', 
            }
        }
        
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