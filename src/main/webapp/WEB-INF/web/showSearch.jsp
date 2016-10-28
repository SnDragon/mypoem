<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>搜索结果</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/jquery.pagination.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/searchResult.css" />
</head>
<body>
<%@include file="header.jsp" %>

<div class="content-wrap">
    <div class="container">
        <div class="row">
            <ul class="nav nav-pills col-xs-10 col-xs-push-1" role="tablist">
                <li role="presentation" class="active"><a href="#">诗人</a></li>
                <li role="presentation"><a href="#">诗歌</a></li>
            </ul>
            <main class="col-xs-10 col-xs-push-1 main-content">
                <div class="authors">
               	 	<div class="no-author hide" id="no-author">没有相应搜索结果</div>
                    <ul>
                    <c:forEach items="${userList }" var="author">
                     <li class="author">
                            <div class="head">
                                <a href="<%=basePath %>/user/aid/${author.userId}" title="进入作者主页" target="_blank">
                                <c:choose>
                                	<c:when test="${author.userIcon!=null }">
                                	<img src="<%=basePath %>/img/user/${author.userIcon}" alt="" />
                                	</c:when>
                                	<c:otherwise>
                                	<img src="<%=basePath %>/img/attached/head-icon1.jpg" alt="" />
                                	</c:otherwise>
                                </c:choose>
                                </a>
                            </div>
                            <div class="info">
                                <span class="name result" title="${author.userName }">${author.userName }</span>
                                <c:choose>
                                	<c:when test="${author.userSex==1 }">
                                		<span class="gender male glyphicon glyphicon-user"></span>
                                	</c:when>
                                	<c:otherwise>
                                	    <span class="gender female glyphicon glyphicon-user"></span>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                    </c:forEach>
                        
                    
                    </ul>
                </div>

                <div class="poems hide">
                 <div class="no-poem hide" id="no-poem" >没有相应搜索结果</div>
                    <ul>
                       <c:forEach items="${poemList }" var="poem">
                       	 <li class="poem">
                            <a class="title h4 result" href="<%=basePath %>/poem/pid/${poem.poemId}" target="_blank">${poem.poemTitle }</a>
                            <a class="author" href="<%=basePath%>/user/aid/${poem.userId}">${poem.userName }</a>
                            <div class="content-wrapper">
                                <div class="content">${poem.poemText }</div>
                            </div>
                        </li>
                       </c:forEach>
                        
                    </ul>
                </div>
            </main>
        </div>
    </div>
</div>
<input type="hidden" value="${user.userId }" id="userId"/>

<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/lib/jquery.pagination-1.2.1.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/searchResult.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	    var $nav = $(".nav-pills");
	    var $authors = $(".authors");
	    var $poems = $(".poems");
	    $nav.find("li").click(function () {
	        if($(this).index() == 0){
	            $(this).addClass("active");
	            $(this).next().removeClass("active");
	            $authors.removeClass("hide");
	            $poems.addClass("hide");
	        }else{
	            $(this).addClass("active");
	            $(this).prev().removeClass("active");
	            $poems.removeClass("hide");
	            $authors.addClass("hide");
	        }
	    });
	    
	    if($(".authors li").length==0){
	    	$("#no-author").removeClass("hide");
	    }
	    if($(".poems li").length==0){
	    	$("#no-poem").removeClass("hide");
	    	
	    }
});
</script>
<script type="text/javascript">
	var key="${key}";
	$(".result").each(function(){
		var text=$(this).html();
		
		if(text.indexOf(key)!=-1){
			var a=new RegExp(key,"g");
			text=text.replace(a,("<em style='color:#F00'>" + key + "</em>"));
		}
		$(this).html(text);
	});
	
	 var txt = 110;
	    var o = document.getElementsByClassName("content");
	    for(var i = 0; i < o.length; i ++){
	        var s = o[i].innerHTML;
	        var p = document.createElement("span");
	        var n = document.createElement("font");
	        p.innerHTML = s.substring(0,txt);
	        n.innerHTML = s.length > txt ? "..." : "";
	        o[i].innerHTML = "";
	        o[i].appendChild(p);
	        o[i].appendChild(n);
	    }
</script>
</body>
</html>