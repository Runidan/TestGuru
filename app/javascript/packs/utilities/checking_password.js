document.addEventListener('turbolinks:load', () => {
  let formNewUser = document.getElementById('new_user')
  if (formNewUser) {
    formNewUser.addEventListener('input', checkPassWord)
  }})

  function checkPassWord() { 
    let confirmPassWordField = document.getElementById('user_password_confirmation')
    let passWordField = document.getElementById('user_password')
    let markSuccess = document.getElementById('mark-success')
    let markBlocked = document.getElementById('mark-blocked')

    let passWord = passWordField.value
    let confirmPassWord = confirmPassWordField.value


    if (confirmPassWord) {
      (confirmPassWord == passWord) ? showMark(markSuccess, markBlocked) : showMark(markBlocked, markSuccess)
    } else {
      markSuccess.classList.add('hide')
      markBlocked.classList.add('hide')
    }   
  }

  function showMark(node1, node2) {
    node1.classList.remove('hide')
    node2.classList.add('hide')
  }
