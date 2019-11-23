<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<style>
.slider-content {
  position: relative;
  max-width: 112rem;
  min-width: 480px;
  background: #fff;
  margin: 0 auto;
  overflow: hidden;
  box-shadow: 0 0 35px 20px rgba(79, 69, 66, 0.2);
}
.slider-content .slide {
  position: absolute;
  width: 100%;
  height: 100%;
}
.slider-content .slide:after {
  content: "";
  display: table;
  clear: both;
}
.slider-content .slide:first-child .txt-wrapper span.copy {
  opacity: 1;
}
.slider-content .slide:nth-child(odd) .img {
  margin-left: 50%;
  -webkit-transform: translateY(-100%);
          transform: translateY(-100%);
}
.slider-content .slide:nth-child(odd) .txt {
  -webkit-transform: translateY(100%);
          transform: translateY(100%);
}
.slider-content .slide:nth-child(even) .img {
  -webkit-transform: translateY(100%);
          transform: translateY(100%);
}
.slider-content .slide:nth-child(even) .txt {
  margin-left: 50%;
  -webkit-transform: translateY(-100%);
          transform: translateY(-100%);
}
.slider-content .slide.active {
  position: absolute;
  z-index: 5;
}
.slider-content .slide.active .img, .slider-content .slide.active .txt {
  -webkit-transform: translateY(0);
          transform: translateY(0);
}

.slider-container {
  position: relative;
  height: 50rem;
  overflow: hidden;
}
.slider-container:after {
  content: "";
  display: table;
  clear: both;
}
.slider-container .slide-content {
  position: fixed;
  display: block;
  width: 50%;
  height: 100%;
  top: 23.5%;
  left: 20%;
  transition: -webkit-transform 0.3s ease;
  transition: transform 0.3s ease;
  transition: transform 0.3s ease, -webkit-transform 0.3s ease;
  transition-delay: 0.15s;
}
.slider-container .slide-content.txt {
  display: table;
  padding: 8rem 14rem;
  background: white;
}
.slider-container .slide-content .txt-wrapper {
  position: fixed;
  display: table-cell;
  vertical-align: middle;
  top: 35%;
  left: 50%;
  width: 25%;
  
}
.slider-container .slide-content .txt-wrapper span.copy {
  position: relative;
  text-transform: uppercase;
  width: 2rem;
  display: block;
  font-size: 1rem;
  line-height: 1;
  margin-bottom: 4rem;
  font-weight: 500;
  opacity: 0;
}
.slider-container .slide-content .txt-wrapper h2 {
  margin: 0;
  font-size: 4.3rem;
  margin-bottom: 4rem;
  line-height: 1;
  font-weight: 600;
}
.slider-container .slide-content .txt-wrapper h2 span {
  display: block;
}
.slider-container .slide-content .txt-wrapper h3 {
  margin: 0;
  font-size: 2rem;
  margin-bottom: 2rem;
  line-height: 1;
  font-weight: 400;
}
.slider-container .slide-content .txt-wrapper h3 span {
  color: #ccc;
}
.slider-container .slide-content .txt-wrapper a {
  text-decoration: none;
  color: #AEACAB;
}
.slider-container .slide-content .txt-wrapper button {
  position: relative;
  padding: 1rem 3.5rem;
  color: white;
  text-align: center;
  display: block;
  border-radius: 3rem;
  background: #d02e2e;
  text-transform: uppercase;
  border: none;
  font-size: 1rem;
  margin-top: 3rem;
  font-weight: bold;
  outline: none;
  box-shadow: 0 0 1rem 0 rgba(0, 0, 0, 0.3);
}
.slider-container .slide-content .txt-wrapper .phone {
  display: block;
  color: black;
  font-size: 1.9rem;
}
.slider-container .slide-content .txt-wrapper .subtitle {
  display: block;
  text-transform: uppercase;
  color: #AEACAB;
  font-weight: bold;
  letter-spacing: 0.3rem;
  font-size: 1.2rem;
  margin-bottom: 1rem;
}
.slider-container .slide-content .txt-wrapper p.excerpt {
  margin: 0;
  color: #AEACAB;
  font-size: 1.2rem;
  line-height: 1.5;
}
.slider-container .slide-content .txt-wrapper span.view-all {
  color: #AEACAB;
}
.slider-container .slide-content .txt-wrapper ul {
  margin: 0;
  padding: 0;
  list-style: none;
  margin-bottom: 1.5rem;
}
.slider-container .slide-content .txt-wrapper ul li {
  position: relative;
  margin: 1.5rem 0;
  padding: 0;
}
.slider-container .slide-content .txt-wrapper ul li:after {
  content: "";
  display: table;
  clear: both;
}
.slider-container .slide-content .txt-wrapper .date-wrapper {
  width: 20%;
  float: left;
  color: #AEACAB;
  text-align: left;
}
.slider-container .slide-content .txt-wrapper .date-wrapper .date {
  font-size: 1.7rem;
}
.slider-container .slide-content .txt-wrapper .date-wrapper .month {
  font-size: 1rem;
}
.slider-container .slide-content .txt-wrapper .post-wrapper {
  width: 80%;
  float: left;
}
.slider-container .slide-content .txt-wrapper .post-wrapper .post-title {
  display: block;
  font-size: 1.4rem;
  line-height: 1.3;
}
.slider-container .slide-content .txt-wrapper .post-wrapper .post-title a {
  display: block;
  color: black;
  cursor: pointer;
}
.slider-container .slide-content .txt-wrapper .post-wrapper .post-title a:hover {
  text-decoration: underline;
}
.slider-container .slide-content .txt-wrapper .post-wrapper .post-info {
  display: block;
  color: #AEACAB;
  font-size: 1rem;
}
.slider-container .slide-content .txt-wrapper .post-wrapper .post-info:after {
  content: "";
  display: table;
  clear: both;
}
.slider-container .slide-content .txt-wrapper .post-wrapper .post-info ul {
  margin: 0;
}
.slider-container .slide-content .txt-wrapper .post-wrapper .post-info li {
  float: left;
  margin: 0 0.5rem;
}
.slider-container .slide-content .txt-wrapper .post-wrapper .post-info li:first-child {
  margin-left: 0;
}
.slider-container .slide-content img {
  width: 100%;
  height: 100%;
}


/* modal */
/* Full-width input fields */
input[type=text], input[type=password], input[type=number] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus, input[type=number]:focus {
  background-color: #ddd;
  outline: none;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

.signupbtn {
  padding: 14px 20px;
  background-color: #4CAF50;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 45%;
  border-style: none;
  margin-left: 20px;
  border-radius: 5px;
  color: white;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  top: 10%;
  left: 25%;
  width: 50%; 
  height: 100%; 
  overflow: auto; /* Enable scroll if needed */
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/index.css"> --%>
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/index1.css"> --%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>	
	
	<!-- header -->
	<jsp:include page="/WEB-INF/view/header.jsp" />
	
	
	<div class="slider-wrapper">
		<div class="slider-container">
			<div class="slide active" data-order="1">
				<div class="slide-content txt">
					<div class="img-wrapper">
						<img src="images/book.jpg" alt="" style="width: 300px; height: 320px;"/>
					</div>
					<div class="txt-wrapper">
						<h2>
							<span>Hello!</span> It`s BookStore
						</h2>
						<span class="subtitle">BookStore Owner</span>
						<p class="excerpt">I combine the best of our skills and ideas
							to present you products really worth your attention that will
							change the way you think about knowledge, hobby, shopping and
							skill itself.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 회원가입 폼 -->
	<div id="joinForm" class="modal">
		<span
			onclick="document.getElementById('joinForm').style.display='none'"
			class="close" title="Close Modal">&times;</span>
		<form class="modal-content" action="join.do" method="post">
			<div class="container">
				<h1>Sign Up</h1>
				<hr>
				<label for="customerID"><b>ID</b></label> <input type="text"
					placeholder="Enter ID" name="customerID" required> <label
					for="customerPW"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="customerPW" required> <label
					for="confirmPassword"><b>confirm Password</b></label> <input
					type="password" placeholder="Repeat Password"
					name="confirmPassword" required> <label for="name"><b>name</b></label>
				<input type="text" placeholder="Enter name" name="name" required>
				<div class="clearfix">
					<button type="submit" class="signupbtn">Sign Up</button>
					<button type="button"
						onclick="document.getElementById('joinForm').style.display='none'"
						class="cancelbtn">Cancel</button>
				</div>
			</div>
		</form>
	</div>


	<!-- 로그인 폼 -->
	<div id="loginForm" class="modal">
		<span
			onclick="document.getElementById('loginForm').style.display='none'"
			class="close" title="Close Modal">&times;</span>
		<form class="modal-content" action="login.do" method="post">
			<div class="container">
				<h1>Login</h1>
				<hr>
				<label for="customerID"><b>ID</b></label> <input type="text"
					placeholder="Enter ID" name="customerID" required> <label
					for="customerPW"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="customerPW" required>
				<div class="clearfix">
					<button type="submit" class="signupbtn">Login</button>
					<button type="button"
						onclick="document.getElementById('loginForm').style.display='none'"
						class="cancelbtn">Cancel</button>
				</div>
			</div>
		</form>
	</div>

	<!-- 책 등록 -->
	<div id="bookRegistForm" class="modal">
		<span
			onclick="document.getElementById('bookRegistForm').style.display='none'"
			class="close" title="Close Modal">&times;</span>
		<form class="modal-content" action="book.do?job=regist" method="post"
			enctype="multipart/form-data">
			<div class="container">
				<h1>Register Book</h1>
				<hr>
				<label for="bookno"><b>bookno</b></label> <input type="number"
					placeholder="Enter bookno" name="bookno" required> <label
					for="title"><b>title</b></label> <input type="text"
					placeholder="Enter title" name="title" required> <label
					for="price"><b>price</b></label> <input type="number"
					placeholder="Enter price" name="price" required> <label
					for="amount"><b>amount</b></label> <input type="number"
					placeholder="Enter amount" name="amount" required> <label
					for="photo"><b>photo</b></label> <input type="file"
					placeholder="Regist photo" name="photo" style="margin-bottom: 30px;" required>

				<div class="clearfix">
					<button type="submit" class="signupbtn">Register</button>
					<button type="button"
						onclick="document.getElementById('bookRegistForm').style.display='none'"
						class="cancelbtn">Cancel</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Modal js -->
	<script>
		// Get the modal
		var modal1 = document.getElementById('joinForm');
		var modal2 = document.getElementById('loginForm');
		var modal3 = document.getElementById('bookRegistForm');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal1) {
				modal1.style.display = "none";
			} else if (event.target == modal2) {
				modal2.style.display = "none";
			} else if (event.target == modal3) {
				modal3.style.display = "none";
			}
		}
	</script>
	
	
	
	
	
</body>
</html>