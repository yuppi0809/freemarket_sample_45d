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
    console.log(files)
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
        console.log(fr)
        fr.readAsDataURL(files[i]);
      })();
      formData.append('file', files[i]);
    }
  });
    dropzone.on('change', function() {
      console.log(this.file)
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
      // if(file.type.indexOf('img') < 0) {
      //   return false;
      // }
      reader.onload = (function(file) {
        return function(event) {
          // preview.empty();

          var img = $('<div class= "img_view"><img alt="" class="img"><span class="img_del">画像を削除する</span></div>');
          img.find('img').attr({
            src: event.target.result
          })
    //       // var img = ($('<img>').attr({
    //       //   src: event.target.result,
    //       //   width: "200px",
    //       //   class: "preview",
    //       //   title: file.name
    //       // }));
    //       // var buttonwrapper = $('div');
    //       // var deletebutton = $('<a>削除</a>').attr({
    //       //   width: '50px',
    //       //   height: '50px',
    //       // })
    //       // deletebutton.css({
    //       //   'color': '#5B98E8',
    //       //   'text-decoration': 'none',
    //       //   'cursor': 'pointer'
    //       // })
    //       // buttonwrapper.append(deletebutton);
    //       // imgWrapper.append(img)
    //       // imgWrapper.append(buttonwrapper)
          preview.append(img);
        };
    //     console.log(preview)
      })(file);
      reader.readAsDataURL(file);
    });
    $('#preview').on('click', '.img_del', function() {
      $(this).parent().remove();
    })
});
