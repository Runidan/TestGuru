document.addEventListener('turbolinks:load', () => {
  console.log('in!')
  const timer_box = document.getElementById('timer')
  let time = timer_box.dataset.lefttime
  let x = setInterval(() => {
    const hours = Math.floor((time % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((time % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((time % (1000 * 60)) / 1000);

    timer_box.innerHTML = hours + ":" + minutes + ":" + seconds
    time -= 1 
    
    if (time < 0) {
      timer_box.innerHTML = timer_box.dataset.timeover
    }
  }, 1000)
})