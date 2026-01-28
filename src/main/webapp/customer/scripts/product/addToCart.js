
let cartItems = []

const container = document.querySelector(".toast-container");
const cartItemList = document.querySelector('.cart-items-list')
const totalCartPrice = document.querySelector('.total-price')
const cartCounter = document.querySelector('.cart-count-badge')




export function createNotification(text)
{
    const div = document.createElement("div");
    div.classList.add("toast");
    div.innerText = text;
    container.appendChild(div);
    setTimeout(() =>
    {
        div.remove();
    }, 3000);
}

export function formatPrice(price)
{
    return new Intl.NumberFormat('vi-VN').format(price)
}





export const addToCart = async (productId, quantity=1) =>
{
    const url = `${window.APP_CONTEXT_PATH}/cart`;

    try
    {
        const res = await fetch(url,
        {
            method: 'POST',
            headers:
            {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                productId: productId,
                quantity: quantity
            })
        });

        if (res.ok)
        {
            const data = await res.json()
            cartItems = data?.cart
            let totalPrice = 0.0
            cartItemList.innerHTML = ``

            let cnt = 0;
            Object.keys(cartItems).forEach(key=>
            {
                const item = cartItems[key]
                totalPrice += (item.price * item.quantity)
                const cartItemElement = document.createElement('div')
                cartItemElement.classList.add('cart-item')

                cartItemElement.innerHTML = `
                        <div class="cart-item-img"> 
                            <img src="${item?.product.img_url}" alt="">
                        </div>
                        <div class="cart-item-info">
                            <h4>${item?.product.name}</h4>
                            <p class="cart-item-qty">x${item.quantity}</p>
                        </div>
                        <div class="cart-item-price">
                            <span>${formatPrice(item.price)}₫</span>
                        </div>
                `
                cartItemList.appendChild(cartItemElement)
                cnt++;
            })

            totalCartPrice.innerText = `${formatPrice(totalPrice)}₫`
            cartCounter.innerText = `${cnt} sản phẩm`
            createNotification("Thêm sản phẩm thành công!");
        } else
        {
            createNotification("Thêm sản phẩm thất bại!");
        }
    } catch (err)
    {
        console.error(err);
        createNotification("Đăng nhập để thêm sản phẩm!");
    }
};
window.addToCart = addToCart;




