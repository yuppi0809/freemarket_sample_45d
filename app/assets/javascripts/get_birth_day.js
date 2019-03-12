$(document).on('turbolinks:load', function(){
  function getDay(year){
    monthDays = ['---', 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if(birthMonth.val() == 2){
      if(year !== '' && year % 4 == 0){
        if(year % 100 == 0 && year % 400 !== 0){
          days = 28
        }else{
          days = 29
        }
      }else{
        days = 28
      }
    }else if(birthMonth.val() == ''){
      days = 31
    }else{
      days = monthDays[birthMonth.val()]
    }
    return days
  }

  var birthYear = $('#user_birth_year')
  var birthMonth = $('#user_birth_month')
  var birthDay = $('#user_birth_day')

  $('#user_birth_month, #user_birth_year').on('change', function(){
    var year = birthYear.val()
    var endDay = getDay(year)
    birthDay.empty()
    birthDay.append(`<option value>---</option>`)
    for(var i=1; i <= endDay; i++){
      var day = $(`<option value=${ i }>${ i }</option>`)
      birthDay.append(day)
    }
  })
})
