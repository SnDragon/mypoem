<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>首页</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/main.css" />
</head>
<body>
<%@include file="header.jsp" %>
<!--导航栏-->
<nav class="main-navigation">
    <div id="main-menu">
        <ul class="menu">
            <li class="current-page"><a href="<%=basePath%>/index">首页</a></li>
            <li><a href="recommend.html">今日推荐</a></li>
            <li class="hide friends"><a href="<%=basePath %>/user/friendCircle">朋友圈</a></li>
            <li class="hide person"><a href="mine.html">个人中心</a></li>
        </ul>
        <!--小屏幕时显示的导航栏，默认隐藏-->
        <span class="menu-small hide glyphicon glyphicon-chevron-down"></span>
    </div>

    <!--搜索框  样式有待改善-->
    <div id="main-search">
        <form id="form-search" action="" method="post">
            <div class="input-group">
                <input name="poem-search" type="text" class="form-control poem-search" value="搜索" />
                <button class="btn btn-default" onclick="document.getElementById('form-search').submit()">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </div>
        </form>
    </div>
</nav>
<!--小屏幕时点击扩展图标的下拉菜单，默认隐藏-->
<div class="assit-menu">
    <ul class="menu">
        <li class="current-page"><a href="home.html">首页</a></li>
        <li><a href="recommend.html">今日推荐</a></li>
        <li class="hide friends"><a href="friends.html">朋友圈</a></li>
        <li class="hide person"><a href="mine.html">个人中心</a></li>
    </ul>
</div>


<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/style/main.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script type="text/javascript">
	if("${user}"!=""){
		$(".friends").removeClass("hide");
		$(".person").removeClass("hide");
	}
</script>
</body>
</html>