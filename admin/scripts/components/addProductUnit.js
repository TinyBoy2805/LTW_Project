document.addEventListener('DOMContentLoaded', () => {
    const unitList = document.getElementById('unit-input-list');
    const addUnitButton = document.getElementById('add-unit-btn');
    const unitTemplate = document.getElementById('unit-item-template');

    let unitIdCounter = 2; // Bắt đầu đếm từ 2 vì item mặc định là 1

    /**
     * Gắn sự kiện xóa cho nút và thêm tính năng ẩn/hiện nút xóa.
     * @param {HTMLElement} item - Phần tử unit-item.
     */
    const setupRemoveHandler = (item) => {
        const removeButton = item.querySelector('.unit-item__remove-btn');
        if (removeButton) {
            removeButton.addEventListener('click', () => {
                item.remove();
                toggleRemoveButtons();
            });
        }
    };

    /**
     * Kiểm tra số lượng đơn vị và ẩn/hiện nút xóa.
     */
    const toggleRemoveButtons = () => {
        const items = unitList.querySelectorAll('.unit-item');
        items.forEach((item, index) => {
            const removeBtn = item.querySelector('.unit-item__remove-btn');
            if (removeBtn) {
                // Chỉ hiển thị nút xóa nếu có nhiều hơn 1 item
                removeBtn.style.display = (items.length > 1) ? 'block' : 'none';
            }
        });
    };

    /**
     * Tạo một hàng đơn vị nhập mới từ template.
     */
    const createNewUnitItem = () => {
        // Clone phần tử từ template
        const newUnitItem = unitTemplate.content.cloneNode(true).firstElementChild;

        // Cập nhật ID và thuộc tính
        newUnitItem.setAttribute('data-unit-id', unitIdCounter++);
        
        // Cần reset giá trị input cho item clone
        newUnitItem.querySelector('select').value = 'le'; // Đặt mặc định là Lẻ
        newUnitItem.querySelector('input[name="unit-qty[]"]').value = '';
        newUnitItem.querySelector('input[name="unit-price[]"]').value = '';

        // Gắn sự kiện xóa
        setupRemoveHandler(newUnitItem);

        return newUnitItem;
    };

    // Khởi tạo: Gắn sự kiện xóa cho item mặc định (item có sẵn trong HTML)
    const initialItem = unitList.querySelector('.unit-item[data-unit-id="1"]');
    if (initialItem) {
        setupRemoveHandler(initialItem);
    }
    toggleRemoveButtons(); // Thiết lập trạng thái ban đầu (nút xóa ẩn)

    // Sự kiện khi nhấn nút Thêm đơn vị
    addUnitButton.addEventListener('click', () => {
        const newItem = createNewUnitItem();
        unitList.appendChild(newItem);
        toggleRemoveButtons();
    });
});