$(document).on('turbolinks:load', function() {

  function buildMiddlecategory(category) {
    var html = `
    <option value="${category.id}">
      ${category.name}
    </option>`;
    return html;
  }
  $('#input-price').on('keyup', function() {
     var price = $(this).val();
     if(price > 100) {
       var commission = (price / 10)
       $('#commission').text(commission);
       $('#profit').text(price - commission)
     }
  });
  $('#large_category').on('change', function() {
    $('#middle_category').remove();
    $('#small_category').remove();
    var category_id = $(this).val();
    var url =
    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {category_id: category_id},
      dateType: 'json'
    })
    .done(function(categories) {
      var select_wrapper = $('<div class="select-wrapper">');
      var select = $('<select class="select-wrapper__select" id="middle_category" name="product[second_category_id]">');
      select.append('<option>---</option>');
      categories.forEach(function(category) {
      select.append(buildMiddlecategory(category));
      })
      select_wrapper.append(select)
      select_wrapper.append('<i class="fa fa-chevron-down select-wrapper__icon"></i>')
      $('.select-wrapper-all').append(select_wrapper);
    })
  })
  $('.select-wrapper-all').on('change', '#middle_category', function() {
    $('#small_category').remove();
    var category_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {category_id: category_id},
      dateType: 'json'
    })
    .done(function(categories) {
      var select_wrapper = $('<div class="select-wrapper">');
      var select = $('<select class="select-wrapper__select" id="small_category" name="product[third_category_id]">');
      select.append('<option>---</option>');
      categories.forEach(function(category) {
      select.append(buildMiddlecategory(category));
      })
      select_wrapper.append(select)
      select_wrapper.append('<i class="fa fa-chevron-down select-wrapper__icon"></i>')
      $('.select-wrapper-all').append(select_wrapper);
    })
  })
  $('.select-wrapper-all').on('change', '#small_category', function() {
    $('#size').css('display', "block");
    $('#brand').css('display', "block");
  })

});
