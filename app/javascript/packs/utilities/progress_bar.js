document.addEventListener('turbolinks:load', () => {
  const progressBar = document.getElementById('test-progress-bar')

  if (progressBar) {
    const questionCount = progressBar.dataset.questions
    const question = progressBar.dataset.question - 1
    const progress = Math.round(question / questionCount * 100)
    progressBar.setAttribute('style', `width: ${progress}%`)    
    progressBar.setAttribute('aria-valuenow', `${question}`)    
    progressBar.setAttribute('aria-valuemin', `0`)    
    progressBar.setAttribute('aria-valuemax', `${questionCount}`)    
  }
})
