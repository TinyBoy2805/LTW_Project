

    const tabs = document.querySelectorAll('.main__trending-tab')
    const contents = document.querySelectorAll('.main__trending-content')

    const mainCateList = document.querySelector(".main__categories-list")
    const mainCateListUl = mainCateList.querySelector('ul')
    const mainCateListUl_lis = mainCateListUl.querySelectorAll('li')

    const leftBtn = mainCateList.querySelector('.left-btn')
    const rightBtn = mainCateList.querySelector('.right-btn')

    let currentIndex = 0
    const maxIndex = parseInt(mainCateListUl.getAttribute("data-total")) - Math.floor(1200 / 200)

    function updateSlider()
    {
        const translateX = -currentIndex * 200
        mainCateListUl.style.transform = `translateX(${translateX}px)`

        leftBtn.disabled = currentIndex === 0
        rightBtn.disabled = currentIndex === maxIndex
    }

    leftBtn.addEventListener('click', () =>
    {
        if (currentIndex > 0) {
            currentIndex--
            updateSlider()
        }
    })

    rightBtn.addEventListener('click', () =>
    {
        if (currentIndex < maxIndex) {
            currentIndex++
            updateSlider()
        }
    })

    updateSlider()


///////////////////////////////////////////////////////////////

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

