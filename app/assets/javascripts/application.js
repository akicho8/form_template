// gem で入れている
//= require rails-ujs
//
// yarn add で入れている
//= require jquery
//= require bootstrap/dist/js/bootstrap
//= require_tree .

if (typeof(jQuery) != "undefined") {
  console.log('jQuery found (in app/assets/javascript/application.js)')
} else {
  console.log('jQuery not found (in app/assets/javascript/application.js)')
}
