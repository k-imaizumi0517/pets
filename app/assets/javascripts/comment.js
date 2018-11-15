$(function(){
  $(document).on('turbolinks:load', function() {
    function buildHTML(comment){
      var html = `<div class="card mb-4 shadow-sm card__background">
                    <div class="card-body">
                      <p class="card-text">
                        <small class="text-muted">by</small>
                        <a href=/users/${comment.user_id}>${comment.user_nickname}</a>
                      </p>
                      <p>
                        ${comment.text}
                      </P>
                      <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group"></div>
                        <small class="text-muted">${comment.created_at}</small>
                      </div>
                    </div>
                  </div>`
      return html;
    }
    $('#new_comment').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
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
        $('.comments').append(html);
        $('.form-control').val('');
        $('.disable').prop('disabled', false);
      })
      .fail(function(){
        alert('error');
      });
    });
  });
});
