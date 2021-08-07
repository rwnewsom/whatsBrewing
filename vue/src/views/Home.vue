<template>
  <div class="home">
    <div class="img-container">
      <div class="image-text">
        <div class="title-box">
          <h2 class="title">WHAT'S BREWIN?</h2>
          <h3 class="headline">Not all who wander are lost.</h3>
        </div>
        <router-link v-bind:to="{ name: 'breweries' }" class="noline">
          <div class="image-button brewery-button">Find your Brewery</div>
        </router-link>
        <div class="justify-right">
          <router-link v-bind:to="{ name: 'beers' }" class="noline">
            <div class="image-button beers-button">Find your Beer</div>
          </router-link>
        </div>
      </div>
      <img id="home-img" src="https://images.unsplash.com/photo-1589711428882-6f8d7bff75f7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGJyZXdlcnl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" />
    </div>
    
    <p class="quote"> You might not end up where you intended to go, but you'll get where you needed to be.</p>
    
    <div v-if="deleteOrAddAuth">
      <add-beer />
    </div>
  </div>
</template>

<script>
import AddBeer from "../views/AddBeer.vue";
export default {
  name: "home",
  components: {
    AddBeer,
  },
  computed: {
    deleteOrAddAuth(){
            if (this.$store.state.user.role == "admin" ||this.$store.state.user.role == "brewer"){
                return true;
            } return false;
        },
  }
};
</script>

<style lang="scss">
@import "../styles/colors.scss";

.img-container {
  background: black;
  margin-bottom: 2rem;
  width: 100%;
  display: flex;
  justify-content: center;
}

#home-img {
  width: 75%;
  height: 30rem;
  object-fit: cover;
  mask-image: linear-gradient(to left, rgba(0,0,0,.1),white, white, white, rgba(0,0,0,.1));

} 

.justify-right {
  display: flex;
  justify-content: flex-end;
}

.title {
  text-align: center;
  font-weight: bold;
}

.title-box {
  grid-area: textbox;
  color: black;
  background: rgba(255,255,255, .5);
  font-family: "Monaco","Helvana", "Arial", "Sans-serif";
  border: 4px solid $black;
  padding: 1rem 6rem;
}

.image-text {
  position: absolute;
  z-index: 1;
  margin-top: 8rem;  
  display: grid;
  grid-template-areas: "textbox textbox"
                       "brew-button beer-button";
  width: fit-content;
}

.image-button {
  text-align: center;
  border: 2px solid $black;
  background-color: $blue;
  color: $white;
  font-weight: bold;
  padding: 0 1rem;
  border-radius: 1rem;
  min-width: 15rem;
  width:fit-content;  
  margin-top: 1rem;
}

.image-button:hover {
  color: $blue;
  background: white;
}

.headline {
  text-align: center;
}

.quote {
  text-align: center;
}

.home {
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}

</style>
