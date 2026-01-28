const getMoreVouchers = async (page=1)=>
{
    try
    {
        const url = `${window.APP_CONTEXT_PATH}/voucher?page=${page}&ajax=true`;
        const res = await fetch(url);

        if (!res.ok) throw new Error("API Error: " + res.status);

        const vouchers = await res.json();
        return vouchers; // Trả về mảng voucher
    } catch (err)
    {
        console.error("Failed to fetch vouchers:", err);
        return []; // Tránh crash nếu API lỗi
    }
}

const renderVoucher = (template, data, container) => {
    // Xóa container trước khi render
    container.innerHTML = '';

    for (const v of data) {
        // Clone template
        const clone = template.content.cloneNode(true);
        const card = clone.querySelector('.voucher__card');

        // Các node
        const voucherTypeElem = clone.querySelector('.voucher__type');
        const title = clone.querySelector('.voucher__title');
        const desc = clone.querySelector('.voucher__desc');
        const progressFill = clone.querySelector('.progress__fill');
        const progressText = clone.querySelector('.progress__text');
        const codeText = clone.querySelector('.code__text');
        const copyBtn = clone.querySelector('.code__copy');
        const expiry = clone.querySelector('.voucher__expiry');
        const iconElem = clone.querySelector('.voucher__icon i');
        const badge = clone.querySelector('.voucher__badge');

        // --- Gán dữ liệu cơ bản ---
        if (voucherTypeElem) voucherTypeElem.textContent = v.voucher_type || '';
        if (title) title.textContent = v.name || 'Voucher';
        if (desc) desc.textContent = `Áp dụng cho đơn hàng từ ${v.min_order_value}đ`;

        const usedPercent = v.usage_limit > 0 ? Math.round(((v.usage_limit - v.current_amount) / v.usage_limit) * 100) : 0;
        if (progressFill) progressFill.style.width = usedPercent + '%';
        if (progressText) progressText.textContent = `Đã dùng ${usedPercent}%`;

        if (codeText) codeText.textContent = v.code || '';
        if (expiry) expiry.textContent = `HSD: ${v.end_date || ''}`;

        // --- Phân loại 2 loại voucher ---
        if (card && v.voucher_type) {
            card.classList.remove('freeship', 'discount');

            if (v.voucher_type.toLowerCase() === 'shipping') {
                card.classList.add('freeship');
                if (iconElem) iconElem.className = 'fa-solid fa-truck-fast';
                // if (badge) badge.textContent = 'HOT';
            } else {
                // discount (cả giảm %, giảm tiền)
                card.classList.add('discount');
                if (iconElem) iconElem.className = 'fa-solid fa-percent';
                // if (badge) badge.textContent = '';
            }
        }

        // --- Gán sự kiện copy code ---
        if (copyBtn) {
            copyBtn.addEventListener('click', () => {
                navigator.clipboard.writeText(v.code).then(() => {
                    const originalHTML = copyBtn.innerHTML;
                    copyBtn.innerHTML = '<i class="fa-solid fa-check"></i>';
                    copyBtn.style.color = '#10b981';

                    setTimeout(() => {
                        copyBtn.innerHTML = originalHTML;
                        copyBtn.style.color = '';
                    }, 2000);
                }).catch(err => console.error('Failed to copy:', err));
            });
        }

        // Append vào container
        container.appendChild(clone);
    }
};





window.addEventListener("DOMContentLoaded", async ()=>
{
    let page = 1
    const moreVoucherBtn = document.querySelector("#more-voucher")
    const voucherTemplate = document.querySelector("#voucher_template")
    const voucherList = document.querySelector(".vouchers__grid")
    let vouchers = await getMoreVouchers(page)

    //first render
    renderVoucher(voucherTemplate, vouchers, voucherList)

    page++;
    if((await getMoreVouchers(page)).length > 0)
    {
        moreVoucherBtn.innerText = 'Xem thêm'
    }else
    {
        moreVoucherBtn.innerText = 'Hết voucher!'
        page--;
    }

    moreVoucherBtn.addEventListener("click", async ()=>
    {
        page++;
        const moreVouchers = await getMoreVouchers(page)
        vouchers = [...vouchers, ...moreVouchers]
        renderVoucher(voucherTemplate, vouchers, voucherList)
    })

})