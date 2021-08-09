<template>
    <div class="ad">
      <p>Your ad here</p>
    </div>
</template>

<style lang="scss">

@import "../styles/colors.scss";

.ad {
  grid-area: ad;
  display: flex;
  justify-content: space-around;
  background-color: $white;
  color: $black;
  border: 1px solid $black;
}

</style>