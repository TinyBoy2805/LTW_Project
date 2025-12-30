    import {getDataByTrending} from "./home-trending.js";
    import {getProductsByPage} from "./home-product.js";


    const $ = document.querySelector.bind(document)
    const $$ = document.querySelectorAll.bind(document)


    //////////////////DECLARE VARIABLES//////////////////////////////
    const searchBtn = $("#search_trending")
    const sellBtn = $("#sell_trending")
    const ratingBtn = $("#rating_trending")

    const productCardTemplate = $("#product-card__template")
    const trending_container = $('.main__trending-content-ul')

    const tabs = $$('.main__trending-tab')
    const contents = $$('.main__trending-content')

    const mainCateList = $(".main__categories-list")
    const mainCateListUl = mainCateList.querySelector('ul')
    const mainCateListUl_lis = mainCateListUl.querySelectorAll('li')

    const leftBtn = mainCateList.querySelector('.left-btn')
    const rightBtn = mainCateList.querySelector('.right-btn')


    //////////////////////CATEGORY SLIDER//////////////////////////


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


//////////////////////TRENDING TAB EFFECT/////////////////////////

tabs.forEach((tab, index)=>
{
    tab.addEventListener('click', (e)=>
    {
        tabs.forEach((tab)=>
        {
            tab.classList.remove('active')
        })
        tab.classList.add('active')

        // contents.forEach(content=>
        // {
        //     content.classList.remove('active')
        // })
        // contents[index].classList.add('active')

        const line = $('.main__trending-tab-line')
        line.style.width = e.target.offsetWidth + 'px'
        line.style.left = e.target.offsetLeft + 'px'
    })
})

//////////////////////////////HOME TRENDING////////////////////////////////


    const renderProductCard = (data, container)=>
    {
        container.innerHTML = ''
        for(const p of data)
        {
            const clone = productCardTemplate.content.cloneNode(true)

            clone.querySelector('h3').textContent = p.name
            clone.querySelector('img').src = p.img_url
            clone.querySelector('#rating').textContent = Math.ceil(p.avg_rating)
            clone.querySelector('#price').textContent = formatPrice(p.price) + 'đ'
            clone.querySelector('#buy_count').textContent = p.buy_count


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
    }

    function formatPrice(price)
    {
        return new Intl.NumberFormat('vi-VN').format(price)
    }

    async function callSearchTrendingFirst()
    {
        const data = await getDataByTrending('search')
        renderProductCard(data, trending_container)
    }

    window.addEventListener('load', async ()=>
    {
        await callSearchTrendingFirst()
    })

    searchBtn.addEventListener('click', async()=>
    {
        try
        {
            const data = await getDataByTrending('search')
            console.log(data)
            renderProductCard(data, trending_container)

        }catch (err)
        {
            console.log(err)
        }

    })

    sellBtn.addEventListener('click', async()=>
    {
         try
        {
            const data = await getDataByTrending('buy_count')
            console.log(data)
            renderProductCard(data, trending_container)
        }catch (err)
        {
            console.log(err)
        }
    })

    ratingBtn.addEventListener('click', async()=>
    {
         try
        {
            const data = await getDataByTrending('rating')
            console.log(data)
            renderProductCard(data, trending_container)
        }catch (err)
        {
            console.log(err)
        }
    })


///////////////////////////////GET PRODUCTS/////////////////////////////////////

    const moreButton = document.querySelector("#home-more-button");
    let page = 1;
    let products = []
    const product_container = document.querySelector(".main__today-suggestion-list-ul")


    window.addEventListener("load", async ()=>
    {
        const data = await getProductsByPage(page);
        products = data
        renderProductCard(products, product_container)
    })


    moreButton.addEventListener("click", async ()=>
    {
        page++;
        const data = await getProductsByPage(page);
        console.log("page: " + page + "data: ", data)
        products = [...products, ...data]
        renderProductCard(products, product_container)
    })

/////////////////////REVIEW STORE////////////////////////////////////

    const review_form = document.querySelector(".main__rating-form")

    const starContainer = review_form.querySelector("ul")
    const stars = starContainer.querySelectorAll("li")

    stars.forEach((star, index) => //bị ngược index
    {

        star.addEventListener("click", ()=>
        {
            for(let i=4; i>=0; i--)
            {
                stars[i].querySelector("i").classList.remove("--star")
            }

            for(let i=4; i>=index; i--)
            {
                stars[i].querySelector("i").classList.add("--star")
            }
        })

    })








