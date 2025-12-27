<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiChiShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <div class="scroll-to-top-btn"><i class="fa-solid fa-circle-up"></i></div>
    <jsp:include page="/customer/components/Header.jsp"/>
    <main class="main">

        <div class="main__content">
            <div class="main__filter">
                <h3 class="main__filter-heading">Bộ lọc tìm kiếm</h3>

                <div class="main__filter-content">
                    <form class="main__filter-form">
                        <fieldset>
                            <legend>Thương hiệu</legend>
                            <label><input type="checkbox" name="brand" value="Meiji"> Meiji</label>
                            <label><input type="checkbox" name="brand" value="Aptamil"> Aptamil</label>
                            <label><input type="checkbox" name="brand" value="Friso"> Friso</label>
                        </fieldset>
                        <div class="main__filter-form-line"></div>
                        <fieldset>
                            <legend>Độ tuổi</legend>
                            <label><input type="checkbox" name="age" value="0-6m"> 0-6 tháng</label>
                            <label><input type="checkbox" name="age" value="6-12m"> 6-12 tháng</label>
                            <label><input type="checkbox" name="age" value="1-3y"> 1-3 tuổi</label>
                        </fieldset>
                        <div class="main__filter-form-line"></div>
                        <fieldset>
                            <legend>Khoảng giá</legend>
                            <label><input type="checkbox" name="price" value="below 200.000đ"> Dưới 200.000đ</label>
                            <label><input type="checkbox" name="price" value="200.000đ – 500.000đ"> 200.000đ–500.000đ</label>
                            <label><input type="checkbox" name="price" value="500.000đ – 1.000.000đ">500.000đ–1.000.000đ</label>
                            <label><input type="checkbox" name="price" value="over 1.000.000đ">Trên 1.000.000đ</label>
                        </fieldset>
                        <div class="main__filter-form-line"></div>
                        <fieldset>
                            <legend>Loại sản phẩm</legend>
                            <label><input type="checkbox" name="type" value="Sữa bột công thức">Sữa bột công thức</label>
                            <label><input type="checkbox" name="type" value="Sữa tươi tiệt trùng">Sữa tươi tiệt trùng</label>
                            <label><input type="checkbox" name="type" value="Sữa đặc">Sữa đặc</label>
                            <label><input type="checkbox" name="type" value="Sữa chua uống">Sữa chua uống</label>
                            <label><input type="checkbox" name="type" value="Thực phẩm ăn dặm ">Thực phẩm ăn dặm </label>
                        </fieldset>
                        <div class="main__filter-form-line"></div>
                        <fieldset>
                            <legend>Đặc điểm dinh dưỡng</legend>
                            <label><input type="checkbox" name="characteristic" value="Tăng cân">Tăng cân</label>
                            <label><input type="checkbox" name="characteristic" value="Phát triển chiều cao">Phát triển chiều cao</label>
                            <label><input type="checkbox" name="characteristic" value="Hỗ trợ tiêu hoá">Hỗ trợ tiêu hoá</label>
                            <label><input type="checkbox" name="characteristic" value="Không đường / Ít béo">Không đường / Ít béo</label>
                            <label><input type="checkbox" name="characteristic" value="Organic (Hữu cơ)">Organic (Hữu cơ)</label>
                        </fieldset>
                        <div class="main__filter-form-line"></div>
                        <fieldset>
                            <legend>Khuyến mãi / Ưu đãi</legend>
                            <label><input type="checkbox" name="discount" value="đang giảm giá">Đang giảm giá</label>
                            <label><input type="checkbox" name="discount" value="Hàng mới ra mắt">Hàng mới ra mắt</label>
                        </fieldset>
                        <div class="main__filter-form-line"></div>
                        <fieldset>
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
                                <input type="checkbox" name="rating" value="5">
                                <ul>
                                    <li><i class="fa-solid fa-star --star"></i></li>
                                    <li><i class="fa-solid fa-star --star"></i></li>
                                    <li><i class="fa-solid fa-star --star"></i></li>
                                    <li><i class="fa-solid fa-star --star"></i></li>
                                    <li><i class="fa-solid fa-star --color3"></i></li>
                                </ul>
                            </label>
                            <label>
                                <input type="checkbox" name="rating" value="5">
                                <ul>
                                    <li><i class="fa-solid fa-star --star"></i></li>
                                    <li><i class="fa-solid fa-star --star"></i></li>
                                    <li><i class="fa-solid fa-star --star"></i></li>
                                    <li><i class="fa-solid fa-star --color3"></i></li>
                                    <li><i class="fa-solid fa-star --color3"></i></li>
                                </ul>
                            </label>
                            <label>
                                <input type="checkbox" name="rating" value="5">
                                <ul>
                                    <li><i class="fa-solid fa-star --star"></i></li>
                                    <li><i class="fa-solid fa-star --star"></i></li>
                                    <li><i class="fa-solid fa-star --color3"></i></li>
                                    <li><i class="fa-solid fa-star --color3"></i></li>
                                    <li><i class="fa-solid fa-star --color3"></i></li>
                                </ul>
                            </label>
                            <label>
                                <input type="checkbox" name="rating" value="5">
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
                            <button type="submit"><i class="fa-solid fa-rotate-right"></i></button>
                            <button type="submit">Lọc sản phẩm</button>
                        </div>
                    </form>
                </div>

            </div>

            <div class="main__products">
                <ul class="main__products-ul">
                    <form action="${pageContext.request.contextPath}/product-detail" method="post" style="display: none;" id="product__form">
                        <input type="hidden" value="" name="product_id" id="product__id">
                    </form>
                    <c:forEach var="p" items="${products}">
                        <li class="main__products-ul-li" onclick="
                               document.querySelector('#product__id').value = ${p.id}
                               document.querySelector('#product__form').submit()
                           ">
                            <div class="product" title="${p.name}">
                                <div class="product__top">
                                    <div class="product__image">
                                        <img src="${p.img_url}" alt="">
                                    </div>
                                </div>

                                <div class="product__mid">
                                    <h3 title="${p.name}">${p.name}</h3>
                                    <div class="product__mid-sub1">
                                        <ul class="product__mid-sub1-stars">
                                            <c:choose>
                                                <c:when test="${p.avg_rating < 5 && p.avg_rating > 0}">
                                                    <c:forEach var="i" begin="0" end="${p.avg_rating}">
                                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                                    </c:forEach>
                                                    <c:forEach var="i" begin="${p.avg_rating}" end="${4}">
                                                        <li class="product__mid-sub1-stars-item --color2"><i class="fa-solid fa-star hidden"></i></li>
                                                    </c:forEach>
                                                </c:when>

                                                <c:when test="${p.avg_rating == 5}">
                                                    <c:forEach var="i" begin="0" end="${4}">
                                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                                    </c:forEach>
                                                </c:when>

                                                <c:when test="${p.avg_rating == 0}">
                                                    <c:forEach var="i" begin="0" end="${4}">
                                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star hidden"></i></li>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>

                                        </ul>
                                        <p>${p.avg_rating}</p>

                                    </div>

                                    <div class="product__mid-sub2">
                                        <p>
                                            <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/>đ
                                        </p>
                                        <p>Đã bán ${p.buy_count}</p>
                                    </div>
                                </div>

                                <div class="product__bottom">
                                    <div class="product__bottom-actions">
                                        <button><i class="fa-solid fa-cart-plus"></i></button>
                                        <form action="${pageContext.request.contextPath}/product-detail" method="post" style="width: 100%; position:relative;">
                                            <input type="hidden" name="product_id" value="${p.id}" style="position:absolute;">
                                            <button type="submit" style="width: 100%;">Mua ngay</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                

                <div class="pagination">

                    <c:choose>
                        <c:when test="${currentPage > 1}">
                            <a href="${pageContext.request.contextPath}/product?page=${currentPage - 1}" class="pagination__btn">
                                <i class="fa-solid fa-chevron-left"></i> Prev
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="pagination__btn pagination__btn--disabled">
                                <i class="fa-solid fa-chevron-left"></i> Prev
                            </span>
                        </c:otherwise>
                    </c:choose>

                    <div class="pagination__numbers">
                        <c:forEach var="i" begin="${currentPage - 1}" end="${currentPage + 1}">
                            <c:if test="${i >= 1 && i <= totalPages}">
                                <a href="${pageContext.request.contextPath}/product?page=${i}" 
                                   class="pagination__number ${i == currentPage ? 'pagination__number--active' : ''}">
                                   ${i}
                                </a>
                            </c:if>
                        </c:forEach>

                        <c:if test="${currentPage + 1 < totalPages}">
                            <a href="${pageContext.request.contextPath}/product?page=${currentPage + 1}" 
                               class="pagination__dots">...</a>
                        </c:if>
                    </div>

                    <c:choose>
                        <c:when test="${currentPage < totalPages}">
                            <a href="${pageContext.request.contextPath}/product?page=${currentPage + 1}" class="pagination__btn">
                                Next <i class="fa-solid fa-chevron-right"></i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="pagination__btn pagination__btn--disabled">
                                Next <i class="fa-solid fa-chevron-right"></i>
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

    </main>

    <jsp:include page="/customer/components/Footer.jsp"/>

</body>
<script type="module" src="${pageContext.request.contextPath}/customer/scripts/main.js"></script>
<%--<script src="${pageContext.request.contextPath}/customer/scripts/Products.js" type="module"></script>--%>
</html>