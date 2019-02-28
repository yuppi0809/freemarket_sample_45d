$(function(){
  function removeAlert(userElements){
    userElements.forEach(function(element){
      element.nextAll('.alert-message').remove()
    })
  }

  function appendAlert(element, text){
    var label = element.prevAll('label').text()
    var alert = `<p class='alert-message'>
                   ${ label } ${ text }
                 </p>`
    if(!element.next().length){
      element.parent().append(alert)
    }
  }

  function validateBlank(userElements){
    removeAlert(userElements)
    userElements.forEach(function(element){
      if(element.val() == ''){
        appendAlert(element, blankAlert)
      }
    })
  }

  function validateEmail(){
    var emailAlert = 'を正しく入力してください'
    var emailAdress = email.val()
    if(!emailAdress.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
      appendAlert(email, emailAlert)
    }
  }

  function validatePassword(){
    var passwordAlert = 'は6文字以上128文字以下で入力してください'
    var passwordLength = password.val().length
    if(passwordLength < 6 || passwordLength >128){
      appendAlert(password, passwordAlert)
      password.val('')
    }
  }

  function validatePasswordConfirmation(){
    var passwordConfirmationAlert = 'パスワードとパスワード（確認）が一致しません'
    if(password.val() !== passwordConfirmation.val()){
      appendAlert(passwordConfirmation, passwordConfirmationAlert)
    }
  }

  function validateNameCharacter(){
    var names = [firstName, lastName]
    names.forEach(function(name){
      var character = name.val().replace(/[A-Za-z0-9]/g, function(s) {
                        return String.fromCharCode(s.charCodeAt(0) + 0xFEE0)
      })
      name.val(character)
    })
  }

  function validateNameKana(){
    var kanaAlert = 'にはカナ文字を入力してください'
    var nameKana = [firstNameKana, lastNameKana]
    nameKana.forEach(function(nameKana){
      var kana = nameKana.val()
      if(!kana.match(/^[\u3040-\u30ff]+$/)){
        appendAlert(nameKana, kanaAlert)
      }
    })
  }

  function validateBirthDay(){
    if(birthYear.val() == '' || birthMonth.val() == '' || birthDay.val() == ''){
      appendAlert(birthDay, blankAlert)
    }else{
      birthDay.nextAll('.alert-message').remove()
    }
  }

  function nextPage(elements){
    var count = elements.length
    for(var i = 0; i < count; i++){
      if(elements[i].val() == ''){
        $(window).scrollTop(0)
        return false
      }
    }
    return true
  }

  var registrationUser = $('.registration-user')
  var registrationVerify = $('.registration-verify')
  var blankAlert = 'を入力してください'
  var nickname = $('.registration-user__nickname')
  var email = $('.registration-user__email')
  var password = $('.registration-user__password')
  var passwordConfirmation = $('.registration-user__password-confirmation')
  var firstName = $('.registration-user__first-name')
  var lastName = $('.registration-user__last-name')
  var firstNameKana = $('.registration-user__first-name-kana')
  var lastNameKana = $('.registration-user__last-name-kana')
  var birthYear = $('.registration-user__birth-year')
  var birthMonth = $('.registration-user__birth-month')
  var birthDay = $('.registration-user__birth-day')
  var userElements = [nickname, email, password, passwordConfirmation, firstName, lastName, firstNameKana, lastNameKana, birthYear, birthMonth, birthDay]

  $('.registration-user__btn').on('click', function(){
    validateBlank(userElements)
    validateEmail()
    validatePassword()
    validatePasswordConfirmation()
    validateNameCharacter()
    validateNameKana()
    validateBirthDay()
    if(nextPage(userElements)){
      registrationUser.hide()
      registrationVerify.show()
    }
  })
})
