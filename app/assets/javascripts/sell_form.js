$(function() {
  $('#input-price').on('keyup', function() {
     var price = $(this).val();
     if(price > 100) {
       var commission = (price / 10)
       $('#commission').text(commission);
       $('#profit').text(price - commission)
     }
  });
});
