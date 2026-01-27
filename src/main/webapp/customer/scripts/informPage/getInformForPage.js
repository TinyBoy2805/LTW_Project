const getInform  = async (page)=>
{
    const url = `${window.APP_CONTEXT_PATH}/notification/detail?page=${page}&ajax=true`

    const res = await fetch(url)
    if(!res.ok) throw new Error("API Error")

    const data = await res.json()

    // console.log("Raw data:", data); // xem data trước

    return data;

}

const renderInform = (notifs, inform_article_template, notifications_list)=>
{
    for(const notif of notifs)
    {
        const clone = inform_article_template.content.cloneNode(true)

        const articleItem = clone.querySelector(".notification")
        const title = clone.querySelector(".notif-title")
        const message = clone.querySelector(".notif-message")
        const timestamp = clone.querySelector(".notif-timestamp")

        if(notif.read)
        {
            articleItem.classList.remove("active")
        }else articleItem.classList.add("active")


        if(title && message && timestamp)
        {
            title.innerText = notif.title
            message.innerText = notif.message
            timestamp.innerText = new Date(notif.created_at).toLocaleString("vi-VN")
        }
        notifications_list.appendChild(clone)
    }
}


window.addEventListener("DOMContentLoaded", async ()=>
{
    let page = 1
    const inform_article_template = document.querySelector("#inform_article_template")
    const notifications_list = document.querySelector(".notifications-list")
    const more_notif_btn = document.querySelector("#more-notif")

    if (!inform_article_template || !notifications_list || !more_notif_btn) return;

    notifications_list.innerHTML = ''

    let notifs = await getInform(page)

    renderInform(notifs, inform_article_template, notifications_list)

    let testPage = page+1
    if((await getInform(testPage)).length === 0)
    {
        more_notif_btn.classList.add("--dn")
    }else
    {
        more_notif_btn.classList.remove("--dn")
    }

    more_notif_btn.addEventListener('click', async ()=>
    {
        page++;
        const newNotifs = await getInform(page);
        notifs = [...notifs, ...newNotifs];
        renderInform(newNotifs, inform_article_template, notifications_list)
    })

})