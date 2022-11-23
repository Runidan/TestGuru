//событие turbolinks:load возникает после закрузки всей страницы, и тогда закружается остальные обработчики
document.addEventListener('turbolinks:load', function() { 
  const control = document.querySelector('.sort-by-title') //находим элемент по классу
  if (control) { control.addEventListener('click', sortRowsByTitle) } //добавляем элементу обработчик события click если он существует
})

function sortRowsByTitle() {
  const table = document.querySelector('table')

  //NodeList
  //https://developer.mozilla.org/ru/docs/Web/API/NodeList
  const rows = table.querySelectorAll('tr')
  const sortedRows = []

  //перебираем все элементы кроме заголовков, start = 1 и добавляем в новый массив
  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  const arrowUp = this.getElementsByClassName('octicon-arrow-up')[0]
  const arrowDown = this.getElementsByClassName('octicon-arrow-down')[0]
  
  //сортируем элементы
  if (arrowUp.classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    arrowUp.classList.remove('hide')
    arrowDown.classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    arrowUp.classList.add('hide')
    arrowDown.classList.remove('hide')
  }

  const sortedTable = document.createElement('table') //создаем элемент таблицы в памяти
  sortedTable.classList.add('table', "table-hover", 'mt-3', 'mb-3', 'table-bordered') //добавляем классы таблицы
  const tHead = document.createElement('thead') //создаем элемент thead
  tHead.classList.add('table-light')
  tHead.appendChild(rows[0])//добавляем строку заголовков
  sortedTable.appendChild(tHead) 

  const tBody = document.createElement('tbody')
  tBody.classList.add('table-group-divider')
  //вставляем отсортированные строки
  for (let i = 0; i < sortedRows.length; i++) {
    tBody.appendChild(sortedRows[i])
  }
  sortedTable.appendChild(tBody)

  //ставим нашу таблицу в замен существующей
  table.parentNode.replaceChild(sortedTable, table)

}

//Функция сравнения строк
function compareRowsAsc(row1, row2) { 
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) { 
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}