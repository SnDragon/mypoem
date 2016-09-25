<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <script type="text/javascript" src="<%=basePath %>/js/lib/jquery-1.11.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>/css/style/style.css" />
</head>
<body>
    <div class="header">
          <div class="header_content">
            <a href="#" id="logo"><img src="<%=basePath %>/img/common/logo.png" /></a>
            <ul class="title">
                <li><a href="#">关于我们</a></li>
                <li><a href="#">常见问题</a></li>
                <li><a href="#">注册</a></li>
                <li><a href="#">登录</a></li>
            </ul>
          </div>
          <h1>注册</h1>
    </div>
    <div class="content">
         <form class="form-horizontal" role="form" method="post" action="<%=basePath %>/user/doRegister">
          <div class="form-group" id="email-group">
            <label for="inputEmail3" class="col-sm-3 control-label">邮箱</label>
            <div class="col-sm-8">
              <input name="email" type="email" class="form-control" id="email" placeholder="请输入邮箱">
            </div>
          </div>
          <div class="form-group" id="name-group">
            <label for="inputPassword3" class="col-sm-3 control-label">昵称</label>
            <div class="col-sm-8">
              <input name="username" type="text" class="form-control" id="name" placeholder="请输入您的笔名">
            </div>
          </div>
         <div class="form-group has-feedback" id="password1-group">
            <label for="inputPassword3" class="col-sm-3 control-label">密码</label>
            <div class="col-sm-8">
              <input name="password1" type="password" class="form-control" id="password1" placeholder="6个及以上的数字或字符">
            </div>
          </div>
          <div class="form-group" id="password2-group">
            <label for="inputPassword3" class="col-sm-3 control-label">确认密码</label>
            <div class="col-sm-8">
              <input name="password2" type="password" class="form-control" id="password2" placeholder="请输入您上面填写的密码">
            </div>
          </div>
           <div class="form-group">
              <div class="col-sm-offset-3 col-sm-7">
                <button type="submit" id="submit"  class="btn btn-success" >&nbsp;&nbsp;&nbsp;&nbsp;注册成为诗人&nbsp;&nbsp;&nbsp;&nbsp;</button>
              </div>
          </div>
          
        </form>
        <div class="form-group">
              <div class="col-sm-offset-3 col-sm-7">
                <button id="test"  class="btn btn-success" >&nbsp;&nbsp;&nbsp;&nbsp;测试&nbsp;&nbsp;&nbsp;&nbsp;</button>
              </div>
          </div>
    </div>

    <div class="footer">
        <!-- helloworld -->
        <p>&copy;2016华南理工大学软件学院饭饼虫尾</p>
    </div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$("#email").blur(function(){
		var email=$("#email").val();
		var emailReg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if(!emailReg.test(email)){
			$("#email-group").addClass("has-error");
		}else{
			$("#email-group").removeClass("has-error");
			$.ajax({
				type:"POST",
				url:"<%=basePath%>/user/isAccountExisted",
				data:{
					email:$("#email").val()
				},
				dataType:"text",
				success:function(json){
					if("true"==json){
						alert("邮箱已存在");
					}
				}
			});
		}
	});
	$("#name").blur(function(){
		var name=$("#name").val();
		if(!name){
			$("#name-group").addClass("has-error");
		}else{
			$("#name-group").removeClass("has-error");
		}
	});
	$("#password1").blur(function(){
		var password1=$("#password1").val();
		if(password1.length<6){
			$("#password1-group").addClass("has-error");
		}else{
			$("#password1-group").removeClass("has-error");
		}
		$("#password2").blur();
	});
	$("#password2").blur(function(){
		var password1=$("#password1").val();
		var password2=$("#password2").val();
		//这坑得一逼if(!password1===password2)
		if(!(password1===password2)){
			$("#password2-group").addClass("has-error");
		}else{
			$("#password2-group").removeClass("has-error");
		}
	});
	
	$("#test").click(function(){
		if($(".form-group").hasClass("has-error")){
			alert("error");
		}
	});
	
	$("#submit").click(function(){
		
		if($(".form-group").hasClass("has-error")){
			alert("hello");
			return false;
		}
		var email=$("#email").val();
		var pass1=$("#password1").val();
		var pass2=$("#password2").val();
		var name=$("#name").val();
		if(email==""||pass1==""||pass2==""||name==""){
			return false;
		}
	});
	
});
</script>
</html>