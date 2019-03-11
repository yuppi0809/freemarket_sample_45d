$(document).on('turbolinks:load', function(){
  $('.mypage-link__content').hover(
    function(){
      $(this).css('background-color', '#efefef')
      $(this).children('.fa-angle-right').css({'color':'#333333', 'font-weight':'bold'})
    },
    function(){
      $(this).css('background-color', '')
      $(this).children('.fa-angle-right').css({'color':'', 'font-weight':''})
    }
  )
})
