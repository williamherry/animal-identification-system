# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#btn-reset").click (e) ->
    do e.preventDefault
    $("input[type=checkbox]").attr('checked', false)
