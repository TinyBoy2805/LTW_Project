



export const getProductsByPage = async (page)=>
{
    const url = `${window.APP_CONTEXT_PATH}/home/product?page=${page}`
    const res = await fetch(url)

    if(!res.ok) throw new Error("API Error")

    const products = await res.json()

    return products
}

