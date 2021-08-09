<template>
<div class="review-display">
    <div class="card">
        <div class="card-content">
           
            <h4>Reviewer: {{review.reviewerName}}</h4>

             <div class="starReviews">
                <img src="../assets/filledHop.png"
                    v-for="i of review.reviewerRating" v-bind:key="i"  />
                <img class="empty" src="../assets/emptyHop.png"
                    v-for="i of emptyIcons" v-bind:key="i"  />
            </div>

            <h4 class="reviewer-rating">Rating: {{ review.reviewerRating}}</h4>
            <p class="review-author">Review: {{ review.reviewDescription }}</p>
        </div>
    </div>   
</div>
  
</template>

<script>

export default {
     computed: {
            emptyIcons(){
            return 5- this.review.reviewerRating;
        } 
     },
    name: 'review-card',
    props: {
        review: Object,
        enableAdd: { //For future implementation, code taken from lecture
            type: Boolean,
            default: false,
        },
    },
}

</script>

<style lang="scss">
@import "../styles/colors.scss";

.card {
    border: 2px solid $white;
    border-radius: 10px;
    width: 90%;
    height: auto;
    margin-left: auto;
    margin-right: auto;
    background-color: $black;
    color: $white;    
}

.card-content{
    padding: 1rem;
}

.starReviews img {
    height: 36px;
    margin: 0;
    padding: 0;
}

.starReviews img .empty {
    opacity: .5;
}



</style>