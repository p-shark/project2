<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
body {
  background: #f2f2f2;
  font-family: 'proxima-nova-soft', sans-serif;
  font-size: 14px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.post-module {
  position: relative;
  z-index: 1;
  display: block;
  background: #FFFFFF;
  min-width: 270px; 
  height: 470px;
  -webkit-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.15);
  -webkit-transition: all 0.3s linear 0s;
  -moz-transition: all 0.3s linear 0s;
  -ms-transition: all 0.3s linear 0s;
  -o-transition: all 0.3s linear 0s;
  transition: all 0.3s linear 0s;
}
.post-module .thumbnail {
  background: #000000;
  height: 400px;
  overflow: hidden;
}
.post-module .thumbnail .date {
  position: absolute;
  top: 20px;
  right: 20px;
  z-index: 1;
  background: #e74c3c;
  width: 55px;
  height: 55px;
  padding: 12.5px 0;
  -webkit-border-radius: 100%;
  -moz-border-radius: 100%;
  border-radius: 100%;
  color: #FFFFFF;
  font-weight: 700;
  text-align: center;
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.post-module .thumbnail .date .day {
  font-size: 18px;
}
.post-module .thumbnail .date .month {
  font-size: 12px;
  text-transform: uppercase;
}
.post-module .thumbnail img {
  display: block;
  width: 100%;
  height: 75%;
  -webkit-transition: all 0.3s linear 0s;
  -moz-transition: all 0.3s linear 0s;
  -ms-transition: all 0.3s linear 0s;
  -o-transition: all 0.3s linear 0s;
  transition: all 0.3s linear 0s;
}
.post-module .post-content {
  position: absolute;
  bottom: 0;
  background: #FFFFFF;
  width: 100%;
  padding: 10px;
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -moz-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -ms-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  -o-transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
  transition: all 0.3s cubic-bezier(0.37, 0.75, 0.61, 1.05) 0s;
}
.post-module .post-content .category {
  position: absolute;
  top: -41px;
  left: 0;
  background: #e74c3c;
  padding: 10px 15px;
  color: #FFFFFF;
  font-size: 14px;
  font-weight: 600;
  text-transform: uppercase;
  text-decoration: none;
}
.post-module .post-content .title {
  margin: 0;
  padding: 0 0 10px;
  color: #333333;
  font-size: 26px;
  font-weight: 700;
}
.post-module .post-content .sub_title {
  margin: 0;
  padding: 0 0 20px;
  color: #e74c3c;
  font-size: 20px;
  font-weight: 400;
}
.post-module .post-content .description {
  display: none;
  color: #666666;
  font-size: 14px;
  line-height: 1.8em;
}
.post-module .post-content .post-meta {
  margin: 30px 0 0;
  color: #999999;
}
.post-module .post-content .post-meta .timestamp {
  margin: 0 16px 0 0;
}
.post-module .post-content .post-meta a {
  color: #999999;
  text-decoration: none;
}
.hover .post-content .description {
  display: block !important;
  height: auto !important;
  opacity: 1 !important;
}
.content {
  max-width: 1200px;
  min-width: 640px;
  margin: 0 auto;
}

.content .column {
  width: 25%;
  padding: 20 25px; 
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  float: left;
}
.content .column .demo-title {
  margin: 0 0 15px;
  color: #666666;
  font-size: 18px;
  font-weight: bold;
  text-transform: uppercase;
}
.content .info {
  width: 300px;
  margin: 50px auto;
  text-align: center; 
}
.content .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 24px;
  font-weight: bold;
  color: #333333;
}
.content .info span {
  color: #666666;
  font-size: 12px;
}
.content .info span a {
  color: #000000;
  text-decoration: none;
}
.content .info span .fa {
  color: #e74c3c;
}
.containBox {
  width: 1200x;
}

</style>
<!DOCTYPE html>
<html>
<head>
<title>도서 목록</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/header.jsp" />

	<div class="containBox">
		<div class="content">
			<div class="info">
				<h1>Today`s Book List</h1>
			</div>
			<!-- Normal Demo-->
			<c:if test="${bookPage.hasNoArticles()}">
				<h1>게시글이 없습니다.</h1>
			</c:if>
			<c:forEach var="book" items="${bookPage.content}">
				<div class="column">
					<!-- Post-->
					<div class="post-module">
						<!-- Thumbnail-->
						<div class="thumbnail">
							<!-- <div class="date">
						<div class="day">27</div>
						<div class="month">Mar</div>
					</div> -->
							<img src="<%=application.getContextPath() %>/${book.photo}"
								alt="" />
						</div>
						<!-- Post Content-->
						<div class="post-content">
							<a href="#" class="category">구매</a>
							<h1 class="title">${book.title}</h1>
							<h2 class="sub_title">Today`s book.</h2>
							<div class="post-meta">
								<span class="timestamp"><i class="fa fa-clock-"></i>${book.price}원</span>
								<span class="comments"><i class="fa fa-comments">수량:
								</i>${book.amount}</span> 
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


	<%-- <table border="1">
			<tr>
				<td>도서 이미지</td>
				<td>도서번호</td>
				<td>제목</td>
				<td>가격</td>
				<td>수량</td>
			</tr>
			<c:if test="${bookPage.hasNoArticles()}">
				<tr>
					<td colspan="4">게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="book" items="${bookPage.content}">
				<tr>
					<td><img
						src="<%=application.getContextPath() %>/${book.photo}" alt="" /></td>
					<td>${book.bookno}</td>
					<td>${book.title}</td>
					<td>${book.price}</td>
					<td>${book.amount}</td>
				</tr>
			</c:forEach>
			<c:if test="${bookPage.hasArticles()}">
				<tr>
					<td colspan="4"><c:if test="${bookPage.startPage > 5}">
							<a href="list.do?pageNo=${bookPage.startPage - 5}">[이전]</a>
						</c:if> <c:forEach var="pNo" begin="${bookPage.startPage}"
							end="${bookPage.endPage}">
							<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
						</c:forEach> <c:if test="${bookPage.endPage < bookPage.totalPages}">
							<a href="list.do?pageNo=${bookPage.startPage + 5}">[다음]</a>
						</c:if></td>
				</tr>
			</c:if>
		</table> --%>
</body>
</html>