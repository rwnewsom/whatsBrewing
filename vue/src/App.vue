<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.5/getting-started/introduction/ for reference on bootstrap -->
<template>
  <div id="app">
    <!-- If you start to get random styling you don't like, remove container from this div -->
    <div id="nav">
        <div id="nav-spacer" />
        <div id="nav-spacer-2" />
        
        <router-link class="nav-item breweries" v-bind:to="{ name: 'breweries' }">
          <!-- This is a font awesome icon -->
          Breweries
        </router-link>

        <router-link class="nav-item home" v-bind:to="{ name: 'home' }">
          <!-- This is a font awesome icon -->
          Home
        </router-link>
        <a class="nav-item events">
          Events
        </a>
        <a class="nav-item news">
          News
        </a>
        <div id="account-buttons">
          <router-link
            class="login account-button"
            v-bind:to="{ name: 'login' }"
            v-if="!$store.state.token"
          >
            Login
          </router-link>
          <router-link
            class="login account-button"
            v-bind:to="{ name: 'logout' }"
            v-if="$store.state.token"
          >
            Logout
          </router-link>
          <router-link
            class="register account-button"
            v-bind:to="{ name: 'register' }"
            v-if="!$store.state.token"
          >
            Register
          </router-link>
        </div>
    </div>

    <div class="main">
      <router-view />
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
    "head"
    "main";
  grid-template-rows: 8rem 1fr;

  height: 100%;
  width: 100%;
}

.main {
  grid-area: main;
}

// .ad {
//   grid-area: ad;
//   display: flex;
//   justify-content: space-around;
//   background-color: $babypowder;
//   color: $accentDark;
//   border: 1px solid $accentDark;
// }

//override default body & html padding & margin to eliminate scrollbar
body {
  margin: 0;
  padding: 0;
}

#nav {
  grid-area: head;
  display: grid;
  grid-template-areas:
    "top top top top"
    "middle middle middle middle"
    "home breweries events news";
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-template-rows: 1.5fr .5fr 1fr;

  width: 100%;
  text-align: center;
  align-items: center;
  filter: drop-shadow(0.25rem 0.1rem 0.5rem black);
}

#nav-spacer {
  grid-area: top;
  width: 100%;
  height: 100%;
  background-color: #E71D36;
} 

#nav-spacer-2 {
  grid-area: middle;
  width: 100%;
  height: 100%;
  background-color: #2ec4b6;
}

#nav router-link {
  align-content: center;
  background-color: #FF9F1C;
}

.nav-item, a.nav-item {
  background-color: #FF9F1C;
  color: $babypowder;
  font-size: 1.5rem;
  height: 100%;
  text-transform: uppercase;
  margin-top: auto;
  margin-bottom: auto;
  text-decoration-line: none;
}

.home {
  grid-area: home;
  font-weight: bold;
}

.breweries {
  grid-area: breweries;
  font-weight: bold;
}

.register {
  font-weight: bold;
}

.login {
  font-weight: bold;
}

#account-buttons {
  grid-area: top;
  display: flex;
  flex-direction: row-reverse;
}

.events {
  grid-area: events;
  font-weight: bold;
}

.news {
  grid-area: news;
  font-weight: bold;
}

.account-button {
  border: 2px solid black;
  text-decoration-line: none;
  margin-right: 1rem;
  background-color: $babypowder;
  color: $richblack;
  padding: 0 1rem;
  border-radius: 1rem;
  min-width: 8rem;
}

</style>