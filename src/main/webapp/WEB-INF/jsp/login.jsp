<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<html>  
<head>  
<style>  
.error{color:red}  
</style>  
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>  
<body>  
<div class="container">
        <div class="row justify-content-center align-items-center" style="height:100vh">
            <div class="col-4">
                <div class="card">
                    <div class="card-body">
                    <h3>Đăng nhập</h3>
                        <form action="/com.spring/j_spring_security_check" method="post" autocomplete="off">
                        <br>
                            <div class="form-group">
                            <h6>Tài khoản</h6>
                                <input type='text' name='name' value='' class="form-control" placeholder="Tài khoản">
                            </div>
                            <br>
                            <div class="form-group">
                            <h6>Mật khẩu</h6>
                                <input type='password' name='pass' class="form-control" placeholder="Mật khẩu">
                            </div>
                            <br>
                            <button name="submit" type="submit" value="submit" class="btn btn-primary">Đăng nhập</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>  
</html>  


<!------ Include the above in your HEAD tag ---------->

<!-- no additional media querie or css is required -->
