console.log('Jose');

$(function(){
  $('body').on('click', '.task-link', function(e){
    e.preventDefault();
    console.log('works like a charm');

    $that = $(this);
    $that.siblings('.edit_task').show().end().hide();

  })
});

// $('.task').find('.task-link').click(function(e) {
//   e.preventDefault()
//   $that = $(this);

//  // var text = $('.text-info').text();
//  var input = $('<input type="text" placeholder="' + text + '" />')
//  $('.text-info').text('').append(input);
// });