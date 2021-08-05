<template>
    <div class="review-container">
        <add-review-form />
        <h4 v-if="numberOfReviews >= 1">This beer has an average rating of {{averageRating}} </h4>
        <h4 v-else>This beer has no reviews.</h4>
        
        <h4 v-if="numberOfReviews >= 1">There are {{numberOfReviews}} reviews for this beer:</h4>
    <review-card v-bind:review="review" v-for="review in $store.state.reviews" v-bind:key="review.reviewId" />
  </div> 
  
</template>

<script>
import ReviewCard from '../components/ReviewCard.vue';
import ReviewService from '../services/ReviewService.js';
import AddReviewForm from '../components/AddReviewForm.vue';

export default {
    name: 'review-list',
    components: {
        ReviewCard,
        AddReviewForm
    },
     computed: {
        allReviews(){
            return this.$store.state.reviews;
        },

        numberOfReviews(){
            return this.$store.state.reviews.length;
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

}
</script>

<style>

</style>