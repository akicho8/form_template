// app/views/name_space1/type037_articles/_form.html.slim

import Vue from 'vue/dist/vue.esm'
// import draggable from "vuedraggable"

window.Type037ArticleForm = Vue.extend({
  // components: {
  //   draggable,
  // },

  data() {
    return {
      type037_attachments: this.$options.type037_attachments,
      errors_full_messages: null,
      stored_file_infos: null,
      upfile_infos: [],
    }
  },

  computed: {
    // draggable_options() {
    //   return {
    //     animation: 200,
    //   }
    // },
  },

  methods: {
    // uploaded_handle1() {
    //   const files = this.$refs["multiple_file_input"].files
    //
    //   // 本体のバイナリー以外の情報は FileReader する前からわかる
    //   console.log(files)
    //
    //   // ここを外すと追加になるけど、inputタグの方と合わせておいた方が管理しやすいので追加はやめた方がいい
    //   this.file_infos = []
    //
    //   // files は Array ではなく FileList 型なので常識的に考えたらあるはずの forEach メソッドがないのでこんなことになっている
    //   for (const file of files) {
    //     console.log(file)
    //     const reader = new FileReader()
    //     reader.addEventListener("load", e => {
    //       // e.target と reader は同じ
    //       const file_info = {filename: file.name, file_type: file.type, file_src: e.target.result}
    //       this.file_infos.push(file_info)
    //
    //       const params = {
    //         file_info: file_info,
    //         authenticity_token: this.$options.authenticity_token,
    //       }
    //       fetch(this.$options.put_path, {
    //         method: this.$options.use_method,
    //         body: JSON.stringify(params),
    //         headers: {
    //           "Accept": "application/json",
    //           "Content-Type": "application/json; charset=utf-8",
    //           // "Content-Type": "application/x-www-form-urlencoded",
    //         },
    //       }).then(response => response.json())
    //         .then(v => {
    //           this.message = v["message"]
    //         })
    //
    //     }, false)
    //     reader.readAsDataURL(file)
    //   }
    // },

    uploaded_handle() {
      const files = this.$refs["multiple_file_input"].files

      // 本体のバイナリー以外の情報は FileReader する前からわかる
      console.log(files)

      // ここを外すと追加になるけど、inputタグの方と合わせておいた方が管理しやすいので追加はやめた方がいい
      this.upfile_infos = []

      // files は Array ではなく FileList 型なので常識的に考えたらあるはずの forEach メソッドがないのでこんなことになっている
      for (const file of files) {
        const reader = new FileReader()
        reader.addEventListener("load", e => {
          // e.target と reader は同じ
          const upfile_info = {
            filename: file.name,
            content_type: file.type,
            data_base64_body: e.target.result,
          }
          this.upfile_infos.push(upfile_info)

          // 配列に溜めて読み込みが終わった段階でまとめて送信する(なぜかというと親のレコードが新規のときに同期できない)
          if (this.upfile_infos.length >= files.length) {
            const params = {
              upfile_infos: this.upfile_infos,
              authenticity_token: this.$options.authenticity_token,
            }
            fetch(this.$options.put_path, {
              method: this.$options.use_method,
              body: JSON.stringify(params),
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json; charset=utf-8",
                // "Content-Type": "application/x-www-form-urlencoded",
              },
            }).then(response => response.json())
              .then(v => {
                this.errors_full_messages = v["errors_full_messages"]
                if (v["stored_file_infos"]) {
                  this.stored_file_infos = v["stored_file_infos"]
                }
              })
          }
        }, false)
        reader.readAsDataURL(file)
      }
    },

  },
})
