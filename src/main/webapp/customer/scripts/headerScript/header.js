(() => {
    const search_form = document.querySelector("#search_form")
    const search_bar = document.querySelector("#search_bar")

    if(!search_form || !search_bar) return;

    search_form.addEventListener('submit', (e) => {
        e.preventDefault();
        const value = search_bar.value.trim()

        if (!value) {
            alert('Vui lòng nhập tên sản phẩm');
            return;
        }

        window.location.href = `${window.APP_CONTEXT_PATH}/product?search=${encodeURIComponent(value)}`;
    })
})();
