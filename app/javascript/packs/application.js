/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

require("bootstrap/dist/css/bootstrap")
require("bootstrap/dist/css/bootstrap-theme")

import "./general_sort.js"

window.chroma  = require("chroma-js")
window.sprintf = require("sprintf-js").sprintf
window.axios   = require("axios")

// TODO: 「window.Vue = require("vue/dist/vue.esm")」だとダメなのはなぜだろう？
import Vue from 'vue/dist/vue.esm'
window.Vue = Vue

import _ from "lodash"
window._ = _
Object.defineProperty(Vue.prototype, '_', {value: _})

console.log(`jQuery ${typeof(jQuery)}`)
console.log(`Vue ${typeof(Vue)}`)
