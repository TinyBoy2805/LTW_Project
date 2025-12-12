const tabs = document.querySelectorAll('.profile-tab')
const contents = document.querySelectorAll('.profile-content')

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
    })
})


const tabs2 = document.querySelectorAll('.purchase-tab')
const contents2 = document.querySelectorAll('#purchase-info .content')

tabs2.forEach((tab, index)=>
{
    tab.addEventListener('click', (e)=>
    {
        tabs2.forEach((tab)=>
        {
            tab.classList.remove('active')
        })
        tab.classList.add('active')

        contents2.forEach(content=>
        {
            content.classList.remove('active')
        })
        contents2[index].classList.add('active')
    })
})


