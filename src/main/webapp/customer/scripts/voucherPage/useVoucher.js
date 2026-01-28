import { createNotification } from '../product/addToCart.js';

document.addEventListener("click", async (e) => {
    const btn = e.target.closest(".voucher__btn, .voucher__right button");
    if (!btn) return;

    const voucherId = btn.getAttribute('data-voucher-id');
    console.log("Voucher button clicked, ID:", voucherId);

    if (!voucherId || voucherId === "undefined" || voucherId === "") {
        console.warn("No voucherId found on element:", btn.outerHTML);
        console.warn("Full Dataset:", btn.dataset);
        return;
    }

    try {
        const url = `${window.APP_CONTEXT_PATH}/voucher`;
        console.log("Fetching POST:", url);

        const res = await fetch(url, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ voucherId: parseInt(voucherId) })
        });

        console.log("Response status:", res.status);
        const contentType = res.headers.get("content-type");
        if (!contentType || !contentType.includes("application/json")) {
            const text = await res.text();
            console.error("Server returned non-JSON response:", text);
            createNotification("Lỗi server: Phản hồi không đúng định dạng!");
            return;
        }

        const data = await res.json();
        console.log("Data received:", data);

        if (data.success) {
            createNotification("🎉 Nhận voucher thành công!");
            btn.disabled = true;
            btn.textContent = "Đã nhận";
            btn.style.backgroundColor = "#ccc";
            btn.style.cursor = "not-allowed";
        } else {
            createNotification(data.message || "Không thể nhận voucher!");
        }

    } catch (err) {
        console.error("Fetch error:", err);
        createNotification("Lỗi kết nối server!");
    }
});
