$(document).ready(function() {
  $('.has-popover').on("click", function(){
    var popover = $(this).children(".rg-popover");
    if (popover.hasClass("hidden")) {
      popover.removeClass("hidden");
    } else {
      popover.addClass("hidden");
    }
  });
  $('.has-popover').on("mouseenter", function(){
    $(this).children(".rg-popover").removeClass("hidden");
  });
  $('.has-popover').mouseleave(function(){
    $(this).children(".rg-popover").addClass("hidden");
  });

  $('.has-popover').on("click", function(){
    var popover = $(this).children('div').children(".rg-popo");
    if (popover.hasClass("hidden")) {
      popover.removeClass("hidden");
    } else {
      popover.addClass("hidden");
    }
  });
  $('.has-popover').on("mouseenter", function(){
    $(this).children('div').children(".rg-popo").removeClass("hidden");
  });
  $('.has-popover').mouseleave(function(){
    $(this).children('div').children(".rg-popo").addClass("hidden");
  });
});
