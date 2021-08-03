/* <template> *_*_*_ VESTIGIAL *_*_*_
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
//adding this
export default {
    computed: {
      allBreweries(){
        return this.$store.state.breweries;
      }
    },

    created() {
      BreweryService.list()
      .then(result => {
        if(result.status === 200) {
          this.$store.commit('LOADED_BREWERIES', result.data);
        }
      } );
    }
}
</script>

<style>

</style> */