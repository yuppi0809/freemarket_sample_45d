$(function(){
  var dropzone = $('.dropzone-area');
  var dropzone_box = $('.dropzone-box');
  var images = [];
  // var formData = new FormData();

  // dropzone.on('dragover', function(e) {
  //   e.stopPropagation();
  //   e.preventDefault();
  // })
  //   dropzone.on('dragleave', function(e) {
  //   e.stopPropagation();
  //   e.preventDefault();
  // })
  //   dropzone.on('drop', function(e) {
  //   e.stopPropagation();
  //   e.preventDefault();

  //   var files = e.originalEvent.dataTransfer.files;

  //   for(var i = 0; i < files.length; i++) {
  //     (function() {
  //       var fr = new FileReader();
  //       fr.onload = (function() {
  //         var div = $('<div>');

  //         var img = $('<img>');
  //         img.attr('src', fr.result);
  //         div.append(img);

  //         var preview = $('#preview')
  //         preview.append(div);
  //       })
  //       fr.readAsDataURL(files[i]);
  //     })();
  //     formData.append('file', files[i]);
  //   }
  // });
  //   dropzone.on('change', function() {
  //   })

    // function fileLoad(file) {
    //     var reader = new FileReader();
    //     reader.onload = function(e) {
    //       var img = $('<div class= "img_view"><img></div>');
    //       var btn_wrapper = $('<div class="btn_wrapper"><div class="btn">削除</div><div class="btn">編集</div></div>');
    //       img.append(btn_wrapper);
    //       img.find('img').attr({
    //         src: e.target.result
    //       })
    //       preview.append(img);
    //     };
    //     reader.readAsDataURL(file)
    // }

    $(document).on('change', 'input[type= "file"].upload-image', function(event) {
      var file = $(this).prop('files')[0];
      var files = $(this).prop('files');
      var reader = new FileReader();
      var preview = $('#preview');
      reader.onload = function(e) {
        var img = $('<div class= "img_view"><img></div>');
          var btn_wrapper = $('<div class="btn_wrapper"><div class="btn">削除</div><div class="btn">編集</div></div>');
          img.append(btn_wrapper);
          img.find('img').attr({
            src: e.target.result
          })
          preview.append(img);
         }
         reader.readAsDataURL(file)
         dropzone.css({
          'width': 'calc(100% - 135px)'
         })
         images.push(this.value)
         var new_image = $(this).clone(true);
         dropzone_box.append(new_image);
    });
    $('.sell-form-container__label').on('click', function() {
      console.log(images.length)
    })
});
