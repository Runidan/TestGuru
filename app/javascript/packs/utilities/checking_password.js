document.addEventListener('turbolinks:load', () => {
  const formNewUser = document.getElementById('new_user')
  if (formNewUser) {
    formNewUser.addEventListener('input', checkPassWord)
  }})

  function checkPassWord() { 
    const confirmPassWordField = document.getElementById('user_password_confirmation')
    const passWordField = document.getElementById('user_password')
    const markSuccess = document.getElementById('mark-success')
    const markBlocked = document.getElementById('mark-blocked')

    const passWord = passWordField.value
    const confirmPassWord = confirmPassWordField.value


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
