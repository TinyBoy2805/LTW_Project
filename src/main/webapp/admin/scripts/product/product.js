/**
 * Fetch all product card
 */
async function fetchAllProductCard(page) {
    try {
        // Fetch API with axios
        return await axios.get(`/LTW_Project_war_exploded/admin/products/page-index-${page}`)
            .then(response => response.data)
            .catch(error => console.error("Fail to fetch data:", error))
    } catch (error) {
        console.error("Fail to execute:" + error)
    }
}

/**
 * Fetch product by search product card
 */
async function fetchProductBySearch(name, page) {
    try {
        return await axios.get(`/LTW_Project_war_exploded/admin/products/search?name=${encodeURIComponent(name)}&page=${page}`)
            .then(response => response.data)
            .catch(error => console.error("Fail to fetch data:", error));
    } catch (error) {
        console.error("Fail to execute:", error)
    }
}

/**
 * Fetch product by filter
 */
async function fetchProductByFilter(filterData, page) {
    try {
        return await axios.post(`/LTW_Project_war_exploded/admin/products/filter?page=${page}`, filterData)
            .then(response => response.data)
            .catch(error => console.error(error))
    } catch (error) {
        console.error("Fail to execute:", error);
    }
}

const productList = document.querySelector('.content__grid__product');

//hiển thị danh sách đơn hàng từ data
function renderCard(productCard) {
    const cardClone = document.querySelector("#card-template").content.cloneNode(true);
    const cardCloneQuery = cardClone.querySelector.bind(cardClone);
    let rawUrl = productCard.img_url;
    let finalUrl = "";

    if (rawUrl) {
        if (rawUrl.startsWith('http') || rawUrl.startsWith('/LTW_Project_war_exploded')) {
            finalUrl = rawUrl;
        } else {
            finalUrl = '/LTW_Project_war_exploded' + (rawUrl.startsWith('/') ? rawUrl : '/' + rawUrl);
        }
    }

    cardCloneQuery(".product__img img").setAttribute("src", finalUrl);
    cardCloneQuery(".product__img img").setAttribute("alt", productCard.name);
    cardCloneQuery(".product__name").innerHTML = productCard.name;
    cardCloneQuery(".product__badge").innerHTML = `Số lượng: ${productCard.quantity}`
    cardCloneQuery(".product__price").innerHTML = productCard.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + "đ";
    cardCloneQuery(".product__buy").innerHTML = `Đã bán: ${productCard.buy_count}`;
    const deleteBtn = cardCloneQuery(".delete-button");
    deleteBtn.addEventListener('click', () => handleDeleteProduct(productCard.id));
    cardCloneQuery(".edit-button").addEventListener('click', () => handleEditProduct(productCard.id));
    productList.append(cardClone);
}

//cờ đánh dấu trạng thái của trang
let currentMode = 'ALL'; // ALL, SEARCH và FILTER

//cập nhật giao diện sau mỗi lần fetch
function updateUI(data){
    if (!data || !data.data) return
    productList.innerHTML = "";
    data.data.forEach(productList => renderCard(productList));

    handlePage(data.pageIndex, data.totalPage);
    navigationPage.value = data.pageIndex;
}

//lấy thông tin thanh điều hướng trang
const next = document.getElementById('page-next')
const previous = document.getElementById('page-prev')
const navigationPage = document.getElementById('page-input')


next.addEventListener("click", () => {
    handleNaviagtionPage('next')
})
previous.addEventListener("click", () => {
    handleNaviagtionPage('previous')
})

//quản lý trạng thái của thanh điều hướng cho mỗi trạng thái currentMode
function handleNaviagtionPage(state) {
    let newPageIndex = state === 'previous' ? Number(navigationPage.value) - 1 : Number(navigationPage.value) + 1;
    let fetchPromise;

    if (currentMode === 'SEARCH') {
        const searchWord = document.getElementById('search_input').value;
        fetchPromise = fetchProductBySearch(searchWord, newPageIndex);
        } else if (currentMode === 'FILTER'){
            const dataFilter = {
                category: document.getElementById("filter__category").value === "all" ? null : document.getElementById("filter__category").value,
                status: document.getElementById("filter__status").value || "active",
                quantity: document.getElementById("filter__stock").value || "0",
            };
            fetchPromise = fetchProductByFilter(dataFilter, newPageIndex);
        } else {
        fetchPromise = fetchAllProductCard(newPageIndex);
    }

    fetchPromise.then(updateUI);
}

//xử lý hiển thị các nút điều hướng trang
function handlePage(pageIndex, maxPageIndex) {
    if (maxPageIndex > 0 && maxPageIndex <= 1) {
        next.disabled = true;
        previous.disabled = true;
        return;
    }

    previous.disabled = (pageIndex <= 1);
    next.disabled = (pageIndex >= maxPageIndex);
}

//logic fetch api
document.addEventListener("DOMContentLoaded", () => {
    // setup DOM element
    currentMode = 'ALL';
    // fetch all data and render HTML cards
    fetchAllProductCard(1)
        .then(data => {
            console.log("Data here:")
            updateUI(data);
        });

    // search and fetch data searched
    navigationPage.addEventListener('input', (event) => {
        const value = event.target.value.trim();
        if (isNaN(value)) {
            event.target.value = 1;
        }
    })

    document.getElementById('search_input')
        .addEventListener('input', (event) => {
            const searchWord = event.target.value.trim();
            if (searchWord !== ""){
                currentMode = 'SEARCH';
                fetchProductBySearch(searchWord, 1).then(updateUI)
            } else {
                currentMode = 'ALL';
                fetchAllProductCard(1).then(updateUI)
            }
        })

    // filter and fetch order cards
    const resetButton = document.getElementById("clear__button")
    resetButton.addEventListener('click', () => {
        document.getElementById("filter__category").value = "all"
        document.getElementById("filter__status").value = "active"
        document.getElementById("filter__stock").value = ""

        currentMode = 'ALL'
        fetchAllProductCard(1).then(updateUI)
    });

    const filterButton = document.getElementById("apply__button")
    filterButton.addEventListener('click', () => {
        const category = document.getElementById("filter__category").value
        const status = document.getElementById("filter__status").value
        const quantity = document.getElementById("filter__stock").value
        const dataFilter = {
            category: category === "all" ? null : category,
            status: status ,
            quantity: quantity || "0",
        }
        currentMode = 'FILTER';

        fetchProductByFilter(dataFilter, 1).then(updateUI)
    })
})

function handleEditProduct(productId) {
    window.location.href = `/LTW_Project_war_exploded/admin/products/edit-product?productID=${productId}`;
}

// Hàm xử lý xóa sản phẩm
async function handleDeleteProduct(productId) {
    const isConfirmed = confirm("Bạn có chắc chắn muốn xóa sản phẩm này không? Dữ liệu ảnh liên quan cũng sẽ bị xóa!");

    if (isConfirmed) {
        try {
            const params = new URLSearchParams();
            params.append('productID', productId);

            const response = await axios.post(`/LTW_Project_war_exploded/admin/products/delete-product`, params);

            if (response.status === 200) {
                alert("Xóa sản phẩm thành công!");

                refreshList();
            }
        } catch (error) {
            console.error("Lỗi khi xóa sản phẩm:", error);
            if (error.response && error.response.status === 500) {
                alert("Không thể xóa sản phẩm này (có thể do ràng buộc dữ liệu đơn hàng).");
            } else {
                alert("Có lỗi xảy ra khi xóa sản phẩm. Vui lòng thử lại!");
            }
        }
    }
}

/**
 * Hàm hỗ trợ tải lại danh sách dựa trên chế độ đang xem
 */
function refreshList() {
    const currentPage = Number(navigationPage.value) || 1;
    let fetchPromise;

    if (currentMode === 'SEARCH') {
        const searchWord = document.getElementById('search_input').value;
        fetchPromise = fetchProductBySearch(searchWord, currentPage);
    } else if (currentMode === 'FILTER') {
        const dataFilter = {
            category: document.getElementById("filter__category").value === "all" ? null : document.getElementById("filter__category").value,
            status: document.getElementById("filter__status").value || "active",
            quantity: document.getElementById("filter__stock").value || "0",
        };
        fetchPromise = fetchProductByFilter(dataFilter, currentPage);
    } else {
        fetchPromise = fetchAllProductCard(currentPage);
    }

    fetchPromise.then(updateUI);
}