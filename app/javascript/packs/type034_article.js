/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag "hello_vue" %>
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// CSS
require("select2/dist/css/select2")                       // select2 本体のCSSの読み込み
require("select2-bootstrap-theme/dist/select2-bootstrap") // bootstrap テーマの読み込み

// JS
import Select2 from "select2"

// エラーメッセージの日本語化
require("select2/dist/js/i18n/ja")

// グローバルなオプションの指定
$.fn.select2.defaults.set("allowClear", true)    // 空にできるようにする
$.fn.select2.defaults.set("placeholder", "")     // allowClear だけだとエラーになるため
$.fn.select2.defaults.set("width", "100%")       // tdタグの中に入れたときにだんだん大きくなっていくのを防ぐ
$.fn.select2.defaults.set("theme", "bootstrap")  // テーマの指定

// 実行
document.addEventListener("DOMContentLoaded", () => {
  $(".js-searchable").select2()
})
