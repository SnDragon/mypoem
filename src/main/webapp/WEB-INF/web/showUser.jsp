<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>个人中心</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
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
            
            <div class="col-xs-8 col-xs-push-1 my-infos">
                <span class="title">我的资料</span>
                <div class="content">
                    <!--<form id="infosForm" action="#">-->

                    <!--</form>-->
                    <form method="post" action="<%=basePath%>/user/changeIcon/${user.userId}" enctype="multipart/form-data">
                    <div class="icon">
                        <c:choose>
				    		<c:when test="${user.userIcon!=null }">
				    			<img src="<%=path %>/img/user/${user.userIcon}" alt="">
				    		</c:when>
				    		<c:otherwise>
				    			<img src="<%=path %>/img/user/userDefault.jpeg" alt="">
				    		</c:otherwise>
    					</c:choose>
                        <button type="button" class="change btn btn-default">更换头像</button>
                        <input type="file" class="hide" id="icon-file" name="file" />
                        <div class="icon-change-btn hide">
                            <button class="btn btn-default btn-xs">保存头像</button>
                            <button type="button" class="btn btn-default btn-xs">取消修改</button>
                        </div>
                    </div>
                    </form>
                    <div class="info name">
                        <span class="tag">笔名</span>
                        <span class="value">${user.userName }</span>
                        <!--<span class="change">修改</span>-->
                    </div>
                    <div class="info email">
                        <span class="tag">邮箱</span>
                        <span class="value">${user.userEmail }</span>
                        <!--<span class="change">查看</span>-->
                    </div>
                    <div class="info password">
                        <span class="tag">密码</span>
                        <span class="value">12345678</span>
                        <!--<span class="change to-security">修改</span>-->
                    </div>
                    <div class="info signature">
                        <span class="tag">个性签名</span>
                        <span class="user_motto value">${user.userMotto }</span>
                        <span class="change not-to">编辑</span>
                        <div class="old hide">
                            <span class="sig">现个性签名</span>
                            <span></span>
                        </div>
                        <div class="new hide">
                            <span class="sig">新个性签名</span>
                            <textarea type="text" name="new_signature" id="new_signature" class="form-control" placeholder="输入新的个性签名"></textarea>
                            <span>30</span>
                        </div>
                        <button id="save_intro" class="save hide btn btn-default">保存</button>
                    </div>
                    <!--<div class="info phone">-->
                        <!--<span class="tag">手机号</span>-->
                        <!--<span class="value">18823244553</span>-->
                        <!--<span class="change to-security">修改</span>-->
                    <!--</div>-->
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/mine.js"></script>
<script>
$(document).ready(function(){
	if("${user}"!=""){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	$(".menu li:eq(3)").addClass("current-page");
	$(".mine-sidebar li:eq(0)").addClass("active");
});
</script>
<script type="text/javascript">
$(document).on("click", ".signature button", function () {
    var $count = $(this).siblings(".new").find("span").eq(1);
    if($count.html() < 0){
        return false;
    }else{
    	 var new_sig = $(this).siblings(".new").find("textarea").val();
    	 
    	$.ajax({
    		type:"POST",
    		url:"<%=basePath%>/user/updateUserMotto/${user.userId}",
    		data:{
    			user_intro:new_sig
    		},
    		dataType:"text",
    		success:function(data){
    			if(data=="success"){
    				alert("保存成功！");
    				$(".user_motto").html(new_sig);
    				$(".info .not-to").click();    
    			}else{
    				alert("保存失败!");
    			}
    		}
    	});
       
        
    }
});
</script>
</body>
</html>