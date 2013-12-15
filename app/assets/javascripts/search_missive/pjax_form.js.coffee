# pjaxによる検索結果の差し替え
$(document).on 'submit', 'form[data-pjax]', (event) ->
  $.pjax.submit(event, '#result')