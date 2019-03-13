$(document).on('turbolinks:load', function(){
  var modalButton = $(".item-container__links__left .report");

  var modal = $(".modal")

  var cancelButton = $(".modal__window__bottom").find(".left")

  modalButton.on("click", function(){
    modal.css("display", "block");
  });

  cancelButton.on("click", function(){
    modal.css("display", "none");
  })

 $(window).on("click", function(event){
    if(event.target == modal[0]){
      modal.css("display", "none");
      }
    });
});
