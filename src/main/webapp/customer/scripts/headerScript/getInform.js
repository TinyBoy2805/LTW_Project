


const getInform  = async ()=>
{
    const url = `${window.APP_CONTEXT_PATH}/notification`

    const res = await fetch(url)
    if(!res.ok) throw new Error("API Error")

    const data = await res.json()

    // console.log("Raw data:", data); // xem data trước

    return data;

}



window.addEventListener("DOMContentLoaded", async ()=>
{
    const inform_template = document.querySelector("#inform_template")
    const notification_list = document.querySelector(".notification-list")

    if (!inform_template || !notification_list) return; // ⭐ trang không có thì thôi

    const notif_count = document.querySelector(".notif-count")
    notification_list.innerHTML = ''
    const notifs = await getInform()

    let countUnread = 0

    for (const notif of notifs)
    {
        console.log(notif);

       console.log(notif.id)
       console.log(notif.title)
       console.log(notif.message)
       console.log(notif.userId)
       console.log(notif.created_at)


        const clone = inform_template.content.cloneNode(true);




        const item = clone.querySelector(".notification-item")
        const textEl = clone.querySelector(".notification-text");
        const timeEl = clone.querySelector(".notification-time");

        if (textEl) textEl.innerText = notif.title;
        if (timeEl) timeEl.innerText = notif.created_at;

        if(notif.read) item.classList.remove("unread")
        else
        {
            item.classList.add("unread");
            countUnread++;
        }

        notification_list.appendChild(clone);


    }

    notif_count.innerText = countUnread

})