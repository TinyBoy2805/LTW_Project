/**
 * filter.js
 * Logic duy nhất: Toggle (Ẩn/Hiện) khung lọc khi click vào nút icon,
 * và đóng khung khi click ra ngoài.
 */

document.addEventListener('DOMContentLoaded', function () {

    // Hàm xử lý chung để thiết lập cơ chế ẩn/hiện cho một cặp nút và khung lọc
    function setupFilterToggle(buttonId, frameId) {
        const filterBtn = document.getElementById(buttonId);
        const filterFrame = document.getElementById(frameId);

        if (filterBtn && filterFrame) {
            filterBtn.addEventListener('click', function (event) {
                // Đóng tất cả các filter khác trước khi mở filter hiện tại
                document.querySelectorAll('.filter__frame').forEach(frame => {
                    if (frame.id !== frameId) {
                        frame.classList.add('hidden');
                    }
                });

                // Toggle (ẩn/hiện) filter hiện tại
                filterFrame.classList.toggle('hidden');
                event.stopPropagation(); // Ngăn sự kiện click lan truyền lên document
            });

            // Ngăn chặn sự kiện click bên trong frame lan truyền lên document (để không bị đóng ngay lập tức)
            filterFrame.addEventListener('click', function (event) {
                event.stopPropagation();
            });

            // Đóng frame khi click ra ngoài (trên document)
            document.addEventListener('click', function () {
                if (!filterFrame.classList.contains('hidden')) {
                    filterFrame.classList.add('hidden');
                }
            });
        }
    }

    // Thiết lập cho trang Kho hàng (categories.html)
    setupFilterToggle('product__filter__btn', 'product__filter__frame');

    // Thiết lập cho trang Đơn hàng (order.html)
    setupFilterToggle('order__filter__btn', 'order__filter__frame');

    // Thiết lập cho trang Email (Email.html)
    setupFilterToggle('email__filter__btn', 'email__filter__frame');

    // Thiết lập cho trang Blog (Blog.html)
    setupFilterToggle('blog__filter__btn', 'blog__filter__frame');


    // *** Thêm logic xử lý nút Áp dụng/Xóa lọc để đóng frame khi hoàn tất ***

    document.querySelectorAll('.apply__button, .clear__button').forEach(btn => {
        btn.addEventListener('click', function () {
            // Sau khi thực hiện lọc/xóa, đóng frame lại
            this.closest('.filter__frame').classList.add('hidden');
        });
    });
});