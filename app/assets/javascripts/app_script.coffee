$(document).on 'turbolinks:load', ->
  $('#to-top').click ->
    $(window).scrollTop 0
  $('.alert').delay(2000).slideUp 1500
  $('#error-explanation').delay(5000).slideUp 2000
