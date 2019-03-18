$(document).on('turbolinks:load', function(){
  function scroll(){
    $(window).scrollTop(0)
  }

  // function validateRecaptcha(){
  //   var response = grecaptcha.getResponse()
  //   $('.g-recaptcha').children('.alert-message').remove()
  //   if(response == ''){
  //     var alert = `<p class='alert-message'>
  //                    選択してください
  //                  </p>`
  //     $('.g-recaptcha').append(alert)
  //     scroll()
  //     return false
  //   }else{
  //     return true
  //   }
  // }

  function removeAlert(userElements){
    userElements.forEach(function(element){
      element.nextAll('.alert-message').remove()
      element.css('border', '')
    })
  }

  function appendAlert(element, text){
    var label = element.prevAll('label').text()
    var alert = `<p class='alert-message'>
                   ${ label }${ text }
                 </p>`
    if(!element.next().length){
      element.parent().append(alert)
      if(element !== expirationYear && element !== birthDay){
        element.css('border', 'solid 1.5px #EA352D')
      }
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
        scroll()
        return false
      }
    }
    return true
  }

  var defaultTextColor = {'color':'#9e9e9e'}
  var stepTextColor = {'color':'#EA352D'}
  var stepLineColor = {'background-color':'#EA352D'}
  var registrationNav = $('.registration-nav')
  var registrationUser = $('.registration-user')
  var registrationVerify = $('.registration-verify')
  var registrationDelivery = $('.registration-delivery')
  var registrationPayment = $('.registration-payment')
  var blankAlert = 'を入力してください'
  var nickname = $('.registration-field__nickname')
  var email = $('.registration-field__email')
  var password = $('.registration-field__password')
  var passwordConfirmation = $('.registration-field__password-confirmation')
  var firstName = $('.registration-field__first-name')
  var lastName = $('.registration-field__last-name')
  var firstNameKana = $('.registration-field__first-name-kana')
  var lastNameKana = $('.registration-field__last-name-kana')
  var birthYear = $('.registration-field__birth-year')
  var birthMonth = $('.registration-field__birth-month')
  var birthDay = $('.registration-field__birth-day')
  var verifySms = $('.registration-field__verify-sms')
  var userElements = [nickname, email, password, passwordConfirmation, firstName, lastName, firstNameKana, lastNameKana, birthYear, birthMonth, birthDay]
  var delvFirstName = $('.registration-field__delv-first-name')
  var delvLasttName = $('.registration-field__delv-last-name')
  var delvFirstNameKana = $('.registration-field__delv-first-name-kana')
  var delvLasttNameKana = $('.registration-field__delv-last-name-kana')
  var postalCode = $('.registration-field__postal-code')
  var prefecture = $('.registration-field__prefecture')
  var city = $('.registration-field__city')
  var address = $('.registration-field__address')
  var deliveryElements = [delvFirstName, delvLasttName, delvFirstNameKana, delvLasttNameKana, postalCode, prefecture, city, address]
  var cardNum = $('.registration-field__card-num')
  var expirationMonth = $('.registration-field__expiration-month')
  var expirationYear = $('.registration-field__expiration-year')
  var securityCode = $('.registration-field__security-code')
  var paymentElements = [cardNum, expirationMonth, expirationYear, securityCode]

  $('.registration-user__btn').on('click', function(){
    validateBlank(userElements)
    validateEmail(email)
    validatePassword(password)
    validatePasswordConfirmation()
    validateNameCharacter()
    validateNameKana()
    validateBirthDay()
    // if(validateRecaptcha()){
    if(nextPage(userElements)){
      registrationUser.hide()
      registrationVerify.show()
      registrationNav.text('電話番号の確認')
      $('.registration-step__user-info p').css(defaultTextColor)
      $('.registration-step__verify').css(stepTextColor)
      $('.registration-step__verify .step-line').css(stepLineColor)
      scroll()
    // }
    }
  })
  $('.registration-verify__btn').on('click', function(){
    if(validateVerifySms()){
      registrationVerify.hide()
      registrationDelivery.show()
      registrationNav.text('発送元・お届け先住所入力')
      $('.registration-step__verify p').css(defaultTextColor)
      $('.registration-step__delivery').css(stepTextColor)
      $('.registration-step__delivery .step-line').css(stepLineColor)
      scroll()
    }else{
      scroll()
    }
  })
  $('.registration-delivery__btn').on('click', function(){
    validateBlank(deliveryElements)
    if(nextPage(deliveryElements)){
      registrationDelivery.hide()
      registrationPayment.show()
      registrationNav.text('支払い方法')
      $('.registration-step__delivery p').css(defaultTextColor)
      $('.registration-step__payment').css(stepTextColor)
      $('.registration-step__payment .step-line').css(stepLineColor)
      scroll()
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
    var email = $('.session-field__email')
    var password = $('.session-field__password')
    var sessionElements = [email, password]
    validateBlank(sessionElements)
    validateEmail(email)
    validatePassword(password)
    // if(validateRecaptcha()){
    if(nextPage(sessionElements)){
      $('#session-form').submit()
    }
    // }
  })
  $('.registration-update__btn').on('click', function(){
    validateBlank(deliveryElements)
    if(nextPage(deliveryElements)){
      $('#delivery-update-form').submit()
    }
  })
  $('.payment-form__btn').on('click', function(){
    validateBlank(paymentElements)
    if(nextPage(paymentElements)){
      $('#payment-form').submit()
    }
  })
})
