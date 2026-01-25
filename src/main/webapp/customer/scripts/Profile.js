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
const addAddressBtn = document.getElementById("add-address-btn");
const addressList = document.getElementById("address-list");
// Nút trong từng address card
const addressCards = addressList ? addressList.querySelectorAll(".address-card") : [];

// ======================
// THÊM ĐỊA CHỈ MỚI
// ======================
if (addAddressBtn && addressList) {

    // Tạo form HTML
    const formHtml = `
        <div class="address-form">
            <input type="text" placeholder="Số nhà" class="input-houseNumber">
            <input type="text" placeholder="Đường" class="input-road">
            <input type="text" placeholder="Ấp/Hẻm" class="input-hamlet">
            <input type="text" placeholder="Phường/Xã" class="input-ward">
            <input type="text" placeholder="Quận/Huyện" class="input-district">
            <input type="text" placeholder="Tỉnh/Thành phố" class="input-city">
            <div class="form-actions">
                <button type="button" class="btn-cancel">Hủy</button>
                <button type="button" class="btn-submit">Thêm</button>
            </div>
        </div>
    `;

    let formElement = null;

    addAddressBtn.addEventListener("click", () => {
        // Nếu form chưa có thì append
        if (!formElement) {
            addressList.insertAdjacentHTML("afterbegin", formHtml);
            formElement = addressList.querySelector(".address-form");

            // Gắn sự kiện cho nút hủy
            formElement.querySelector(".btn-cancel").addEventListener("click", () => {
                formElement.remove();
                formElement = null;
            });

            // Gắn sự kiện cho nút thêm
            formElement.querySelector(".btn-submit").addEventListener("click", () => {
                // Lấy dữ liệu
                const houseNumber = formElement.querySelector(".input-houseNumber").value.trim();
                const road = formElement.querySelector(".input-road").value.trim();
                const hamlet = formElement.querySelector(".input-hamlet").value.trim();
                const ward = formElement.querySelector(".input-ward").value.trim();
                const district = formElement.querySelector(".input-district").value.trim();
                const city = formElement.querySelector(".input-city").value.trim();

                // Tạo card mới
                const newId = Date.now(); // tạm dùng timestamp làm id
                const newCardHtml = `
                    <div class="address-card" data-id="${newId}">
                        <div class="address-card-header">
                            <div class="address-name">
                                <h4>Địa chỉ ${newId}</h4>
                            </div>
                            <button class="address-edit-btn">
                                <i class="fa-solid fa-pen"></i>
                            </button>
                        </div>
                        <div class="address-card-body">
                            <div class="address-detail">
                                <i class="fa-solid fa-location-dot"></i>
                                <span>
                                    ${houseNumber}${road ? ', ' + road : ''}${hamlet ? ', ' + hamlet : ''}
                                    ${ward ? ', ' + ward : ''}${district ? ', ' + district : ''}${city ? ', ' + city : ''}
                                </span>
                            </div>
                        </div>
                        <div class="address-card-footer">
                            <button class="btn-text" >Xóa</button>
                        </div>
                    </div>
                `;

                // Thêm card vào danh sách
                addressList.insertAdjacentHTML("beforeend", newCardHtml);

                // Xóa form
                formElement.remove();
                formElement = null;
            });
        }
    });
}



// ======================
// VOUCHER
// ======================
const useVoucherBtns = document.querySelectorAll(".use-voucher-btn");

// ======================
// BẢO MẬT
// ======================
const changePasswordBtn = document.getElementById("change-password-btn");
const logoutBtn = document.querySelector("#logout-btn");
const deleteAccountBtn = document.getElementById("delete-account-btn");

logoutBtn.addEventListener("click", async ()=>
{
    console.log("logout")
    await fetch(`${window.APP_CONTEXT_PATH}/auth/logout`)
    window.location.reload()
})


