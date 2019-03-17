$(document).on('turbolinks:load', function(){
  var dropzone = $('.dropzone-area');
  var dropzone_box = $('.dropzone-box');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');
  
  $(document).on('change', 'input[type= "file"].upload-image',function(event) {
    var file = $(this).prop('files')[0];
    var files = $(this).prop('files');
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);
    $('#preview').empty();
    $.each(images, function(index, image) {
      image.attr('data-image', index);
      preview.append(image);
    })
    dropzone.css({
      'width': `calc(100% - (135px * ${images.length}))`
    })
    var new_image = $(`<input multiple= "multiple" name="product_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
  });
  $(document).on('click', '.delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': 0
          })
        }
        dropzone.css({
          'width': `calc(100% - (135px * ${images.length}))`
        })
      }
    })
    // console.log(inputs.length)
    // console.log(images.length)
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    $.each(images, function(index, image) {
      image.attr('data-image', index);
      preview.append(image);
    })
  })
});
