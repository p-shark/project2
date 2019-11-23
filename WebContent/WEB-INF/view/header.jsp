<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<style>

@import 'https://fonts.googleapis.com/css?family=Roboto:400,500';

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, ol, ul, li, form, legend, label, table, header, footer, nav, section, figure {
  margin: 0;
  padding: 0;
}

header, footer, nav, section, article, hgroup, figure {
  display: block;
}

body {
  font-family: 'Roboto', sans-serif;
  font-size: 100%;
  line-height: 1.5;
}

/* menu */
.container {
  width: 90%;
  margin-left: auto;
  margin-right: auto;
  max-width: 1200px;
}

.container:after {
  content: "";
  display: table;
  clear: both;
}

.container {
  margin-left: auto;
  margin-right: auto;
  width: 90%;
  max-width: 1200px;
}

ul{
	list-style: none;
}

ul li {
	display: inline-block;
}

/* 로그인, 회원가입 */
.login{
	float: right;
	margin-top: 14px;
}

header nav ul li a{
	font-weight: bold;
	color: white;
	text-decoration: none;
	margin-right: 30px;
}

.row{
	margin-bottom: 0;
	padding-bottom: 0;
}

/* 
Full screen background image
*/
.hero {
  background: url('https://hd.unsplash.com/photo-1454165804606-c3d57bc86b40');
  background-size: cover;
  width: 100%;
  position: relative;
}

/*
Blueish tint overlay
*/
.hero:after {
  content: '';
  background: cornflowerblue;
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
}

/* 
Making sure everything in .hero sits above our :after elements 
*/
.hero * {
  position: relative;
  z-index: 1;
}

#masthead {
  padding: 1em 0;
  position: relative;
}

#masthead.is-active {
  box-shadow: 0 4px 4px rgba(0, 0, 0, 0.15);
}

/*
Using this method because browsers can transition opacity very cheaply as opposed to using background: rgba
https://www.html5rocks.com/en/tutorials/speed/high-performance-animations/
*/
#masthead:after {
  content: '';
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: #fff;
  opacity: 0;
  transition: opacity 0.3s ease;
}

#masthead.is-active:after {
  opacity: 1;
}

/*!
 * Hamburgers
 * @description Tasty CSS-animated hamburgers
 * @author Jonathan Suh @jonsuh
 * @site https://jonsuh.com/hamburgers
 * @link https://github.com/jonsuh/hamburgers
 */
.hamburger {
  background-color: transparent;
  border: 0;
  color: inherit;
  cursor: pointer;
  display: inline-block;
  float: left;
  font: inherit;
  margin: 0.8125em 0 0;
  overflow: visible; 
  outline: none;
  padding: 0;
  text-transform: none;
  transition: opacity 0.15s;
  -webkit-appearance: none;
}

.hamburger:hover {
  opacity: 0.7; 
}

.hamburger-box {
  width: 30px;
  height: 24px;
  display: inline-block;
  position: relative; 
}

.hamburger-inner {
  display: block;
  top: 50%;
  margin-top: -2px; 
}

.hamburger-inner, 
.hamburger-inner::before, 
.hamburger-inner::after {
  width: 30px;
  height: 2px;
  background-color: #fff;
  border-radius: 4px;
  position: absolute;
  transition-property: -webkit-transform;
  transition-property: transform;
  transition-property: transform, -webkit-transform;
  transition-duration: 0.15s;
  transition-timing-function: ease; 
}

#masthead.is-active .hamburger-inner, 
#masthead.is-active .hamburger-inner::before, 
#masthead.is-active .hamburger-inner::after {
    background-color: #000;
}

.hamburger-inner::before, 
.hamburger-inner::after {
  content: "";
  display: block; 
}

.hamburger-inner::before {
  top: -6px; 
}

.hamburger-inner::after {
  bottom: -6px; 
}

/*
 * Boring
 */
.hamburger--boring .hamburger-inner, 
.hamburger--boring .hamburger-inner::before, 
.hamburger--boring .hamburger-inner::after {
  transition-property: none; 
}

.hamburger--boring.is-active .hamburger-inner {
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg); 
}

.hamburger--boring.is-active .hamburger-inner::before {
  top: 0;
  opacity: 0; 
}

.hamburger--boring.is-active .hamburger-inner::after {
  bottom: 0;
  -webkit-transform: rotate(-90deg);
  transform: rotate(-90deg); 
}

.hamburger-label {
  color: #fff;
  display: inline-block;
  font-weight: 700;
  letter-spacing: 0.08em;
  line-height: 1;
  margin-left: 0.3125em;
  text-transform: uppercase;
}

#masthead.is-active .hamburger-label {
  color: #000;
}

.hamburger-box,
.hamburger-label {
  display: inline-block;
  vertical-align: middle;
}

#site-nav {
  clear: both;
  display: flex;
  flex-direction: column; 
  height: 0;
  overflow: hidden;
  padding-top: 2.5em;
}

#site-nav.is-active {
  height: auto;
  overflow: visible;
}

#site-nav .col { 
  padding-bottom: 2.5em;
} 

@media screen and (min-width: 550px) {
  #site-nav {
    flex-direction: row;
    flex-wrap: wrap;
  }
  
  #site-nav .col {
    flex: 0 0 50%;
  } 
}

@media screen and (min-width: 768px) {
  #site-nav .col {
    flex: 0 0 33.333333333%;
  } 
}

@media screen and (min-width: 960px) {
  #site-nav {
    flex-wrap: nowrap;
  }
  
  #site-nav .col {
    flex: 0 0 20%;
  } 
  
  #site-nav .col:last-child {
    display: flex;
    justify-content: flex-end;
  }  
}

#site-nav h4 {
  letter-spacing: 0.05em;
  text-transform: uppercase;
}

#site-nav ul {
  list-style-type: none;
  margin-top: 1em;
}

#site-nav li {
  margin-bottom: 0.3125em;
}

#site-nav li a {
  color: #b4b9ba;
  text-decoration: none;
  transition: color 0.3s ease;
}

#site-nav li a:hover,
#site-nav li a:focus {
  color: #686d6e;
}

#site-nav .social {
  margin: 0;
  overflow: hidden;
}

#site-nav .social li {
  float: left;
  margin: 0 0.3125em;
  width: 32px;
  height: 32px;
}

#site-nav .social li svg {
  display: block;
  fill: #b4b9ba;
  width: 100%;
  height: 100%;
  transition: fill 0.3s ease;
}

#site-nav .social li:hover svg {
  fill: #686d6e;
}

#masthead-search {
  float: right;
  margin-top: 0.625em;
  width: 100%;
  max-width: 14em;
  position: relative;
  -webkit-appearance: none;
}

#masthead-search input {
  background: transparent;
  border: none;
  border-color: #fff;
  border-style: solid;
  border-width: 1px;
  border-radius: 50px;
  outline: none;
  width: 100%;
  padding: 0.75em 1.125em;
  transition: border-color 0.3s ease;
  -webkit-appearance: none;
}

#masthead-search button {
  background: none;
  border: none;
  color: #fff;
  font-size: 1em;
  padding: 0;
  position: absolute;
  top: 50%;
  right: 0.75em;
  transform: translateY(-50%);
  -webkit-appearance: none;
}

#masthead.is-active #masthead-search button {
  color: #b4b9ba;
}

#masthead.is-active #masthead-search input {
  border-color: #b4b9ba;
}

#masthead-search ::-webkit-input-placeholder {
    color:    #fff;
}

#masthead-search :-moz-placeholder {
   color:    #fff;
   opacity:  1;
}

#masthead-search ::-moz-placeholder {
   color:    #fff;
   opacity:  1;
}

#masthead-search :-ms-input-placeholder {
   color:    #fff;
}

#masthead.is-active #masthead-search ::-webkit-input-placeholder {
    color:    #b4b9ba;
}

#masthead.is-active #masthead-search :-moz-placeholder {
   color:    #b4b9ba;
   opacity:  1;
}

#masthead.is-active #masthead-search ::-moz-placeholder {
   color:    #b4b9ba;
   opacity:  1;
}

#masthead.is-active #masthead-search :-ms-input-placeholder {
   color: #b4b9ba
}

#masthead .col {
  opacity: 0;
}

#masthead.is-active .col {
  transform: translateY(40px);
  transition: opacity 0.3s ease;
  animation: fade-in-stagger 0.8s ease forwards;
}

#masthead.is-active .col:nth-child(1) {
    -webkit-animation-delay: 0;
}

#masthead.is-active .col:nth-child(2) {
    -webkit-animation-delay: 0.1s;
}

#masthead.is-active .col:nth-child(3) {
    -webkit-animation-delay: 0.2s;
}

#masthead.is-active .col:nth-child(4) {
    -webkit-animation-delay: 0.3s;
}

#masthead.is-active .col:nth-child(5) {
    -webkit-animation-delay: 0.4s;
}

@keyframes fade-in-stagger {
  to {
    opacity: 1;
    transform: translateY(0); 
  }
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="hero">
		<header id="masthead" role="banner">
			<div class="container">
				<button class="hamburger hamburger--boring" type="button">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span> <span class="hamburger-label">Menu</span>
				</button>
				<u:notLogin>
					<nav class=login>
						<ul>
							<li><a onclick="document.getElementById('loginForm').style.display='block'"  style="cursor: pointer">login</a></li>
							<li><a onclick="document.getElementById('joinForm').style.display='block'"  style="cursor: pointer">sign up</a></li>
						</ul>
					</nav>
				</u:notLogin>
				<u:isLogin>
					<nav class=login>
						<ul>
							<li style="color: white;">${authUser.name }님환영합니다.</li>
							<li><a href="logout.do">logout</a></li>
						</ul>
					</nav>
				</u:isLogin>

				<nav id="site-nav" role="navigation">
					<div class="col">
						<h4>BookStore</h4>
						<ul>
							<li><a
						onclick="document.getElementById('bookRegistForm').style.display='block'" style="cursor: pointer">Register Book</a></li>
							<li><a href="book/listbook.do">Today`s Book List</a></li>
						</ul>
					</div>
					<div class="col">
						<h4>Results</h4>
						<ul>
							<li><a href="#">Case Studies</a></li>
							<li><a href="#">Client Partners</a></li>
						</ul>
					</div>
					<div class="col">
						<h4>Company</h4>
						<ul>
							<li><a href="#">Our Story</a></li>
							<li><a href="#">Our Team</a></li>
							<li><a href="#">Our Culture</a></li>
							<li><a href="#">News</a></li>
							<li><a href="#">Join Us</a></li>
						</ul>
					</div>
					<div class="col">
						<h4>Approach</h4>
						<ul>
							<li><a href="#">Digital Transformation</a></li>
							<li><a href="#">Digital Readiness Tool</a></li>
							<li><a href="#">Solution Partners</a></li>
						</ul>
					</div>
					<div class="col">
						<ul class="social">
							<li><a href=""><svg title="Facebook">
										<use xlink:href="#icon-facebook"></use></svg></a></li>
							<li><a href=""><svg title="Twitter">
										<use xlink:href="#icon-twitter"></use></svg></a></li>
							<li><a href=""><svg title="LinkedIn">
										<use xlink:href="#icon-linkedin"></use></svg></a></li>
						</ul>
					</div>
				</nav>
			</div>
		</header>
	</div>
	
	<!-- Menu js -->
	<script>
	$(function() {
	    $('body').addClass('js');
	  
	    var $hamburger = $('.hamburger'),
	        $nav = $('#site-nav'),
	        $masthead = $('#masthead');
	  
	    $hamburger.click(function() {
	      $(this).toggleClass('is-active');
	      $nav.toggleClass('is-active');
	      $masthead.toggleClass('is-active');
	      return false; 
	    });
	});
	</script>
	
</body>
</html>