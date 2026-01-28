const deleteButton = document.getElementById("delete-account-btn");
const modal = document.getElementById("delete-modal");
const confirmInput = document.getElementById("confirm-input");
const confirmBtn = document.getElementById("confirm-delete");
const cancelBtn = document.getElementById("cancel-delete");
const msg = document.getElementById("delete-msg");

// Username hiện tại từ server, nhúng data attribute
const username = deleteButton.dataset.username;

// Mở modal khi bấm nút xóa
deleteButton.addEventListener("click", () =>
{
    console.log("open")
    modal.style.display = "flex";
    confirmInput.value = "";
    msg.textContent = "";
});

// Hủy
cancelBtn.addEventListener("click", () =>
{
    console.log("close")
    modal.style.display = "none";
});

// Xác nhận
confirmBtn.addEventListener("click", async () =>
{
    console.log(username)
    const val = confirmInput.value.trim();
    if(val !== username + " MichiShop")
    {
        msg.textContent = "Nhập không đúng! Vui lòng nhập đúng 'USERNAME + MichiShop'";
        return;
    }

    try
    {
        const res = await fetch(`${window.APP_CONTEXT_PATH}/profile`, {
            method: "DELETE",
            headers: { "Content-Type": "application/json" }
        });

        const data = await res.json();
        if(data.success)
        {
            alert("Xóa tài khoản thành công!");
            window.location.href = `${window.APP_CONTEXT_PATH}/auth/logout`;
        } else
        {
            msg.textContent = data.message || "Có lỗi khi xóa tài khoản!";
        }
    } catch(err)
    {
        console.error(err);
        msg.textContent = "Có lỗi khi xóa tài khoản!";
    }
});

// Click ngoài modal đóng modal
window.addEventListener("click", e =>
{
    if(e.target === modal)
    {
        modal.style.display = "none";
    }
});
