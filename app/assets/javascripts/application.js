//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require moment/fr

//= require underscore
//= require gmaps/google
//= require typed
//= require clipboard
//= require data-confirm-modal
//= require_tree ./vendor/
//= require_tree .

// alert('Sadly ...');

$(function () {
  $('.incorrect').click(function(event) {
    $(this).addClass('red-border');
    $('.incorrect').removeClass('incorrect').off('click');;
    $('.correct').removeClass('correct').off('click');;
    $('.answer').removeClass('hidden');
  });
  $('.correct').click(function(event) {
    $(this).addClass('green-border');
    $('.incorrect').removeClass('incorrect').off('click');;
    $('.correct').removeClass('correct').off('click');;
    $('.answer').removeClass('hidden');
    var question_id = $(this).attr('id');
    console.log(question_id);
    $.ajax({
      type: "GET",
      url: '/questions/incrementation/' + question_id,
      success: function(data) {
        console.log('incrementation ok');
      },
      error: function(jqXHR) {
        console.log('incrementation raté');
      }
    });
  });
});



