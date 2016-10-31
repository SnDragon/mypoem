<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <script type="text/javascript" src="<%=basePath %>/js/lib/jquery-1.11.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>/css/style/loginStyle.css" />
</head>
<body>
   <div class="header">
    <div class="header_content">
        <a href="#" id="logo"><img src="img/common/logo.png" /></a>
        <ul class="title">
	        <li><a href="<%=basePath%>/login">登录</a></li>
	        <li><a href="<%=basePath%>/register">注册</a></li>
	        <li><a href="#">常见问题</a></li>
            <li><a href="#">关于我们</a></li>
        </ul>
    </div>
    <!-- <h1>登录</h1> -->
	</div>
    <div class="content">
         <form class="form-horizontal" role="form" id="login"  method="post" action="<%=basePath%>/user/doLogin">
          <span class="error hide">该邮箱未注册或密码错误</span>
          <div class="form-group" id="email-group">
            <label for="inputEmail3" class="col-sm-3 control-label">邮箱</label>
            <div class="col-sm-8">
              <input name="email" value="${cookie.email.value }" type="email" class="form-control" id="email" placeholder="请输入邮箱">
            </div>
          </div>
          <div class="form-group" id="password-group">
            <label for="inputPassword3" class="col-sm-3 control-label">密码</label>
            <div class="col-sm-8">
              <input name="password" value="${cookie.password.value }" type="password" class="form-control" id="password" placeholder="请输入6位以上密码">
            </div>
          </div>
          <div class="form-group">
             <div class="col-sm-5 col-sm-offset-2">
                  <div class="checkbox">
                    <label>&nbsp;&nbsp;
                      <input type="checkbox" name="rememberPass" value="true"
                       <c:if test="${cookie.rememberPass.value }">
                      checked="checked"
                      </c:if>
                      />记住密码？
                    </label>
                  </div>
            </div>
            <div class="col-sm-4">
                <div class="checkbox">
               <a href="#">&nbsp;忘记密码？</a>
           </div>
            </div>
          </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-5">
            &nbsp;
              <button type="submit" class="btn  btn_block btn-success ">&nbsp;&nbsp;&nbsp;&nbsp;登录&nbsp;&nbsp;&nbsp;&nbsp;</button>
            </div>
            <div class="col-sm-4">
              <a href="register" class="btn  btn_block btn-info ">&nbsp;&nbsp;&nbsp;&nbsp;注册&nbsp;&nbsp;&nbsp;&nbsp;
              </a>
            </div>
          </div> 
        </form>
    </div>
    

    <div class="footer">
        <p>&copy;2016华南理工大学软件学院</p>
    </div>
</body>
<script type="text/javascript" src="<%=basePath%>/js/style/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if(window.location.href.indexOf("fail")!=-1){
		$(".error").removeClass("hide");
	}
	$("#email").blur(function(){
		var email=$("#email").val();
		var emailReg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if(!emailReg.test(email)){
			$("#email-group").addClass("has-error");
		}else{
			$("#email-group").removeClass("has-error");
		}
	});
	$("#password").blur(function(){
		var password1=$("#password").val();
		if(password1.length<6){
			$("#password-group").addClass("has-error");
		}else{
			$("#password-group").removeClass("has-error");
		}
		$("#password").blur();
	});
	
});
</script>

</html>