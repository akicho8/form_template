# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# //
# // GoogleMapsの表示
# //
# //              id: 表示する場所
# //   center_gpoint: 中心座標
# //         gpoints: [{:latitude => ?, :longitude => ?, :balloon_html => ?}]
# //    balloon_show: trueなら最初の1件のバルーンを最初から開いておく。(FIXME: "first_open" や "all_open" とかにすること)
$.multipoint_googlemaps = (params) ->
  # ネットに繋がっていないといきなり GBrowserIsCompatible() が使えないため
  # if typeof(GBrowserIsCompatible) == "undefined"
  #   return
  map = new GMap2(document.getElementById(params.id))
  center_latlng = new GLatLng(params.center_gpoint.latitude, params.center_gpoint.longitude)
  map.setCenter(center_latlng, params.zoom)
  map.addControl(new GSmallZoomControl())

#   if (GBrowserIsCompatible()) {
# 
#     var first = false;
#     $.each(params.gpoints, function(index, gpoint) {
#       var latlng = new GLatLng(gpoint.latitude, gpoint.longitude);
#       var marker = new GMarker(latlng);
#       GEvent.addListener(marker, "click", function() {
#         marker.openInfoWindowHtml(gpoint.balloon_html);
#       });
#       if (first == false) {
#         first = true
#         if (params.balloon_show) {
#           marker.openInfoWindowHtml(gpoint.balloon_html);
#         }
#       }
#       map.addOverlay(marker);
#     });
#   }
# }
