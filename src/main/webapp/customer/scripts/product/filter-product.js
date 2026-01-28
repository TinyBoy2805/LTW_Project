// Lấy form filter (sẽ query lại trong functions để đảm bảo DOM đã load)
let filterForm = null;
let productsContainer = null;
let resetBtn = null;

// Function để init elements
function initElements() {
    if (!filterForm) filterForm = document.querySelector('.main__filter-form');
    if (!productsContainer) productsContainer = document.querySelector('.main__products-ul');
    if (!resetBtn) resetBtn = document.querySelector('.btn-reset');
}

// Helper function để escape HTML
function escapeHtml(text) {
    if (!text) return '';
    const map = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#039;'
    };
    return String(text).replace(/[&<>"']/g, m => map[m]);
}

// Helper function để tạo HTML cho sao rating
function createStarsHTML(rating) {
    let starsHTML = '';
    const floorRating = Math.floor(rating || 0);
    
    for (let i = 0; i < 5; i++) {
        if (i < floorRating) {
            starsHTML += '<li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>';
        } else {
            starsHTML += '<li class="product__mid-sub1-stars-item --color2"><i class="fa-solid fa-star hidden"></i></li>';
        }
    }
    return starsHTML;
}

// Helper function để format số tiền
function formatPrice(price) {
    return new Intl.NumberFormat('de-DE').format(Math.floor(price || 0));
}

// Function để render products
function renderProducts(products) {
    initElements(); // Init elements trước khi dùng
    
    console.log('renderProducts called with:', products);
    console.log('Type:', typeof products, 'IsArray:', Array.isArray(products));
    console.log('productsContainer:', productsContainer);
    
    // Xóa message "không tìm thấy" cũ nếu có
    const existingMessage = document.querySelector('.main__products > div[style*="flex-direction: column"]');
    if (existingMessage) {
        existingMessage.remove();
    }
    
    if (!productsContainer) {
        console.error('Products container not found!');
        console.error('Trying alternative selector...');
        productsContainer = document.querySelector('ul.main__products-ul');
        if (!productsContainer) {
            console.error('Still not found. Available containers:', 
                document.querySelectorAll('ul[class*="product"]'));
            return;
        }
    }
    
    if (!products || products.length === 0) {
        console.log('No products found, showing empty message');
        productsContainer.innerHTML = '';
        
        const mainProducts = document.querySelector('.main__products');
        if (mainProducts) {
            const emptyMessage = document.createElement('div');
            emptyMessage.style.cssText = 'display: flex; flex-direction: column; margin: 0 auto; text-align: center; padding: 60px 20px; border-radius: 8px; width: 1000px;';
            emptyMessage.innerHTML = `
                <h2 style="font-size: 24px; color: var(--c6); margin-bottom: 12px; font-weight: 600;">Không tìm thấy sản phẩm phù hợp</h2>
                <p style="font-size: 16px; color: var(--c3); margin: 0;">Hãy thử thay đổi bộ lọc</p>
            `;
            mainProducts.appendChild(emptyMessage);
        }
        
        // Ẩn pagination
        const pagination = document.querySelector('.pagination');
        if (pagination) pagination.style.display = 'none';
        return;
    }

    console.log('Rendering', products.length, 'products');
    
    try {
        // Lưu lại form ẩn trước khi xóa
        const productForm = document.querySelector('#product__form');
        const formHTML = productForm ? productForm.outerHTML : '';
        
        // Render products
        let productsHTML = formHTML; // Thêm form vào đầu
        products.forEach((product, index) => {
            console.log(`Rendering product ${index}:`, product);
            
            const contextPath = window.APP_CONTEXT_PATH || '';
            
            productsHTML += `
                <li class="main__products-ul-li" onclick="
                    document.querySelector('#product__id').value = ${product.id};
                    document.querySelector('#product__form').submit();
                ">
                    <div class="product" title="${escapeHtml(product.name)}">
                        <div class="product__top">
                            <div class="product__top-cart"><i class="fa-solid fa-cart-plus"></i></div>
                            <div class="product__image">
                                <img src="${product.img_url || ''}" alt="${escapeHtml(product.name)}">
                            </div>
                        </div>

                        <div class="product__mid">
                            <h3 title="${escapeHtml(product.name)}">${escapeHtml(product.name)}</h3>
                            <div class="product__mid-sub1">
                                <ul class="product__mid-sub1-stars">
                                    ${createStarsHTML(product.avg_rating)}
                                </ul>
                                <p>${product.avg_rating || 0}</p>
                            </div>

                            <div class="product__mid-sub2">
                                <p>${formatPrice(product.price)}đ</p>
                                <p>Đã bán ${product.buy_count || 0}</p>
                            </div>
                        </div>

                        <div class="product__bottom">
                            <div class="product__bottom-actions">
                                <button><i class="fa-solid fa-cart-plus"></i></button>
                                <form action="${contextPath}/product-detail" method="post" style="width: 100%; position:relative;">
<!--                                    <input type="hidden" name="product_id" value="${product.id}" style="position:absolute;">-->
                                    <button type="submit" style="width: 100%;" class="buy-now">Mua ngay</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
            `;
        });

        console.log('HTML built, length:', productsHTML.length);
        productsContainer.innerHTML = productsHTML;
        console.log('Products rendered successfully');
        
        // Ẩn pagination khi filter
        const pagination = document.querySelector('.pagination');
        if (pagination) pagination.style.display = 'none';
    } catch (error) {
        console.error('Error rendering products:', error);
        throw error; // Re-throw để catch bên ngoài bắt được
    }
}

// Xử lý khi submit form
function setupFormHandler() {
    initElements();
    
    if (!filterForm) {
        console.error('Filter form not found!');
        return;
    }
    
    filterForm.addEventListener('submit', function(e) {
        e.preventDefault(); // Ngăn form submit mặc định
        
        // Thu thập dữ liệu từ các checkbox đã được check
        const formData = new FormData(this);
        
        // Tạo object để gửi lên server
        const filterData = {
            brands: [],
            ages: [],
            prices: [],
            types: [],
            characteristics: [],
            discounts: [],
            ratings: []
        };
        
        // Lấy tất cả các giá trị đã check theo từng loại
        formData.getAll('brand').forEach(value => filterData.brands.push(value));
        formData.getAll('age').forEach(value => filterData.ages.push(value));
        formData.getAll('price').forEach(value => filterData.prices.push(value));
        formData.getAll('type').forEach(value => filterData.types.push(value));
        formData.getAll('characteristic').forEach(value => filterData.characteristics.push(value));
        formData.getAll('discount').forEach(value => filterData.discounts.push(value));
        formData.getAll('rating').forEach(value => filterData.ratings.push(value));
        
        console.log('Filter Data:', filterData);
        
        // Gửi dữ liệu lên server bằng fetch API
        const contextPath = window.APP_CONTEXT_PATH || '';
        console.log('Sending request to:', `${contextPath}/product/filter`);
        
        fetch(`${contextPath}/product/filter`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(filterData)
        })
        .then(response => {
            console.log('Response status:', response.status);
            console.log('Response ok:', response.ok);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(products => {
            console.log('Products from server:', products);
            console.log('Number of products:', products.length);
            renderProducts(products);
        })
        .catch(error => {
            console.error('Detailed error:', error);
            console.error('Error message:', error.message);
            console.error('Error stack:', error.stack);
            alert('Có lỗi xảy ra khi lọc sản phẩm. Vui lòng thử lại!');
        });
    });
}

// Xử lý button reset
function setupResetButton() {
    initElements();
    
    if (!resetBtn) {
        console.warn('Reset button not found');
        return;
    }
    
    resetBtn.addEventListener('click', function() {
        if (!filterForm) return;
        
        // Uncheck tất cả các checkbox
        filterForm.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
            checkbox.checked = false;
        });
        
        // Reload trang để hiển thị lại tất cả sản phẩm
        window.location.href = (window.APP_CONTEXT_PATH || '') + '/product';
    });
}

// Init khi DOM ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function() {
        console.log('DOM loaded, initializing filter...');
        setupFormHandler();
        setupResetButton();
    });
} else {
    // DOM đã ready
    console.log('DOM already ready, initializing filter...');
    setupFormHandler();
    setupResetButton();
}