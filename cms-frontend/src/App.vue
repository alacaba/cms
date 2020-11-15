<template>
  <section id="app">
      <section class="hero is-primary">
        <div class="hero-body">
          <div class="container">
            <h1 class="title">Oozou stories</h1>
          </div>
        </div>
      </section>
      <section id="content">
        <div class="container">
          <Content></Content>
        </div>
      </section>
    </div>
  </section>
</template>

<script>
import Content from './components/Content.vue'

export default {
  name: 'app',
  components: {
    Content
  }
}
</script>

<style>
#content {
  margin-top: 20px;
}
</style>
