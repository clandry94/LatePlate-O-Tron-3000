# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#breakfast_button").click ->
    $("#breakfast_div").toggle()

  $("#dinner_button").click ->
    $("#dinner_div").toggle()

  $("#recur_breakfast_button").click ->
    $("#breakfast_recur_div").toggle()

  $("#recur_dinner_button").click ->
    $("#dinner_recur_div").toggle()
