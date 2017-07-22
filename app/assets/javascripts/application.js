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
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require jquery_ujs
//= require_tree .

  function toggleIcon() {
    $("i").toggleClass("fa-bars fa-times");
  }

  function toggleClass() {
    $("#nav").toggleClass("hidden active");
  }

  function changeSrc() {
    var src = ($(this).attr('src') === 'icons/menu-white.svg')
      ? 'icons/cancel-white.svg'
      : 'icons/menu-white.svg';
    $(this).attr('src', src);
  }
