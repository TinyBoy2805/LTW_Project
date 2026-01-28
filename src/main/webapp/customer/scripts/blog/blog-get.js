


export const getBlogByPage = async (page) =>
{
    const url = `${window.APP_CONTEXT_PATH}/blog?page=${page}`
    const res = await fetch(url)

    if(!res.ok) throw new Error("API Error")

    const blogs = await res.json()

    return blogs
}

