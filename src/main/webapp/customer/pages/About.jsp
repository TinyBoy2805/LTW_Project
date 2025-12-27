<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="scroll-to-top-btn"><i class="fa-solid fa-circle-up"></i></div>
    <jsp:include page="/customer/components/Header.jsp"/>


    <main class="main"> 

        <!-- 1. HERO -->
        <section class="hero">
            <div class="hero__content">
                <h1 class="hero__title">Cửa Hàng Dinh Dưỡng Cho Bé</h1>
                <p class="hero__subtitle">Sản phẩm chính hãng - An toàn - Uy tín</p>
                <a href="#" class="hero__btn">Xem sản phẩm</a>
            </div>
        </section>


        <!-- 2. JOURNEY TIMELINE -->
        <section class="journey">
            <h2 class="journey__title">Hành trình phát triển</h2>
            <p class="journey__subtitle">Từ những bước đầu tiên đến hiện tại</p>
            
            <div class="journey__timeline">
                <div class="timeline__item">
                    <div class="timeline__year">
                        <span>2020</span>
                    </div>
                    <div class="timeline__card">
                        <div class="timeline__icon">
                            <i class="fa-solid fa-rocket"></i>
                        </div>
                        <h3>Khởi đầu</h3>
                        <p>Ra đời với sứ mệnh mang dinh dưỡng chất lượng đến mọi gia đình Việt. Khởi đầu với 50 sản phẩm từ các thương hiệu uy tín.</p>
                    </div>
                </div>

                <div class="timeline__item">
                    <div class="timeline__year">
                        <span>2021</span>
                    </div>
                    <div class="timeline__card">
                        <div class="timeline__icon">
                            <i class="fa-solid fa-chart-line"></i>
                        </div>
                        <h3>Phát triển</h3>
                        <p>Đạt mốc 1000+ khách hàng tin tưởng. Mở rộng danh mục sản phẩm lên 200+ items với nhiều dòng sản phẩm cao cấp.</p>
                    </div>
                </div>

                <div class="timeline__item">
                    <div class="timeline__year">
                        <span>2022</span>
                    </div>
                    <div class="timeline__card">
                        <div class="timeline__icon">
                            <i class="fa-solid fa-store"></i>
                        </div>
                        <h3>Mở rộng</h3>
                        <p>Khai trương 3 chi nhánh tại TP.HCM. Đội ngũ tư vấn chuyên nghiệp 20+ người, sẵn sàng hỗ trợ 24/7.</p>
                    </div>
                </div>

                <div class="timeline__item">
                    <div class="timeline__year">
                        <span>2023</span>
                    </div>
                    <div class="timeline__card">
                        <div class="timeline__icon">
                            <i class="fa-solid fa-trophy"></i>
                        </div>
                        <h3>Hiện tại</h3>
                        <p>Phục vụ 5000+ khách hàng, 500+ sản phẩm chính hãng. Trở thành đối tác tin cậy của các thương hiệu quốc tế hàng đầu.</p>
                    </div>
                </div>
            </div>
        </section>


        <!-- 3. MISSION & VISION -->
        <section class="mv">
            <h2 class="mv__title">Sứ mệnh & Tầm nhìn</h2>
            <div class="mv__content">
                <div class="mv__item">
                    <div class="mv__icon-wrapper">
                        <i class="fa-solid fa-bullseye"></i>
                    </div>
                    <h3 class="mv__item-title">Sứ mệnh</h3>
                    <p class="mv__item-desc">Mang đến những sản phẩm dinh dưỡng chất lượng cao, an toàn và được kiểm định nghiêm ngặt, giúp trẻ em Việt Nam phát triển toàn diện về thể chất và trí tuệ.</p>
                </div>
                <div class="mv__item">
                    <div class="mv__icon-wrapper">
                        <i class="fa-solid fa-lightbulb"></i>
                    </div>
                    <h3 class="mv__item-title">Tầm nhìn</h3>
                    <p class="mv__item-desc">Trở thành đối tác tin cậy hàng đầu của các bậc phụ huynh trong hành trình chăm sóc và nuôi dưỡng con cái, góp phần xây dựng thế hệ trẻ khỏe mạnh cho tương lai.</p>
                </div>
            </div>
        </section>


        <!-- 4. CORE VALUES -->
        <section class="values">
            <h2 class="values__title">Giá trị cốt lõi</h2>
            <div class="values__items">
                <div class="values__item">
                    <div class="values__icon">
                        <i class="fa-solid fa-certificate"></i>
                    </div>
                    <h3>Chất lượng</h3>
                    <p>Cam kết sản phẩm chính hãng, nguồn gốc rõ ràng</p>
                </div>
                <div class="values__item">
                    <div class="values__icon">
                        <i class="fa-solid fa-shield-halved"></i>
                    </div>
                    <h3>Uy tín</h3>
                    <p>Xây dựng niềm tin qua từng sản phẩm và dịch vụ</p>
                </div>
                <div class="values__item">
                    <div class="values__icon">
                        <i class="fa-solid fa-hand-holding-heart"></i>
                    </div>
                    <h3>Tận tâm</h3>
                    <p>Tư vấn chuyên nghiệp, chăm sóc khách hàng tận tình</p>
                </div>
                <div class="values__item">
                    <div class="values__icon">
                        <i class="fa-solid fa-heart-pulse"></i>
                    </div>
                    <h3>An toàn</h3>
                    <p>Đặt sức khỏe của bé lên hàng đầu trong mọi quyết định</p>
                </div>
            </div>
        </section>


        <!-- 5. WHY CHOOSE US -->
        <section class="why">
            <h2 class="why__title">Vì sao chọn chúng tôi?</h2>
            <div class="why__content">
                <div class="why__card">
                    <div class="why__number">01</div>
                    <div class="why__icon">
                        <i class="fa-solid fa-certificate"></i>
                    </div>
                    <h3>Sản phẩm chính hãng</h3>
                    <p>100% hàng chính hãng, nhập khẩu trực tiếp từ các thương hiệu uy tín</p>
                </div>
                <div class="why__card">
                    <div class="why__number">02</div>
                    <div class="why__icon">
                        <i class="fa-solid fa-truck-fast"></i>
                    </div>
                    <h3>Giao hàng nhanh chóng</h3>
                    <p>Giao hàng tận nơi trong 24h, đóng gói cẩn thận và bảo quản đúng cách</p>
                </div>
                <div class="why__card">
                    <div class="why__number">03</div>
                    <div class="why__icon">
                        <i class="fa-solid fa-tags"></i>
                    </div>
                    <h3>Giá cả hợp lý</h3>
                    <p>Giá tốt nhất thị trường, nhiều chương trình khuyến mãi hấp dẫn</p>
                </div>
                <div class="why__card">
                    <div class="why__number">04</div>
                    <div class="why__icon">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <h3>Hơn 5000+ khách hàng</h3>
                    <p>Được tin tưởng bởi hàng ngàn gia đình trên toàn quốc</p>
                </div>
            </div>
        </section>


        <!-- 6. STATS & PARTNERS -->
        <section class="partners">
            <h2 class="partners__title">Con số & Đối tác</h2>
            <p class="partners__subtitle">Những thành tựu và đối tác đồng hành</p>

            <!-- STATS -->
            <div class="partners__stats">
                <div class="stat__card">
                    <div class="stat__icon">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <div class="stat__number">5000+</div>
                    <div class="stat__label">Khách hàng</div>
                </div>

                <div class="stat__card">
                    <div class="stat__icon">
                        <i class="fa-solid fa-box"></i>
                    </div>
                    <div class="stat__number">500+</div>
                    <div class="stat__label">Sản phẩm</div>
                </div>

                <div class="stat__card">
                    <div class="stat__icon">
                        <i class="fa-solid fa-building"></i>
                    </div>
                    <div class="stat__number">3</div>
                    <div class="stat__label">Chi nhánh</div>
                </div>

                <div class="stat__card">
                    <div class="stat__icon">
                        <i class="fa-solid fa-heart"></i>
                    </div>
                    <div class="stat__number">99%</div>
                    <div class="stat__label">Hài lòng</div>
                </div>
            </div>

            <!-- PARTNERS BRANDS -->
            <div class="partners__brands">
                <h3>Đối tác thương hiệu</h3>
                <div class="brands__grid">
                    <div class="brand__card">
                        <div class="brand__logo">
                            <i class="fa-solid fa-certificate"></i>
                        </div>
                        <p>Nestlé</p>
                    </div>

                    <div class="brand__card">
                        <div class="brand__logo">
                            <i class="fa-solid fa-award"></i>
                        </div>
                        <p>Abbott</p>
                    </div>

                    <div class="brand__card">
                        <div class="brand__logo">
                            <i class="fa-solid fa-medal"></i>
                        </div>
                        <p>Mead Johnson</p>
                    </div>

                    <div class="brand__card">
                        <div class="brand__logo">
                            <i class="fa-solid fa-shield-halved"></i>
                        </div>
                        <p>Friesland Campina</p>
                    </div>

                    <div class="brand__card">
                        <div class="brand__logo">
                            <i class="fa-solid fa-star"></i>
                        </div>
                        <p>Danone</p>
                    </div>

                    <div class="brand__card">
                        <div class="brand__logo">
                            <i class="fa-solid fa-gem"></i>
                        </div>
                        <p>Meiji</p>
                    </div>
                </div>
            </div>

            <!-- CERTIFICATIONS -->
            <div class="partners__certifications">
                <h3>Chứng nhận chất lượng</h3>
                <div class="cert__list">
                    <div class="cert__badge">
                        <i class="fa-solid fa-circle-check"></i>
                        <span>FDA Approved</span>
                    </div>
                    <div class="cert__badge">
                        <i class="fa-solid fa-clipboard-check"></i>
                        <span>HACCP Certified</span>
                    </div>
                    <div class="cert__badge">
                        <i class="fa-solid fa-circle-check"></i>
                        <span>ISO 9001:2015</span>
                    </div>
                    <div class="cert__badge">
                        <i class="fa-solid fa-shield"></i>
                        <span>Bộ Y Tế VN</span>
                    </div>
                </div>
            </div>
        </section>


        <!-- 7. TESTIMONIALS -->
        <section class="testimonials">
            <h2 class="testimonials__title">Khách hàng nói gì?</h2>
            <div class="testimonials__grid">
                <div class="testimonials__card">
                    <div class="card__top">
                        <div class="img-container">
                            <img src="https://i.pinimg.com/474x/28/36/ed/2836ed60aa938a17992f5212f9a0c416.jpg" alt="">
                        </div>
                        <div class="card__info">
                            <h4>Nguyễn Văn A</h4>
                            <div class="card__star">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card__bottom">
                        <p>Cửa hàng tư vấn nhiệt tình, sản phẩm chất lượng. Con tôi uống sữa rất thích, phát triển tốt hơn hẳn.</p>
                    </div>
                </div>

                <div class="testimonials__card">
                    <div class="card__top">
                        <div class="img-container">
                            <img src="https://i.pinimg.com/474x/98/51/1e/98511ee82f39e8956ca83f1b3e175e45.jpg" alt="">
                        </div>
                        <div class="card__info">
                            <h4>Trần Thị B</h4>
                            <div class="card__star">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card__bottom">
                        <p>Giao hàng nhanh, đóng gói cẩn thận. Giá cả hợp lý, chắc chắn sẽ quay lại mua tiếp.</p>
                    </div>
                </div>

                <div class="testimonials__card">
                    <div class="card__top">
                        <div class="img-container">
                            <img src="https://i.pinimg.com/736x/5c/7c/e8/5c7ce8ed53f36b83c89159252f9b829f.jpg" alt="">
                        </div>
                        <div class="card__info">
                            <h4>Lê Văn C</h4>
                            <div class="card__star">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card__bottom">
                        <p>Sản phẩm đa dạng, nhân viên tư vấn tận tâm. Rất hài lòng với chất lượng dịch vụ.</p>
                    </div>
                </div>

                <div class="testimonials__card">
                    <div class="card__top">
                        <div class="img-container">
                            <img src="https://i.pinimg.com/736x/07/33/ba/0733ba760b29378474dea0fdbcb97107.jpg" alt="">
                        </div>
                        <div class="card__info">
                            <h4>Phạm Thị D</h4>
                            <div class="card__star">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card__bottom">
                        <p>Mua hàng ở đây yên tâm vì sản phẩm chính hãng 100%. Bé nhà tôi rất khoẻ mạnh.</p>
                    </div>
                </div>

                <div class="testimonials__card">
                    <div class="card__top">
                        <div class="img-container">
                            <img src="https://i.pinimg.com/736x/d2/02/4e/d2024e101baadd79bd66e6e24b3c7b79.jpg" alt="">
                        </div>
                        <div class="card__info">
                            <h4>Hoàng Văn E</h4>
                            <div class="card__star">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card__bottom">
                        <p>Dịch vụ tốt, giao hàng đúng hẹn. Shop luôn có chương trình khuyến mãi hấp dẫn.</p>
                    </div>
                </div>

                <div class="testimonials__card">
                    <div class="card__top">
                        <div class="img-container">
                            <img src="https://i.pinimg.com/736x/46/e3/35/46e335769126de5163d3de170ab42b24.jpg" alt="">
                        </div>
                        <div class="card__info">
                            <h4>Vũ Thị F</h4>
                            <div class="card__star">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card__bottom">
                        <p>Giá tốt nhất thị trường, chất lượng đảm bảo. Nhân viên tư vấn rất chuyên nghiệp và nhiệt tình.</p>
                    </div>
                </div>
            </div>
        </section>

    </main>


    <jsp:include page="/customer/components/Footer.jsp"/>



</body>
<script type="module" src="../scripts/main.js"></script>
</html>