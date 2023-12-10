<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서점 책 구매 페이지</title>
    <!-- 여기에 스타일링을 위한 외부 CSS 파일 링크 또는 스타일 태그 추가 가능 -->
    <!-- 예: <link rel="stylesheet" href="styles.css"> -->
</head>
<body>

<header>
    <h1>서점</h1>
    <nav>
        <ul>
            <li><a href="#">홈</a></li>
            <li><a href="#">베스트셀러</a></li>
            <li><a href="#">신간도서</a></li>
            <li><a href="#">문학소설</a></li>
            <!-- 필요한 메뉴 추가 가능 -->
        </ul>
    </nav>
</header>

<section id="book-details">
    <img src="book_cover.jpg" alt="책 표지 이미지">
    <div>
        <h2>책 제목</h2>
        <p>저자: 작가 이름</p>
        <p>가격: ₩20,000</p>
        <p>재고: 10권</p>
        <label for="quantity">수량:</label>
        <input type="number" id="quantity" name="quantity" min="1" max="10" value="1">
        <button onclick="addToCart()">장바구니에 추가</button>
    </div>
</section>

<section id="book-details">
    <img src="book_cover.jpg" alt="책 표지 이미지">
    <div>
        <h2>책 제목</h2>
        <p>저자: 작가 이름</p>
        <p>가격: ₩20,000</p>
        <p>재고: 10권</p>
        <label for="quantity">수량:</label>
        <input type="number" id="quantity" name="quantity" min="1" max="10" value="1">
        <button onclick="addToCart()">장바구니에 추가</button>
    </div>
</section>

<section id="book-details">
    <img src="book_cover.jpg" alt="책 표지 이미지">
    <div>
        <h2>책 제목</h2>
        <p>저자: 작가 이름</p>
        <p>가격: ₩20,000</p>
        <p>재고: 10권</p>
        <label for="quantity">수량:</label>
        <input type="number" id="quantity" name="quantity" min="1" max="10" value="1">
        <button onclick="addToCart()">장바구니에 추가</button>
    </div>
</section>

<section id="customer-info">
    <h2>주문자 정보</h2>
    <form action="주문처리_스크립트.php" method="post">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>

        <label for="address">주소:</label>
        <textarea id="address" name="address" rows="4" required></textarea>

        <button type="submit">주문 완료</button>
    </form>
</section>

<footer>
    <p>&copy; 2023 서점. All rights reserved.</p>
</footer>

<!-- 여기에 필요한 경우 외부 JavaScript 파일 링크 또는 스크립트 태그 추가 가능 -->
<!-- 예: <script src="script.js"></script> -->

</body>
</html>
