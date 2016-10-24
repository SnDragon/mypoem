<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${label.labelName }</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/dynamic.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/label.css" />
    <script src="<%=basePath %>/js/lib/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/custom/commonFunction.js"></script>
    
</head>
<body>
<%@include file="header.jsp" %>


<div class="content-wrap">
    <div class="container">
        <div class="row">
            <main class="col-md-10 col-md-push-1 main-content">
                <!--作者简单信息-->
                <div class="label-desc">
                    <h1>
                        <small>${label.labelName }</small>
                        <small></small>
                        <small>${label.labelDescription }</small>
                    </h1>
                </div>
				
				<div id="no-poem" class="none-hint hide" >
                    暂时没有这个类型的诗歌，去看看其他类型的吧~
                </div>
                
               <div id="articleDiv">
               <c:forEach items="${poemUtilList }" var="poemUtil">
               	 <article  class="dynamic" id="article-${poemUtil.poemId }">
                    <div class="dynamic-head">
                        <h1 class="dynamic-title">
                            <a href="<%=basePath %>/poem/pid/${poemUtil.poemId}" class="poem-title">${poemUtil.poemTitle }</a>   <!--如何跳转到作者的相应页面，参考ghost网站-->
                        </h1>
                        <div class="dynamic-meta">
                            <span class="dynamic-author">
                                作者：
                                <a target="_blank" href="<%=basePath%>/user/aid/${poemUtil.userId}">${poemUtil.userName }</a>
                            </span>
                            <time id="time_${poemUtil.poemId }" class="dynamic-time">2016年</time>
                        </div>
                    </div>
                    <div class="dynamic-content">
                    	<c:forEach items="${poemUtil.poemRow }" var="row" begin="0" end="4">
                    		<p>${row }</p>
                    	</c:forEach>
                    	<c:if test="${fn:length(poemUtil.poemRow)>5 }">
	                    	<span class="expand">展开全文</span>
	                    	<c:forEach items="${poemUtil.poemRow }" var="row" begin="5">
	                    		<p class="hide">${row }</p>
	                    	</c:forEach>
	                    	<span class="pack-up hide">收起全文</span>
                    	</c:if>
                    </div>
                    <c:if test="${poemUtil.poemImg!=null }">
	                    <div class="row">   <!--用row包裹，给图片设置栅格系统-->
	                        <div class="dynamic-img col-sm-7 col-xs-9">
	                            <img src="<%=basePath %>/img/poem/${poemUtil.poemImg}" alt="这也是一切" />
	                        </div>
	                    </div>
                    </c:if>
                   
                    <div class="dynamic-action">
                        <div class="row">
                            <ul id="${poemUtil.poemId }">
                                <li class="col-xs-3 keep collection 
                                <c:choose><c:when test="${poemUtil.isCollected }">orangeLi</c:when><c:otherwise>grayLi</c:otherwise></c:choose>
                                " >
                                    <span class="glyphicon glyphicon-heart-empty"></span><span>收藏</span>
                                </li>
                                <li class="col-xs-3 share">
                                    <!--触发弹出框的元素设置data-toggle和data-target才可以正常关闭-->
                                    <a href="#" data-toggle="modal" data-target="#myModal">
                                        <span class="glyphicon glyphicon-share"></span><span class="share-number" id="share-span-${poemUtil.poemId }">${poemUtil.poemNumTransmit }</span>
                                    </a>
                                </li>
                                <li class="col-xs-3 comment" >
                                    <span class="glyphicon glyphicon-comment"></span><span class="comment-number" id="comment-span-${poemUtil.poemId }">${poemUtil.poemNumComment }</span>
                                </li>
                                <li class="col-xs-3 thumb support
                                <c:choose><c:when test="${poemUtil.isSupported }">orangeLi</c:when><c:otherwise>grayLi</c:otherwise></c:choose>
                                ">
                                    <span class="glyphicon glyphicon-thumbs-up"></span><span class="thumb-number">${poemUtil.poemNumSupport }</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--点击转发后，出现遮罩层-->


                    <!--点击评论后，显示的评论记录及评论框-->
                     <div class="comment-wrap">
                        <div class="dynamic-comment">
                            <div class="send-comment">
                                <!--不能在评论框前面放用户名，不同长度的用户名会导致评论框的位置变动-->
                                <a class="head-icon" href="<%=basePath %>/user/uid/${user.userId}" target="_blank">
                                    <img src="<%=basePath %>/img/attached/head-icon-mine.jpg" alt="进入我的个人中心" />
                                </a>
                                <textarea name="comment" class="input-comment" rows="2"></textarea>
                                <br />
                                <button class="btn-comment btn btn-default">
                                    评论
                                </button>
                            </div>

                            
                            <div class="more-comment">
                                <span class="more-comment-span">加载更多</span>
                            </div>
                        </div>
                    </div>
                     <script type="text/javascript">
                    var time=transferTime("${poemUtil.poemPublishTime.time}")
                	var id="${poemUtil.poemId}";
                	$("#time_"+id).html(time);
                </script>
                </article>
               
               </c:forEach>

                </div>
            </main>
        </div>
    </div>
</div>

<!--点击转发后，弹出模态框-->
<div class="modal" id="myModal" data-backdrop="false" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">转发</h4>
            </div>
            <div class="modal-body">
                <div class="share-content">
                    <a class="share-author" target="_blank" href="#"></a>
                    : &nbsp;
                    <span class="share-title"></span>
                </div>
                <div class="share-word">
                    <textarea name="share-word" id="share-word" cols="100" rows="5" title="20">请输入转发理由</textarea>
                    <span class="remain-word">120</span>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary">转发</button>
            </div>
        </div>
    </div>
</div>
<input type="hidden" value="<%=basePath%>" id="basePath"/>
<input type="hidden" value="${user.userId }" id="userId"/>
<input type="hidden" value="${user.userName }" id="userName"/>


<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/dynamic.js"></script>
<script src="<%=basePath %>/js/custom/comment.js"></script>
<script src="<%=basePath %>/js/custom/poem.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${user.userId}"){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	
	var $assit_menu = $(".assit-menu .menu");
	if($assit_menu.find("li").eq(2).hasClass("hide")){
		$(".content-wrap").css("margin-top", "80px");
	}else{
		$(".content-wrap").css("margin-top", "3px");
	}
	if($(".dynamic").length==0){
		$("#no-poem").removeClass("hide");
	}
});
</script>
</body>
</html>