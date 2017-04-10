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
