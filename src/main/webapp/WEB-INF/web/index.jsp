<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>首页</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/carousel.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/jQuery.toolTip.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/home.css" />
</head>
<body>
<%@include file="header.jsp" %>

<div class="content-wrap">
    <!--<div class="container">-->
        <!--<div class="row">-->
            <!--<main class="col-md-11 main-content">-->
            <main class="main-content">
                <div class="screen">
                    <div class = "caroursel poster-main" data-setting = '{
                        "width":1020,
                        "height":350,
                        "posterWidth":770,
                        "posterHeight":350,
                        "scale":0.8,
                        "dealy":"2000",
                        "algin":"middle",
                        "isAutoplay":"true"
                    }'>
                        <ul class = "poster-list">
                        
                        	<c:forEach items="${homePoemUtils}" var="poem">
                        		<li class = "poster-item">
                                	<a href="<%=basePath %>/poem/pid/${poem.poemId}" target="_blank" class="img">
                                	<img src="<%=basePath %>/img/poem/${poem.poemImg}" alt="${poem.poemTitle}" />
                                	</a>
                            	</li>
                        	</c:forEach>
                        
                        </ul>
                        <div class = "mask"></div>  <!--底部遮罩层-->
                        <a target="_blank" class="title"></a>   <!--诗歌标题，从img的alt获取-->
                        <div class = "poster-btn poster-prev-btn"></div>
                        <div class = "poster-btn poster-next-btn"></div>
                    </div>
                </div>
                <div class="label row">
                    <!--校园、旅游、日常、风景、爱情、友情、励志、思乡、哲理、其他-->
                    <canvas id="labelCanvas"></canvas>
                    <div class="col-xs-2">
                        <div class="img">
                            <img src="<%=basePath %>/img/common/校园.jpg" alt="校园" />
                            <div class="mask-bottom"></div>
                            <span class="label-name">校园</span>
                            <div class="mask-all"></div>
                            <a class="to-specific" href="<%=basePath %>/poem/lid/2" target="_blank">进入标签页</a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="img">
                            <img src="<%=basePath %>/img/common/旅游.jpg" alt="旅游" />
                            <div class="mask-bottom"></div>
                            <span class="label-name">旅游</span>
                            <div class="mask-all"></div>
                            <a class="to-specific" href="<%=basePath %>/poem/lid/4" target="_blank">进入标签页</a>
                        </div>
                    </div>
                    <div class="col-xs-3">
                        <div class="img">
                            <img src="<%=basePath %>/img/common/日常.jpg" alt="日常" />
                            <div class="mask-bottom"></div>
                            <span class="label-name">日常</span>
                            <div class="mask-all"></div>
                            <a class="to-specific" href="<%=basePath %>/poem/lid/6" target="_blank">进入标签页</a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="img">
                            <img src="<%=basePath %>/img/common/风景.jpg" alt="风景" />
                            <div class="mask-bottom"></div>
                            <span class="label-name">风景</span>
                            <div class="mask-all"></div>
                            <a class="to-specific" href="<%=basePath %>/poem/lid/8" target="_blank">进入标签页</a>
                        </div>
                    </div>
                    <div class="col-xs-3">
                        <div class="img">
                            <img src="<%=basePath %>/img/common/爱情.jpg" alt="爱情" />
                            <div class="mask-bottom"></div>
                            <span class="label-name">爱情</span>
                            <div class="mask-all"></div>
                            <a class="to-specific" href="<%=basePath %>/poem/lid/10" target="_blank">进入标签页</a>
                        </div>
                    </div>

                    <div class="col-xs-3">
                        <div class="img">
                            <img src="<%=basePath %>/img/common/友情.jpg" alt="友情" />
                            <div class="mask-bottom"></div>
                            <span class="label-name">友情</span>
                            <div class="mask-all"></div>
                            <a class="to-specific" href="<%=basePath %>/poem/lid/3" target="_blank">进入标签页</a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="img">
                            <img src="<%=basePath %>/img/common/励志.jpg" alt="励志" />
                            <div class="mask-bottom"></div>
                            <span class="label-name">励志</span>
                            <div class="mask-all"></div>
                            <a class="to-specific" href="<%=basePath %>/poem/lid/5" target="_blank">进入标签页</a>
                        </div>
                    </div>
                    <div class="col-xs-3">
                        <div class="img">
                            <img src="<%=basePath %>/img/common/思乡.jpg" alt="思乡" />
                            <div class="mask-bottom"></div>
                            <span class="label-name">思乡</span>
                            <div class="mask-all"></div>
                            <a class="to-specific" href="<%=basePath %>/poem/lid/7" target="_blank">进入标签页</a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="img">
                            <img src="<%=basePath %>/img/common/哲理.jpg" alt="哲理" />
                            <div class="mask-bottom"></div>
                            <span class="label-name">哲理</span>
                            <div class="mask-all"></div>
                            <a class="to-specific" href="<%=basePath %>/poem/lid/9" target="_blank">进入标签页</a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="img">
                            <img src="<%=basePath %>/img/common/其他.jpg" alt="其他" />
                            <div class="mask-bottom"></div>
                            <span class="label-name">其他</span>
                            <div class="mask-all"></div>
                            <a class="to-specific" href="<%=basePath %>/poem/lid/1" target="_blank">进入标签页</a>
                        </div>
                    </div>
                </div>

                <div class="recom-author">
                    <div class="tip">推荐诗人</div>
                    <dl class="authors">
                        <c:forEach items="${homeUserUtils }" var="author" begin="6" end="10">
                        <dd class="author">
                            <a href="<%=basePath %>/user/aid/${author.userId}" target="_blank" class="mytooltip">
                                <span class="name">${author.userName }</span>
                                （<span class="num-of-poem">${author.numOfPoem }</span>首诗
                                <span class="num-of-fans">${author.numOfConcern }</span>个粉丝）
                            </a>
                        </dd>
                        </c:forEach>
                    </dl>
                    <dl class="authors">
                        <c:forEach items="${homeUserUtils }" var="author" begin="11" end="15">
                        <dd class="author">
                            <a href="<%=basePath %>/user/aid/${author.userId}" target="_blank" class="mytooltip">
                                <span class="name">${author.userName }</span>
                                （<span class="num-of-poem">${author.numOfPoem }</span>首诗
                                <span class="num-of-fans">${author.numOfConcern }</span>个粉丝）
                            </a>
                        </dd>
                        </c:forEach>
                    </dl>
                    <div class="icons">
                    	<c:forEach items="${homeUserUtils }" var="author" begin="0" end="5">
	                    	<a href="<%=basePath %>/user/aid/${author.userId}" target="_blank" class="icon mytooltip">
	                    	<c:choose>
	                    		<c:when test="${author.userIcon!=null }">
	                    			<img src="<%=basePath %>/img/user/${author.userIcon}" />
	                    		</c:when>
	                    		<c:otherwise>
	                    			<img src="<%=basePath %>/img/attached/head-icon2.PNG" />
	                    		</c:otherwise>
	                    	</c:choose>
	                            
	                            <div class="info">
	                                <span class="name">${author.userName }</span>
	                                <br />
	                                <span class="num-of-poem">${author.numOfPoem }</span>首诗
	                                <br />
	                                <span class="num-of-fans">${author.numOfConcern }</span>个人关注<span class="gender">他</span>
	                            </div>
	                        </a>
                    	</c:forEach>
                    </div>
                </div>

                <div class="others-poem">
                    <div class="tip">
                        其他平台诗歌推荐
                        <small><a href="<%=basePath %>/poem/others" target="_blank">更多>></a></small>
                    </div>
                    <dl class="poems">
                    <c:forEach items="${otherPoemUtils }" var="poem">
                     <dd class="poem">
                            <a href="<%=basePath %>/poem/oid/${poem.poemId}" target="_blank" class="mytooltip">
                                ${poem.poemTitle }
                            </a>
                            <span class="author-name">${poem.authorName }</span>
                        </dd>
                    </c:forEach>
                       
                        
                    </dl>
                </div>
            </main>
        <!--</div>-->
    <!--</div>-->
</div>
<input type="hidden" value="${user.userId }" id="userId"/>

<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/lib/jquery.carousel.js"></script>
<script src="<%=basePath %>/js/lib/jQuery.toolTip.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/home.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".menu li:eq(0)").addClass("current-page");
});
	
</script>


</body>
</html>