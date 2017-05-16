# yarn add で入れている
#= require jquery

# gem で入れている
#= require rails-ujs
#  require turbolinks
#= require twitter/bootstrap
#= require_tree .

if jQuery?
  console.log('jQuery found (in app/assets/javascript/application.js)')
else
  console.log('jQuery not found (in app/assets/javascript/application.js)')
