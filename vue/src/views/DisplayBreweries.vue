<template>
  <div>
      <h1>BreweryList</h1>
      <brewery />
  </div>
</template>

<script>
import Brewery from '../components/Brewery.vue'
import BreweryService from '../services/BreweryService';
export default {
  components: { Brewery },
    name: "brewery",
    data() {
    return {
      brewery: {
        id: '',
        name: '',
        description: '',
      },
    };
  },
    methods: {
        listBreweries() {
            BreweryService.list(
                //.then(response => {
                   // this.$store
                //})
            )
        }
    }
}
</script>

<style>

</style>