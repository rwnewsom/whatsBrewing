<template>
  <div>
      <!-- <h1>BreweryList</h1>
      <brewery /> -->
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
        <!-- Changed to computed property, of as opposed to in -->
        <tr v-for="brewery of allBreweries" v-bind:key="brewery.id">
          <td width="10%">
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
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService.js'
// import BreweryService from '../services/BreweryService';
export default {

  computed: {
      allBreweries(){
        return this.$store.state.breweries;
      }
    },

    created() {
      console.log('Attempting brewery request...'); //this is the last loggged message


      BreweryService.list()
      .then(result => {
        console.log('Promise Resolved', result);


        if(result.status === 200) {
          this.$store.commit('LOADED_BREWERIES', result.data);
        }
      } );
    }
  /* components: {  },
    name: "brewery",
    data() {
    return {
      brewery: {
        id: '',
        name: '',
        description: '',
      },
    },
    
  }, */
    /* methods: {
        listBreweries() {
            BreweryService.list(
                //.then(response => {
                   // this.$store
                //})
            )
        }
    } */
}
</script>


<style lang="scss">

@import '../styles/colors.scss';

table {
    width: 100%;
}

table thead th {
    text-align: left;
}



table {
  border: 1px solid $accentLight;
  width: 100%;
  border-collapse: collapse;
}
table td, table th {
  border: 1px solid $accentLight;
  padding: 3px 2px;
}
table tbody td {
  font-size: 13px;
}
table tr:nth-child(even) {
  background: $accentLight;
}
table thead {
  background: $accentDark;
  color: $accentLight;
  border-bottom: 5px solid $accentLight;
}
table thead th {
  font-size: 17px;
  font-weight: bold;
  color: $accentLight;
  text-align: left;
  border-left: 2px solid $accentLight;
}
table thead th:first-child {
  border-left: none;
}

</style>