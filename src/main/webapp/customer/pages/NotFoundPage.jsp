<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang không tìm thấy</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        :root {
            --c1: #1C1C1C;
            --c2: #A4A4A4;
            --c3: #ACACAC;
            --c4: #858585;
            --c5: #ECECEC;
            --c6: #F564A9;
            --c7: #F875AA;
            --c8: #FAF8F0;
            --c9: #4CD3C2;
            --c10: #ffffff;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--c10);
            color: var(--c1);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .notfound-container {
            text-align: center;
            padding: 40px 20px;
        }

        .notfound-container i {
            font-size: 120px;
            color: var(--c6);
            margin-bottom: 20px;
        }

        .notfound-container h1 {
            font-size: 48px;
            margin: 10px 0;
        }

        .notfound-container p {
            font-size: 18px;
            color: var(--c3);
            margin-bottom: 30px;
        }

        .notfound-container a {
            text-decoration: none;
            background: var(--c6);
            color: var(--c10);
            padding: 12px 28px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .notfound-container a:hover {
            background: var(--c7);
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        @media (max-width: 480px) {
            .notfound-container h1 {
                font-size: 36px;
            }

            .notfound-container i {
                font-size: 80px;
            }

            .notfound-container p {
                font-size: 16px;
            }

            .notfound-container a {
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
<div class="notfound-container">
    <i class="fa-solid fa-triangle-exclamation"></i>
    <h1>Oops! Trang không tồn tại</h1>
    <p>Hoặc bạn chưa đăng nhập. Hãy kiểm tra lại URL hoặc quay về trang chủ.</p>
    <a href="${pageContext.request.contextPath}/">Quay về trang chủ</a>
</div>
</body>
</html>
