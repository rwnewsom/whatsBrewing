<template>
  <div id="beer-details">
      <div class="capsule">
        <delete-beer class="indent" />
        <h1 class="header"> Beer: The Devil is in the Details.... </h1>
        <!-- if not working check case -->
        <div class = "detailGroup">
            <div class="beer-details">
                <table>
                    <tr>
                        <td>Name:</td>
                        <td>{{currentBeer.name}}</td>
                    </tr>
                    <tr>
                        <td>Brewery:</td>
                        <td>{{currentBrewery.name}}</td>
                    </tr>
                    <tr>
                        <td>Style:</td>
                        <td>{{currentBeer.style}}</td>
                    </tr>
                    <tr>
                        <td>ABV:</td>
                        <td>{{currentBeer.abv}}</td>
                    </tr>
                    <tr v-if="currentBeer.ibu">
                        <td>IBU:</td>
                        <td>{{currentBeer.ibu}}</td>
                    </tr>
                </table>
            </div>
            <div class="beer-image">
                <img v-bind:src="currentBeer.beerImageUrl" />
            </div>
        </div>
        <div class="indent">
            <h5 class="desc">Description: {{currentBeer.description}}</h5>
        </div>
        <div class="ReviewDetails">
            <review-list />
        </div>
      </div>
  <Ad v-bind:numAds="3" />    
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService.js'
import Ad from "../components/Ad.vue";
import ReviewList from '../components/ReviewList.vue';
import DeleteBeer from '../views/DeleteBeer.vue';


export default {
    name: 'BeerDetails',
    computed: {
        currentBeer(){
            return this.$store.state.beerDetails;
        },
        currentBrewery(){
            return this.$store.state.brewery;
        }
    },
      components: {
        Ad,
        ReviewList,
        DeleteBeer,
    },
    mounted () {
        window.scrollTo(0, 0)
    },
    // methods: {
    //     deleteBeer() {
    //         let confirmed = confirm('Are you sure you want to delete this beer? This cannot be undone.');

    //         if (confirmed) {
    //             this.$store.commit('DELETE_BEER', this.beer.beerId);

    //             this.$router.push({name: 'BeerList'});
    //         }
    //     }
    // },
    created(){
        console.log('Requesting beer details...');

        let breweryId = parseInt(this.$route.params.id);
        let beerId = parseInt(this.$route.params.beerId);

        BreweryService.beerDetails(breweryId, beerId)
        .then(result => {
            console.log('Promise resolved.', result);
            if(result.status === 200){
                this.$store.commit('LOADED_BEER_DETAILS', result.data);
            }
        }),
        console.log('Requesting brewery details.');

        let currentBreweryId = parseInt(this.$route.params.id);

        BreweryService.detail(currentBreweryId)
        .then(result => {
            console.log('Promise resolved.', result);
            if(result.status === 200){
                this.$store.commit('LOADED_BREWERY', result.data);
            }
        });
    }

}
</script>

<style lang="scss">
@import "../styles/colors.scss";

/* .beerDeets{
    padding-left: 2rem;
} */

.capsule{
    border: 1px solid $black;
    background-color: $white;
    margin: 1rem;
    padding: 1rem;
    filter: drop-shadow(0.25rem 0.1rem 0.5rem $black);
    border-radius: 5px;
}

#beer-details {
    display: grid;
    grid-template-areas: "details ad";
    grid-template-columns: 4fr 1fr;
    height: 100%;
    padding-top: 2rem;
    padding-left: 2rem;

}


.header {
    text-align: center;
    text-align: center;
    margin-bottom: 1rem;
    font-style: oblique;
}

.tooltip{
    position:absolute;
    z-index:1020;
    display:block;
    visibility:visible;
    padding:5px;
    font-size:13px;
    opacity:0;
    filter:alpha(opacity=0)
}

.tooltip.in{
    opacity:.8;
    filter:alpha(opacity=80)
}

.tooltip.right .tooltip-inner{ 
width:310px; 
height: 30px;
padding:3px 8px; 
text-align:center; 
background-color:#CC0000; 
-webkit-border-radius:5px; 
-moz-border-radius:5px; 
border-radius:15px 
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

.detailGroup {
    // background-color:red;
    display: grid;
    grid-template-areas: "details image";
    grid-template-columns: 1fr 1fr;

    .beer-details {
        grid: details;
        display: flex;
        flex-direction: column;
        justify-content: center;
        // background-color: lime;
        margin-left: 8rem;
        margin-right: 1rem;
        table {
            border-collapse: collapse;
            border: none;
            margin: 0;
            // background-color: peachpuff;
            tr, td {
                border: none;
                font-size: x-large;
            }

            td:nth-child(1){
                font-weight: bold;
            }

            tr:nth-child(odd) {
                background-color: transparent;
            }
        }
    }

    .beer-image{
        grid: image;
        display: flex;
        flex-direction: row-reverse;
        margin-right: 8rem;
        img {
            border-radius: 10px;
            overflow: hidden;
            min-width: 25rem;
            width: 33%;
            max-width: 40rem;
        }
    }
}

.indent {
    width: 90%;
    margin: 0 auto;
}

.desc {
    padding: 2rem 0;
}

.abv-ibu{
    margin-top: 2rem;
    margin-bottom: 2rem;
}

.abv-ibu h3{
    margin: 0;
    padding: 0;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75 {
    width: 100%;
    margin-top: 0;
  }
}



</style>