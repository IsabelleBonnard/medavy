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
  // $( '.swipebox' ).swipebox();
  $( '.swipebox' ).swipebox( {
      useCSS : true, // false will force the use of jQuery for animations
      useSVG : true, // false to force the use of png for buttons
      initialIndexOnArray : 0, // which image index to init when a array is passed
      hideCloseButtonOnMobile : false, // true will hide the close button on mobile devices
      removeBarsOnMobile : true, // false will show top bar on mobile devices
      hideBarsDelay : 3000, // delay before hiding bars on desktop
      videoMaxWidth : 1140, // videos max width
      beforeOpen: function() {}, // called before opening
      afterOpen: null, // called after opening
      afterClose: function() {}, // called after closing
      loopAtEnd: false // true will return to the first image after the last image is reached
    } );
  // aligner la hauteur de la map et de la description sur la home page
  if (document.getElementById('map')) {
    console.log('map');
    var right=document.getElementById('map').clientHeight;
    var left=document.getElementById('leftdiv').clientHeight;
    if(left>right)
    {
        document.getElementById('map').style.height = left+'px';
    }
    else
    {
        document.getElementById('leftdiv').style.height = right+'px';
    }
  }
  // cliquer vers une div sur la page history
  $.fn.goTo = function() {
    $('html, body').animate({
        scrollTop: $(this).offset().top - 30 + 'px'
    }, 'fast');
    return this; // for chaining...
  }
  $('#li-origins').click(function(event) {
    $('#card-origins').goTo();
  });
  $('#li-rouxel').click(function(event) {
    $('#card-rouxel').goTo();
  });
  $('#li-montregard').click(function(event) {
    $('#card-montregard').goTo();
  });
  $('#li-laroque').click(function(event) {
    $('#card-laroque').goTo();
  });
  $('#li-recent').click(function(event) {
    $('#card-recent').goTo();
  });
});



