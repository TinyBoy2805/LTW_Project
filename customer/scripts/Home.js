const tabs = document.querySelectorAll('.main__trending-tab')
const contents = document.querySelectorAll('.main__trending-content')

tabs.forEach((tab, index)=>
{
    tab.addEventListener('click', (e)=>
    {
        tabs.forEach((tab)=>
        {
            tab.classList.remove('active')
        })
        tab.classList.add('active')

        contents.forEach(content=>
        {
            content.classList.remove('active')
        })
        contents[index].classList.add('active')

        const line = document.querySelector('.main__trending-tab-line')
        line.style.width = e.target.offsetWidth + 'px'
        line.style.left = e.target.offsetLeft + 'px'
    })
})

