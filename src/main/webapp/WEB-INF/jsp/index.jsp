<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<decorator:title></decorator:title>
<link rel="icon" type="image/x-icon"
	href="<c:url value ="/template/assets/favicon.ico"/>" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js "
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="<c:url value="/template/css/styles.css" />">
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/jsp/layouts/header.jsp"%>
	<decorator:body></decorator:body>
	
	<%@ include file="/WEB-INF/jsp/layouts/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src=" <c:url value="/template/js/scripts.js" />"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script type="text/javascript">
	function alertFn() {
		var agree=confirm("Bạn có muốn thao tác?");
		if (agree)
		 return true ;
		else
		 return false ;
	}
	</script>
</body>

</html>