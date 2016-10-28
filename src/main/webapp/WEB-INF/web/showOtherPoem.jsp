<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${poem.poemTitle }</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/otherSpecific.css" />
</head>
<body>
<%@include file="header.jsp" %>

<div class="content-wrap">
    <div class="container">
        <div class="row">
            <main class="col-md-8 col-md-push-2 main-content">
                <div class="head">
                    <h3 class="title">${poem.poemTitle }</h3>
                    <span class="author">${poem.authorName }</span>
                    <span class="time">${poem.publishTime }</span>
                </div>
                <div class="body" id="poem-content">
                </div>
                <nav>
                    <ul class="pager">
                    	<c:if test="${prev.poemId!=null }">
                    		<li><a href="<%=basePath%>/poem/oid/${prev.poemId}">上一篇：${prev.poemTitle }</a></li>
                    	</c:if>
						<c:if test="${next.poemId!=null }">
                    		<li><a href="<%=basePath%>/poem/oid/${next.poemId}">下一篇：${next.poemTitle }</a></li>
                    	</c:if>                   
                    </ul>
                </nav>
            </main>
        </div>
    </div>
</div>
<input type="hidden" value="${user.userId }" id="userId"/>

<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var poemText="${poem.poemText}".split("|");
	var str="";
	for(var i in poemText){
		str=str+"<br/>"+poemText[i];
	}
	$("#poem-content").append(str);
});
</script>
</body>
</html>