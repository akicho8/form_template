// 汎用の並び替え
// app/views/admin/guides/type005_articles/edit.html.slim

import Vue from 'vue/dist/vue.esm'
import draggable from "vuedraggable"

window.GeneralSort = Vue.extend({
  components: {
    draggable,
  },

  data() {
    return {
      target_records: this.$options.target_records,
      message: null,
    }
  },

  computed: {
    draggable_options() {
      return {
        animation: 200,
      }
    },
  },

  methods: {
    draggable_callback(e) {
      const params = {
        reordered_ids: this.target_records.map(e => e.id),
        authenticity_token: this.$options.authenticity_token,
      }

      fetch(this.$options.put_path, {
        method: "PUT",
        body: JSON.stringify(params),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json; charset=utf-8",
          // "Content-Type": "application/x-www-form-urlencoded",
        },
      }).then(response => response.json())
        .then(v => {
          this.message = v["message"]
        })
    },
  },
})
