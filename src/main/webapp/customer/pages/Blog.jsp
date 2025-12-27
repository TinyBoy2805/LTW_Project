<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MichiShop</title>
    <link rel="stylesheet" href="../styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="scroll-to-top-btn"><i class="fa-solid fa-circle-up"></i></div>

    <jsp:include page="/customer/components/Header.jsp"/>

    <main class="main">
        <div class="main__blog">
           <div class="main__blog-header">
                <h2>Chăm sóc bé yêu – Tips & Kiến thức dinh dưỡng</h2>
                <p>Khám phá bí quyết dinh dưỡng và mẹo nuôi con, cùng hướng dẫn chọn sữa giúp bé phát triển khỏe mạnh mỗi ngày.</p>
           </div>
            <div class="main__parent">
                <article class="main__parent-article1">
                    <h5>Dinh dưỡng và sức khỏe</h5>
                    <h3>Chế độ ăn cân bằng cho trẻ</h3>
                    <p>Hướng dẫn bố mẹ cách xây dựng thực đơn khoa học, đầy đủ dưỡng chất cho trẻ từ 1-5 tuổi.</p>
                    <div class="main__parent-article-actions">
                        <button>Đọc bài viết</button>
                        <a><i class="fa-regular fa-heart"></i><p>10k</p></a>
                    </div>
                </article>

                <article class="main__parent-article2">
                    <h5>Mẹo nuôi con</h5>
                    <h3>Làm thế nào để bé ăn ngon miệng hơn?</h3>
                    <p>5 mẹo giúp bé hứng thú với bữa ăn, từ việc trang trí món ăn đến chọn sữa phù hợp.</p>
                    <div class="main__parent-article-actions">
                        <button>Đọc bài viết</button>
                        <!-- <a class="active"><i class="fa-regular fa-heart"></i><p>10k</p></a> -->
                        <a class="active"><i class="fa-solid fa-heart"></i><p>10k</p></a>
                    </div>
                </article>

                <article class="main__parent-article3">
                    <h5>Product Guide</h5>
                    <h3>Chọn sữa phù hợp theo độ tuổi</h3>
                    <p>Tìm hiểu loại sữa nào phù hợp với trẻ từ 6 tháng đến 3 tuổi, cách đọc nhãn hiệu thông minh.</p>
                    <div class="main__parent-article-actions">
                        <button>Đọc bài viết</button>
                        <a><i class="fa-regular fa-heart"></i><p>10k</p></a>
                    </div>
                </article>

                <article class="main__parent-article4">
                    <h5>Recipes / Công thức</h5>
                    <h3>Snack dinh dưỡng từ sữa cho bé</h3>
                    <p>Công thức snack nhanh, bổ sung canxi và protein, bé vừa ăn vừa phát triển khỏe mạnh.</p>
                    <div class="main__parent-article-actions">
                        <button>Đọc bài viết</button>
                        <a><i class="fa-regular fa-heart"></i><p>12k</p></a>
                    </div>
                </article>

                <article class="main__parent-article5">
                    <h5>News & Updates</h5>
                    <h3>Khuyến mãi đặc biệt cuối tuần</h3>
                    <p>Nhận ngay ưu đãi lên tới 20% cho các sản phẩm sữa và dinh dưỡng trẻ em.</p>
                    <div class="main__parent-article-actions">
                        <button>Đọc bài viết</button>
                        <!-- <a class="active"><i class="fa-regular fa-heart"></i><p>10k</p></a> -->
                        <a class="active"><i class="fa-solid fa-heart"></i><p>100k</p></a>
                    </div>
                </article>

                <article class="main__parent-article6">
                    <h5>Educational</h5>
                    <h3>Tầm quan trọng của vitamin D</h3>
                    <p>Tìm hiểu tại sao vitamin D lại cần thiết cho sự phát triển xương và miễn dịch của trẻ.</p>
                    <div class="main__parent-article-actions">
                        <button>Đọc bài viết</button>
                        <a><i class="fa-regular fa-heart"></i><p>4.8k</p></a>
                    </div>
                </article>
            </div>

            <div class="main__blog-pagination">
                <button class="pagination-btn prev-btn" disabled>
                    <i class="fa-solid fa-chevron-left"></i>
                </button>
                <div class="pagination-numbers">
                    <button class="pagination-number active">1</button>
                    <button class="pagination-number">2</button>
                    <button class="pagination-number">3</button>
                    <span class="pagination-dots">...</span>
                    <button class="pagination-number">10</button>
                </div>
                <button class="pagination-btn next-btn">
                    <i class="fa-solid fa-chevron-right"></i>
                </button>
            </div>
        </div>
    
    





    </main>

    <jsp:include page="/customer/components/Footer.jsp"/>

    
</body>
<script type="module" src="../scripts/main.js"></script>
</html>