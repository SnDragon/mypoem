<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <!-- 不能与其他页面声明的变量相同，不然会报错 -->
<%String path=request.getContextPath(); %>
<!--为header设置背景图片-->
<header class="main-header">
    <!--当图片无法显示时，显示以下内容-->
    <div class="container hide">
        <div class="row">
            <div class="col-sm-12">
                <!--<h2 class="text-hide">这是一个现代诗分享平台</h2>  &lt;!&ndash;未设置样式&ndash;&gt;-->
                <h2>生活除了眼前的苟且，还有诗和</h2>  <!--未设置样式-->
                <h2>远方</h2>
            </div>
        </div>
    </div>
    <div class="header">
        <div class="header_content">
            <ul class="title">
          	<c:choose>
          		<c:when test="${user==null }">
	          		<li><a href="<%=path %>/login">登录</a></li>
	             	<li><a href="<%=path %>/register">注册</a></li>
          		</c:when>
          		<c:otherwise>
          			<li><a href="">欢迎,${user.userName }</a></li>
          			<li><a href="<%=path %>/user/logout">退出</a></li>
          		</c:otherwise>
          	</c:choose>
            	
             	<li><a href="#">常见问题</a></li>
                <li><a href="#">关于我们</a></li>
                
                
            </ul>
        </div>
    </div>
    <div class="icon">
    	<c:choose>
    		<c:when test="${user.userIcon!=null }">
    			<img src="<%=path %>/img/user/${user.userIcon}" alt="">
    		</c:when>
    		<c:otherwise>
    			<img src="<%=path %>/img/user/userDefault.jpeg" alt="">
    		</c:otherwise>
    	</c:choose>
        
        <p class="signature user_motto" >
        <c:choose>
        <c:when test="${user.userMotto!=null }">
    			${user.userMotto }
    		</c:when>
    		<c:otherwise>
    			暂无签名
    		</c:otherwise>
        </c:choose>
        	
        </p>
    </div>
</header>
<!--导航栏-->
<nav class="main-navigation">
    <div id="main-menu">
        <ul class="menu">
            <li><a href="<%=path%>">首页</a></li>
            <li><a href="<%=path %>/recommend">今日推荐</a></li>
            <li class="hide friendCircle"><a href="<%=path %>/user/friendCircle">朋友圈</a></li>
            <li class="hide person"><a href="<%=path%>/user/uid/${user.userId}">个人中心</a></li>
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
        <li><a href="<%=path%>">首页</a></li>
        <li><a href="<%=path%>/recommend">今日推荐</a></li>
        <li class="hide friendCircle"><a href="<%=path%>/user/friendCircle">朋友圈</a></li>
        <li class="hide person"><a href="<%=path%>/user/uid/${user.userId}">个人中心</a></li>
    </ul>
</div>
