/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %>
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Chart from 'chart.js'

document.addEventListener('DOMContentLoaded', () => {
  var labels = []
  var values = []
  for (var i = 0; i < 24; i++) {
    labels.push(i)
    values.push(Math.floor(Math.random() * 10))
  }
  var ctx = document.getElementById('type032_chart').getContext('2d')
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: labels,
      datasets: [
        {
          label: 'ラベル1',
          data: values,
          backgroundColor: "rgba(0,20,170,0.02)",
          borderColor:     "rgba(0,20,170,0.8)",
          fill: true,
        },
      ],
    },
  })
})
