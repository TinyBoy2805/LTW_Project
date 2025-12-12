const section1 = document.querySelector('.main__payment')
const section2 = document.querySelector('.payment__result')


const payBtn = document.querySelector('.pay-btn')


payBtn.addEventListener('click', (e)=>
{
    e.preventDefault()
    section1.classList.remove('active')
    section2.classList.add('active')
})



