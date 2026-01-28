const getInform = async (page) =>
{
    const url = `${window.APP_CONTEXT_PATH}/notification/detail?page=${page}&ajax=true`
    const res = await fetch(url)
    if(!res.ok) throw new Error("API Error")
    const data = await res.json()
    console.log("🔍 Raw API response:", data)  // ✅ Xem data thô
    console.log("🔍 First item read value:", data[0]?.read, typeof data[0]?.read)  // ✅ Check kiểu dữ liệu

    return data;
}

const markReadAll = async () =>
{
    const url = `${window.APP_CONTEXT_PATH}/notification/mark`
    const res = await fetch(url)
    if(!res.ok) throw new Error("API Error")
    const data = await res.json()
    return data.success;
}

const renderInform = (notifs, inform_article_template, notifications_list) =>
{
    console.log("🔥 renderInform từ getInformForPage.js được gọi!") // ✅ Log đầu tiên
    console.log("Số notifications:", notifs.length)

    for(const notif of notifs)
    {
        console.log("🔄 Rendering notification:", notif.title) // ✅ Log mỗi item

        const clone = inform_article_template.content.cloneNode(true)
        const articleItem = clone.querySelector(".notification")
        const title = clone.querySelector(".notif-title")
        const message = clone.querySelector(".notif-message")
        const timestamp = clone.querySelector(".notif-timestamp")

        console.log("read value:", notif.is_read, "type:", typeof notif.is_read)

        if(notif.is_read === 1 || notif.is_read === true)
        {
            console.log("  → Đã đọc, remove active")
            articleItem.classList.remove("active")
        } else
        {
            console.log("  → Chưa đọc, add active")
            articleItem.classList.add("active")
        }

        if(title && message && timestamp)
        {
            title.innerText = notif.title
            message.innerText = notif.message
            timestamp.innerText = new Date(notif.created_at).toLocaleString("vi-VN")
        }
        notifications_list.appendChild(clone)
    }

    console.log("✅ renderInform hoàn thành!")
}

window.addEventListener("load", async () =>
{
    try
    {
        console.log("🚀 getInformForPage.js - load event triggered")
        let page = 1
        const inform_article_template = document.querySelector("#inform_article_template")
        const notifications_list = document.querySelector(".notifications-list")
        const more_notif_btn = document.querySelector("#more-notif")

        if (!inform_article_template || !notifications_list || !more_notif_btn) return;

        notifications_list.innerHTML = ''

        let notifs = await getInform(page)
        renderInform(notifs, inform_article_template, notifications_list)

        let testPage = page + 1
        if((await getInform(testPage)).length === 0)
        {
            more_notif_btn.classList.add("--dn")
        } else
        {
            more_notif_btn.classList.remove("--dn")
        }

        more_notif_btn.addEventListener('click', async () =>
        {
            page++;
            const newNotifs = await getInform(page);
            notifs = [...notifs, ...newNotifs];
            renderInform(newNotifs, inform_article_template, notifications_list)
        })

    } catch(e)
    {
        console.error("Error in DOMContentLoaded async block:", e)
    }
})