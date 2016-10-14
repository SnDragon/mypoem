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
    <!-- <link rel="stylesheet" href="<%=basePath %>/css/style/main.css" />  -->
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
            <div class="col-xs-8 col-xs-push-1 my-friends">
                <span class="title">全部关注 ${number }</span>
                <div class="content">
                    <div class="no-friend hide">
                        你暂时没有关注其他诗人 ~
                    </div>
                    <ul class="friends">
                    	<c:forEach items="${cocernUserList }" var="author">
                    		<li class="friend"  id="author-${author.userId }">
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
	                            <a href="#" data-toggle="modal" data-target="#concernModal">
	                                <span class="delete">取消关注</span>
	                            </a>
                        	</li>
                    	</c:forEach>
                        
                       
                      
                    </ul>
                </div>
                <!--分页-->
                <div class="pageWrap">
                    <div id="conPage" class="m-pagination"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--“取消关注”模态框-->
<div class="modal" id="concernModal" data-backdrop="false" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">取消关注</h4>
            </div>
            <div class="modal-body">
                确定要取消对
                “<span></span>”
                的关注？
            </div>
            <div class="modal-footer">
                <button class="yes btn btn-primary">确定</button>
                <button type="button" class="no btn btn-primary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
    <input type="hidden" id="hidden-concernId" value="" />
</div>
<input type="hidden" id="basePath" value="<%=basePath%>" />
<input type="hidden" id="userId" value="${user.userId }" />

<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.js"></script>
<script src="<%=basePath %>/js/lib/jquery.pagination-1.2.1.js"></script>
<!--<script src="js/lib/bootstrap.min.js"></script>-->
<!--<script src="js/style/main.js"></script>-->
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/mine.js"></script>
<script>
$(document).ready(function(){
	if("${user}"!=""){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	$(".menu li:eq(3)").addClass("current-page");
	$(".mine-sidebar li:eq(1)").addClass("active");
});
</script>
</body>
</html>