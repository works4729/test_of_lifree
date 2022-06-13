<template>
  <div>
    <button
      type="button"
      name="button"
      @click="getMsg"
    >
      RailsからAPIを取得する
    </button>
    <div
      v-for="(msg, i) in msgs"
      :key="i"
    >
      {{ msg }}
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      subTitle: 'RailsからAPIを取得する',
      msgs: []
    }
  },
  methods: {
    getMsg () {
      this.$axios.$get('/hello')
        .then(res => this.msgs.push(res))
    }
  }
}
</script>