<template>
  <div>
    <div v-for="content in contents" :key="content.id">
      <h1 class="title">{{ content.attributes.title }}</h1>
      <h2 class="subtitle">{{ content.attributes.author }}</h2>
      <p>{{ content.attributes.content }}</p>
      <br>
      <div>
        <small><em>Date published: {{ content.attributes.published_date }}</em></small>
      </div>
      <hr>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      contents: []
    }
  },

  created () {
    axios
      .get('http://localhost:3000/contents')
      .then(contents => {
        this.contents = contents.data.data
      })
  }
}
</script>

