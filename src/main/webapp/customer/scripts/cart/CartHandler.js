const checkAll = document.querySelector('#check-all')
const itemCheckboxes = document.querySelectorAll('.cart__select-input')


checkAll.addEventListener('change', () =>
{
    itemCheckboxes.forEach(cb =>
    {
        cb.checked = checkAll.checked
    })
})


itemCheckboxes.forEach(cb =>
{
    cb.addEventListener('change', () =>
    {
        const total = itemCheckboxes.length
        const checked = document.querySelectorAll('.cart__select-input:checked').length

        checkAll.checked = total === checked
    })
})
