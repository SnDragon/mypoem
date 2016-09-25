<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <script type="text/javascript" src="<%=basePath %>/js/lib/jquery-1.11.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>/css/style/style.css" />
</head>
<body>
   <%@include file="header.jsp" %>
    <div class="content">
         <form class="form-horizontal" role="form" id="login"  method="post" action="<%=basePath%>/user/doLogin">
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