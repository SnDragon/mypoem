<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>今日推荐</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
	<link rel="stylesheet" href="css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/recommend.css" />
    <script src="<%=basePath %>/js/lib/jquery.min.js"></script>
	<script src="js/lib/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/custom/commonFunction.js"></script>
	
</head>
<body>
<%@include file="header.jsp" %>

<!--好友动态-->
<div class="content-wrap">
    <div class="container">
        <div class="row">
            <!--动态占8列-->
            <main class="col-md-10 col-md-push-1 main-content">
                <c:forEach items="${poemUtilList }" var="poemUtil">
                <div class="recommend">
                    <div class="row">
                        <div class="img col-sm-4">
                        	<div class="img-wrap">
                        	<c:choose>
                        		<c:when test="${poemUtil.poemImg!=null }">
                        			<img src="<%=basePath %>/img/poem/${poemUtil.poemImg }" alt="今日推荐" />
                        		</c:when>
                        		<c:otherwise>
                             		<img src="<%=basePath %>/img/attached/zheyeshiyiqie.jpg" alt="今日推荐" />
                             	</c:otherwise>
                        	</c:choose>
                            </div>
                        </div>
                        <div class="words col-sm-8">
                            <div class="recom-title">
                                <a href="<%=basePath%>/poem/pid/${poemUtil.poemId}">${poemUtil.poemTitle }</a>
                            </div>
                            <div class="recom-content">  <!--显示三句-->
								<c:forEach items="${poemUtil.poemRow }" var="row" begin="0" end="2" varStatus="status">
									<p>${row }
									<c:if test="${status.count==3 }" >
									...
									</c:if>
									</p>
								</c:forEach>
                            </div>
                            <div class="recom-meta">
                                <span class="recom-author">
                                    <a target="_blank" href="<%=basePath%>/user/aid/${poemUtil.userId}">${poemUtil.userName }</a>
                                </span>
                                <time class="recom-time" id="time_${poemUtil.poemId }">2016-9-3</time>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                	var time=transferTime("${poemUtil.poemPublishTime.time}")
                	$("#time_${poemUtil.poemId }").html(time);
                </script>
                </c:forEach>

                
            </main>
        </div>
    </div>
</div>

<script src="js/style/recommend.js"></script>
<script src="js/style/common.js"></script>
<!--  
<script src="js/style/main.js"></script>
-->
<script type="text/javascript">
$(document).ready(function(){
	if("${user.userId}"){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	$(".menu li:eq(1)").addClass("current-page");
	
});
</script>
</body>
</html>