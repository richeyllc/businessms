# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# called from a bootstrap dropdown, this closes the dropdown
$(document).ready ->
  clickOnPopupLink = ->
    $("body").on "click", ".static-popup-link", ->
      $("#myModal").modal "show"


  clickOnPopupLink()
