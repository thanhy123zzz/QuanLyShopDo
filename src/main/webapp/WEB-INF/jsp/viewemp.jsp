<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="page-section portfolio" id="portfolio">
	<div class="container">
		<!-- Portfolio Section Heading-->
		<h2
			class="page-section-heading text-center text-uppercase text-secondary mb-0">Các
			sản phẩm</h2>
		<br>

		<div class="row">
			<div class="col">
				<select class="form-select form-select-lg mb-3 "
					aria-label=".form-select-lg example"
					onchange="location = this.options[this.selectedIndex].value;">
					<option disabled selected hidden></option>
					<option value="/com.spring/admin/viewemp1"
						<c:if test ="${typeid == null}">selected</c:if>>Tất cả</option>
					<c:forEach var="type" items="${types}">
						<option <c:if test ="${typeid == type.id}">selected</c:if>
							value="/com.spring/admin/viewemp/${type.id}">${type.type}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-6 mx-auto">
				<form class="form-group" action="/com.spring/admin/viewemp">
					<div class="input-group">
						<input type="text" class="form-control form-control-lg mb-3"
							placeholder="Tìm kiếm" aria-label="Recipient's username"
							name="keyword">
						<div class="input-group-append">
							<button class="btn btn-lg btn-primary mb3" type="submit">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- Icon Divider-->
		<div class="divider-custom">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fas fa-star"></i>
			</div>
			<div class="divider-custom-line"></div>

		</div>

		<!-- Portfolio Grid Items-->
		<div class="row justify-content-center">
			<!-- Portfolio Item 1-->
			<c:forEach var="emp" items="${list1}">
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal1">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">

							<div
								class="portfolio-item-caption-content text-center text-white">
								<a href="/com.spring/admin/sua-san-pham/${emp.id}"><i
									class="fa fa-pencil fa-3x"></i></a> / &nbsp;
								<c:if test="${typeid!=null}">
									<a onclick="return alertFn()"
										href="/com.spring/admin/viewemp/${typeid }/xoa/${emp.id }"><i
										class="fas fa-times-circle fa-3x"></i></a>
								</c:if>
								<c:if test="${typeid==null}">
									<a onclick="return alertFn()"
										href="/com.spring/admin/viewemp${page}/xoa/${emp.id }"><i
										class="fas fa-times-circle fa-3x"></i></a>
								</c:if>
							</div>
						</div>
						<img class="img-fluid"
							src="/com.spring/admin/<c:out value='${emp.id}'/>" alt="..."
							style="width: 400px; height: 300px" />
					</div>
					<div class="card-body p-4">
						<div class="text-center">
							<h5>${ emp.name}</h5>
							<h6>${emp.price}VNĐ|&nbsp;Sốlượngcòn:${emp.amount}</h6>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="text-center">
			<nav aria-label="text-center">
				<ul class="pagination justify-content-center">

					<c:set var="myTest" value="${soluongPage}" />

					<%
					for (int i = 1; i <= (int) pageContext.getAttribute("myTest"); i += 1) {
					%>
					<li class="page-item"><a class="page-link"
						href="/com.spring/admin/viewemp<%=i%>"> <%=i%>
					</a></li>
					<%
					}
					%>

				</ul>
			</nav>
		</div>
	</div>
</section>
<section class="page-section bg-primary text-white mb-0" id="contact">
	<div class="container">
		<!-- About Section Heading-->
		<h2 class="page-section-heading text-center text-uppercase text-white">Sản
			phẩm</h2>
		<!-- Icon Divider-->
		<div class="divider-custom divider-light">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fas fa-star"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
		<!-- About Section Content-->
		<!-- About Section Button-->
		<div class="text-center mt-4">
			<a class="btn btn-xl btn-outline-light"
				href="/com.spring/admin/them-san-pham"> Thêm sản phẩm </a>
		</div>
	</div>
</section>


