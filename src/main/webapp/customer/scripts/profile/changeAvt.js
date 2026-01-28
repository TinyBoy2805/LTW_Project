

const changeAvatarBtn = document.querySelector(".change-avatar-btn");
const avtModal = document.getElementById("avt-modal");
const closeBtn = document.getElementById("avt-close-btn");
const confirmBtn = document.getElementById("avt-confirm-btn");
const avatarImg = document.getElementById("avatar-img");

let selectedAvatar = null;

// Mở modal
changeAvatarBtn.addEventListener("click", () =>
{
    avtModal.style.display = "flex";
});

// Đóng modal
closeBtn.addEventListener("click", () =>
{
    avtModal.style.display = "none";
    selectedAvatar = null;
    document.querySelector(".avt-item.selected")?.classList.remove("selected");
    confirmBtn.disabled = true;
});

// Chọn avatar
document.querySelectorAll(".avt-item").forEach(item =>
{
    item.addEventListener("click", () =>
    {
        document.querySelector(".avt-item.selected")?.classList.remove("selected");
        item.classList.add("selected");
        selectedAvatar = item.querySelector("img").src;
        confirmBtn.disabled = false;
    });
});
const container = document.querySelector(".toast-container");
function createNotification(text)
{
    const div = document.createElement("div");
    div.classList.add("toast");
    div.innerText = text;
    container.appendChild(div);
    setTimeout(() =>
    {
        div.remove();
    }, 3000);
}

// Đồng ý thay đổi avatar
confirmBtn.addEventListener("click", async () =>
{
    if (selectedAvatar)
    {
        avatarImg.src = selectedAvatar;
        console.log(selectedAvatar)

        // Gọi API lưu avatar về server
        await fetch(`${window.APP_CONTEXT_PATH}/profile/change-avatar`,
            {
            method: "POST",
            headers: {  'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({
                avtUrl: selectedAvatar
            })
        })
            .then(res => res.json())
            .then(data =>
            {
                if(data.success)
                {
                    createNotification("Đổi avatar thành công!");
                    setTimeout(()=>
                    {
                        window.location.reload()
                    }, 1000)
                } else
                {
                    createNotification("Có lỗi khi đổi avatar");
                }
            })
            .catch(err => console.error(err));

        avtModal.style.display = "none";
    }
});