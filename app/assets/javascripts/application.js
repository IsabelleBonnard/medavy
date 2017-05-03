//= require jquery
//= require jquery_ujs
//= require src/js/jquery.swipebox.js
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
  $('#image-park').click(function(event) {
    $('#details-box-park').toggleClass('hidden');
  });
  $('#image-castle').click(function(event) {
    $('#details-box-castle').toggleClass('hidden');
  });
  $('#image-peter').click(function(event) {
    $('#details-box-peter').toggleClass('hidden');
  });
  $(window).scroll(function () {
    var h = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
    // console.log(h);
    var x = $(this).scrollTop() + h/4;
    console.log(x);
    var y = $('#card-origins').offset().top;
    console.log(y);
    var z = $('#card-rouxel').offset().top;
    // console.log(z);
    var t = $('#card-montregard').offset().top;
    var u = $('#card-laroque').offset().top;
    var v = $('#card-recent').offset().top;
    if (x < z) {
      $('.timeline > ul > li').removeClass('menu-active');
      $('.timeline > ul > li').addClass('menu-inactive');
      $('#li-origins').addClass('menu-active');
    }
    else if (x < t) {
      $('.timeline > ul > li').removeClass('menu-active');
      $('.timeline > ul > li').addClass('menu-inactive');
      $('#li-rouxel').addClass('menu-active');
    }
    else if (x < u) {
      $('.timeline > ul > li').removeClass('menu-active');
      $('.timeline > ul > li').addClass('menu-inactive');
      $('#li-montregard').addClass('menu-active');
    }
    else if (x < v) {
      $('.timeline > ul > li').removeClass('menu-active');
      $('.timeline > ul > li').addClass('menu-inactive');
      $('#li-laroque').addClass('menu-active');
    }
    else {
      $('.timeline > ul > li').removeClass('menu-active');
      $('.timeline > ul > li').addClass('menu-inactive');
      $('#li-recent').addClass('menu-active');
    }
  });
  $( '.swipebox' ).swipebox();
});



