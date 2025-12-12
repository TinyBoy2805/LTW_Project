

const clickProductItem = () => 
{
    const products = document.querySelectorAll('.product');
    if (!products) return;

    products.forEach((item)=>
    {
        item.addEventListener('click', ()=>
        {
            window.location.href = '../pages/ProductDetail.jsp'
        })
    })
   
};

export default { clickProductItem };
