<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/27/2025
  Time: 5:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<template id="product-card__template">
    <li class="main__trending-content-ul-li">
        <div class="product">
            <div class="product__top">
                <div class="product__image">
                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="" loading="lazy">
                </div>
            </div>

            <div class="product__mid">
                <h3>Sữa tươi thanh trùng</h3>
                <div class="product__mid-sub1">
                    <ul class="product__mid-sub1-stars">

                    </ul>
                    <p id="rating">98</p>
                </div>

                <div class="product__mid-sub2">
                    <p id="price">360.000đ</p>
                    <p id="buy_count">Đã bán 3.6k+</p>
                </div>
            </div>

            <div class="product__bottom">
                <div class="product__bottom-actions">
                    <button><i class="fa-solid fa-cart-plus"></i></button>
                    <button>Mua ngay</button>
                </div>
            </div>
        </div>
    </li>
</template>

