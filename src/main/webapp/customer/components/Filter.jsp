
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main__filter">
    <h3 class="main__filter-heading">Bộ lọc tìm kiếm</h3>

    <div class="main__filter-content">
        <form class="main__filter-form">
            <fieldset id="field-brand">
                <legend>Thương hiệu</legend>
                <label><input type="checkbox" name="brand" value="Meiji"> Meiji</label>
                <label><input type="checkbox" name="brand" value="Aptamil"> Aptamil</label>
                <label><input type="checkbox" name="brand" value="Friso"> Friso</label>
                <label><input type="checkbox" name="brand" value="Enfamil"> Enfamil</label>
                <label><input type="checkbox" name="brand" value="Similac"> Similac</label>
                <label><input type="checkbox" name="brand" value="Vinamilk"> Vinamilk</label>
                <label><input type="checkbox" name="brand" value="Nutifood"> Nutifood</label>
                <label><input type="checkbox" name="brand" value="Abbott"> Abbott</label>
                <label><input type="checkbox" name="brand" value="Morinaga"> Morinaga</label>
                <label><input type="checkbox" name="brand" value="Nestlé"> Nestlé</label>
            </fieldset>
            <div class="main__filter-form-line"></div>
            <fieldset id="field-age">
                <legend>Độ tuổi</legend>
                <label><input type="checkbox" name="age" value="0-6m"> 0-6 tháng</label>
                <label><input type="checkbox" name="age" value="6-12m"> 6-12 tháng</label>
                <label><input type="checkbox" name="age" value="1-3y"> 1-3 tuổi</label>
            </fieldset>
            <div class="main__filter-form-line"></div>
            <fieldset id="field-price">
                <legend>Khoảng giá</legend>
                <label><input type="checkbox" name="price" value="below 200.000đ"> Dưới 200.000đ</label>
                <label><input type="checkbox" name="price" value="200.000đ – 500.000đ"> 200.000đ–500.000đ</label>
                <label><input type="checkbox" name="price" value="500.000đ – 1.000.000đ">500.000đ–1.000.000đ</label>
                <label><input type="checkbox" name="price" value="over 1.000.000đ">Trên 1.000.000đ</label>
            </fieldset>
            <div class="main__filter-form-line"></div>
            <fieldset id="field-category">
                <legend>Loại sản phẩm</legend>
                <label><input type="checkbox" name="type" value="Sữa bột công thức">Sữa bột công thức</label>
                <label><input type="checkbox" name="type" value="Sữa tươi tiệt trùng">Sữa tươi tiệt trùng</label>
                <label><input type="checkbox" name="type" value="Sữa đặc">Sữa đặc</label>
                <label><input type="checkbox" name="type" value="Sữa chua uống">Sữa chua uống</label>
                <label><input type="checkbox" name="type" value="Thực phẩm ăn dặm ">Thực phẩm ăn dặm </label>
            </fieldset>
            <div class="main__filter-form-line"></div>
            <fieldset id="field-particular">
                <legend>Đặc điểm dinh dưỡng</legend>
                <label><input type="checkbox" name="characteristic" value="Tăng cân">Tăng cân</label>
                <label><input type="checkbox" name="characteristic" value="Phát triển chiều cao">Phát triển chiều cao</label>
                <label><input type="checkbox" name="characteristic" value="Hỗ trợ tiêu hoá">Hỗ trợ tiêu hoá</label>
                <label><input type="checkbox" name="characteristic" value="Không đường / Ít béo">Không đường / Ít béo</label>
                <label><input type="checkbox" name="characteristic" value="Organic (Hữu cơ)">Organic (Hữu cơ)</label>
            </fieldset>
            <div class="main__filter-form-line"></div>
            <fieldset id="field-discount">
                <legend>Khuyến mãi / Ưu đãi</legend>
                <label><input type="checkbox" name="discount" value="đang giảm giá">Đang giảm giá</label>
                <label><input type="checkbox" name="discount" value="Hàng mới ra mắt">Hàng mới ra mắt</label>
            </fieldset>
            <div class="main__filter-form-line"></div>
            <fieldset id="field-rating">
                <legend>Đánh giá người mua</legend>
                <label>
                    <input type="checkbox" name="rating" value="5">
                    <ul>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --star"></i></li>
                    </ul>
                </label>
                <label>
                    <input type="checkbox" name="rating" value="4">
                    <ul>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --color3"></i></li>
                    </ul>
                </label>
                <label>
                    <input type="checkbox" name="rating" value="3">
                    <ul>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --color3"></i></li>
                        <li><i class="fa-solid fa-star --color3"></i></li>
                    </ul>
                </label>
                <label>
                    <input type="checkbox" name="rating" value="2">
                    <ul>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --color3"></i></li>
                        <li><i class="fa-solid fa-star --color3"></i></li>
                        <li><i class="fa-solid fa-star --color3"></i></li>
                    </ul>
                </label>
                <label>
                    <input type="checkbox" name="rating" value="1">
                    <ul>
                        <li><i class="fa-solid fa-star --star"></i></li>
                        <li><i class="fa-solid fa-star --color3"></i></li>
                        <li><i class="fa-solid fa-star --color3"></i></li>
                        <li><i class="fa-solid fa-star --color3"></i></li>
                        <li><i class="fa-solid fa-star --color3"></i></li>
                    </ul>
                </label>
            </fieldset>

            <div class="main__filter-form-actions">
                <button type="button" class="btn-reset"><i class="fa-solid fa-rotate-right"></i></button>
                <button type="submit">Lọc sản phẩm</button>
            </div>
        </form>
    </div>

</div>
<script src="${pageContext.request.contextPath}/customer/scripts/product/filter-product.js"></script>