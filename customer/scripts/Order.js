const order_cards = document.querySelectorAll('.order-card')

order_cards.forEach((card)=>
{
    card.addEventListener('click', ()=>
    {
        window.location.href = '../pages/OrderDetail.html'
    })
})


