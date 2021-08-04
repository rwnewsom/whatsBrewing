<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.5/getting-started/introduction/ for reference on bootstrap -->
<template>
  <div id="app">
    <!-- If you start to get random styling you don't like, remove container from this div -->
    <div id="nav">
      <div id="nav-spacer" />
        <router-link class="nav-item home" v-bind:to="{ name: 'home' }">
          <i class="fas fa-home"></i>
          <!-- This is a font awesome icon -->
          Home
        </router-link>

        <router-link class="nav-item breweries" v-bind:to="{ name: 'breweries' }">
          <i class="fas fa-beer"></i>
          <!-- This is a font awesome icon -->
          All Breweries
        </router-link>

        <router-link
          class="nav-item register"
          v-bind:to="{ name: 'register' }"
          v-if="!$store.state.token"
        >
          Register
        </router-link>
        <router-link
          class="nav-item login"
          v-bind:to="{ name: 'login' }"
          v-if="!$store.state.token"
        >
          Login
        </router-link>
        <router-link
          class="nav-item login"
          v-bind:to="{ name: 'logout' }"
          v-if="$store.state.token"
        >
          Logout
        </router-link>
    </div>

    <div class="main">
      <router-view />
    </div>

    <div class="ad">
      <iframe
        width="224"
        height="126"
        src="https://www.youtube.com/embed/gtbgKR2OLBc"
        title="YouTube video player"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen
      ></iframe>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<!-- Application-Wide Styles go here. 
     Any valid CSS or SCSS is allowable here. See https://sass-lang.com/documentation/style-rules for info on SCSS -->
<style lang="scss">
@import "./styles/colors.scss";

// Import the bootstrap styles. If you want to override Bootstrap colors, it needs to happen above this line
@import "../node_modules/bootstrap/scss/bootstrap";

// Your custom styles go below this point

html {
  background-color: $background;
  color: $accentLight;
  /* margin: 0;
  padding: 0; */
}

#app {
  background-color: $background;
  color: $accentLight;

  display: grid;
  grid-template-areas:
    "head head"
    "main ad";
  grid-template-columns: 4fr 1fr;
  grid-template-rows: 10rem 1fr;

  height: 100vh;
  width: 100vw;
}

.main {
  grid-area: main;
}

.ad {
  grid-area: ad;
  display: flex;
  justify-content: space-around;
  background-color: $babypowder;
}

.ad iframe {
  padding-top: 1rem;
}

//override default body & html padding & margin to eliminate scrollbar
body {
  margin: 0;
  padding: 0;
}

#nav {
  grid-area: head;
  display: grid;
  grid-template-areas:
    "spacer spacer spacer spacer"
    "home breweries register login";
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-template-rows: 2fr 1fr;

  width: 100%;
  text-align: center; 
  align-items: center;
}

#nav-spacer {
  grid-area: spacer;
  width: 100%;
  height: 100%;
  background-color: #E71D36;
}

.nav-item {
  background-color: #2ec4b6;
  color: $accentLight;
  font-size: 1.5rem;
  height: 100%;
  text-transform: uppercase;
}

.home {
  grid-area: home;
}

.breweries {
  grid-area: breweries;
}

.register {
  grid-area: register;
}

.login {
  grid-area: login;
}
</style>