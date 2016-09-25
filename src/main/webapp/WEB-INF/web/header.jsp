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
</header>
