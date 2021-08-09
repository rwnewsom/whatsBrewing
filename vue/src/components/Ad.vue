<template>
    <div class="ad">
      <img class="ad-img" src="https://s3-prod.adage.com/s3fs-public/beer-cases-sold-sidebar.jpg" />
      <img class="ad-img-2" src="https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/16d9dc86194045.5d9250eb67932.jpg" />
    </div>
</template>

<style lang="scss">

@import "../styles/colors.scss";

.ad img {
  grid-area: ad;
  display: flex;
  flex-wrap: wrap; 
  flex-direction: column;
  align-items: flex-start;
  margin-top: 4rem;
  background-color: $white;
  color: $black;
  border: 1px solid $black;
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

</style>