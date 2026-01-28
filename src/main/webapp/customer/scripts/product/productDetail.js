// productDetail.js
import {addToCart, createNotification} from "./addToCart.js";

// ==================== CAROUSEL ====================
document.addEventListener("DOMContentLoaded", () =>
{
    const slider = document.querySelector(".img-slider");
    const images = document.querySelectorAll(".img-slider img");
    const prevBtn = document.querySelector(".nav.prev");
    const nextBtn = document.querySelector(".nav.next");
    const counter = document.querySelector(".carousel-counter");

    // Kiểm tra elements tồn tại
    if (!slider || images.length === 0)
    {
        console.warn("Carousel elements not found");
        return;
    }

    let index = 0;
    const total = images.length;

    console.log(`Carousel initialized with ${total} images`);

    // Nếu chỉ có 1 ảnh → không cần slider
    if (total <= 1)
    {
        if (prevBtn) prevBtn.style.display = "none";
        if (nextBtn) nextBtn.style.display = "none";
        if (counter) counter.style.display = "none";
        return;
    }

    // Tạo dots
    if (counter)
    {
        for (let i = 0; i < total; i++)
        {
            const dot = document.createElement("div");
            dot.classList.add("carousel-dot");
            if (i === 0) dot.classList.add("active");

            dot.addEventListener("click", () =>
            {
                index = i;
                updateCarousel();
            });

            counter.appendChild(dot);
        }
    }

    const dots = counter ? counter.querySelectorAll(".carousel-dot") : [];

    function updateCarousel()
    {
        slider.style.transition = "transform 0.3s ease-in-out";
        slider.style.transform = `translateX(-${index * 100}%)`;

        // Update dots
        if (dots.length > 0)
        {
            dots.forEach(d => d.classList.remove("active"));
            if (dots[index])
            {
                dots[index].classList.add("active");
            }
        }

        // Update buttons state
        if (prevBtn)
        {
            prevBtn.disabled = (index === 0);
            prevBtn.style.opacity = (index === 0) ? "0.5" : "1";
        }
        if (nextBtn)
        {
            nextBtn.disabled = (index === total - 1);
            nextBtn.style.opacity = (index === total - 1) ? "0.5" : "1";
        }
    }

    // Next button
    if (nextBtn)
    {
        nextBtn.addEventListener("click", () =>
        {
            if (index < total - 1)
            {
                index++;
                updateCarousel();
            }
        });
    }

    // Prev button
    if (prevBtn)
    {
        prevBtn.addEventListener("click", () =>
        {
            if (index > 0)
            {
                index--;
                updateCarousel();
            }
        });
    }

    // Initial update
    updateCarousel();
});

// ==================== QUANTITY CONTROLS ====================
document.addEventListener("DOMContentLoaded", () =>
{
    const quantityDisplay = document.querySelector(".section1-right ul:nth-of-type(2) p");
    const decreaseBtn = document.querySelector(".section1-right ul:nth-of-type(2) button:first-of-type");
    const increaseBtn = document.querySelector(".section1-right ul:nth-of-type(2) button:last-of-type");
    const stockText = document.querySelector(".section1-right ul:nth-of-type(2) li:last-child strong");

    if (!quantityDisplay || !decreaseBtn || !increaseBtn || !stockText)
    {
        console.warn("Quantity controls not found");
        return;
    }

    let quantity = 1;
    const maxStock = parseInt(stockText.textContent.trim()) || 999;

    function updateQuantity()
    {
        quantityDisplay.textContent = quantity;
        decreaseBtn.disabled = (quantity <= 1);
        increaseBtn.disabled = (quantity >= maxStock);

        decreaseBtn.style.opacity = (quantity <= 1) ? "0.5" : "1";
        increaseBtn.style.opacity = (quantity >= maxStock) ? "0.5" : "1";
    }

    decreaseBtn.addEventListener("click", () =>
    {
        if (quantity > 1)
        {
            quantity--;
            updateQuantity();
        }
    });

    increaseBtn.addEventListener("click", () =>
    {
        if (quantity < maxStock)
        {
            quantity++;
            updateQuantity();
        }
    });

    // Initial state
    updateQuantity();
});

function blinkCartIcon()
{
    const cartIcon = document.querySelector("#cart-icon"); // class icon giỏ hàng của bạn
    if (!cartIcon) return;

    cartIcon.classList.add("cart-blink");

    // Xóa class sau khi animation kết thúc để lần sau còn chạy lại
    cartIcon.addEventListener("animationend", () =>
    {
        cartIcon.classList.remove("cart-blink");
    }, { once: true });
}
// ==================== ADD TO CART ====================
document.addEventListener("DOMContentLoaded", () =>
{
    const container = document.querySelector(".toast-container");
    const addToCartBtn = document.querySelector(".actions button:first-of-type");

    if (addToCartBtn)
    {
        addToCartBtn.addEventListener("click", () =>
        {
            addToCartBtn.disabled = true
            const quantityDisplay = document.querySelector(".section1-right ul:nth-of-type(2) p");
            const quantity = parseInt(quantityDisplay?.textContent || "1");

            // TODO: Gọi API thêm vào giỏ hàng
            console.log(window.userId)
            console.log("Add to cart:", quantity);
            if(window.userId === null)
            {
                createNotification("Vui lòng đăng nhập!")
                const originalText = addToCartBtn.innerHTML;
                addToCartBtn.innerHTML = '<i class="fa-solid fa-ban"></i> Thất bại';

                setTimeout(() =>
                {
                    addToCartBtn.innerHTML = originalText;
                    addToCartBtn.style.background = "";
                    addToCartBtn.disabled = false
                }, 2000);
                return;
            }
            addToCart(addToCartBtn.id, quantity)
            blinkCartIcon()

            // Visual feedback
            const originalText = addToCartBtn.innerHTML;
            addToCartBtn.innerHTML = '<i class="fa-solid fa-check"></i> Đã thêm';

            setTimeout(() =>
            {
                addToCartBtn.innerHTML = originalText;
                addToCartBtn.style.background = "";
                addToCartBtn.disabled = false
            }, 2000);
        });
    }
});

document.addEventListener("DOMContentLoaded", ()=>
{
    const buyNow = document.querySelector("#buyNow")

    if(buyNow)
    {
        buyNow.addEventListener("click", ()=>
        {
            if(window.userId)
            {
                console.log("mua mua mua")
            }else
            {
                createNotification("Vui lòng đăng nhập!")
            }
        })
    }
})

// loadmore reviews


const getMoreReviews = async (productId, page = 1) =>
{
    try
    {
        const url = `${window.APP_CONTEXT_PATH}/product-detail/review?product_id=${productId}&pageReview=${page}`;

        const response = await fetch(url); // mặc định GET
        if (!response.ok) throw new Error("Failed to fetch reviews");

        const data = await response.json();
        return data;
    } catch (err)
    {
        console.error(err);
        return [];
    }
};



const renderReviews = (template, data, container) =>
{
    container.innerHTML = ""; // nếu muốn xóa cũ trước khi append
    for(const item of data)
    {
        const clone = template.content.cloneNode(true);

        clone.querySelector(".review-avt").src = item.avt_url || 'https://i.pinimg.com/1200x/dc/6c/b0/dc6cb0521d182f959da46aaee82e742f.jpg';
        clone.querySelector(".review-name").textContent = item.name;
        clone.querySelector(".review-comment").textContent = item.comment;

        // render stars
        const starsContainer = clone.querySelector(".review-stars");
        starsContainer.innerHTML = "";
        const starCount = Math.ceil(item.rating); // làm tròn lên nếu muốn
        for(let i = 1; i <= 5; i++)
        {
            const li = document.createElement("li");
            if(i <= starCount)
            {
                li.innerHTML = `<i class="fa-solid fa-star --star"></i>`;
            } else
            {
                li.innerHTML = `<i class="fa-regular fa-star empty"></i>`;
            }
            starsContainer.appendChild(li);
        }

        // format date
        const date = new Date(item.created_at);
        const formatted = `${date.getDate().toString().padStart(2,'0')}/${
            (date.getMonth()+1).toString().padStart(2,'0')}/${date.getFullYear()}`;
        clone.querySelector(".review-date").textContent = formatted;

        container.appendChild(clone);
    }
};



document.addEventListener("DOMContentLoaded", async ()=>
{
    let page = 1;
    const moreReviews = document.querySelector("#more-reviews")
    const productId = document.querySelector("#productIdHolder").value
    const reviewTemplate = document.querySelector("#review-template")
    let reviewData = await getMoreReviews(productId, page)
    const reviewContainer = document.querySelector(".review-container")

    renderReviews(reviewTemplate, reviewData, reviewContainer)

    const nextReviews = await getMoreReviews(productId, page + 1); // xem page tiếp theo
    if(nextReviews.length <= 0)
    {
        moreReviews.disabled = true;
        moreReviews.innerText = "Đã hết!";
    }

    if(moreReviews)
    {
        moreReviews.addEventListener("click", async ()=>
        {
            page++;
            const newReviews = await getMoreReviews(productId, page)
            reviewData = [...reviewData, ...newReviews]
            renderReviews(reviewTemplate, reviewData, reviewContainer)

            const nextReviews = await getMoreReviews(productId, page + 1); // xem page tiếp theo
            if(nextReviews.length <= 0)
            {
                moreReviews.disabled = true;
                moreReviews.innerText = "Đã hết!";
            }
        })
    }

})




//////////////////////////////////////////////more product

const getMoreProduct = async (productId, page=1)=>
{
    try
    {
        const url = `${window.APP_CONTEXT_PATH}/product-detail/product?product_id=${productId}&pageProduct=${page}`;

        const response = await fetch(url); // mặc định GET
        if (!response.ok) throw new Error("Failed to fetch reviews");

        const data = await response.json();
        return data;
    } catch (err)
    {
        console.error(err);
        return [];
    }
}

function formatPrice(price)
{
    return new Intl.NumberFormat('vi-VN').format(price)
}

const renderProductCard = (template, data, container)=>
{
    const form = container.querySelector('#product__form')
    const productDetailIdHolder = container.querySelector("#product__id")
    container.innerHTML = ''

    if(form)
    {
        container.appendChild(form)
    }
    for(const p of data)
    {
        const clone = template.content.cloneNode(true)

        // clone.querySelector("#holder").value = p.id
        clone.querySelector('h3').innerText = p.name
        clone.querySelector('img').src = p.img_url
        clone.querySelector('#rating').innerText = Math.ceil(p.avg_rating)
        clone.querySelector('#price').innerText = formatPrice(p.price) + 'đ'
        clone.querySelector('#buy_count').innerText = p.buy_count

        const star = Math.ceil(p.avg_rating)
        const leftStar = 5 - star;
        const starContainer = clone.querySelector('.product__mid-sub1-stars')

        for(let i=0; i<star; i++)
        {
            const starTag = document.createElement('li')
            starTag.classList.add('product__mid-sub1-stars-item')
            starTag.innerHTML = `<i class="fa-solid fa-star"></i>`
            starContainer.appendChild(starTag)
        }

        for(let i=0; i<leftStar; i++)
        {
            const starTag = document.createElement('li')
            starTag.classList.add('product__mid-sub1-stars-item')
            starTag.classList.add('--color2')
            starTag.innerHTML = `<i class="fa-solid fa-star hidden"></i>`
            starContainer.appendChild(starTag)
        }
        container.appendChild(clone)
    }

    const productCards = container.querySelectorAll('li.main__trending-content-ul-li')
    productCards.forEach((card, index) =>
    {
        const cardBtn = card.querySelector(".buy-now")
        const cartBtn = card.querySelector(".product__top-cart")

        cartBtn.addEventListener('click', ()=>
        {
            // sessionStorage.setItem("scrollPos", window.scrollY);
            addToCart(data[index].id)
            blinkCartIcon()
        })

        cardBtn.addEventListener('click', () =>
        {
            const productId = data[index].id
            productDetailIdHolder.value = productId
            form.submit()
        })
    })

}


document.addEventListener("DOMContentLoaded", async ()=>
{
    let page = 1;
    const moreProduct = document.querySelector(".anothers-more")
    const productId = document.querySelector("#productIdHolder").value
    const productTemplate = document.querySelector("#product-card__template")
    let productData = await getMoreProduct(productId, page)
    const productContainer = document.querySelector(".another-list")

    renderProductCard(productTemplate,productData, productContainer)

    // check xem còn page 2
    const nextData = await getMoreProduct(productId, page + 1);
    moreProduct.disabled = nextData.length === 0;
    moreProduct.innerText = nextData.length > 0 ? "Xem thêm" : "Đã hết";

    moreProduct.addEventListener("click", async () =>
    {
        page++;
        const newData = await getMoreProduct(productId, page);
        productData = [...productData, ...newData];
        renderProductCard(productTemplate, productData, productContainer, false);

        const nextData = await getMoreProduct(productId, page + 1);
        moreProduct.disabled = nextData.length === 0;
        moreProduct.innerText = nextData.length > 0 ? "Xem thêm" : "Đã hết";
    });

})




