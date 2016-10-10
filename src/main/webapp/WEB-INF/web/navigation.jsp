<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<nav class="col-xs-2 col-xs-push-1 mine-sidebar">
	<ul>
		<!--我的资料（包括个人头像，Name，性别，个性签名，地区等），我的收藏，-->
		<!--安全中心（修改密码等），关于（这是对这个app的简单介绍与团队介绍）-->
		<li><a href="<%=path %>/user/uid/${user.userId}" title="我的资料"> 
		<span class="data">我的资料</span>
		</a></li>
		<li><a href="<%=path %>/user/concern/${user.userId}"
			title="关注"> <span class="concern">关注</span>
		</a></li>
		<li><a href="<%=path %>/user/collection/${user.userId}"
			title="收藏"> <span class="collection">收藏</span>
		</a></li>
		<li><a href="<%=path %>/user/creation/${user.userId }"
			title="我的原创"> <span class="mypoem">我的原创</span>
		</a></li>
		<li><a href="<%=path %>/user/security/${user.userId}"
			title="安全中心"> <span class="security">安全中心</span>
		</a></li>
		<li><a href="about.html" title="关于"> <span class="about">关于</span>
		</a></li>
	</ul>
</nav>