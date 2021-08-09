<template>
  <div class ="brew-display">
    <div id="breweries">
      <!-- all the breweries show on the line below-->
      <router-link 
        v-for="brewery of allBreweries" 
        v-bind:key="brewery.id" 
        v-bind:to="{name: 'breweryDetails', 
        params: {id: brewery.id}}"
        class="noline brewery-card">
        <img class="brewery-card-img" v-bind:src="brewery.imageURL"  />
        <div class="brewery-card-title">{{brewery.name}}</div>
      </router-link>
    </div>
    <div class="filter-box">
      <h3>Filter By:</h3>
      <div class="row">
            <div>
                <label for="searchName">Brewery: </label>
            </div>
            <div class>
                <input id="searchName" type="text" v-model="searchName">
            </div>
      </div>

      <div class="row">
            <div>
                <label for="searchDescription">Description: </label>
            </div>
            <div class>
                <input id="searchDescription" type="text" v-model="searchDescription">
            </div>
      </div>


    </div>
    <Ad />
  </div>
</template>

<script>
import BreweryService from "../services/BreweryService.js";
import Ad from "../components/Ad.vue";

export default {
  name: 'DisplayBreweries',
  data(){
    return {
      searchName: '',
      searchDescription: '',
    };

  },
  computed: {
    allBreweries() {
      return this.$store.state.breweries;
    },
    filteredBreweries(){
      let result = this.allBreweries.slice();

      if(this.searchName || this.searchDescription){
        result = result.filter(brewery => brewery.name.toLowerCase().includes(this.searchName.toLowerCase()) && brewery.description.toLowerCase().includes(this.searchDescription.toLowerCase()));
      }
      return result;
      },
  },


  components: {
        Ad,
    },

  created() {
    console.log("Attempting brewery request..."); //this is the last loggged message

    BreweryService.list().then((result) => {
      console.log("Promise Resolved", result);

      if (result.status === 200) {
        this.$store.commit("LOADED_BREWERIES", result.data);
      }
    });
  },
};
</script>


<style lang="scss">
@import "../styles/colors.scss";

.brew-display {
  display: grid;
  grid-template-areas: "filt main ad";
  grid-template-columns: 1fr 3fr 1fr;
}

.filter-box {
  grid-area: filt;
  vertical-align: text-top;
  background-color: $white;
}

.brewery-card {
  color: $white;
  background: $blue;
  text-align: center;
  width: 65%;
  height: 355px;
  margin-left: 17.5%;
  margin-right: 17.5%;
  margin-top: 2rem;
  font-size: 2rem;
  font-weight: bold;
  font-family: sans-serif;
  border-radius: 20px;
  margin-bottom: 2rem;
}

.brewery-card-title {
  color: $white;
  text-transform: uppercase;
}

#breweries {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.brewery-card-img {
  width: 100%;
  height: 300px;
  object-fit: cover;
  border-top-right-radius: 20px;
  border-top-left-radius: 20px;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
  margin-bottom: 0;
  padding-bottom: 0;
  font-weight: bold;
  font-style: oblique;
}

input[type=text] {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

</style>