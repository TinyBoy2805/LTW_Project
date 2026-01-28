// ===== TAB SWITCHING =====
const tabs = document.querySelectorAll('.profile-tab')
const contents = document.querySelectorAll('.profile-content')

tabs.forEach((tab, index)=>
{
    tab.addEventListener('click', (e)=>
    {
        tabs.forEach((tab)=>
        {
            tab.classList.remove('active')
        })
        tab.classList.add('active')

        contents.forEach(content=>
        {
            content.classList.remove('active')
        })
        contents[index].classList.add('active')
    })
})

// Handle URL parameters for tabs
const urlParams = new URLSearchParams(window.location.search);
const activeTabId = urlParams.get('tab');
if (activeTabId) {
    const targetContent = document.getElementById(activeTabId);
    if (targetContent) {
        const contentIndex = Array.from(contents).indexOf(targetContent);
        if (contentIndex !== -1) {
            tabs.forEach(t => t.classList.remove('active'));
            contents.forEach(c => c.classList.remove('active'));
            tabs[contentIndex].classList.add('active');
            contents[contentIndex].classList.add('active');
        }
    }
}


const tabs2 = document.querySelectorAll('.purchase-tab')
const contents2 = document.querySelectorAll('#purchase-info .content')

tabs2.forEach((tab, index)=>
{
    tab.addEventListener('click', (e)=>
    {
        tabs2.forEach((tab)=>
        {
            tab.classList.remove('active')
        })
        tab.classList.add('active')

        contents2.forEach(content=>
        {
            content.classList.remove('active')
        })
        contents2[index].classList.add('active')
    })
})


// ======================
// THÔNG TIN CÁ NHÂN
// ======================
const editNameBtn = document.getElementById("edit-name-btn");
const editPhoneBtn = document.getElementById("edit-phone-btn");
const avatarImg = document.getElementById("avatar-img");
const changeAvatarBtn = document.querySelector(".change-avatar-btn");

// ======================
// ĐỊA CHỈ
// ======================
// ======================
// ĐỊA CHỈ (ADDRESS MANAGEMENT)
// ======================
const addAddressBtn = document.getElementById("add-address-btn");
const addressList = document.getElementById("address-list");
const addressModal = document.getElementById("address-modal");
const addressCloseBtn = document.getElementById("address-close-btn");
const addressModalCancel = document.getElementById("address-modal-cancel");
const addressModalSubmit = document.getElementById("address-modal-submit");
const addressModalTitle = document.getElementById("address-modal-title");

// Form Inputs
const modalAddressId = document.getElementById("modal-address-id");
const modalHouse = document.getElementById("modal-house");
const modalRoad = document.getElementById("modal-road");
const modalHamlet = document.getElementById("modal-hamlet");
const modalWard = document.getElementById("modal-ward");
const modalDistrict = document.getElementById("modal-district");
const modalCity = document.getElementById("modal-city");
const modalDefault = document.getElementById("modal-default");
const modalDefaultWrapper = document.getElementById("modal-default-wrapper");

if (addAddressBtn && addressModal) {
    const openModal = (mode = "add", data = {}) => {
        addressModal.classList.add("active");
        addressModalTitle.textContent = mode === "add" ? "Thêm địa chỉ mới" : "Chỉnh sửa địa chỉ";

        // Reset or Fill fields
        modalAddressId.value = data.id || "";
        modalHouse.value = data.house || "";
        modalRoad.value = data.road || "";
        modalHamlet.value = data.hamlet || "";
        modalWard.value = data.ward || "";
        modalDistrict.value = data.district || "";
        modalCity.value = data.city || "";
        modalDefault.checked = false;

        // Hide default checkbox if editing (optional, but requested simple edit)
        if (mode === "edit") {
            modalDefaultWrapper.style.display = "none";
        } else {
            modalDefaultWrapper.style.display = "block";
        }
    };

    const closeModal = () => {
        addressModal.classList.remove("active");
    };

    addAddressBtn.addEventListener("click", () => openModal("add"));
    addressCloseBtn.addEventListener("click", closeModal);
    addressModalCancel.addEventListener("click", closeModal);

    addressModalSubmit.addEventListener("click", async () => {
        const id = modalAddressId.value;
        const data = {
            addressId: id,
            houseNumber: modalHouse.value.trim(),
            road: modalRoad.value.trim(),
            hamlet: modalHamlet.value.trim(),
            ward: modalWard.value.trim(),
            district: modalDistrict.value.trim(),
            city: modalCity.value.trim(),
            isDefault: modalDefault.checked
        };

        if (!data.city || !data.district || !data.ward) {
            createNotification("Vui lòng nhập Phường, Quận, Tỉnh!");
            return;
        }

        const endpoint = id ? "update-address" : "add-address";
        try {
            const res = await fetch(`${window.APP_CONTEXT_PATH}/profile/${endpoint}`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(data)
            });
            const result = await res.json();

            if (result.success) {
                createNotification(id ? "Đã cập nhật địa chỉ!" : "Đã thêm địa chỉ!");
                window.location.reload();
            } else {
                createNotification("Lỗi hệ thống, vui lòng thử lại!");
            }
        } catch (err) {
            console.error(err);
            createNotification("Lỗi kết nối server!");
        }
    });

    // Event Delegation
    addressList.addEventListener("click", async (e) => {
        const editBtn = e.target.closest(".btn-edit-address");
        const deleteBtn = e.target.closest(".btn-delete-address");
        const defaultBtn = e.target.closest(".btn-set-default");

        if (editBtn) {
            openModal("edit", editBtn.dataset);
        }

        if (deleteBtn) {
            const addressId = deleteBtn.dataset.id;
            if (confirm("Bạn có chắc muốn xóa địa chỉ này?")) {
                try {
                    const res = await fetch(`${window.APP_CONTEXT_PATH}/profile/delete-address?addressId=${addressId}`, { method: "POST" });
                    const result = await res.json();
                    if (result.success) {
                        createNotification("Đã xóa!");
                        deleteBtn.closest(".address-card").remove();
                    }
                } catch (err) {
                    createNotification("Lỗi xóa địa chỉ!");
                }
            }
        }

        if (defaultBtn) {
            const addressId = defaultBtn.dataset.id;
            try {
                const res = await fetch(`${window.APP_CONTEXT_PATH}/profile/set-default-address?addressId=${addressId}`, { method: "POST" });
                const result = await res.json();
                if (result.success) {
                    createNotification("Đã đặt làm mặc định!");
                    window.location.reload();
                }
            } catch (err) {
                createNotification("Lỗi cập nhật!");
            }
        }
    });
}



// ======================
// VOUCHER
// ======================
import { createNotification } from '../product/addToCart.js';

// ======================
// THÔNG TIN CÁ NHÂN & BẢO MẬT
// ======================

// Modal Elements
const nameModal = document.getElementById("name-modal");
const phoneModal = document.getElementById("phone-modal");
const passwordModal = document.getElementById("password-modal");

// Trigger Buttons are already declared above as editNameBtn, editPhoneBtn
const changePasswordBtn = document.getElementById("change-password-btn");

// Close Buttons
const nameCloseBtn = document.getElementById("name-close-btn");
const nameCancelBtn = document.getElementById("name-cancel-btn");
const phoneCloseBtn = document.getElementById("phone-close-btn");
const phoneCancelBtn = document.getElementById("phone-cancel-btn");
const passwordCloseBtn = document.getElementById("password-close-btn");
const passwordCancelBtn = document.getElementById("password-cancel-btn");

// Submit Buttons
const nameSubmitBtn = document.getElementById("name-submit-btn");
const phoneSubmitBtn = document.getElementById("phone-submit-btn");
const passwordSubmitBtn = document.getElementById("password-submit-btn");

// Utils to toggle modals
const toggleModal = (modal, show) => {
    if (show) modal.classList.add("active");
    else modal.classList.remove("active");
};

// Name Update
if (editNameBtn) {
    editNameBtn.addEventListener("click", () => toggleModal(nameModal, true));
    nameCloseBtn.addEventListener("click", () => toggleModal(nameModal, false));
    nameCancelBtn.addEventListener("click", () => toggleModal(nameModal, false));

    nameSubmitBtn.addEventListener("click", async () => {
        const newName = document.getElementById("input-new-name").value.trim();
        if (!newName) return createNotification("Vui lòng nhập tên!");

        try {
            const res = await fetch(`${window.APP_CONTEXT_PATH}/profile/update-name`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ name: newName })
            });
            const result = await res.json();
            if (result.success) {
                createNotification("Đã đổi tên thành công!");
                document.getElementById("user-name").textContent = newName;
                toggleModal(nameModal, false);
            }
        } catch (e) {
            createNotification("Lỗi kết nối!");
        }
    });
}

// Phone Update
if (editPhoneBtn) {
    editPhoneBtn.addEventListener("click", () => toggleModal(phoneModal, true));
    phoneCloseBtn.addEventListener("click", () => toggleModal(phoneModal, false));
    phoneCancelBtn.addEventListener("click", () => toggleModal(phoneModal, false));

    phoneSubmitBtn.addEventListener("click", async () => {
        const newPhone = document.getElementById("input-new-phone").value.trim();
        if (!newPhone) return createNotification("Vui lòng nhập số điện thoại!");

        try {
            const res = await fetch(`${window.APP_CONTEXT_PATH}/profile/update-phone`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ phone: newPhone })
            });
            const result = await res.json();
            if (result.success) {
                createNotification("Đã đổi số điện thoại!");
                document.getElementById("user-phone").textContent = newPhone;
                toggleModal(phoneModal, false);
            }
        } catch (e) {
            createNotification("Lỗi kết nối!");
        }
    });
}

// Password Change
if (changePasswordBtn) {
    changePasswordBtn.addEventListener("click", () => toggleModal(passwordModal, true));
    passwordCloseBtn.addEventListener("click", () => toggleModal(passwordModal, false));
    passwordCancelBtn.addEventListener("click", () => toggleModal(passwordModal, false));

    passwordSubmitBtn.addEventListener("click", async () => {
        const oldPassword = document.getElementById("input-old-pwd").value;
        const newPassword = document.getElementById("input-new-pwd").value;
        const confirmPassword = document.getElementById("input-confirm-pwd").value;

        if (!oldPassword || !newPassword) return createNotification("Vui lòng nhập đủ mật khẩu!");
        if (newPassword !== confirmPassword) return createNotification("Mật khẩu xác nhận không khớp!");
        if (newPassword.length < 6) return createNotification("Mật khẩu phải từ 6 ký tự!");

        try {
            const res = await fetch(`${window.APP_CONTEXT_PATH}/profile/change-password`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ oldPassword, newPassword })
            });
            const result = await res.json();
            if (result.success) {
                createNotification("Đã đổi mật khẩu thành công!");
                toggleModal(passwordModal, false);
                // Clear fields
                document.getElementById("input-old-pwd").value = "";
                document.getElementById("input-new-pwd").value = "";
                document.getElementById("input-confirm-pwd").value = "";
            } else {
                createNotification(result.message || "Lỗi khi đổi mật khẩu!");
            }
        } catch (e) {
            createNotification("Lỗi kết nối!");
        }
    });
}

const useVoucherBtns = document.querySelectorAll(".use-voucher-btn");

// ======================
// BẢO MẬT
// ======================
const logoutBtn = document.querySelector("#logout-btn");
const deleteAccountBtn = document.getElementById("delete-account-btn");

logoutBtn.addEventListener("click", async ()=>
{
    console.log("logout")
    await fetch(`${window.APP_CONTEXT_PATH}/auth/logout`)
    window.location.reload()
})


