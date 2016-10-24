<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>其他平台诗歌推荐</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/jquery.pagination.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/otherPlatform.css" />
</head>
<body>
<%@include file="header.jsp" %>

<div class="content-wrap">
    <div class="container">
        <div class="row">
            <main class="col-md-10 col-md-push-1 main-content">
                <ul>
                <c:forEach items="${otherPoemList }" var="poem">
                	<li class="plat">
                        <a class="plat-title h4" href="<%=basePath %>/poem/oid/${poem.poemId}" target="_blank" onclick="return false;">
                        ${poem.poemTitle }
                        </a>
                        <span class="plat-author">${poem.authorName }</span>
                        <div class="plat-content-wrapper">
                            <div class="plat-content">${poem.poemText }</div>
                        </div>
                    </li>
                </c:forEach>
                    
                </ul>
                <!--分页-->
                <div class="pageWrap">
                    <div id="platPage" class="m-pagination"></div>
                </div>
            </main>
        </div>
    </div>
</div>
<input type="hidden" id="basePath" value="<%=basePath %>" />

<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/lib/jquery.pagination-1.2.1.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/otherPlatform.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${user.userId}"){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	
	var totalItems = Number("${page.totalNum}");
    var itemsEachPage = Number("${page.itemsPerPage}");
    var pages = Math.ceil(totalItems / itemsEachPage);
    if(pages > 1){
        showPage($("#platPage"), totalItems, itemsEachPage);  //调用实现分页插件的函数
        $("#platPage").on("pageClicked", function (event, pageIndex) {
			window.location.href=$("#basePath").val()+"/poem/others?page="+pageIndex;
        });
    }
    
    $(".m-pagination-page li").removeClass("active");
	var currentPage=Number("${page.currentPage}");
	$(".m-pagination-page li").eq(currentPage-1).addClass("active");
});
</script>
</body>
</html>