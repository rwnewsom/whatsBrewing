<template>
    <div class="ad">
      <img v-for="url in array" v-bind:key="url" class="ad-img" v-bind:src="url">
    </div>
</template>

<script>
export default {
  // mounted(){
  //   var array = ['https://i.ibb.co/vk7vX5L/Better-Call-Saul.jpg',
  //               'https://i.pinimg.com/originals/f7/fe/39/f7fe39708b9d1b585304dcea08197719.jpg',
  //               'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/16d9dc86194045.5d9250eb67932.jpg',
  //               'https://s3-prod.adage.com/s3fs-public/beer-cases-sold-sidebar.jpg',
  //               'https://www.americancraftbeer.com/wp-content/uploads/2018/12/Coors-Light-min.png',
  //               'https://d31029zd06w0t6.cloudfront.net/wp-content/uploads/sites/38/2020/07/web1_Drive-Sober-or-Get-Pulled-Over.jpg'];
  //     function shuffle(array) {
  //     var currentIndex = array.length;
  //     var temporaryValue;
  //     var randomIndex;
  //     while (0 !== currentIndex) {
  //       randomIndex = Math.floor(Math.random() * currentIndex);
  //       currentIndex -= 1;
  //       temporaryValue = array[currentIndex];
  //       array[currentIndex] = array[randomIndex];
  //       array[randomIndex] = temporaryValue;
  //     }
  //     return array.slice(0,4);
  //   }
  //   var shuffled_images = shuffle(array);
  //   for(var i=0;i<shuffled_images.length-2;i++) {
  //   document.getElementById('ad' + (i+1)).src = shuffled_images[i] ;
  //   }
  //},
  data(){
    return {
      array: ['https://i.ibb.co/vk7vX5L/Better-Call-Saul.jpg',
                 'https://i.pinimg.com/originals/f7/fe/39/f7fe39708b9d1b585304dcea08197719.jpg',
                 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/16d9dc86194045.5d9250eb67932.jpg',
                 'https://s3-prod.adage.com/s3fs-public/beer-cases-sold-sidebar.jpg',
                 'https://www.americancraftbeer.com/wp-content/uploads/2018/12/Coors-Light-min.png',
                 'https://d31029zd06w0t6.cloudfront.net/wp-content/uploads/sites/38/2020/07/web1_Drive-Sober-or-Get-Pulled-Over.jpg']
    }
  },
  computed: {
    showAd(){
      return this.$route.params.name == 'beers';
    }
  },
  created(){
    function shuffle(array, numAds) {
       var currentIndex = array.length;
       var temporaryValue;
       var randomIndex;
       while (0 !== currentIndex) {
         randomIndex = Math.floor(Math.random() * currentIndex);
         currentIndex -= 1;
         temporaryValue = array[currentIndex];
         array[currentIndex] = array[randomIndex];
         array[randomIndex] = temporaryValue;
       }
       return array.slice(0, numAds);
     }
    this.array = shuffle(this.array, this.numAds)
  },
  props:{
    numAds: {
      type: Number,
      default: 4,
    }
  }
}
</script>

<style lang="scss">

@import "../styles/colors.scss";

.ad {
  background-color: rgb(231, 230, 230);
  border-radius: 5px;
  filter: drop-shadow(-0.2rem 0.1rem 0.8rem $black);
}

.ad img {
  grid-area: ad;
  display: flex;
  flex-wrap: wrap; 
  flex-direction: column;
  align-items: flex-start;
  margin-top: 1rem;
  color: $black;
  border: 2px solid $black;
  margin-left: auto;
  margin-right: auto;
  filter: drop-shadow(0.25rem 0.1rem 0.5rem $black);
}

.ad-img {
  width: 90%;
  height: fit-content;
  border: 2px solid $black;
  margin-top: 2rem;
  border-radius: 5px;
  display: flex;
  grid-area: ad1;
}

.ad-img-2 {
  width: 90%;
  height: fit-content;
  border: 2px solid $black;
  margin-top: 2rem;
  border-radius: 5px;
  display: flex;
  grid-area: ad2
}
.ad-img-3 {
  width: 91%;
  height: fit-content;
  border: 5px solid $black;
  margin-top: 2rem;
  border-radius: 5px;
  display: flex;
}

</style>