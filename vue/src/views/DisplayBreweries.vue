<template>
  <div class ="brew-display">
    <div id="breweries">
      <div v-if="resultCount > 1" id="brewery-result-count">{{resultCount}} results</div>
      <div v-else id="brewery-result-count">{{resultCount}} result</div>
      <!-- all the breweries show on the line below-->
      <router-link 
        v-for="brewery of pageBreweries" 
        v-bind:key="brewery.id" 
        v-bind:to="{name: 'breweryDetails', 
        params: {id: brewery.id}}"
        class="noline brewery-card">
        <img class="brewery-card-img" v-bind:src="brewery.imageURL"  />
        <div class="brewery-card-title">{{brewery.name}}</div>
      </router-link>
      <div id="pagination-breweries">
        <jw-pagination :pageSize="5" :items="filteredBreweries" @changePage="onChangePage" />
      </div>

    </div>
    <div class="filter-box">
      <div class="sticky">
        <div v-if="showAdd"><add-brewery /></div>
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
    </div>
    <Ad v-bind:numAds="6" />
  </div>
</template>

<script>
import BreweryService from "../services/BreweryService.js";
import Ad from "../components/Ad.vue";
import AddBrewery from "../views/AddBrewery.vue";

export default {
  name: 'DisplayBreweries',
  data(){
    return {
      searchName: '',
      searchDescription: '',
      pageBreweries: [],
      resultCount: 0,
  };

  },

   components: {
        Ad,
        AddBrewery
    },
    mounted () {
        window.scrollTo(0, 0)
    },



  computed: {
    allBreweries() {
      return this.$store.state.breweries;
    },
    filteredBreweries(){
      let result = this.$store.state.breweries.slice();

      if(this.searchName || this.searchDescription){
        result = result.filter(brewery => brewery.name.toLowerCase().includes(this.searchName.toLowerCase()) && brewery.description.toLowerCase().includes(this.searchDescription.toLowerCase()));
      }
      this.updateResultCount(result.length)
      return result;
      },
      showAdd(){
        if(this.$store.state.user.role == "admin" || this.$store.state.user.role == "brewer") {
          return true;
        }
        return false;
      }
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
  methods: {
    onChangePage(pageBreweries) {
      this.pageBreweries = pageBreweries;
    },
    updateResultCount(count) {
      this.resultCount = count;
    },
  }
};
</script>


<style lang="scss">
@import "../styles/colors.scss";

.brew-display {
  display: grid;
  grid-template-areas: "filt main ad";
  grid-template-columns: 17.5rem auto 17.5rem;
  background-size: contain;
  background-image: url("../assets/background.jpg");
}

.filter-box {
  grid-area: filt;
  vertical-align: text-top;
  background-color: $white;
}

#brewery-result-count {
  margin-left: 2rem;
  text-decoration-line: none;
  margin-top: 1rem;
  display: flex;
  align-self: flex-start;
  color: $black;
  font-size: 1.3rem;
  font-weight: bold;
  background-color: rgba(255, 255, 255, .7)
}

.brewery-card {
  color: $white;
  background: $blue;
  text-align: center;
  width: 66%;
  max-width: 35rem;
  height: 355px;
  margin-left: 17.5%;
  margin-right: 17.5%;
  margin-top: 2rem;
  font-size: 2rem;
  font-weight: bold;
  font-family: sans-serif;
  border-radius: 20px;
  margin-bottom: 2rem;
  filter: drop-shadow(0.25rem 0.1rem 0.5rem $black);
}

.brewery-card-title {
  text-transform: uppercase;
  font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
}

#breweries {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
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

#pagination-breweries {
  display: flex;
  justify-content: center;
}

</style>