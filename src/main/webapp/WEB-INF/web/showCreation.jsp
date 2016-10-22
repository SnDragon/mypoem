<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>我的诗集</title>
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
            <div class="col-xs-8 col-xs-push-1 my-poems">
                <span class="title">我的诗集  ${number }</span>
                <div class="content">
                    <div class="no-poem hide">
                        你还没有任何原创哦 ~
                    </div>
					<div id="content-wrap-div">
                    <c:forEach items="${creationList }" var="poem">
                    	<div class="poem" id="poem-${poem.poemId }">
                        <div class="row">
                            <div class="img col-sm-4">
                            	<c:choose>
                            		<c:when test="${poem.poemImg!=null }">
                            			<img src="<%=basePath %>/img/poem/${poem.poemImg}" alt="我的诗集" />
                            		</c:when>
                            		<c:otherwise>
                            			<img src="<%=basePath %>/img/attached/zheyeshiyiqie.jpg" alt="我的诗集" />
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                            <div class="words col-sm-8">
                                <a href="#" data-toggle="modal" data-target="#poemModal">
                                    <span class="poem-remove glyphicon glyphicon-trash"></span>
                                </a>
                                <div class="poem-title">
                                    <a href="<%=basePath %>/poem/pid/${poem.poemId}" target="_blank" title="${poem.poemTitle }">${poem.poemTitle }</a>
                                </div>
                                <div class="poem-meta">
                                    <span class="poem-author">
                                        <a target="_blank" href="<%=basePath %>/user/aid/${user.userId}" title="${user.userName }">${user.userName }</a>
                                    </span>
                                    <time class="poem-time" id="time-${poem.poemId }">2016-9-3</time>
                                </div>
                                <div class="poem-content" id="content-${poem.poemId }">  <!--显示三句-->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <script type="text/javascript">
                    	$("#time-${poem.poemId}").html(transferTime(Number("${poem.poemPublishTime.time}")));
                    	var rows="${poem.poemText}".split("|", 3);
                    	var str="";
                    	for(var i in rows){
                    		str=str+"<p>"+rows[i]+"</p>";
                    	}
                    	$("#content-${poem.poemId}").append(str);
                    	
                    </script>
                    </c:forEach>
					</div>
                   
                </div>
                <!--分页-->
                <div class="pageWrap">
                    <div id="poemPage" class="m-pagination"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--“删除诗”模态框-->
<div class="modal" id="poemModal" data-backdrop="false" data-keyboard="false" remove-id="">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">移除收藏</h4>
            </div>
            <div class="modal-body">
                确定移除
                《<span></span>》
                ？
            </div>
            <div class="modal-footer">
                <button class="yes btn btn-primary">确定</button>
                <button type="button" class="no btn btn-primary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
    <input type="hidden" id="poem-id-input" value="" />
</div>
<input type="hidden" id="basePath" value="<%=basePath %>" />
<input type="hidden" id="userId" value="${user.userId }" />



<!--<script src="js/lib/bootstrap.js"></script>-->
<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/lib/jquery.pagination-1.2.1.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/mine.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	if("${user}"!=""){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	$(".menu li:eq(3)").addClass("current-page");
	$(".mine-sidebar li:eq(4)").addClass("active");

	var $title=$("span.title");
	var num=$title.html().slice(5);
    if(Number(num)==0){
    	$(".no-poem").removeClass("hide");
    }
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