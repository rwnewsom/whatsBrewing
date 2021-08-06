<template>
  <div class="home">
    <img id="home-img" src="../assets/proriat-hospitality-unsplash.jpg" />
    <h2 class="title">The Vagrant Tippler</h2>
    <h3 class="headline">Not all who wander are lost.</h3>
    <p class="quote"> You might not end up where you intended to go, but you'll get where you needed to be.</p>
    <add-beer />
    <display-all-beers />
  </div>
</template>

<script>
import DisplayAllBeers from "../components/DisplayAllBeers.vue";
import AddBeer from "../views/AddBeer.vue";
export default {
  name: "home",
  components: {
    AddBeer,
    DisplayAllBeers
  }
};
</script>

<style lang="scss">
@import "../styles/colors.scss";

#home-img {
  width: 100%;
  height: 30rem;
  margin-bottom: 2rem;
  object-fit: cover;
}

.title {
  text-align: center;
}

.headline {
  text-align: center;
}

.quote {
  text-align: center;
}



</style>
