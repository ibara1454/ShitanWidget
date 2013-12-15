# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

  #live binding
$(document).on 'click', "#result table a", (e) ->
  e.preventDefault()
  popup = $('#missiveModal')
  href = $(this).attr('href')
  $.ajax
    url: href
    beforeSend: ->
      popup.modal('show')
    success: (data, dataType)->
      popup.find('.modal-body').html data
  false