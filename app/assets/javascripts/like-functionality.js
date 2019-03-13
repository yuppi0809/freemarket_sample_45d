$(document).on('turbolinks:load', function(){
  var likeButton = $(".item-container__links__left").find(".like")

  function changeColorToRed(){
    likeButton.toggleClass("like-clicked");
    likeButton.toggleClass("left-link");
  }

  if(likeButton.attr("data-method") === "delete"){
    changeColorToRed();
   }
});
