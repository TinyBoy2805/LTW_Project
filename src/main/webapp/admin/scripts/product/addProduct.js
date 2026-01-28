const moveToListButton = document.getElementById("move-to-list")


const getCorrectUrl = (fileUrl) => {
    if (!fileUrl) return "";

    // Xử lý CKFinder trả URL chứa 'CKFinderJava'
    let url = fileUrl.replace('/CKFinderJava/', '/');

    // đã chứa contextPath thì không thêm nữa
    if (url.startsWith(contextPath)) {
        return url;
    }

    return contextPath + (url.startsWith('/') ? url : '/' + url);
};

//load ckeditor
var descriptionEditor = CKEDITOR.replace('product__description', {
    height: 200,
    language: 'vi',
    filebrowserBrowseUrl: contextPath + '/libraries/ckfinder/ckfinder.html',
    filebrowserImageBrowseUrl: contextPath + '/libraries/ckfinder/ckfinder.html?type=Images',
    filebrowserFlashBrowseUrl: contextPath + '/libraries/ckfinder/ckfinder.html?type=Flash',
    filebrowserUploadUrl: contextPath + '/libraries/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
    filebrowserImageUploadUrl: contextPath + '/libraries/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
    filebrowserFlashUploadUrl: contextPath + '/libraries/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash',

    toolbar: [
        {name: 'document', items: ['Undo', 'Redo']},
        {name: 'styles', items: ['Format', 'Font', 'FontSize']},
        {name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike']},
        {name: 'colors', items: ['TextColor', 'BGColor']},
        {name: 'paragraph', items: ['NumberedList', 'BulletedList', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']},
        {name: 'links', items: ['Link', 'Unlink']},
        {name: 'insert', items: ['Image', 'Table', 'Blockquote']},
        {name: 'tools', items: ['Source']}
    ],
    extraPlugins: 'justify,blockquote'
});

//ckfinder
CKFinder.setupCKEditor(descriptionEditor, contextPath + '/libraries/ckfinder/');

//hàm kiểm tra số lượng ảnh
const updateButtonState = () => {

    const mainImg = document.querySelector('.main-group__item img');
    const mainBtn = document.getElementById('add-main-image');
    if (mainImg && mainImg.src && !mainImg.hidden && mainImg.getAttribute('src') !== "") {
        mainBtn.style.display = "none";
    } else {
        mainBtn.style.display = "block";
    }

    const secondaryImgs = document.querySelectorAll('.secondary-item img');
    const secondaryBtn = document.getElementById('add-secondary-image');

    let count = 0;
    secondaryImgs.forEach(img => {
        if (!img.hidden && img.src && img.getAttribute('src') !== "" && img.getAttribute('src') !== ".") {
            count++;
        }
    });

    if (count >= 4) {
        secondaryBtn.style.display = "none";
    } else {
        secondaryBtn.style.display = "block";
    }
};

//dùng ckfinder chọn ảnh chính
const addMainImageBtn = document.getElementById('add-main-image');
const mainImgTag = document.querySelector('.main-group__item img');
const mainImgInput = document.getElementById('main-image-input');

addMainImageBtn.addEventListener('click', () => {
    var finder = new CKFinder();
    finder.selectActionFunction = function (fileUrl) {
        const fixedUrl = getCorrectUrl(fileUrl);

        mainImgTag.src = fixedUrl;
        mainImgTag.hidden = false;
        mainImgTag.removeAttribute('hidden');
        mainImgTag.style.display = "block";
        mainImgTag.style.width = "150px";

        mainImgInput.value = fixedUrl;

        updateButtonState();
    };
    finder.popup();
});

//chọn ảnh phụ
const addSecondaryImageBtn = document.getElementById('add-secondary-image');
const secondaryImgTags = document.querySelectorAll('.secondary-item img');
const secondaryInputsContainer = document.getElementById('secondary-images-inputs-container');

addSecondaryImageBtn.addEventListener('click', () => {
    var finder = new CKFinder();
    finder.selectActionFunction = function (fileUrl) {
        const fixedUrl = getCorrectUrl(fileUrl);

        for (let i = 0; i < secondaryImgTags.length; i++) {
            const img = secondaryImgTags[i];
            if (img.hidden || !img.src || img.getAttribute('src') === "" || img.getAttribute('src') === ".") {

                img.src = fixedUrl;
                img.hidden = false;
                img.removeAttribute('hidden');
                img.style.display = "block";
                img.style.width = "100px";
                img.style.height = "100px";
                img.style.objectFit = "cover";

                const hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.name = 'secondaryImages[]';
                hiddenInput.value = fixedUrl;
                secondaryInputsContainer.appendChild(hiddenInput);

                break;
            }
        }
        updateButtonState();
    };
    finder.popup();
});

//sự kiện cho nút thêm sản phẩm
const productForm = document.querySelector('.add__product__form');

moveToListButton.addEventListener('click', (e) => {
    e.preventDefault();

    // Đồng bộ dữ liệu CKEditor
    if (CKEDITOR.instances.product__description) {
        CKEDITOR.instances.product__description.updateElement();
    }

    const priceInput = document.getElementById("unit-import-price");
    if (priceInput) {
        priceInput.value = unformatCurrency(priceInput.value);
    }

    // Kiểm tra xem đã có tên sản phẩm chưa
    const name = document.getElementById('product__name').value;
    if(!name) {
        alert("Vui lòng nhập tên sản phẩm!");
        return;
    }

    productForm.submit();
});

// Gọi lần đầu khi load trang
updateButtonState();

// Thêm logic: Nếu xóa ảnh thì hiện lại nút
// Bạn nên thêm sự kiện click vào thẻ img để xóa
document.querySelectorAll('.img-group__item img').forEach(img => {
    img.style.cursor = "pointer";
    img.title = "Click để xóa ảnh này";
    img.addEventListener('click', function() {
        if(this.src && this.src !== window.location.href) {
            if(confirm("Bạn muốn bỏ chọn ảnh này?")) {
                this.src = "";
                this.hidden = true;
                this.style.display = "none";

                // Nếu là ảnh phụ, cần xóa input ẩn tương ứng
                if(this.parentElement.classList.contains('secondary-item')) {
                    // Xóa bớt 1 input ẩn trong container (cái cuối cùng hoặc khớp URL)
                    if(secondaryInputsContainer.lastChild) {
                        secondaryInputsContainer.removeChild(secondaryInputsContainer.lastChild);
                    }
                } else {
                    mainImgInput.value = "";
                }
                updateButtonState();
            }
        }
    });
});



// Hàm định dạng tiền thành kiểu xxx.xxx
const formatCurrency = (value) => {
    if (!value) return "";
    // Loại bỏ tất cả ký tự không phải số
    let numericValue = value.replace(/\D/g, "");
    // Thêm dấu chấm phân cách hàng nghìn
    return numericValue.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
};

document.addEventListener("DOMContentLoaded", () => {
    const priceInput = document.getElementById("unit-import-price");

    if (priceInput) {
        priceInput.addEventListener('input', (e) => {

            const cursorPosition = e.target.selectionStart;
            const originalLength = e.target.value.length;


            e.target.value = formatCurrency(e.target.value);


            const newLength = e.target.value.length;
            const offset = newLength - originalLength;
            e.target.setSelectionRange(cursorPosition + offset, cursorPosition + offset);
        });
    }
});