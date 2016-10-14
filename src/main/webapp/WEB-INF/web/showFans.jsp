<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>我的关注</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/jquery.pagination.css" />
    <!--<link rel="stylesheet" href="css/style/main.css" />-->
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/mine.css" />
</head>
<body>
<%@include file="header.jsp" %>

<!--主体-->
<div class="content-wrap">
    <div class="container">
        <div class="row">
            <jsp:include page="navigation.jsp"></jsp:include>
            <div class="col-xs-8 col-xs-push-1 my-fans">
                <span class="title">我的粉丝 ${number }</span>
                <div class="content">
                    <div class="no-fan hide">
                        你暂时还没有粉丝 ~
                    </div>
                    <ul class="fans">
                        <li class="fan">
                            <div class="head">
                                <a href="wangsai.html" title="进入作者主页" target="_blank">
                                    <img src="<%=basePath %>/img/attached/head-icon1.jpg" alt="" />
                                </a>
                            </div>
                            <div class="info">
                                <span class="name" title="张三张三张三张三张三">张三张三张三张三张三</span>
                                <span class="gender male glyphicon glyphicon-user"></span>
                            </div>
                        </li>
                        <li class="fan">
                            <div class="head">
                                <a href="wangsai.html" title="进入作者主页" target="_blank">
                                    <img src="<%=basePath %>/img/attached/head-icon4.jpg" alt="" />
                                </a>
                            </div>
                            <div class="info">
                                <span class="name" title="张三张三v张三张三张三">张三张三v张三张三张三</span>
                                <span class="gender female glyphicon glyphicon-user"></span>
                            </div>
                        </li>
                        <li class="fan">
                            <div class="head">
                                <a href="wangsai.html" title="进入作者主页" target="_blank">
                                    <img src="<%=basePath %>/img/attached/head-icon2.PNG" alt="" />
                                </a>
                            </div>
                            <div class="info">
                                <span class="name" title="王五">王五</span>
                                <span class="gender female glyphicon glyphicon-user"></span>
                            </div>
                        </li>
                        <li class="fan">
                            <div class="head">
                                <a href="wangsai.html" title="进入作者主页" target="_blank">
                                    <img src="<%=basePath %>/img/attached/head-icon3.jpeg" alt="" />
                                </a>
                            </div>
                            <div class="info">
                                <span class="name" title="王赛">王赛</span>
                                <span class="gender male glyphicon glyphicon-user"></span>
                            </div>
                        </li>
                    </ul>
                </div>
                <!--分页-->
                <div class="pageWrap">
                    <div id="fansPage" class="m-pagination"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.js"></script>
<script src="<%=basePath %>/js/lib/jquery.pagination-1.2.1.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/mine.js"></script>

<script>
$(document).ready(function(){
	if("${user}"!=""){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	$(".menu li:eq(3)").addClass("current-page");
	$(".mine-sidebar li:eq(2)").addClass("active");
});
</script>
</body>
</html>