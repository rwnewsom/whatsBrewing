<template>
  <div class="register-page">
    <div id="register" class="text-center">
      <form class="form-register" @submit.prevent="register">
        <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
        <div class="alert alert-danger" role="alert" v-if="registrationErrors">
          {{ registrationErrorMsg }}
        </div>
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
        <div class="form-group">
          <input
            type="password"
            id="confirmPassword"
            class="form-control"
            placeholder="Confirm Password"
            v-model="user.confirmPassword"
            required />
        </div>
        <div class="form-group">
          <router-link class="have-account" :to="{ name: 'login' }">Have an account?</router-link>
        </div>
        <button class="btn btn-primary" type="submit">
          Create Account
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  mounted () {
        window.scrollTo(0, 0)
    },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                name: 'login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style lang="scss">
@import "../styles/colors.scss";

.form-register{
  padding: 10rem;
}

input#username.form-control, input#password.form-control, input#confirmPassword.form-control{
  width: 50%;
  margin-left: auto;
  margin-right: auto;
  border-radius: 5px;
  border: 2px solid $black;
  filter: drop-shadow(0.25rem 0.1rem 0.5rem $black);
}

.register-page {
  background-image: url("https://images.unsplash.com/photo-1542835497-a6813df96ed9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80");
  height: 100%;
  width: 100%;
  background-size: cover;
  background-repeat: no-repeat;
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

.have-account {
  color: $white;
}

.btn {
  filter: drop-shadow(0.25rem 0.1rem 0.5rem $black);
}

</style>
