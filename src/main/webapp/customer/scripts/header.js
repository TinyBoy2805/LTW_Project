
const search_form = document.querySelector("#search_form")
const search_bar = document.querySelector("#search_bar")


search_form.addEventListener('submit',async (e)=>
{
    e.preventDefault();

    const value = search_bar.value.trim()
    console.log("value: " + value)
    if (!value)
    {
        alert('Vui lòng nhập tên sản phẩm');
        return;
    }
    try
    {
        const url = `${window.APP_CONTEXT_PATH}/product/search?name=${value}`

        const res = await fetch(url)

        if(!res.ok) throw new Error("API Error")

        const products = await res.json()

        console.log(products)

        sessionStorage.setItem("searchResults", JSON.stringify(products))
        sessionStorage.setItem("searchKeyword", JSON.stringify(value))

        window.location.href = `${window.APP_CONTEXT_PATH}/customer/pages/Products.jsp`;
    }catch (error)
    {
        console.log(error)
    }
})







