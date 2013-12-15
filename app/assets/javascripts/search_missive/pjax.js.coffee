# pjaxによる検索結果の差し替え
$(document).on 'submit', 'form', (event) ->
  $.pjax.submit event, '#result'
$(document).on 'click', ".pagination a[href!='#']", (event) ->
  $.pjax.click event,
    container: $('#result')