<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav
	class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
	id="mainNav">
	<div class="container">
		<a class="navbar-brand" href="/com.spring/">Shop StarL</a>
		<button
			class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
			type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			Menu <i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
		
			<ul class="navbar-nav ms-auto">
			
				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded" href="/com.spring/admin/viewemp1#portfolio">Tất cả sản phẩm</a></li>
				<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Thêm sản phẩm</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
					class="nav-link py-3 px-0 px-lg-3 rounded" href="/com.spring/admin/logout">Đăng xuất</a></li>
			</ul>
		</div>
	</div>
</nav>
<header class="masthead bg-primary text-white text-center">
	<div class="container d-flex align-items-center flex-column">
		<!-- Masthead Avatar Image-->
		<img class="masthead-avatar mb-5" src="<c:url value ="/template/assets/img/logoshop.png"/>"
			alt="..." />
		<!-- Masthead Heading-->
		<h1 class="masthead-heading text-uppercase mb-0">Welcome admin'StarL</h1>
		<!-- Icon Divider-->
		<div class="divider-custom divider-light">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fas fa-star"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
		<!-- Masthead Subheading-->
		<p class="masthead-subheading font-weight-light mb-0">Graphic
			Artist - Web Designer - Illustrator</p>
	</div>
</header>