<template>
  <div class ="brew-display">
    <div id="breweries">
      <!-- all the breweries show on the line below-->
      <div class="brewery-card" v-for="brewery of allBreweries" v-bind:key="brewery.id">
        <img class="brewery-card-img" src="../assets/proriat-hospitality-unsplash.jpg" />
        <div class="brewery-card-title">
          <router-link v-bind:to="{name: 'breweryDetails', params: {id: brewery.id}}">
            {{brewery.name}}
          </router-link>
        </div>
      </div>
    </div>
    <div class="filt">
      <p>filter</p>
    </div>
    <Ad />
  </div>
</template>

<script>
import BreweryService from "../services/BreweryService.js";
import Ad from "../components/Ad.vue";

export default {
  computed: {
    allBreweries() {
      return this.$store.state.breweries;
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

.filt {
  grid-area: filt;
  vertical-align: text-top;
  background-color: $babypowder;
}

.brewery-card, .brewery-card > a {
  color: #011627;
  background: $babypowder;
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
}

.brewery-card-title {
  text-transform: uppercase;
}

.brewery-card-title > a {
  text-decoration-line: none;
}
.brewery-card-title > a:hover {
  text-decoration-line: underline;
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

</style>