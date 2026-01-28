document.querySelectorAll('.cart__quantity-input').forEach(input => {
    input.addEventListener('change', async (e) => {
        const newQty = parseInt(e.target.value);
        const productId = e.target.dataset.id;

        if(newQty < 1){
            e.target.value = 1;
            return;
        }

        try{
            const res = await fetch(`${window.APP_CONTEXT_PATH}/cart`, {  // sửa từ /cart/update → /cart
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ productId, quantity: newQty })
            });

            const data = await res.json();
            if(data.success){
                const row = e.target.closest('tr');
                row.querySelector('.cart__subtotal').textContent = `${data.subtotal}₫`;
                document.querySelector('.cart__total-value').textContent = `${data.total}₫`;
            } else {
                alert(data.message || 'Có lỗi khi cập nhật giỏ hàng');
            }
        } catch(err){
            console.error(err);
            alert('Có lỗi khi cập nhật giỏ hàng');
        }
    });
});
