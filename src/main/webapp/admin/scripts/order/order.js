/**
 * Fetch all order card
 */
async function fetchAllOrderCard(page) {
    try {
        // Fetch API with axios
        return await axios.get(`/LTW_Project_war_exploded/admin/orders/page-index-${page}`)
            .then(response => response.data)
            .catch(error => console.error("Fail to fetch data:", error))
    } catch (error) {
        console.error("Fail to execute:" + error)
    }
}


/**
 * Fetch order by search order card
 */
async function fetchOrderBySearch(name, page) {
    try {
        return await axios.get(`/LTW_Project_war_exploded/admin/orders/search?name=${encodeURIComponent(name)}&page=${page}`)
            .then(response => response.data)
            .catch(error => console.error("Fail to fetch data:", error));
    } catch (error) {
        console.error("Fail to execute:", error)
    }
}


/**
 * Fetch order by filter
 */
async function fetchOrderByFilter(filterData, page) {
    try {
        return await axios.post(`/LTW_Project_war_exploded/admin/orders/filter?page=${page}`, filterData)
            .then(response => response.data)
            .catch(error => console.error(error))
    } catch (error) {
        console.error("Fail to execute:", error);
    }
}


const orderList = document.querySelector('.order__list');

//hiển thị danh sách đơn hàng từ data
function renderCard(orderCard) {
    const cardClone = document.querySelector("#card-template").content.cloneNode(true);
    const cardCloneQuery = cardClone.querySelector.bind(cardClone);
    cardCloneQuery(".order__img img").setAttribute("src", orderCard.url);
    cardCloneQuery(".order__img img").setAttribute("alt", orderCard.name);
    cardCloneQuery(".order__name").innerHTML = orderCard.name;
    cardCloneQuery(".order__id").innerHTML = orderCard.order_code;
    cardCloneQuery(".order__status").innerHTML = orderCard.order_status;
    cardCloneQuery(".price").innerHTML = orderCard.total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + "đ";
    cardCloneQuery(".order__delivery").innerHTML = `Ngày đặt hàng: ${orderCard.created_at}`;
    orderList.append(cardClone);
}

//cờ đánh dấu trạng thái của trang
let currentMode = 'ALL'; // ALL, SEARCH và FILTER

//cập nhật giao diện sau mỗi lần fetch
function updateUI(data){
    if (!data || !data.data) return
    orderList.innerHTML = "";
    data.data.forEach(orderCard => renderCard(orderCard));
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

    if (currentMode === 'SEARCH'){
        const searchWord = document.getElementById('search_input').value;
        fetchPromise = fetchOrderBySearch(searchWord, newPageIndex);
    } else if (currentMode === 'FILTER'){
        const dataFilter = {
            status: document.getElementById("filter__order__status").value === "all" ? null : document.getElementById("filter__order__status").value,
            orderDate: document.getElementById("filter__order__date__from").value || null,
            from: document.getElementById("filter__price__min").value || "0",
            to: document.getElementById("filter__price__max").value || "0"
        };
        fetchPromise = fetchOrderByFilter(dataFilter, newPageIndex);
    }else {
        fetchPromise = fetchAllOrderCard(newPageIndex);
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
    fetchAllOrderCard(1)
        .then(updateUI);


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
                fetchOrderBySearch(searchWord, 1).then(updateUI)
            } else {
                currentMode = 'ALL';
                fetchAllOrderCard(1).then(updateUI)
            }
        })


    // filter and fetch order cards
    const resetButton = document.getElementById("clear-filter-button")
    resetButton.addEventListener('click', () => {
        document.getElementById("filter__order__status").value = "all"
        document.getElementById("filter__order__date__from").value = ""
        document.getElementById("filter__price__min").value = ""
        document.getElementById("filter__price__max").value = ""

        currentMode = 'ALL'
        fetchAllOrderCard(1).then(updateUI)
    });

    const filterButton = document.getElementById("apply-button")
    filterButton.addEventListener('click', () => {
        const statusValue = document.getElementById("filter__order__status").value
        const dateValue = document.getElementById("filter__order__date__from").value
        const fromValue = document.getElementById("filter__price__min").value
        const toValue = document.getElementById("filter__price__max").value;
        const dataFilter = {
            status: statusValue === "all" ? null : statusValue,
            orderDate: dateValue ? dateValue : null,
            from: fromValue ? fromValue : "0",
            to: toValue ? toValue : "0"
        }
        currentMode = 'FILTER';

        fetchOrderByFilter(dataFilter, 1).then(updateUI)
    })
})