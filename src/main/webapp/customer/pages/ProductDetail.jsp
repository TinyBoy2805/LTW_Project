<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setAttribute("activeTab", "product_detail");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MichiShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        window.APP_CONTEXT_PATH = `${pageContext.request.contextPath}`;
    </script>
    <script>
        // Backend Java render userId vào JavaScript
        window.userId = ${sessionScope.userId != null ? sessionScope.userId : 'null'};
    </script>
</head>
<body>

    <input type="hidden" value="${product.id}" id="productIdHolder">

    <div class="scroll-to-top-btn"><i class="fa-solid fa-circle-up"></i></div>
    <div class="toast-container"></div>
    <jsp:include page="/customer/components/Header.jsp"/>


    <main class="main active">

        <div class="main__product-detail">
            <div class="main__product-detail-breadcrumb">
                <ul>
                    <li class="--size20 --color4">&lt;</li>
                    <li class="--pointer"><a href="${pageContext.request.contextPath}/product" class="--color6">Sản phẩm</a></li>
                    <li class="--color4">/</li>
                    <li class="--color9 --pointer">${product.name}</li>
                </ul>
            </div>

            <section class="main__product-detail-section1">
                
                <div class="section1-left">
                    <c:set var="subImageCount" value="${product.images != null ? fn:length(product.images) : 0}" />
                    <c:set var="totalImages" value="${1 + subImageCount}" />
                    <div class="carousel ${totalImages <= 1 ? 'single-image' : ''}">

                        <!-- Nút chỉ hiện khi có ảnh phụ -->
                        <c:if test="${totalImages > 1}">
                            <button class="nav prev">&lt;</button>
                            <button class="nav next">&gt;</button>
                            <div class="carousel-counter"></div>
                        </c:if>

                        <div class="img-container">
                            <div class="img-slider">

                                <!-- ẢNH CHÍNH -->
                                <img src="${product.url}" alt="${product.name}">

                                <!-- ẢNH PHỤ -->
                                <c:forEach var="img" items="${product.images}">
                                    <img src="${img.img_url}" alt="${product.name}">
                                </c:forEach>

                            </div>
                        </div>
                    </div>


                </div>

                <div class="section1-right">
                    <h3>${product.name}</h3>

                    <ul>
                        <li><i class="fa-solid fa-star --star"></i> <strong class="--color1">4.9</strong></li>
                        <li><strong class="--color1">3618</strong> &nbsp; lượt đánh giá</li>
                        <li>đã bán &nbsp;<strong class="--color1">${product.buyCount}</strong></li>
                    </ul>

                    <p class="price"><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>đ</p>

                    <ul>
                        <li>Số lượng</li>
                        <li>
                            <button>-</button>
                            <p>1</p>
                            <button>+</button>
                        </li>
                        <li>còn lại <strong class="--color1"> &nbsp; ${product.quantity}</strong></li>
                    </ul>

                    <div class="actions">
                        <button id="${product.id}"><i class="fa-solid fa-cart-plus"></i> Thêm vào giỏ hàng</button>
                        <button id="buyNow">Mua ngay</button>
                    </div>


                
                </div>
            </section>

            <section class="main__product-description">
                <div class="product-description-header">
                    <i class="fa-solid fa-tags --color6"></i>
                    <h3>Mô tả sản phẩm</h3>
                    <div class="title-line"></div>
                </div>
                <div class="description">
                    <p>${product.description}</p>
                </div>
            </section>

            <section class="main__product-rating">
                <div class="main__product-rating-header">
                    <i class="fa-solid fa-star --star"></i>
                    <h3>Đánh giá sản phẩm</h3>
                    <div class="title-line"></div>
                </div>

                <div class="main__product-rating-filter">
                    <div class="filter-left">
                        <p><strong class="--size20 --weight700"><fmt:formatNumber value="${avgRating}" type="number" maxFractionDigits="1" /></strong> trên 5</p>
                        <ul>
                            <c:forEach begin="1" end="5" var="i">
                                <c:choose>
                                    <c:when test="${i <= avgRating}">
                                        <li><i class="fa-solid fa-star --star"></i></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><i class="fa-regular fa-star empty"></i></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="filter-right">
                        <ul>
                            <li><button class="active">Tất cả</button></li>
                            <li><button>5 sao (36)</button></li>
                            <li><button>4 sao (36)</button></li>
                            <li><button>3 sao (36)</button></li>
                            <li><button>2 sao (36)</button></li>
                            <li><button>1 sao (36)</button></li>
                            <li><button>Có ảnh hoặc video (36)</button></li>
                        </ul>
                    </div>
                </div>


                <template id="review-template">
                    <div class="comment-item">
                        <div class="comment-left">
                            <div class="avt">
                                <img src="" alt="" class="review-avt">
                            </div>
                        </div>
                        <div class="comment-right">
                            <div class="comment-right-sub1">
                                <p class="name review-name"></p>
                                <ul class="review-stars"></ul>
                                <p class="date review-date"></p>
                            </div>
                            <div class="comment-right-sub2">
                                <p class="review-comment"></p>
                            </div>
                        </div>
                    </div>
                </template>


                <div class="main__comment">

                        <div class="review-container" style="max-height: 400px; overflow-y: auto; padding-right: 10px;">

                        </div>

                        <div class="comment-more-button">
                            <button class="main__today-suggestion-more" id="more-reviews">Xem thêm</button>
                        </div>

                    <div class="review-form-group">
                        <label for="comment" class="review-label">
                            <i class="fa-solid fa-pen"></i>
                            Để lại đánh giá của bạn
                        </label>
                        <textarea
                                name="comment"
                                id="comment"
                                class="review-textarea"
                                placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm..."
                                rows="6"
                        ></textarea>
                    </div>
                </div>




            </section>
            
            <section class="main__another">
                <div class="anothers">
                    <div class="another-header">
                        <i class="fa-solid fa-boxes-stacked --color6"></i>
                        <h3>Sản phẩm khác</h3>
                    </div>
                    <ul class="another-list">
                        <form action="${pageContext.request.contextPath}/product-detail" method="post" style="display: none;" id="product__form">
                            <input type="hidden" value="" name="product_id" id="product__id">
                        </form>



                    </ul>
                    <button class="anothers-more">Xem thêm</button>
                </div>
            </section>



        </div>


    </main>


    <jsp:include page="/customer/components/Footer.jsp"/>
    <jsp:include page="/customer/components/ProductCard.jsp"/>

    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
    <script type="module" src="${pageContext.request.contextPath}/customer/scripts/main.js"></script>
    <script type="module" src="${pageContext.request.contextPath}/customer/scripts/headerScript/header.js"></script>
    <script type="module" src="${pageContext.request.contextPath}/customer/scripts/product/productDetail.js" defer></script>
    <script type="module">
        import {initCKEditor} from "${pageContext.request.contextPath}/customer/scripts/utils/initCkeditor.js";
        window.addEventListener("DOMContentLoaded", () => {
            initCKEditor("#comment");
        });
    </script>
</body>
</html>