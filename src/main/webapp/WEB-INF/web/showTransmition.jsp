<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>我的转发</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/jquery.pagination.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/main.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/mine.css" />
    <script src="<%=basePath %>/js/lib/jquery.min.js"></script>
    <script src="<%=basePath %>/js/custom/commonFunction.js"></script>
    
</head>
<body>
<%@include file="header.jsp" %>

<!--主体-->
<div class="content-wrap">
    <div class="container">
        <div class="row">
            <jsp:include page="navigation.jsp" />
            <div class="col-xs-8 col-xs-push-1 my-shares">
                <span class="title">我的转发 ${number }</span>
                <div class="content">
                    <div class="no-share hide">
                        你还没有转发过任何作品 ~
                    </div>

                   <c:forEach items="${transmitList }" var="transmit" >
                    <div class="share row" id="transmit-${transmit.transmitId }">
                        <a href="#" data-toggle="modal" data-target="#shareModal">
                            <span class="share-remove glyphicon glyphicon-trash"></span>
                        </a>
                        <time class="share-time" id="time-${transmit.transmitId }">2016-9-3</time>
                        <div class="shared-reason col-md-6">${transmit.transmitComment }</div>
                        <div class="orig col-md-6">
                            <div class="img">
                            	<c:choose>
                            		<c:when test="${transmit.poemImg!=null }">
                            			<img src="<%=basePath %>/img/poem/${transmit.poemImg}" alt="我的转发" />
                            		</c:when>
                            		<c:otherwise>
                            			<img src="<%=basePath %>/img/attached/zheyeshiyiqie.jpg" alt="我的转发" />
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                            <a class="orig-title" href="<%=basePath %>/poem/pid/${transmit.poemId}" target="_blank" title="${transmit.poemTitle }">${transmit.poemTitle }</a>
                            <a class="orig-author" target="_blank" href="<%=basePath %>/user/uid/${transmit.authorId } " title="${transmit.authorName }">${transmit.authorName }</a>
                        </div>
                    </div>
                    
                    <script>
                    	$("#time-${transmit.transmitId}").html(transferTime(Number("${transmit.transmitTime.time}")));
                    </script>
                   </c:forEach>



                    
                <!--分页-->
                <div class="pageWrap">
                    <div id="sharePage" class="m-pagination"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--“删除诗”模态框-->
<div class="modal" id="shareModal" data-backdrop="false" data-keyboard="false" remove-id="">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">移除转发</h4>
            </div>
            <div class="modal-body">
                确定移除对
                《<span></span>》
                的转发？
            </div>
            <div class="modal-footer">
                <button class="yes btn btn-primary">确定</button>
                <button type="button" class="no btn btn-primary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
    <input type="hidden" id="remove-id-input" value=""/>
</div>
<input type="hidden" id="userId" value="${user.userId }" />
<input type="hidden" id="basePath" value="<%=basePath %>" />



<script src="<%=basePath %>/js/lib/bootstrap.js"></script>
<script src="<%=basePath %>/js/lib/jquery.pagination-1.2.1.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/myShare.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${user.userId}"){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	$(".menu li:eq(3)").addClass("current-page");
	$(".mine-sidebar li:eq(5)").addClass("active");
	
	var url=window.location.search;
	var index=url.indexOf("page=");
	if(index !=-1){
		var page=url.slice(index+5);
		$("ul.m-pagination-page li").removeClass("active");
		$("ul.m-pagination-page li").eq(page-1).addClass("active");
	}
});
</script>
</body>
</html>