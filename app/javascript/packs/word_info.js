// 「読み上げる」用
// app/views/admin/guides/my_albums/_word_info_form.html.slim で利用
// new WordInfoFormSpeech().$mount("#app") として使う

import Vue from "vue/dist/vue.esm"

window.WordInfoFormSpeech = Vue.extend({
  data() {
    return {
      record: this.$options.record_attributes,
    }
  },

  methods: {
    speech_handle() {
      textToSpeech(this.yomiage_text, this.record.locale_key)
    },
  },

  computed: {
    yomiage_text() {
      return this.record.speech_text || this.record.paper_text
    },
  },
})
