$(document).on('turbolinks:load', function(){

  var slideContainer = $(".slides-container")
  var slides = $(".my-slides");
  var dots = $(".dot");

  function showSlide(index){
    for(i =0; i < dots.length; i++){
      $(dots[i]).addClass("opacity");
    }

    var distanceFromLeft = -304 * index
    slideContainer.animate({"margin-left": distanceFromLeft,
  }, 400);
    $(dots[index]).removeClass("opacity");
  }

  showSlide(0);

  dots.on("mouseover", function(){
    var index = dots.index(this);
    showSlide(index);
  });
});
