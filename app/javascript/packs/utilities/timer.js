document.addEventListener('turbolinks:load', () => {
  const timer_box = document.getElementById('timer')
  let time = timer_box.dataset.lefttime
  console.log(time)
  let x = setInterval(() => {
    const hours = Math.floor((time % (60 * 60 * 24)) / (60 * 60));
    const minutes = Math.floor((time % (60 * 60)) / (60));
    const seconds = Math.floor((time % (60)) / 1);

    timer_box.innerHTML = hours + ":" + minutes + ":" + seconds
    time -= 1 
    
    if (time < 0) {
      document.getElementById('submit_question').click()
    }
  }, 1000)
})
