<template>
  <div class="brewery">
    <table>
      <thead>
        <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="brewery in this.$store.state.breweries" v-bind:key="brewery.id">
          <td width="80%">
              {{brewery.id}}
          </td>
          <td>
              {{brewery.name}}
          </td>
          <td>
            {{brewery.description}}
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import BreweryService from "../services/BreweryService.js";
export default {
    name: "brewery",
    methods: {
        getBrewery
    }
}
</script>

<style>

</style>