/* =======================
   GLOBAL STATE
======================= */
let currentPage = 0;
let totalPages = 0;
let pageSize = 8;

let currentMode = "all"; // all | search | filter
let lastSearchValue = "";
let lastFilterData = null;

/* =======================
   CORE FETCH FUNCTIONS
======================= */

// ALL
async function fetchAll(page = 0) {
    currentMode = "all";
    currentPage = page;

    const res = await axios.get(
        `/LTW_Project_war_exploded/admin/orders/page-index-${page}`
    );

    totalPages = res.data.totalPages;
    renderOrders(res.data.data);
    updatePaginationUI();
}

// SEARCH
async function fetchSearch(keyword, page = 0) {
    currentMode = "search";
    currentPage = page;
    lastSearchValue = keyword;

    const res = await axios.get(
        `/LTW_Project_war_exploded/admin/orders/search`,
        {
            params: {
                name: keyword,
                page: page
            }
        }
    );

    totalPages = res.data.totalPages;
    renderOrders(res.data.data);
    updatePaginationUI();
}

// FILTER
async function fetchFilter(filterData, page = 0) {
    currentMode = "filter";
    currentPage = page;
    lastFilterData = filterData;

    const res = await axios.post(
        `/LTW_Project_war_exploded/admin/orders/filter?page=${page}`,
        filterData
    );

    totalPages = res.data.totalPages;
    renderOrders(res.data.data);
    updatePaginationUI();
}

/* =======================
   FETCH BY CURRENT MODE
======================= */
function fetchByMode(page) {
    if (currentMode === "all") {
        fetchAll(page);
        return;
    }
    if (currentMode === "search") {
        fetchSearch(lastSearchValue, page);
        return;
    }
    if (currentMode === "filter") {
        fetchFilter(lastFilterData, page);
    }
}

/* =======================
   SEARCH EVENTS
======================= */
const searchInput = document.getElementById("search_input");
const searchIcon = document.querySelector(".search__icon");

async function handleSearch() {
    const keyword = searchInput.value.trim();

    if (keyword === "") {
        await fetchAll(0);
        return;
    }

    await fetchSearch(keyword, 0);
}

searchInput.addEventListener("keydown", e => {
    if (e.key === "Enter") handleSearch();
});

searchIcon.addEventListener("click", handleSearch);

searchInput.addEventListener("input", async e => {
    if (e.target.value.trim() === "") {
        await fetchAll(0);
    }
});

/* =======================
   FILTER EVENTS
======================= */
const applyBtn = document.getElementById("apply-button");
const clearBtn = document.getElementById("clear-filter-button");

function buildFilterData() {
    const status = document.getElementById("filter__order__status").value;
    const date = document.getElementById("filter__order__date__from").value;
    const from = document.getElementById("filter__price__min").value;
    const to = document.getElementById("filter__price__max").value;

    return {
        status: status === "all" ? null : status,
        orderDate: date || null,
        from: from ? Number(from) : 0,
        to: to ? Number(to) : 0
    };
}

applyBtn.addEventListener("click", async () => {
    const filterData = buildFilterData();

    const isEmpty =
        filterData.status === null &&
        filterData.orderDate === null &&
        filterData.from === 0 &&
        filterData.to === 0;

    if (isEmpty) {
        await fetchAll(0);
        return;
    }

    await fetchFilter(filterData, 0);
});

clearBtn.addEventListener("click", async () => {
    document.getElementById("filter__order__status").value = "all";
    document.getElementById("filter__order__date__from").value = "";
    document.getElementById("filter__price__min").value = "";
    document.getElementById("filter__price__max").value = "";

    await fetchAll(0);
});

/* =======================
   PAGINATION EVENTS
======================= */
const prevBtn = document.getElementById("page-prev");
const nextBtn = document.getElementById("page-next");
const pageInput = document.getElementById("page-input");

prevBtn.addEventListener("click", () => {
    if (currentPage > 0) {
        fetchByMode(currentPage - 1);
    }
});

nextBtn.addEventListener("click", () => {
    if (currentPage < totalPages - 1) {
        fetchByMode(currentPage + 1);
    }
});

pageInput.addEventListener("change", () => {
    const page = Number(pageInput.value) - 1;
    if (page >= 0 && page < totalPages) {
        fetchByMode(page);
    }
});

/* =======================
   UI HELPERS
======================= */
function updatePaginationUI() {
    pageInput.value = currentPage + 1;
    prevBtn.disabled = currentPage === 0;
    nextBtn.disabled = currentPage >= totalPages - 1;
}

function renderOrders(data) {
    const orderList = document.querySelector(".order__list");
    orderList.innerHTML = "";

    data.forEach(order => {
        const card = document
            .querySelector("#card-template")
            .content.cloneNode(true);
        const q = card.querySelector.bind(card);

        q(".order__img img").src = order.url;
        q(".order__name").textContent = order.name;
        q(".order__id").textContent = order.order_code;
        q(".order__status").textContent = order.order_status;
        q(".price").textContent =
            order.total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + "đ";
        q(".order__delivery").textContent =
            `Ngày đặt hàng: ${order.created_at}`;

        orderList.append(card);
    });
}

/* =======================
   INIT
======================= */
document.addEventListener("DOMContentLoaded", () => {
    fetchAll(0);
});
