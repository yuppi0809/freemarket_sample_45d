$(document).on('turbolinks:load', function(){
  var modalButton = $(".item-container__links__left .report");

  var modal = $(".modal")

  var cancelButton = $(".modal__window__bottom").find(".left")

  modalButton.on("click", function(){
    modal.css("display", "block");
  });

