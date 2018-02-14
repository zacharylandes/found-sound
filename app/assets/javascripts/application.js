// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require Chart.min
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .
//= require_tree ./channels


// TRY FETCH??
$(document).ready(function() {
  $('.search-bar').keyup(function(event){   // would be nice to not act on special keys
    var domain = window.location.origin;
    var query = $('.search-bar').val();
    // Note defined global variable item_search_key in application.html.erb
    var endpoint = domain + "/api/v1/search?type=items&q="+query+"&api_key="+item_search_key;
      if (query === "") {
        $(".search-suggestions").html("");
      } else {
        $.getJSON(endpoint, function(data) {
          var items = data["results"].map(function(item) {
            return "<a href='" + domain + "/items/" + item.id + "'>" + item.title + "</a></br>";
          });
          $(".search-suggestions").html(items);
        })
      }
    event.preventDefault();
  })
})
