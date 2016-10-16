<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>我的收藏</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/jquery.pagination.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/mine.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/recommend.css" />
</head>
<body>
<%@include file="header.jsp" %>

<!--主体-->
<div class="content-wrap">
    <div class="container">
        <div class="row">
            <jsp:include page="navigation.jsp" />
            <div class="col-xs-8 col-xs-push-1 my-collections">
                <span class="title">我的收藏 ${number }</span>
                <div class="content">
                    <div class="no-collection hide">
                        你还没有收藏任何作品哦 ~
                    </div>
                    <div id="collection-wrap-div">
					<c:forEach items="${collectionList }" var="collection">
					<div class="collection" id="collection-${collection.poemId }">
                        <div class="row">
                            <div class="img col-sm-5">
                                <c:choose>
                                	<c:when test="${collection.poemImg!=null }">
                                		<img src="<%=basePath %>/img/poem/${collection.poemImg}" alt="我的收藏" />
                                	</c:when>
                                	<c:otherwise>
                                		<img src="<%=basePath %>/img/attached/zheyeshiyiqie.jpg" alt="我的收藏" />
                                	</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="words col-sm-7">
                                <a href="#" data-toggle="modal" data-target="#colModal">
                                    <span class="col-remove glyphicon glyphicon-trash"></span>
                                </a>
                                <div class="col-title">
                                    <a href="<%=basePath %>/poem/pid/${collection.poemId}" target="_blank" title="${collection.poemTitle }">${collection.poemTitle }</a>
                                </div>
                                <span class="col-author">
                                    <a target="_blank" href="<%=basePath %>/user/aid/${collection.userId}" title="${collection.userName }">${collection.userName }</a>
                                </span>
                                <div class="col-content">
                                    <p>${collection.poemText }</p>
                                </div>
                            </div>
                        </div>
                    </div>
					</c:forEach>
                    </div>

                
                </div>
                <!--分页-->
                <div class="pageWrap">
                    <div id="colPage" class="m-pagination"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--“移除收藏”模态框-->
<div class="modal" id="colModal" data-backdrop="false" data-keyboard="false" remove-id="">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">移除收藏</h4>
            </div>
            <div class="modal-body">
                确定移除对
                《<span></span>》
                的收藏？
            </div>
            <div class="modal-footer">
                <button class="yes btn btn-primary">确定</button>
                <button type="button" class="no btn btn-primary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
    <input type="hidden" id="poem-id-hidden" value="" />
</div>
<input type="hidden" id="basePath" value="<%=basePath %>" />
<input type="hidden" id="userId" value="${user.userId }" />


<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.js"></script>
<script src="<%=basePath %>/js/lib/jquery.pagination-1.2.1.js"></script>
<!--<script src="js/lib/bootstrap.min.js"></script>-->
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/mine.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${user}"!=""){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	$(".menu li:eq(3)").addClass("current-page");
	$(".mine-sidebar li:eq(3)").addClass("active");
	
	var $title=$("span.title");
	var num=$title.html().slice(5);
    if(Number(num)==0){
    	$(".no-collection").removeClass("hide");
    }
    //$("#colPage").page("destroy");
    initCollectionPage();
});
</script>
</body>
</html>