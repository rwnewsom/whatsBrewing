<template>
  <div>
    <p>
    <button class="btn btn-primary" id="addBreweryButton" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseAddBrewery">
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
                        placeholder="Tech Elevator Brewing">
                </div>

                 <div class="mb-3">Brewery Description
                    <textarea class="form-control" id="description" rows="3"
                            v-model.trim="newBrewery.description" placeholder="Here at Tech Elevator, we are all in pursuit of hoppiness."></textarea>
                </div>

                <div class="mb-3">Street Number
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.streetNumber"
                        required 
                        placeholder="1275">
                </div>

                <div class="mb-3">Street Name
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.streetName"
                        required 
                        placeholder="Kinnear Rd #121">
                </div>


                <div class="mb-3">City
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.cityName"
                        required 
                        placeholder="Columbus">
                </div>

                <div class="mb-3">State
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.state"
                        required 
                        placeholder="OH">
                </div>


                <div class="mb-3">Zip Code
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.zipCode"
                        required 
                        placeholder="43212">
                </div>

                <div class="mb-3">Phone Number
                    <input type="text" class="form-control"
                            v-model.trim="newBrewery.phoneNumber"
                        required 
                        placeholder="(877) 606-3203">
                </div>

                <div class="mb-3">Website
                    <input type="text" class="form-control" 
                            v-model.trim="newBrewery.url"
                        required 
                        placeholder="https://www.techelevator.com/">
                </div>

                <div class="mb-3">Venue Image URL
                    <input type="text" class="form-control" 
                            v-model.trim="newBrewery.imageUrl" 
                        placeholder="https://computersciencehero.com/wp-content/uploads/2020/01/79918527_2506515349674970_6985513523803586560_o.jpg">
                </div>

                <div class="mb-3">Brewery Logo URL
                    <input type="text" class="form-control" 
                            v-model.trim="newBrewery.logo" 
                        placeholder="https://images.squarespace-cdn.com/content/v1/55ef2da9e4b03f6e1ef0cd28/6792ced3-785f-4085-9dd4-4e117a9c7e7d/Stacked+logo_white+behind+the+mark.png">
                </div>
               
                <button type="submit" class="btn btn-success" id="addBreweryAddButton" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseAddBrewery"
                        v-bind:disabled="isSaving">
                    <span v-if="isSaving" 
                        class="spinner-border spinner-border-sm" 
                        role="status" 
                        aria-hidden="true"
                        ></span>
                    Add
                </button>
                <input type="cancel" value="Cancel" id="addBreweryCancelButton" class="btn btn-primary pull-down" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseAddBrewery">
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
        //taking user address input and translating into IFrame URL for Google Maps - RN
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


    },
    data() {
        return {
            newBrewery: {
                
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
                logo: ''
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
                this.$store.commit('ADD_BREWERY', response.data);
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
#addBreweryButton{
    background-color: $yellow;
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