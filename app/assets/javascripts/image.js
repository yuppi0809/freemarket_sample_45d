$(function(){
  Dropzone.autoDiscover = false;

  $("#item-dropzone").dropzone({
    maxFilesize: 2,
    maxFiles: 10,
    addRemoveLinks: true,
    dictRemoveFile:'削除',
    autoProcessQueue: false,
    previewsContainer: '#preview',
    paramName: 'image',
    success: function(){
      console.log('success')
      window.location.href = '/tweets/'
    },
    init: function(file, option) {
      var myDropzone = this;
      myDropzone.on('maxfilesexceeded', function(file) {
            console.log('over')
            myDropzone.removeFile(file);
          })
       $('.sell-form-btn-content__submit').on('click', function(e) {
          e.preventDefault();
          console.log('click')
          e.stopPropagation();
          myDropzone.processQueue();
       });
     },
  });
});
