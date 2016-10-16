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
                        <c:forEach items="${fansList }" var="author">
                    		<li class="fan"  id="author-${author.userId }">
	                            <div class="head">
	                                <a href="<%=basePath %>/user/aid/${author.userId}" title="进入作者主页" target="_blank">
	                                    <c:choose>
	                                    	<c:when test="${author.userIcon!=null }">
	                                    	<img src="<%=basePath %>/img/user/${author.userIcon}" alt="" />
	                                    	</c:when>
	                                    	<c:otherwise><img src="<%=basePath %>/img/attached/head-icon1.jpg" alt="" /></c:otherwise>
	                                    </c:choose>
	                                </a>
	                            </div>
	                            <div class="info">
	                                <span class="name" title="${author.userName }">${author.userName }</span>
	                                <c:choose>
	                                	<c:when test="${author.userSex==0 }"><span class="gender female glyphicon glyphicon-user"></span></c:when>
	                                	<c:otherwise><span class="gender male glyphicon glyphicon-user"></span></c:otherwise>
	                                </c:choose>
	                            </div>
                        	</li>
                    	</c:forEach>
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
<input type="hidden" id="basePath" value="<%=basePath %>" />
<input type="hidden" id="userId" value="${user.userId }" />

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