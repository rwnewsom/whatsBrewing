<template>
  <form v-on:submit.prevent="handleSave"
      > <!-- v-show keeps it in the DOM, but adds display: none. This is ALWAYS a good idea for forms -->

      <input type="hidden" value="YourUserIDGoesHere" />
      <div class="form-element">
        <label for="rating">Rating:</label>
        <select id="rating" v-model.number="newReview.rating">
          <option value="1">1 Star</option>
          <option value="2">2 Stars</option>
          <option value="3">3 Stars</option>
          <option value="4">4 Stars</option>
          <option value="5">5 Stars</option>
        </select>
      </div>
      <div class="form-element">
        <label for="review">Review:</label>
        <textarea id="review" v-model="newReview.review"></textarea>
      </div>
      <input type="submit" value="Save" v-bind:disabled="isSaveDisabled"> <!-- v-on:click.prevent="handleSave" -->
      <input type="button" value="Cancel" v-on:click="$store.commit('TOGGLE_ADD_FORM_VISIBLE')">
    </form>  
</template>

<script>
//import BreweryService from '../services/BreweryService.js'; 
export default {
    data() {
        return {
            newReview: {
                rating: 1,
                review: '',
                reviewer: ''
            },
        };
    },
    computed: {
            isSaveDisabled() {
                return this.newReview.title === '';
            },
        },
        created() {
        console.log('Here is my $route', this.$route);
        console.log('Here is my $router', this.$router);
        },
    methods: {
        handleSave(event) {
            console.log('Save was clicked!', event);

            // Identify an object representing the new review
            //let reviewToAdd = this.newReview;

            // Add the new review to the reviews array (at the beginning)
            //this.$store.state.reviews.splice(0, 0, reviewToAdd); // Start at beginning, delete nothing, add the review
            //this.$store.commit('ADD_REVIEW', reviewToAdd);

            //let newId = reviewToAdd.id;

            // Clear the form for the next addition (and prevents odd bugs in adding data multiple times)
            this.newReview = {
                rating: 1,
                review: '',
                reviewer: ''
            }

             if (this.$route.name === 'new') 
             //{
            //   // Redirect to the list page
            //   //this.$router.push({name: 'list'});

            //   // Redirect to the item details page
            //   this.$router.push({name: 'review-details',
            //                      params: {id: newId}});
            // } else 
            {
              // Hide the form
              this.$store.commit('TOGGLE_ADD_FORM_VISIBLE');
            }
        },        
    }
}
</script>

<style>

</style>