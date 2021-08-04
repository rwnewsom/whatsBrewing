<template>
  <div class="home">
    <h2 id="headline">The Vagrant Tippler</h2>
    <h3>Not all who wander are lost.</h3>
    <p> You might not end up where you intended to go, but you'll get where you needed to be.</p>
    <img src="../assets/proriat-hospitality-unsplash.jpg" />
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>

<style lang="scss">
@import "../styles/colors.scss";

img {
  width: 95%;
  padding-bottom: 2rem;
}

.home{
  padding-left: 2rem;
  
}

img {
  filter: drop-shadow(0.25rem 0.1rem 0.5rem $accentLight);
}

#headline{
  text-align: center;
}



</style>
