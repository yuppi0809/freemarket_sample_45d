$(function(){
  var dropzone = $('.dropzone-box');
  var formData = new FormData();

  dropzone.on('dragover', function(e) {
    e.stopPropagation();
    e.preventDefault();
  })
    dropzone.on('dragleave', function(e) {
    e.stopPropagation();
    e.preventDefault();
  })
    dropzone.on('drop', function(e) {
    e.stopPropagation();
    e.preventDefault();

    var files = e.originalEvent.dataTransfer.files;

    for(var i = 0; i < files.length; i++) {
      (function() {
        var fr = new FileReader();
        fr.onload = (function() {
          var div = $('<div>');

          var img = $('<img>');
          img.attr('src', fr.result);
          div.append(img);

          var preview = $('#preview')
          preview.append(div);
        })
        fr.readAsDataURL(files[i]);
      })();
      formData.append('file', files[i]);
    }
  });
    dropzone.on('change', function() {
    })

    $(document).on('change', 'input[type= "file"].upload-image', function(event) {
      var file = event.target.files[0];
      var reader = new FileReader();
      var preview = $('#preview');

      const target = $(this);
      if(target.val() != '') {
        const targetContainer = target.closest('.upload-image');
        const clone = targetContainer.clone();
        clone.find('.upload-image').val('');
        targetContainer.after(clone);
      }
      reader.onload = (function(file) {
        return function(event) {
          var img = $('<div class= "img_view"><img alt="" class="img"><span class="img_del">画像を削除する</span></div>');
          img.find('img').attr({
            src: event.target.result
          })
          preview.append(img);
        };
      })(file);
      reader.readAsDataURL(file);
    });
    $('#preview').on('click', '.img_del', function() {
      $(this).parent().remove();
    })
});
