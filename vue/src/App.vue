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

        <router-link class="nav-item beers" v-bind:to="{ name: 'beers' }">
          <!-- This is a font awesome icon -->
          Beers
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
    <router-link id="logo-container" v-bind:to="{ name: 'home' }">
     <img id="primary-logo" src="./assets/officiallogo.png" />
    </router-link>
    <div class="main">
      <router-view />
    </div>
    <div id="footer">
      <div id="footer-top" />
      <div id="footer-bottom" />
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
  background-color: $white;
  color: $black;
  /* margin: 0;
  padding: 0; */
}

#app {
  background-color: $white;
  color: $black;

  display: grid;
  grid-template-areas:
    "head"
    "main"
    "footer";
  grid-template-rows: 8rem 1fr 5.5rem;

  height: 100vh;
  width: 100%;
}

.main {
  grid-area: main;
}

#footer {
  grid-area: footer;
  display: grid;
  grid-template-areas: "footer-top"
                       "footer-bottom";
  grid-template-rows: 1fr 3fr;
}

#footer-top {
  grid-area: footer-top;
  background-color: $blue;
}

#footer-bottom {
  grid-area: footer-bottom;
  background-color: $black;
}
// .ad {
//   grid-area: ad;
//   display: flex;
//   justify-content: space-around;
//   background-color: $babypowder;
//   color: $black;
//   border: 1px solid $black;
// }

//override default body & html padding & margin to eliminate scrollbar
body {
  margin: 0;
  padding: 0;
}

#nav {
  grid-area: head;
  position: fixed;
  z-index: 2;
  display: grid;
  grid-template-areas:
    "top top top top"
    "middle middle middle middle"
    "breweries beers events news";
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-template-rows: 1.5fr .5fr 1fr;

  width: 100%;
  align-items: center;
  filter: drop-shadow(0.25rem 0.1rem 0.5rem black);
}

#nav-spacer {
  grid-area: top;
  width: 100%;
  height: 100%;
  background-color: $black;
} 

#nav-spacer-2 {
  grid-area: middle;
  width: 100%;
  height: 100%;
  background-color: $blue;
}

#nav router-link {
  align-content: center;
  background-color: $yellow;
}

.nav-item, a.nav-item {
  background-color: $white;
  color: $black;
  font-size: 1.5rem;
  height: 100%;
  text-transform: uppercase;
  margin-top: auto;
  margin-bottom: auto;
  text-decoration-line: none;
}

.beers {
  grid-area: beers;
  font-weight: bold;
  padding-left: 1rem;
}

.breweries {
  grid-area: breweries;
  font-weight: bold;
  padding-left: 5rem;
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
  text-align: center;
}

.events {
  grid-area: events;
  font-weight: bold;
  text-align: right;
  padding-right: 1rem;
}

.news {
  grid-area: news;
  font-weight: bold;
  text-align: right;
  padding-right: 5rem;
}

.account-button {
  border: 2px solid $black;
  text-decoration-line: none;
  margin-right: 1rem;
  background-color: $white;
  color: $black;
  padding: 0 1rem;
  border-radius: 1rem;
  min-width: 8rem;
}

#logo-container {
  position: absolute; 
  left: 0; 
  right: 0;
  margin-left: auto; 
  margin-right: auto; 
}

#primary-logo {
  position: fixed; 
  left: 0; 
  right: 0;
  margin-left: auto; 
  margin-right: auto;
  margin-top: 0.5rem; 
  width: 9rem;
  border-radius: 10rem;
  z-index: 2;
  filter: drop-shadow(0.25rem 0.1rem 0.5rem $black);
}

#primary-logo:hover {
  margin-top: 0.4rem;
  width: 9.5rem;
}
</style>