$( document ).ready(function() {
  $("#new-post-form").on("submit", function(event){
  	event.preventDefault();

  	var $form = $(this);
  	var url = $form.attr('action');
  	var method = $form.attr('method');
  	var data = $form.serialize();

  	$.ajax({
  		url: url,
  		method: method,
  		data: data
  	})
  	.done(function(response){
  		$('#post-list').prepend(response);
  		$form.find('.clear').val('')
  	})
  });
  //  $("#post-list").on("submit", ".post", function(event){
  // 	event.preventDefault();
  // 	var $form = $(this).find(".form");
  // 	var url = $form.attr('action');
  // 	var method = $form.attr('method');
  // 	var data = $form.serialize();

  // 	$.ajax({
  // 		url: url,
  // 		method: method,
  // 		data: data
  // 	})
  // 	.done(function(response){
  // 		debugger
  // 		console.log(response)
  //    $form ------------Unable to access $form here but using similar logic, I am able to access it below
  // 	})
  // });
    $('.content').on('submit', '.new-post-like-form', function(event){
      event.preventDefault();
      var $form = $(this)
      $.ajax({
        url: $form.attr('action'),
        method: $form.attr('method'),
        data: $form.serialize()
      })
      .done(function(response){
        var $likes = $form.siblings('.post-details').find('.post-likes');
        $likes.text(response.likes + ' likes')
      })
    });
});

