<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    request.setAttribute("activeTab", "blog");
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

            <template id="blog__template">
                <article class="main__parent-article" style="">
                    <h3></h3>
                    <p></p>
                    <div class="main__parent-article-actions">
                        <a style="opacity: 0"><i class="fa-regular fa-heart"></i><p>10k</p></a>
                        <a class="read">Đọc bài viết</a>
                    </div>
                </article>
            </template>


            <div class="main__parent">
                <c:forEach var="b" items="${blogs}" varStatus="status">
                    <article class="main__parent-article${(status.index % 6) + 1}" style="background: url('${b.thumbnail}')">
                        <h3>${b.title}</h3>
                        <p>${b.content}</p>
                        <div class="main__parent-article-actions">
                            <a style="opacity: 0"><i class="fa-regular fa-heart"></i><p>10k</p></a>
                            <a class="read" href="${b.url}">Đọc bài viết</a>
                        </div>
                    </article>
                </c:forEach>
            </div>

            <button style="
                padding: 8px 20px;
                border-radius: 6px;
                border: 1px solid var(--c5);
                outline: none;
                color: var(--c1);
                background-color: var(--c5);
                cursor: pointer;
                margin-bottom: 16px;
                transition: .1s ease;
                &:hover
                {
                    background-color: var(--c10);
                    color: var(--c1);
                }
            " class="more-btn">Xem thêm</button>
        </div>


    </main>

    <jsp:include page="/customer/components/Footer.jsp"/>

    <script type="module" src="${pageContext.request.contextPath}/customer/scripts/main.js"></script>
    <script type="module" src="${pageContext.request.contextPath}/customer/scripts/blog/Blog.js"></script>
</body>
</html>