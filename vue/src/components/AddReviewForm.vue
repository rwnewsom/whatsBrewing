<template>
  <form v-on:submit.prevent="handleSave"> 
    <div>
      <p>
        <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            Leave a Review
        </button>
      </p>
    <div class="collapse" id="collapseExample" v-if="addFormVisible===true">
        <div class="card card-body">
            <form v-on:submit.prevent="addBeer">
                <input type="hidden" value="YourUserIDGoesHere" />
                <div class="form-element">
                  <select id="rating" v-model.number="newReview.rating">
                    <option value="1">1 Star</option>
                    <option value="2">2 Stars</option>
                    <option value="3">3 Stars</option>
                    <option value="4">4 Stars</option>
                    <option value="5">5 Stars</option>
                  </select>
                </div>
                <div class="form-element">
                  <label for="review" ></label>
                  <textarea id="review" v-model="newReview.description" placeholder="Leave a review"></textarea>
                </div>
            </form>
              <input type="submit" value="Save" class="btn btn-primary" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" v-bind:disabled="isSaveDisabled">
              <input type="button" value="Cancel" class="btn btn-primary" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" v-on:click="$store.commit('TOGGLE_ADD_FORM_VISIBLE')">
        </div>
      </div>

      <div class="collapse" id="collapseExample" v-else>You must be signed in to leave a review.
        <form v-on:submit.prevent="addBeer">
                <input type="hidden" value="YourUserIDGoesHere" />
                <div class="form-element">
                </div>
            </form>
      </div>
    </div>
  </form>
</template>

<script>
import BreweryService from '../services/BreweryService.js'; 
import ReviewService from '../services/ReviewService.js';
export default {
    data() {
        return {
            newReview: {
                rating: 1,
                description: '',
                name: this.$store.state.user.username,
                beerId: 0,
            },
        };
        
    },
    name: 'review-list',
    components: {
    },
     computed: {
        allReviews(){
            return this.$store.state.reviews;
        },
        isSaveDisabled() {
                return this.newReview.title === '';
            },

        numberOfReviews(){
            return this.$store.state.reviews.length;
        },

        addFormVisible(){
            if (this.$store.state.user.username){
                return true;
            } return false;
        },

        averageRating(){
            if(this.numberOfReviews <= 0){
                return 'No Reviews';
            }
            let total = 0;
            this.$store.state.reviews.forEach(rev=> total += rev.reviewerRating);
            return (total / this.$store.state.reviews.length).toFixed(2);
        }

    },
        
        created(){
        console.log('Attempting review request...');
        let beerId = parseInt(this.$route.params.beerId);

        ReviewService.reviewList(beerId)
        .then(result => {
            console.log('Promise Resolved', result);

            if(result.status === 200){
                this.$store.commit('LOADED_REVIEWS', result.data);
            }
        });
    },
    methods: {
        reloadPage() {
        window.location.reload();
        },
        handleSave(event) {
            console.log('Save was clicked!', event);
            this.newReview.name = this.$store.state.user.username;
            this.newReview.beerId= +this.$route.params.beerId;
            BreweryService.submitReview(this.newReview);

            // Identify an object representing the new review
            //let reviewToAdd = this.newReview;

            // Add the new review to the reviews array (at the beginning)
            //this.$store.state.reviews.splice(0, 0, reviewToAdd); // Start at beginning, delete nothing, add the review
            //this.$store.commit('ADD_REVIEW', reviewToAdd);

            //let newId = reviewToAdd.id;

            // Clear the form for the next addition (and prevents odd bugs in adding data multiple times)
            this.newReview = {
                rating: 1,
                description: '',
                name: ''
            }

            //  if (this.$route.name === 'new') 
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

<style lang="scss">
@import "../styles/colors.scss";

.form-box{
  border: 1px solid $babypowder;
  margin: 2rem;
  padding: 1rem;
  border-radius: 5px;
}

.form-box textarea {
  width: 80%;
  padding-left: 1rem;
  padding-right: 1rem;
}

.form-box select {
  width: 20%;
  padding-left: 1rem;
  padding-right: 1rem;
}

.form-box label {
  padding-right: 1rem;
  padding-bottom: 1rem;
}

.form-box input {
  border-radius: 5px;
}



</style>