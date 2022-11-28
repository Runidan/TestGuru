document.addEventListener('turbolinks:load', function() {
  let controls = document.querySelectorAll('.form-inline-link')

  if(controls.length) {
    for(let i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }

  const errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault() //предотврящаем поведение по умолчанию
  let testId = this.dataset.testId //dateset дает доступ к date-атрибуду
  formInlineHandler( testId )
}

function formInlineHandler(testId) {
  let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  let testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  let formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide') //Скрываем заголовок
    formInline.classList.remove('hide') //Показываем форму
    link.textContent = 'Cancel' //Меняем надпись
  } else {
    testTitle.classList.remove('hide') //Показываем заголовок
    formInline.classList.add('hide') //Скрываем форму
    link.textContent = 'Edit'
  }
}