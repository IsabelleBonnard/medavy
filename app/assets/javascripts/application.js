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
});



