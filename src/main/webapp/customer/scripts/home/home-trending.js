


export const getDataByTrending = async (type)=>
{
    const api_url = `${window.APP_CONTEXT_PATH}/home?trending_type=${type}`
    const res = await fetch(api_url)

    if(!res.ok) throw new Error("API Error")
    const data = await res.json()
    return data
}