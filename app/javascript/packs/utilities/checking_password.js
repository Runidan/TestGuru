document.addEventListener('turbolinks:load', () => {
  const formNewUser = document.getElementById('new_user')
  const markSuccess = document.getElementById('mark-success')
  const markBlocked = document.getElementById('mark-blocked')

  if (formNewUser) {
    formNewUser.addEventListener('input', checkPassWord)
  }

  function checkPassWord() { 
    const passWord = document.getElementById('user_password').textContent
    const confirmPassWord = document.getElementById("user_password_confirmation").textContent

    if (confirmPassWord) {
      console.log("first if")
      if (confirmPassWord == passWord) {
        showSuccess
      } else {
        showBlock
      }
    } else {
      hideAll
    }   
  }

  function showSuccess() {
    markSuccess.classList.remove('hide')
    markBlocked.classList.add('hide')
  }

  function showBlock() {
    markSuccess.classList.add('hide')
    markBlocked.classList.remove('hide')
  }

  function hideAll() {
    markSuccess.classList.add('hide')
    markBlocked.classList.add('hide')
  }
})




