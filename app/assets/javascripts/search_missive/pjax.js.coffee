# pjaxによる検索結果の差し替え
$(document).on 'submit', 'form', (event) ->
  $.pjax.submit event, '#result'
$(document).on 'click', ".pagination a", (event) ->
  $.pjax.click event,
    container: $('#result')
    scrollTo: $(window).scrollTop() # デフォルトではpjaxを実行するとスクロールがトップに移動してしまうので、値を設定して現状維持