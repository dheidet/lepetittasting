$(function() {
  $(".flexgrid-item").on("click", function(){
    // Change active tab
    $('.flexgrid-item').removeClass('active');
    $(this).addClass('active');

    // Hide all tab-content (use class="hidden")
    $('.home-card').addClass('hidden');

    // Show target tab-content (use class="hidden")
    var x = $(this).data('target');
    $(x).removeClass('hidden');
  });
});
$(function() {
  $("#long-tasting").on("click", function(){
    // Change active tab
    $('.rg-btn-choice').removeClass('active');
    $(this).addClass('active');

    // Hide all tab-content (use class="hidden")
    $('.long-tasting-field').removeClass('hidden');
  });
  $("#short-tasting").on("click", function(){
    // Change active tab
    $('.rg-btn-choice').removeClass('active');
    $(this).addClass('active');

    // Hide all tab-content (use class="hidden")
    $('.long-tasting-field').addClass('hidden');
  });
});
