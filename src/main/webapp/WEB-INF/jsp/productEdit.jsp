<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.error {
	color: red
}
</style>
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Heading-->
		<h2
			class="page-section-heading text-center text-uppercase text-secondary mb-0">Sửa
			sản phẩm</h2>
		<!-- Icon Divider-->
		<div class="divider-custom">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fas fa-star"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-lg-8 col-xl-7">
			<!-- * * * * * * * * * * * * * * *-->
			<!-- * * SB Forms Contact Form * *-->
			<!-- * * * * * * * * * * * * * * *-->
			<!-- This form is pre-integrated with SB Forms.-->
			<!-- To make this form functional, sign up at-->
			<!-- https://startbootstrap.com/solution/contact-forms-->
			<!-- to get an API token!-->
			<form:form id="contactForm" data-sb-form-api-token="API_TOKEN"
				modelAttribute="product" method="post" action="${product.id}" enctype="multipart/form-data">
				<!-- Name input-->

				<div class="form-floating mb-3">
					<form:input class="form-control" type="text"
						placeholder="Enter your name..." data-sb-validations="required"
						path="name" />
					<label for="name">Tên sản phẩm</label>
				</div>
				<!-- Email address input-->
				<div class="form-floating mb-3">
					<form:input class="form-control" type="text" placeholder="size"
						data-sb-validations="required" path="size" />
					<label for="email">Các size</label>
				</div>
				<!-- Phone number input-->
				<div class="form-floating mb-3">
					<form:input class="form-control" type="text"
						placeholder="(123) 456-7890" data-sb-validations="required"
						path="price" />
					<label for="phone">Giá tiền</label>
				</div>
				<!-- Message input-->
				<div class="form-floating mb-3">
					<form:input class="form-control" id="name" type="text"
						placeholder="Enter your name..." data-sb-validations="required"
						path="amount" />
					<label for="name">Số lượng vào kho</label>
				</div>
				<br>
				<div class="form-floating mb-3">
					<select name="idType" class="form-select form-select-lg mb-3 "
						aria-label=".form-select-lg example">
						<option disabled selected>Thể loại</option>
						<c:forEach var="type" items="${types}">
							<option <c:if test ="${idType == type.id}">selected</c:if>
							 value="${type.id}">${type.type}</option>
						</c:forEach>
					</select>
				</div>
				<br>
				<img class="img-fluid"
							src="/com.spring/admin/<c:out value='${product.id}'/>"
							alt="..." style="width: 400px; height: 300px"/>
				<div class="form-floating mb-3">
					<div class="custom-file">
						<label class="custom-file-label" for="name">Hình ảnh</label> <input
							type="file" class="form-control" id="file"
							placeholder="Enter your name..." name="image"
							data-sb-validations="required" style="border-color: #1abc9c;">
					</div>
				</div>
				<div class="form-floating mb-3">
					<form:textarea class="form-control" id="message" type="text"
						placeholder="Enter your message here..." style="height: 10rem"
						data-sb-validations="required" path="status"></form:textarea>
					<label for="message">Mô tả sản phẩm</label>
				</div>
				<!-- Submit success message-->
				<!---->
				<!-- This is what your users will see when the form-->
				<!-- has successfully submitted-->
				<c:if test="${status==true}">
					<div id="submitSuccessMessage">
						<div class="text-center mb-3">
							<div class="fw-bolder">Sửa thành công!</div>
							Sản phẩm ' ${product.name} ' đã được update. <br />
						</div>
					</div>
				</c:if>
				<c:if test="${status==false}">
					<div id="submitSuccessMessage">
						<div class="text-center mb-3">
							<div class="fw-bolder">sửa thất bai!</div>

							<br />
						</div>
					</div>
				</c:if>
				<button onclick="return alertFn()" class="btn btn-primary btn-xl"
					type="submit">Sửa</button>
			</form:form>
		</div>
	</div>
</section>