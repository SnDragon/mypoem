<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${author.userName }个人主页</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/dynamic.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/author.css" />
    <!--  
    <link rel="stylesheet" href="<%=basePath %>/css/style/mine.css" />
    -->
    <script src="<%=basePath %>/js/lib/jquery.min.js"></script>
</head>
<body>
<%@include file="header.jsp" %>

<div class="content-wrap">
    <div class="container">
        <div class="row">
            <main class="col-md-10 col-md-push-1 main-content">
                <!--作者简单信息-->
                <div class="author">
                    <div class="author-icon">
                    <c:choose>
                    	<c:when test="${author.userIcon!=null }">
                    		<img src="<%=basePath %>/img/user/${author.userIcon}" alt="作者个人信息" />
                    	</c:when>
                    	<c:otherwise>
                    		<img src="<%=basePath %>/img/attached/head-icon3.jpeg" alt="作者个人信息" />
                    	</c:otherwise>
                    </c:choose>
                        
                    </div>
                     <div class="author-info">
                        <span class="author-name">${author.userName }</span>
                        <c:choose>
                        	<c:when test="${author.userSex==1 }">
                        	<span class="gender male glyphicon glyphicon-user"></span>
                        	</c:when>
                        	<c:otherwise>
                        	<span class="gender female glyphicon glyphicon-user"></span>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="author-signature">
					<c:choose>
						<c:when test="${author.userMotto!=null }">
						${author.userMotto }
						</c:when>
						<c:otherwise>
						这家伙很懒，什么都没说~
						</c:otherwise>
					</c:choose>
					</div>
                    <div class="author-meta">
                        <span class="author-poem">
                            诗集
                            <span class="poem-number">${fn:length(poemUtilList) }</span>
                        </span>
                        &nbsp;&nbsp;&nbsp;
                        <span class="author-concern clickable" id="span-concern">
                            关注
                            <span id="concern-number" class="concern-number">${author.numOfConcern }</span>
                        </span>
                        &nbsp;&nbsp;&nbsp;
                        <span class="author-fans clickable" id="span-fans">
                            粉丝
                            <span id="fans-number" class="fans-number">${author.numOfConcerned }</span>
                        </span>
                        <c:if test="${author.userId!=user.userId }">
                        	<c:choose>
                        		<c:when test="${isConcerned!=null }">
                        			<button id="removeConcern" class="btn btn-default cancel-concern">取消关注</button>			
                        			<button id="addConcern" class="hide btn btn-default add-concern">+关注</button>
                        		</c:when>
                        		<c:otherwise>
                        			<button id="addConcern" class="btn btn-default add-concern">+关注</button>
                        			<button id="removeConcern" class="hide btn btn-default cancel-concern">取消关注</button>
                        		</c:otherwise>
                        	</c:choose>
                        </c:if>
                    </div>

                    <div class="concern hide">
                        <span class="triangle"></span>
                        <ul id="concernList">
                           
                         
                        </ul>
                        <!-- 
                        <span class="show-all hide">显示全部</span>
                        <ul class="more hide">
                            <li>
                                <a href="wangsai.html" title="进入作者主页" target="_blank">
                                    <img src="img/attached/head-icon3.jpeg" alt="" />
                                </a>
                                <span class="name" title="王赛">王赛</span>
                                <span class="gender male glyphicon glyphicon-user"></span>
                            </li>
                        </ul>
                         -->
                    </div>

                    <div class="fans hide">
                        <span class="triangle"></span>
                        <ul id="fanList">
                            
                        </ul>
                        <!--  
                        <span class="show-all hide">显示全部</span>
                        <ul class="more hide">
                        </ul>
                        -->
                    </div>
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
                	var date=new Date(Number("${poemUtil.poemPublishTime.time}"));
                	var Y = date.getFullYear() + '-';
                	M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
                	D = date.getDate() + ' ';
                	var id="${poemUtil.poemId}";
                	$("#time_"+id).html(Y+M+D);
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
        	<input type="hidden" id="modal-poemId" value="" />
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">转发</h4>
            </div>
            <div class="modal-body">
                <div class="share-content">
                    <span class="share-author"></span>
                    : &nbsp;
                    <span class="share-title"></span>
                </div>
                <div class="share-word">
                    <textarea name="share-word" id="share-word" cols="100" rows="5" title="20" placeholder="请输入转发理由"></textarea>
                    <span class="remain-word">120</span>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary transfer-button" id="share-button">转发</button>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="userId" value="${user.userId }" />
<input type="hidden" id="authorId" value="${author.userId }" />
<input type="hidden" id="basePath" value="<%=basePath %>" />
<input type="hidden" id="userName" value="${user.userName }" />

<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/dynamic.js"></script>
<script src="<%=basePath %>/js/style/author.js"></script>
<script src="<%=basePath %>/js/custom/comment.js"></script>
<script src="<%=basePath %>/js/custom/poem.js"></script>
<script>
$(document).ready(function(){
	if("${user.userId}"){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
});
//有用到user的属性
$("#addConcern").click(function(){
	$.ajax({
		type:"POST",
		url:$("#basePath").val()+"/concern/addConcernByAjax",
		contentType:"application/json",
		data:JSON.stringify({
			concernedId:$("#authorId").val(),
			concernerId:$("#userId").val()
		}),
		dataType:"text",
		success:function(data){
			if(data=="success"){
				alert("关注成功");
				$("#addConcern").addClass("hide");
				$("#removeConcern").removeClass("hide");
				var num=($("#fans-number").html());
				$("#fans-number").html(Number(num)+1);
				
				if(document.getElementById("span-fans").index){
					var str='<li id="fans-'
						+${user.userId}
						+'"><a href="'
						+$("#basePath").val()
						+'/user/aid/'
						+${user.userId}
						+'" title="进入作者主页" target="_blank">';
				var imgStr='';
				if("${user.userIcon}"){
					imgStr='<img src="'+$("#basePath").val()+'/img/user/'+'${user.userIcon}'+'" alt="" />';
				}else{
					imgStr='<img src="'+$("#basePath").val()+'/img/attached/head-icon1.jpg" alt="" />'	
				}
				str+=imgStr;
                var remainStr='</a><span class="name" title="'
                			  +'">'
                			  +'${user.userName}'
                			  +'</span><span class="gender ';
               if("${user.userSex}"==1){
            	   remainStr+='male';
               }else{
            	   remainStr+='female';
               }
               remainStr+=' glyphicon glyphicon-user"></span></li>';
               str+=remainStr;
               
               $("#fanList").append(str);
				}
			}else{
				alert("关注失败");
			}
		}
	});
});
$("#removeConcern").click(function(){
	$.ajax({
		type:"POST",
		url:$("#basePath").val()+"/concern/removeConcernByAjax",
		contentType:"application/json",
		data:JSON.stringify({
			concernedId:$("#authorId").val(),
			concernerId:$("#userId").val()
		}),
		dataType:"text",
		success:function(data){
			if(data=="success"){
				alert("取消关注");
				$("#removeConcern").addClass("hide");
				$("#addConcern").removeClass("hide");
				var num=($("#fans-number").html());
				$("#fans-number").html(Number(num-1));
				if(document.getElementById("span-fans").index){
					$("#fans-"+$("#userId").val()).remove();
				}
				
			}else{
				alert("取消失败");
			}
		}
	});
});
$("#span-fans").click(function(){
	var num=$("#fans-number").html();
	if(num==0){
		return false;
	}
	
	if(!this.index){
		this.index=1;
		$.ajax({
			type:"POST",
			url:$("#basePath").val()+"/concern/getFansByAjax/"+$("#authorId").val(),
			dataType:"json",
			success:function(data){
				$.each(data,function(){
					var str='<li id="fans-'
							+this.userId
							+'"><a href="'
							+$("#basePath").val()
							+'/user/aid/'
							+this.userId
							+'" title="进入作者主页" target="_blank">';
					var imgStr='';
					if(this.userIcon){
						imgStr='<img src="'+$("#basePath")+'/img/user/'+this.userIcon+'" alt="" />';
					}else{
						imgStr='<img src="'+$("#basePath").val()+'/img/attached/head-icon1.jpg" alt="" />'	
					}
					str+=imgStr;
                    var remainStr='</a><span class="name" title="'
                    			  +'">'
                    			  +this.userName
                    			  +'</span><span class="gender ';
                   if(this.userSex==1){
                	   remainStr+='male';
                   }else{
                	   remainStr+='female';
                   }
                   remainStr+=' glyphicon glyphicon-user"></span></li>';
                   str+=remainStr;
                   
                   $("#fanList").append(str);
				});
			}
		});
	}
});
$("#span-concern").click(function(){
	var num=$("#concern-number").html();
	if(num==0){
		return false;
	}
	
	if(!this.index){
		this.index=1;
		$.ajax({
			type:"POST",
			url:$("#basePath").val()+"/concern/getConcernsByAjax/"+$("#authorId").val(),
			dataType:"json",
			success:function(data){
				$.each(data,function(){
					var str='<li><a href="'
							+$("#basePath").val()
							+'/user/aid/'
							+this.userId
							+'" title="进入作者主页" target="_blank">';
					var imgStr='';
					if(this.userIcon){
						imgStr='<img src="'+$("#basePath")+'/img/user/'+this.userIcon+'" alt="" />';
					}else{
						imgStr='<img src="'+$("#basePath").val()+'/img/attached/head-icon1.jpg" alt="" />'	
					}
					str+=imgStr;
                    var remainStr='</a><span class="name" title="'
                    			  +'">'
                    			  +this.userName
                    			  +'</span><span class="gender ';
                   if(this.userSex==1){
                	   remainStr+='male';
                   }else{
                	   remainStr+='female';
                   }
                   remainStr+=' glyphicon glyphicon-user"></span></li>';
                   str+=remainStr;
                   
                   $("#concernList").append(str);
				});
			}
		});
	}
});
</script>
</body>
</html>