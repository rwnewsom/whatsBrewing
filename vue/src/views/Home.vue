<template>
  <div class="home">
    <div class="img-container">
      <div class="image-text">
        <div class="title-box">
          <h2 class="title">Drink where your beer is made.</h2>
          <h3 class="headline">Start your journey here.</h3>
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
    
    <div class="quote">
    If you keep thinking that everywhere you turn there's a new craft brewery popping up—it’s not just 
            your imagination. A craft beer revolution has swept over America. Whether you enjoy a good IPA or you 
            prefer a dark porter, it’s likely that you can find a craft beer or brewery not too far from your 
            doorstep.
    </div>
    <div class="quote2">
      Welcome to What's Brewin. Find local breweries in your area, search for your favorite beer, review the beers you've tried, 
            and enjoy what your local area has to offer. 
    </div>
    <div class="home-bottom-img-container">
      <img class="bot-img" id="home-img-page-bottom-left" src="https://images.unsplash.com/photo-1623937228271-992646fb0fba?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fGJyZXdlcnl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60" />
      <img class="bot-img" id="home-img-page-bottom-middle" src="https://images.unsplash.com/photo-1603666413723-fd8b35434cba?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGJyZXdlcnl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60" />
      <img class="bot-img" id="home-img-page-bottom-right" src="https://images.unsplash.com/photo-1532634733-cae1395e440f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnJld2VyeXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60" />
    </div>
  </div>
</template>

<script>

export default {
  name: "home",
  mounted () {
        window.scrollTo(0, 0)
    },
  
};
</script>

<style lang="scss">
@import "../styles/colors.scss";

.home {
  height: 100%;
}

.img-container {
  background: black;
  margin-bottom: 2rem;
  width: 100vw;
  display: flex;
  justify-content: center;
}

#home-img {
  width: 75%;
  height: 30rem;
  object-fit: cover;
  mask-image: linear-gradient(to left, rgba(0,0,0,0),white, white, white, rgba(0,0,0,.1));

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
  padding: 1rem 3rem;
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
  margin: 1.5rem;
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
  padding-left: 20rem;
  padding-right: 20rem;
}

.quote2 {
  text-align: center;
  padding-left: 20rem;
  padding-right: 20rem;
  padding-top: 1rem;
  padding-bottom: 2rem;
  font-weight: bold;
}

.home {
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}

.home-bottom-img-container {
  display: flex;
  flex-direction: row;
  width: 100vw;
  height: 100%;
  align-items: flex-end;
  align-self: flex-end;
  margin-bottom: 1rem;
}

.bot-img {
  object-fit: contain;
  width: 33.33%; // lol, 33.3 leaves a tiny white bar on the right
  filter: drop-shadow(0 0 .25rem black);
}

</style>
