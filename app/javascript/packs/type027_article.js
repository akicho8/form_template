/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %>
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import App from './app.vue'

document.addEventListener('DOMContentLoaded', () => {
  var vm = new Vue({
    el: '#app',
    data: {
      mondai_body: "",
      mondai_index: 0,
      mondai_one: "",
      mondai_all: [],
    },
    methods: {
      // 問題の配列
      mondai_list: function() {
        if (!this.mondai_body) {
          return [];
        }
        return this.mondai_body.split(/[,\s]+/);
      },
      // 問題が変更されたとき
      mondai_henkou: function() {
        this.mondai_reset_click();
      },
      // 「最初から」
      mondai_reset_click: function() {
        this.mondai_index = 0;
        this.mondai_one = "";
        this.mondai_shuffle_click();
      },
      // 「つぎへ」
      mondai_next_click: function() {
        if (this.mondai_next()) {
          this.mondai_one = this.mondai_next();
          this.mondai_index += 1
        } else {
          this.mondai_one = "おわり";
        }
      },
      // 「シャッフル」
      mondai_shuffle_click: function() {
        this.mondai_all = this.mondai_list();
        this.shuffle_self(this.mondai_all);
        this.mondai_body = this.mondai_all.join(" ");
      },
      // つぎの問題を返す
      mondai_next: function() {
        return this.mondai_all[this.mondai_index];
      },
      // なんか汚いけど bootstrap 用の "width: 50%" の部分
      mondai_progress_bar_width: function() {
        return "width: " + (100 * this.mondai_index / this.mondai_all.length) + "%";
      },
      // 綺麗なシャッフル
      shuffle_self: function(array) {
        var m = array.length, t, i;
        while (m) {
          i = Math.floor(Math.random() * m--);
          t = array[m];
          array[m] = array[i];
          array[i] = t;
        }
      },
    },
  })
})
