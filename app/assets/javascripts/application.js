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
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.elevatezoom
//= require twitter/bootstrap
//= require masonry/jquery.masonry
//= require_tree .
//= require turbolinks

var ready = function(){

    // var floater = false;
    //   $('#click').click(function(){
    //     var top = $(window).scrollTop();
    //     var left = $(window).scrollLeft();
    //     if(!floater){
    //       $('body').css('overflow', 'hidden');
    //       $(window).scroll(function(){
    //         $(this).scrollTop(top).scrollLeft(left);
    //       });
    //     } else {
    //       $('body').css('overflow', 'auto');
    //       $(window).unbind('scroll');
    //     }
    //
    //     $('#slider').css({top: top, left : left}).animate({
    //       'margin-left' : (floater ? -400 : 0)
    //     }, 500);
    //     floater = !floater;
    //   });

    $('#likes-btn').on('click', function(){
        $('.likes-menu').css('width', 395);
        $('#displazable').css('left', -395);
        $('.shrink').css('left', -395);
        $('#displazable').addClass('stop-links');
        $('.likes-menu .content').fadeIn(1000);
    });

    $('#cart-btn').on('click', function(){
        $('.cart-menu').css('width', 395);
        $('#displazable').css('left', -395);
        $('.shrink').css('left', -395);
        $('#displazable').addClass('stop-links');
        $('.cart-menu .content').fadeIn(1000);
    });

    $('.sidenav .content .continue').on('click', function(){
        $('.sidenav').width(0);
        $('#displazable').css('left',0);
        $('#displazable').removeClass('stop-links');
        $('.shrink').css('left', 0);
        $('.sidenav .content').fadeOut(100);
    });

    $(document).click(function(event) {
        if(!$(event.target).closest('.sidenav').length) {
            if($('.sidenav').width() > 394 || $('.cart-menu').width() > 394) {
                $('.sidenav').width(0);
                $('#displazable').css('left',0);
                $('#displazable').removeClass('stop-links');
                $('.shrink').css('left', 0);
                $('.sidenav .content').fadeOut(100);
            }
        }
    });

    var height = $(window).height() - 71;
    var aHeight = $(window).height() - 50;

    $('section.home').height(height);
    $('.admin-side-bar').height(aHeight);

    if (window.location.href.indexOf("?order") == -1) {
        if (window.location.href.indexOf("?") > -1) {
            $('#clean').removeClass("disable").addClass('enable');
        }else{
            $('#clean').addClass("disable").removeClass('enable');
        }
    }

    var sHeight = $(window).height() - 27;
    var sWidth = $(window).width() + 4 ;
    var wHeight = $(window).height() - 105;

    $('#slider').width(sWidth);
    $('#slider img').width(sWidth);
    $('#slider').height(sHeight);
    $('#slider img').height(sHeight);
    $('#prev').height(sHeight);
    $('#next').height(sHeight);
    $('.home').css("padding-top",sHeight);
    $('.wrapper_page').css('min-height', wHeight);

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

    $('#all').on('click',function(){
        $(".choices input").each(function(){
            this.setAttribute("checked", "checked");
        });
    });

    $('a.normal-size').on('click', function(e){
        e.preventDefault();
        var value = $(this).attr("href");
        $('#size-input').val(value);
        $(this).removeClass("normal-size").addClass("selected").siblings().removeClass("selected").addClass("normal-size");
    });

    $('.link-circle').on('click',function(e){
        e.preventDefault();
        var value = $(this).attr("href");
        $('#color-input').val(value);
        $(this).siblings().children().children().css('opacity', '0');
        $(this).children().children().css('opacity', '1');
    });

    $('.btn-add').on('click', function(){
        if($('#size-input').val() == ""){
            $('.alert_size').show();
            if($('#color-input').val() == ""){
                $('.alert_color').show();
            }
            return false;
        }else if ($('#color-input').val() == "") {
            $('.alert_color').show();
            return false;
        }else{
            setTimeout(changeCartColor, 200);
            $('#alert-o-item').show();
            $('html,body').animate({
                scrollTop: $(".interest").offset().top - 105
            },500);
        }
    });

    function changeCartColor(){
        // alert('change color');
        $('h5.cart-size').css('color','#C2B49A');
    }

    $('body').on('click','.normal-size.cart-el',function(e){
        e.preventDefault();
        var value = $(this).attr("href");
        $(this).parent().next('#size-input-cart').val(value);
        $(this).removeClass("normal-size").addClass("selected").siblings().removeClass("selected").addClass("normal-size");
        $(this).closest('#item_form_cart').submit();
    });

    $('body').on('click','.link-circle.cart-el',function(e){
        e.preventDefault();
        var value = $(this).attr("href");
        $(this).parent().next('#color-input-cart').val(value);
        $(this).siblings().children().children().css('opacity', '0');
        $(this).children().children().css('opacity', '1');
        $(this).closest('#item_form_cart').submit();
    });

    $('.btn-number').click(function(e){
            e.preventDefault();

            fieldName = "order_item[quantity]";//$(this).attr('data-field');
            type      = $(this).attr('data-type');
            var input = $("input[name='"+fieldName+"']");
            var currentVal = parseInt(input.val());
            if (!isNaN(currentVal)) {
                if(type == 'minus') {

                    if(currentVal > input.attr('min')) {
                        input.val(currentVal - 1).change();
                    }
                    if(parseInt(input.val()) == input.attr('min')) {
                        $(this).attr('disabled', true);
                        $('.total h5').slideUp();

                    }

                } else if(type == 'plus') {

                    if(currentVal < input.attr('max')) {
                        input.val(currentVal + 1).change();
                        $('.total h5').slideDown();
                    }
                    if(parseInt(input.val()) == input.attr('max')) {
                        $(this).attr('disabled', true);
                    }

                }
            } else {
                input.val(0);
            }
        });
        $('.input-number').focusin(function(){
           $(this).data('oldValue', $(this).val());
        });
        $('.input-number').change(function() {

            minValue =  parseInt($(this).attr('min'));
            maxValue =  parseInt($(this).attr('max'));
            valueCurrent = parseInt($(this).val());

            name = $(this).attr('name');
            if(valueCurrent >= minValue) {
                $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
            } else {
                alert('Lo sentimos, mínimo es una prenda');
                $(this).val($(this).data('oldValue'));
            }
            if(valueCurrent <= maxValue) {
                $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
            } else {
                alert('Lo sentimos, máximo son 10 prendas por orden');
                $(this).val($(this).data('oldValue'));
            }


        });
        $(".input-number").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
             // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) ||
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });

    setTimeout(setPortraitH, 10);

    function setPortraitH(){
        height = $('.portrait #img2').height();
        $('.portrait').height(height);
        $('.picture').height(height);
    }

    $('#zoom-img').elevateZoom();

    $('.cloth .hover').on('mouseover',function(){
        image = $(this).closest("#image");
        if (image.hasClass("displaying") == false){
            image.addClass("displaying").siblings().removeClass('displaying');
            var id = image.find("#link-img").attr("href");

            var imageP = $('.portrait').find('#'+id);
            imageP.removeClass("hidden").addClass("display").siblings().removeClass("display").addClass("hidden");

            if(id == "img2"){
                $('#zoom-img').elevateZoom();
                $('#zoom-img2').removeData('elevateZoom');
                $('#zoom-img2').removeData('zoomImage');
            }else{
                $('#zoom-img2').elevateZoom();
                $('#zoom-img').removeData('elevateZoom');
                $('#zoom-img').removeData('zoomImage');
            }

            height = $('.display img').height();
            $('.portrait').height(height);
            $('.picture').height(height);
        }
    });

    scHeight = $(window).height() - 216;
    ccHeight = $(window).height() - 240;
    $('.shopping-cart').height(scHeight);

    $('.checkout-cart').height(ccHeight);

    if ($('#repeated').length){
        $('#form-address').hide();
        var showingF = false;
        $('#another-address').on('click',function(){
            if (showingF){
                $('#form-address').slideToggle();
                showingF = false;
                $(this).text('Usar otra');

            }else{
                $('#form-address').slideToggle();
                showingF = true;
                $(this).text('Cancelar');
            }
        });
    }

    if ($('#customer').length){
        $('#form-fields-card').hide();
        var showingC = false;
        $('#another-card').on('click',function(){
            if (showingC){
                $('#form-fields-card').slideToggle();
                showingC = false;
                $(this).text('Usar otra');

            }else{
                $('#form-fields-card').slideToggle();
                showingC = true;
                $(this).text('Cancelar');
            }
        });
    }

    $('input#card_number').keypress(function(e) {
        if (e.which < 0x20) {
            // e.which < 0x20, then it's not a printable character
            // e.which === 0 - Not a character
            return;     // Do nothing
        }
        if (this.value.length == 19) {
            e.preventDefault();
        } else if (this.value.length > 19) {
            // Maximum exceeded
            this.value = this.value.substring(0, 19);
        }
    });

    $("input#card_number").keyup(function(e){
        if(e.keyCode != 8 && e.keyCode != 46) {
            var $this = $(this);
            if ((($this.val().length+1) % 5)==0 && ($this.val().length) < 19){
                $this.val($this.val() + " ");
            }
        }
    });

    $('input#exp').keypress(function(e) {
        if (e.which < 0x20) {
            // e.which < 0x20, then it's not a printable character
            // e.which === 0 - Not a character
            return;     // Do nothing
        }
        if (this.value.length == 5) {
            e.preventDefault();
        } else if (this.value.length > 5) {
            // Maximum exceeded
            this.value = this.value.substring(0, 5);
        }
    });

    $('input#card_code').keypress(function(e) {
        if (e.which < 0x20) {
            // e.which < 0x20, then it's not a printable character
            // e.which === 0 - Not a character
            return;     // Do nothing
        }
        if (this.value.length == 3) {
            e.preventDefault();
        } else if (this.value.length > 3) {
            // Maximum exceeded
            this.value = this.value.substring(0, 3);
        }
    });

    $("input#exp").keyup(function(e){
        if(e.keyCode != 8 && e.keyCode != 46) {
            var $this = $(this);
            if ((($this.val().length+1) % 3)==0 && ($this.val().length) < 5){
                $this.val($this.val() + "/");
            }
        }
    });

    if($('#info-page').length){
        $('#info-link').siblings().find('a').removeClass('active');
        $('#info-link a').addClass('active');
    }
    if($('#likes-page').length){
        $('#likes-link').siblings().find('a').removeClass('active');
        $('#likes-link a').addClass('active');
    }
    if($('#orders-page').length){
        $('#orders-link').siblings().find('a').removeClass('active');
        $('#orders-link a').addClass('active');
    }

    $('.a-side-link').each(function(){
        if (window.location.href.indexOf($(this).attr('href')) > -1) {
            $(this).closest('li').addClass('active').siblings().removeClass('active');
        }
    });

    var aWidth = $(window).width() - 200;
    $('.admin-wrapper').width(aWidth);

    if ($('.pagination').length) {
        $(window).scroll(function() {
          var url = $('.pagination .next_page').attr('href');
          if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
            $('.pagination').text("Please Wait...");
            return $.getScript(url);
          }
        });
        return $(window).scroll();
      }

};

$(document).ready(ready);
//$(document).on('page:load', ready);

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

$(window).scroll(function() {
  if ($(document).scrollTop() > 70) {
    $('.main-navigation').addClass('shrink');
    //$('.main-navigation').fadeIn(500);
    $('.main-navigation').removeClass('normal');
    $('.alert').css('top','60px');
    if ($('.sidenav').width() > 394 || $('.cart-menu').width() > 394){
        $('.main-navigation').css('left',-395);
    }
  } else {
    $('.main-navigation').removeClass('shrink');
    $('.main-navigation').addClass('normal');
    $('.main-navigation').css('left',0);
    $('.alert').css('top','125px');
  }
});

$(window).resize(function() {
    var sHeight = $(window).height() - 27;
    var sWidth = $(window).width() + 4 ;
    scHeight = $(window).height() - 216;
    var wHeight = $(window).height() - 105;
    ccHeight = $(window).height() - 240;

    $('#slider').width(sWidth);
    $('#slider img').width(sWidth);
    $('#slider').height(sHeight);
    $('#slider img').height(sHeight);
    $('#prev').height(sHeight);
    $('#next').height(sHeight);
    $('.home').css("padding-top",sHeight);
    $('.wrapper_page').css('min-height', wHeight);
    $('.shopping-cart').height(scHeight);
    $('.checkout-cart').height(ccHeight);
});
