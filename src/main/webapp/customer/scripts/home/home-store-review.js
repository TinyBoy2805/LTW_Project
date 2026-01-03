


export const sendReviewToServer = async (data)=>
{
    const review = data.review
    const stars = data.stars

    const params = new URLSearchParams({
        review: review,
        stars: stars
    })

    const url = `${window.APP_CONTEXT_PATH}/home/review?${params}`
    const res = await fetch(url)

    return res.ok
}
