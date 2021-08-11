<template>
  <div>
    <p>
    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        Update Brewery
    </button>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="card card-body">
            <form v-on:submit.prevent="handleSave">
                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.name"
                        required 
                        placeholder="Brewery Name">
                </div>

                <div class="mb-3">
                    <textarea class="form-control" id="description" rows="3"
                            v-model.trim="updatedBrewery.description" placeholder="Description"></textarea>
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.streetNumber"
                        required 
                        placeholder="Street Number">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.streetName"
                        required 
                        placeholder="Street Name">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.cityName"
                        required 
                        placeholder="City Name">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.state"
                        required 
                        placeholder="State">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.zipCode"
                        required 
                        placeholder="Zip Code">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="updatedBrewery.phoneNumber"
                        required 
                        placeholder="Phone Number">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control" 
                            v-model.trim="updatedBrewery.url"
                        required 
                        placeholder="url">
                </div>

                  <div class="mb-3">
                    <input type="text" class="form-control" id="title" 
                            v-model.trim="updatedBrewery.imageUrl"
                        required 
                        placeholder="imageURL">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control" 
                            v-model.trim="updatedBrewery.mapUrl"
                        required 
                        placeholder="Map url">
                </div>
                
                <button type="submit" class="btn btn-success" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"
                        v-bind:disabled="isSaving">
                    <span v-if="isSaving" 
                        class="spinner-border spinner-border-sm" 
                        role="status" 
                        aria-hidden="true"
                        ></span>
                    Update
                </button>
                <input v-on:click="handleCancel" type="cancel" value="Cancel" class="btn btn-primary pull-down" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
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
                id: this.$route.params.id,
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
            this.updatedBrewery.id = +this.$route.params.id,
            this.updatedBrewery.streetNumber = +this.updatedBrewery.streetNumber;
            this.updatedBrewery.zipCode = +this.updatedBrewery.zipCode;
            BreweryService.updateBrewery(this.updatedBrewery.id,this.updatedBrewery);

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
                mapUrl: '',  
            }
            
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
                mapUrl: '', 
            }
        }
        
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