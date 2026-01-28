<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    request.setAttribute("activeTab", "");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        window.APP_CONTEXT_PATH = `${pageContext.request.contextPath}`;
    </script>
</head>
<body>
    <div class="scroll-to-top-btn"><i class="fa-solid fa-circle-up"></i></div>
    <jsp:include page="/customer/components/Header.jsp"/>
    <main class="main">
        <section class="notifications">

            <header class="notifications-header">
                <h2>Thông báo của bạn</h2>
                <form action="${pageContext.request.contextPath}/notification/mark" method="post">
                    <button class="btn-mark-all" id="markAll" type="submit">Đánh dấu tất cả đã đọc</button>
                </form>
            </header>


            <template id="inform_article_template">
                <article class="notification">
                    <div class="icon --order">
                        <i class="fa-regular fa-bell"></i>
                    </div>
                    <div class="content" style="display: flex; flex-direction: column; gap: 12px;">
                        <h4 class="notif-title"></h4>
                        <p class="notif-message"></p>
                        <span class="time notif-timestamp"></span>
                    </div>
                </article>
            </template>

            <div class="notifications-list">


                <!-- 1 item -->


            </div>

                <button id="more-notif" class="--size16 --color4" style="max-width: 200px; padding: 8px 16px; margin: auto; background: transparent; border: none; cursor: pointer;">Xem thêm</button>
            </section>

    </main>

    <jsp:include page="/customer/components/Footer.jsp"/>

<script type="module" src="${pageContext.request.contextPath}/customer/scripts/informPage/getInformForPage.js"></script>
<script src="${pageContext.request.contextPath}/customer/scripts/main.js"></script>

</body>
</html>