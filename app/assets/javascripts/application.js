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
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    // var width = $('.main-navigation').width();
    //
    // $('.wrapper_page').css("margin-left", width);

    var height = $(window).height() - 71;
    $('section.home').height(height);

    $('.search-form').click(function(){
        $('.search-form .fieldContainer .searchField').fadeIn().focus();
    });
});

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
