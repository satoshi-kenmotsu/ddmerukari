$(function(){
  function buildHTML(comment){
    var html = `
                <div class="text_box">
                  <div class="username">
                    ${comment.user_name}
                  </div>
                  <div class="text">
                  ${comment.content}
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.message-text').append(html);
      $('.textarea').val('');
      $('.comment-submit').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントが取得できませんでした');
    })
  })
})