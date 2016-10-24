<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>安全中心</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/main.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/mine.css" />
</head>
<body>
<%@include file="header.jsp" %>
<!--主体-->
<div class="content-wrap">
    <div class="container">
        <div class="row">
           <jsp:include page="navigation.jsp" />
            <div class="col-xs-8 col-xs-push-1 my-security">
                <div class="content">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="mySecurityPassword.html">修改密码</a></li>
                    </ul>
                    <div class="page password">
                        <form id="passwordForm" action="#">
                            <div class="input-group old">
                                <span class="input-group-addon">原密码</span>
                                <input name="oldPass" id="oldpass" type="password" placeholder="输入你的原密码" class="form-control" />
                            </div>
                            <div class="input-group new">
                                <span class="input-group-addon">新密码</span>
                                <input name="newPass" id="newpass" type="password" placeholder="设置你的新密码" class="form-control" />
                            </div>
                            <div class="input-group again">
                                <span class="input-group-addon">确认新密码</span>
                                <input name="againpass" id="againpass" type="password" placeholder="再次输入你的新密码" class="form-control" />
                            </div>
                            <button id="modifyPass" type="submit" class="change btn btn-default">修改</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/lib/jquery.validate.js"></script>
<script src="<%=basePath %>/js/lib/jquery.validate.messages_cn.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/mine.js"></script>
<script>
$(document).ready(function(){
	if("${user.userId}"){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	$(".menu li:eq(3)").addClass("current-page");
	$(".mine-sidebar li:eq(6)").addClass("active");
});
</script>
<script>
$("#modifyPass").click(function(){
	$.ajax({
		type:"POST",
		url:"<%=basePath%>/user/updatePass/${user.userId}",
		data:{
			oldPass:$("#oldpass").val(),
			newPass:$("#newpass").val(),
			againPass:$("#againpass").val()
		},
		dataType:"text",
		success:function(data){
			if(data=="success"){
				alert("修改成功");
			}else if(data=="wrong"){
				alert("原密码错误！");
			}else{
				alert("修改失败！请联系管理员");
			}
		}
	});
});
</script>
</body>
</html>