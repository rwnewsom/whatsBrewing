<template>
  <div class="login-page">
    <div id="login" class="text-center">
      <form class="form-signin" @submit.prevent="login">
        <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
        <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
          Invalid username and password!
        </div>

        <div class="alert alert-danger" role="alert" v-if="networkError">
          Network error!
        </div>

        <div
          class="alert alert-success"
          role="alert"
          v-if="this.$route.query.registration">
          Thank you for registering, please sign in.
        </div>
        <div class="username-password">
        <div class="form-group">
          <input
            type="text"
            id="username"
            class="form-control"
            placeholder="Username"
            v-model="user.username"
            required
            autofocus />
        </div>
        <div class="form-group">
          <input
            type="password"
            id="password"
            class="form-control"
            placeholder="Password"
            v-model="user.password"
            required />
        </div>
        </div>
        <div class="form-group">
          <router-link class="need-account" :to="{ name: 'register' }">Need an account?</router-link>
        </div>
        <button class="btn btn-primary" type="submit">Sign in</button>
      </form>
    </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
      networkError: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push({ name: "home" });
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response == null || response.status === 500) {
            this.networkError = true;
          }

          else if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>

<style lang="scss">
@import "../styles/colors.scss";

.form-signin{
  padding-top: 10rem;
}

.username-password {
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  border-radius: 5px;
  filter: drop-shadow(0.25rem 0.1rem 0.5rem $black);
}

.h3 {
  color: $white;
  font-size:xx-large;
}

.alert {
  color: $white;
}

.btn {
  color: $white;
}

.need-account {
  color: $white;
}

.login-page {
  background-image: url("https://images.unsplash.com/photo-1542835497-a6813df96ed9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80");
  height: 100%;
  width: 100%;
  background-size: cover;
  background-repeat: no-repeat;
}

.btn {
  filter: drop-shadow(0.25rem 0.1rem 0.5rem $black);
}

</style>
