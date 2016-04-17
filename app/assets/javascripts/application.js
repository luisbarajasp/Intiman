// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload
//= require twitter/bootstrap
//= require turbolinks
//= require masonry/jquery.masonry
//= require jquery.turbolinks
//= require_tree .

var ready = function(){
    // var width = $('.main-navigation').width();
    //
    // $('.wrapper_page').css("margin-left", width);

    var height = $(window).height() - 71;
    $('section.home').height(height);

    $('.search-form').click(function(){
        $('.search-form .fieldContainer .searchField').fadeIn().focus();
    });

    if (window.location.href.indexOf("?order") == -1) {
        if (window.location.href.indexOf("?") > -1) {
            $('#clean').removeClass("disable").addClass('enable');
        }else{
            $('#clean').addClass("disable").removeClass('enable');
        }
    }

    var sHeight = $(window).height() -70;
    var sWidth = (sHeight / 0.5625);
    var sLeft = ($(window).width() - sWidth) / 2;


    $('#slider').height(sHeight);
    $('#slider img').height(sHeight);
    $('#prev').height(sHeight);
    $('#next').height(sHeight);
    $('.home').css("padding-top",sHeight);

    if($('.slide').siblings().size() > 1){
        $("#slider").hover(
            function () {
                $("#next").show();
                $("#prev").show();
            },
            function () {
                $("#next").hide();
                $("#prev").hide();
        });
        $("#next").hover(
            function () {
                $("#next").show();
                $("#prev").show();
            },
            function () {
                $("#next").hide();
                $("#prev").hide();
        });
        $("#prev").hover(
            function () {
                $("#next").show();
                $("#prev").show();
            },
            function () {
                $("#next").hide();
                $("#prev").hide();
        });

        //Set options
        var speed = 500;
        var autoSwitch = true;
        var autoSwitchSpeed = 8000;
        var id;

        //Add initial active class
        $('.slide').first().addClass('active');

        //Hide all slides
        $('.slide').hide();

        //Show first slide
        $('.active').show();

        //Arrow functionality
        $('#next').on('click',nextSlide);

        $('#prev').on('click',prevSlide);

        //Auto slide
        if(autoSwitch){
            id = setInterval(nextSlide,autoSwitchSpeed);
        }

        //Function for switching to next slide
        function nextSlide(){
            //Let the user see the image for 5 sec
            clearInterval(id);

            $('.active').removeClass('active').addClass('oldActive');
            if($('.oldActive').is(':last-child')){
                $('.slide').first().addClass('active');
            }else{
                $('.oldActive').next().addClass('active');
            }
            $('.oldActive').removeClass('oldActive');
            $('.slide').fadeOut(speed);
            $('.active').fadeIn(speed);

            //Auto slide until the user press next arrow
            if(autoSwitch){
                id = setInterval(nextSlide,autoSwitchSpeed);
            }
        }

        //Function for switching to previous slide
        function prevSlide(){
            //Let the user see the image for 5 sec
            clearInterval(id);

            $('.active').removeClass('active').addClass('oldActive');
            if($('.oldActive').is(':first-child')){
                $('.slide').last().addClass('active');
            }else{
                $('.oldActive').prev().addClass('active');
            }
            $('.oldActive').removeClass('oldActive');
            $('.slide').fadeOut(speed);
            $('.active').fadeIn(speed);

            //Auto slide until the user press prev arrow
            if(autoSwitch){
                id = setInterval(nextSlide,autoSwitchSpeed);
            }
        }
    }

};

$(document).ready(ready);
$(document).on('page:load', ready);

//For hiding search form when clicking in other part of document
$(document).mouseup(function (e)
{
    var container = $(".search-form .fieldContainer .searchField");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0 // ... nor a descendant of the container
        && !container.val()) //...is empty
    {
        container.hide();
    }
});
