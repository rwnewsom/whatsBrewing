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
                    <textarea class="form-control" id="description" rows="3"
                            v-model.trim="newBrewery.description" placeholder="Description"></textarea>
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.streetNumber"
                        required 
                        placeholder="Street Number">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.streetName"
                        required 
                        placeholder="Street Name">
                </div>


                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.cityName"
                        required 
                        placeholder="City Name">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.state"
                        required 
                        placeholder="State">
                </div>


                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.zipCode"
                        required 
                        placeholder="Zip Code">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.phoneNumber"
                        required 
                        placeholder="Phone Number">
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control" 
                            v-model.trim="newBrewery.url"
                        required 
                        placeholder="url">
                </div>



                <div class="mb-3">
                    <input type="text" class="form-control" 
                            v-model.trim="newBrewery.imageUrl" 
                        placeholder="imageURL">
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

        formattedStreetName(){
            const streetNameWords = this.newBrewery.streetName.split(' ');
            if(streetNameWords.length == 1){
                return "%20" + streetNameWords[0] + "%20";
            }
            else{
                let streetNameFormatted = '%20';
                streetNameWords.forEach(word => {
                    streetNameFormatted = streetNameFormatted + word + "%20";
            });
            return streetNameFormatted;
        }
        },

        formattedCityName(){
            const cityNameWords = this.newBrewery.cityName.split(' ');
            if(cityNameWords.length ==1){
                return cityNameWords[0] + "%20";
            }
            else{
                let cityNameFormatted = '';
                cityNameWords.forEach(word => {
                    cityNameFormatted = cityNameFormatted + word + "%20";
                });
                return cityNameFormatted;
            }
        },

        formattedMapUrl(){
            return "https://maps.google.com/maps?q=" + this.newBrewery.streetNumber +this.formattedStreetName + this.formattedCityName + this.newBrewery.state + "&t=&z=13&ie=UTF8&iwloc=&output=embed";
        },

        storeBrewery(){
            return {
                pushBrewery: {
                    description: this.newBrewery.description,
                    id: 0,
                    imageURL: this.newBrewery.imageUrl,
                    name: this.newBrewery.name,
                }
            }
        }


    },
    data() {
        return {
            newBrewery: {
                id: 0,
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
                imageUrl: '',
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
            this.newBrewery.streetNumber= +this.newBrewery.streetNumber;
            this.newBrewery.zipCode = +this.newBrewery.zipCode;
            this.newBrewery.mapUrl = this.formattedMapUrl;
            BreweryService.addBrewery(this.newBrewery)
            .then(response => {
                this.storeBrewery.id = response.data.id;
                this.$store.commit('ADD_BREWERY', this.storeBrewery);
            });

            this.isSaving = false;
            

            this.newBrewery = {
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