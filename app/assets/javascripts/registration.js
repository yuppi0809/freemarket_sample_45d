$(document).on('turbolinks:load', function(){
  function validateRecaptcha(){
    var response = grecaptcha.getResponse()
    $('.g-recaptcha').children('.alert-message').remove()
    if(response == ''){
      var alert = `<p class='alert-message'>
                     選択してください
                   </p>`
      $('.g-recaptcha').append(alert)
      $(window).scrollTop(0)
      return false
    }else{
      return true
    }
  }

  function removeAlert(userElements){
    userElements.forEach(function(element){
      element.nextAll('.alert-message').remove()
    })
  }

  function appendAlert(element, text){
    var label = element.prevAll('label').text()
    var alert = `<p class='alert-message'>
                   ${ label }${ text }
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

  function validateEmail(email){
    var emailAlert = 'を正しく入力してください'
    var emailAdress = email.val()
    if(!emailAdress.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
      appendAlert(email, emailAlert)
    }
  }

  function validatePassword(password){
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

  function validateVerifySms(){
    var verifyAlert = 'の書式を確認してください'
    var regexNum = verifySms.val().replace(/[━.*‐.*―.*－.*\-.*ー.*\-]/gi,'')
    verifySms.nextAll('.alert-message').remove()
    if(regexNum == ''){
      appendAlert(verifySms, blankAlert)
      return false
    }else if(!regexNum.match(/^(0[5-9]0[0-9]{8}|0[1-9][1-9][0-9]{7})$/)){
      appendAlert(verifySms, verifyAlert)
      return false
    }else{
      return true
    }
  }

  function validatePostalCode(){
    var postalCodeAlert = 'のフォーマットが不適切です'
    var input = postalCode.val().replace(/-/g, '').slice(0,7)
    if(input.match(/^\d{7}/)){
      postalCode.nextAll('.alert-message').remove()
      var regexInput = input.replace(input, input.slice(0,3) + '-' + input.slice(3,7))
      postalCode.val(regexInput)
    }else{
      appendAlert(postalCode, postalCodeAlert)
    }
  }

  function validateCardNum(){
    var cardNumAlert = 'のフォーマットが不適切です'
    var input = cardNum.val()
    if(!input.match(/^\d{14,16}$/)){
      appendAlert(cardNum, cardNumAlert)
    }
  }

  function validateSecurityCode(){
    var securityCodeAlert = 'は3桁または4桁の半角数字で入力してください'
    var input = securityCode.val()
    if(!input.match(/^\d{3,4}$/)){
      appendAlert(securityCode, securityCodeAlert)
    }
  }

  function nextPage(elements){
    var count = elements.length
    for(var i = 0; i < count; i++){
      if(elements[i].nextAll('.alert-message').length !== 0){
        $(window).scrollTop(0)
        return false
      }
    }
    return true
  }

  var registrationUser = $('.registration-user')
  var registrationVerify = $('.registration-verify')
  var registrationDelivery = $('.registration-delivery')
  var registrationPayment = $('.registration-payment')
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
  var verifySms = $('.registration-verify__verify-sms')
  var userElements = [nickname, email, password, passwordConfirmation, firstName, lastName, firstNameKana, lastNameKana, birthYear, birthMonth, birthDay]
  var delvFirstName = $('.registration-delivery__first-name')
  var delvLasttName = $('.registration-delivery__last-name')
  var delvFirstNameKana = $('.registration-delivery__first-name-kana')
  var delvLasttNameKana = $('.registration-delivery__last-name-kana')
  var postalCode = $('.registration-delivery__postal-code')
  var prefecture = $('.registration-delivery__prefecture')
  var city = $('.registration-delivery__city')
  var address = $('.registration-delivery__address')
  var deliveryElements = [delvFirstName, delvLasttName, delvFirstNameKana, delvLasttNameKana, postalCode, prefecture, city, address]
  var cardNum = $('.registration-payment__card-num')
  var expirationMonth = $('.registration-payment__expiration-month')
  var expirationYear = $('.registration-payment__expiration-year')
  var securityCode = $('.registration-payment__security-code')
  var paymentElements = [cardNum, expirationMonth, expirationYear, securityCode]

  $('.registration-user__btn').on('click', function(){
    validateBlank(userElements)
    validateEmail(email)
    validatePassword(password)
    validatePasswordConfirmation()
    validateNameCharacter()
    validateNameKana()
    validateBirthDay()
    if(validateRecaptcha()){
      if(nextPage(userElements)){
        registrationUser.hide()
        registrationVerify.show()
      }
    }
  })
  $('.registration-verify__btn').on('click', function(){
    if(validateVerifySms()){
      registrationVerify.hide()
      registrationDelivery.show()
    }else{
      $(window).scrollTop(0)
    }
  })
  $('.registration-delivery__btn').on('click', function(){
    validateBlank(deliveryElements)
    if(nextPage(deliveryElements)){
      registrationDelivery.hide()
      registrationPayment.show()
    }
  })
  $('.registration-payment__btn').on('click', function(){
    validateBlank(paymentElements)
    validateCardNum()
    validateSecurityCode()
    if(nextPage(paymentElements)){
      $('#registration-form').submit()
    }
  })
  postalCode.on('blur', function(){
    validatePostalCode()
  })

  $('.session-form__btn').on('click', function(e){
    e.preventDefault()
    var email = $('.session-form__email')
    var password = $('.session-form__password')
    var sessionElements = [email, password]
    validateBlank(sessionElements)
    validateEmail(email)
    validatePassword(password)
    if(validateRecaptcha()){
      if(nextPage(sessionElements)){
        $('#session-form').submit()
      }
    }
  })
})
