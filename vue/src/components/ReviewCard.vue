<template>
<div class="review-display">
    <div class="card">
        <div class="card-content">
            <h4>Reviewer: {{review.reviewerName}}</h4>
            <h4 class="reviewer-rating">Rating: {{ review.reviewerRating}}</h4>
            <p class="review-author">Review: {{ review.reviewDescription }}</p>
        </div>
    </div>   
</div>
  
</template>

<script>

export default {
    name: 'review-card',
    props: {
        review: Object,
        enableAdd: { //For future implementation, code taken from lecture
            type: Boolean,
            default: false,
        }
    },
   


}
</script>

<style lang="scss">
@import "../styles/colors.scss";

.card {
    border: 2px solid $white;
    border-radius: 10px;
    width: 500px;
    height: auto;
    margin: 20px;
    background-color: $black;
    color: $white;    
}

.card-content{
    padding: 1rem;
}



</style>