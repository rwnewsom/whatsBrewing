<template>
    <div class="ad">
      <img class="ad-img" src="../assets/BetterCallSaul.jpg">
      <img class="ad-img" src="https://i.pinimg.com/originals/f7/fe/39/f7fe39708b9d1b585304dcea08197719.jpg">
      <img class="ad-img-2" src="https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/16d9dc86194045.5d9250eb67932.jpg" />
      <img class="ad-img" src="https://s3-prod.adage.com/s3fs-public/beer-cases-sold-sidebar.jpg" />
      <img class="ad-img" src="https://www.americancraftbeer.com/wp-content/uploads/2018/12/Coors-Light-min.png">
    </div>
</template>

<style lang="scss">

@import "../styles/colors.scss";

.ad {
  background-color: #023047;
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