<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>朋友圈</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/dynamic.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/main.css" />
    <script src="<%=basePath %>/js/lib/jquery.min.js"></script>
	<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
</head>
<body>
<%@include file="header.jsp" %>

<!--好友动态-->
<div class="content-wrap">
    <div class="container">
        <div class="row">
            <!--动态占8列-->
           <main class="col-md-10 col-md-push-1 main-content">
                <!--发布-->
                <div class="put-out">
                    <h4>发布</h4>
                    <div class="input-group">
                        <span class="input-group-addon">标题：</span>
                        <input class="form-control" name="put-out-title" id="put-out-title" />
                    </div>
                    <div class="input-group">
                        <textarea class="form-control" name="put-out-content" id="put-out-content" cols="30" rows="10"></textarea>
                    </div>
                    <div class="put-out-footer">
                        <!--button得用div包裹起来，否则样式出现bug-->
                        <div class="wrapper" width="200px" height="200px">
                            <button id="addPoem" class="btn-invalid btn btn-default disabled">发布</button>
                        </div>
                        <div class="visibility">
                            <div class="dropdown">
                                <button class="btn btn-default btn-sm dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                                公开
                                <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><span class="glyphicon glyphicon-globe"></span>&nbsp;&nbsp;公开</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;仅自己可见</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="insert-picture" title="您可上传一张图片">
                            <span class="glyphicon glyphicon-picture"></span><span>图片</span>
                        </div>
                        <div class="preview-picture hide">
                            <button class="btn btn-info btn-sm" id="btn-preview">预览图片</button>
                            <span class="glyphicon glyphicon-remove" title="删除上传的图片"></span>
                        </div>
                        <div class="hide">
                        <!-- 要有name属性，Controller@RequestParam("file") -->
                            <input type="file" id="file" name="file" />
                        </div>
                    </div>
                     <input type="hidden" name="userId" id="userId" value="${user.userId }" />
					<div id="data" class="hide"></div> 
                </div>
                <!--图片预览-->
                <div id="preview" class="hide">
                    <img width="100" id="img" />
                </div>
                <table id="mask">
                    <tr><td id="mask_td"></td></tr>
                </table>
	<div id="articleDiv">
               <c:forEach items="${poemUtilList }" var="poemUtil">
               	 <article  class="dynamic" id="article-${poemUtil.poemId }">
                    <div class="dynamic-head">
                        <h1 class="dynamic-title">
                            <a href="zheyeshiyiqie.html" class="poem-title">${poemUtil.poemTitle }</a>   <!--如何跳转到作者的相应页面，参考ghost网站-->
                        </h1>
                        <div class="dynamic-meta">
                            <span class="dynamic-author">
                                作者：
                                <a target="_blank" href="wangsai.html">${poemUtil.userName }</a>
                            </span>
                            <time id="time_${poemUtil.poemId }" class="dynamic-time">2016年</time>
                        </div>
                    </div>
                    <div class="dynamic-content">
                    	<c:forEach items="${poemUtil.poemRow }" var="row" begin="0" end="4">
                    		<p>${row }</p>
                    	</c:forEach>
                    	<span class="expand">展开全文</span>
                    	<c:forEach items="${poemUtil.poemRow }" var="row" begin="5">
                    		<p class="hide">${row }</p>
                    	</c:forEach>
                    	<span class="pack-up hide">收起全文</span>
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
                                <a class="head-icon" href="mine.html" target="_blank">
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
            <!--查找好友及分类占4列-->
            <!-- 
            <aside class="col-md-3 sidebar">
                <div class="widget">
                    <h4 class="side-title">
                        查找好友
                    </h4>
                    <div class="side-search"></div>
                </div>
                <div class="widget">
                    <h4 class="side-title">
                        分类
                    </h4>
                    <div class="side-classify"></div>
                </div>
            </aside>
             -->
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
<input type="hidden" value="<%=basePath%>" id="basePath"/>
<input type="hidden" value="${user.userId }" id="userId"/>
<input type="hidden" value="${user.userName }" id="userName"/>
</body>
<script src="<%=basePath %>/js/style/main.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/dynamic.js"></script>
<script src="<%=basePath %>/js/custom/comment.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/lib/jquery.ajaxfileupload.js"></script>
<script src="<%=basePath %>/js/custom/poem.js"></script>
<script src="<%=basePath %>/js/custom/addPoem.js"></script>
<!--  
<script type="text/javascript">
$(document).ready(function(){
	$(document).on("click","li.collection span",function(){
		var $li=$(this).parent();
		if($li.hasClass("grayLi")){
			//收藏
			$.ajax({
				type:"POST",
				url:"<%=basePath%>/collection/add",
				contentType:"application/json",
				data:JSON.stringify({
					userId:"${user.userId}",
					poemId:$li.parent().attr("id")
				}),
				dataType:"text",
				success:function(json){
					if("success"==json){
						$li.removeClass("grayLi").addClass("orangeLi");
						alert("收藏成功！");
					}else{
						alert(json);
						alert("收藏失败！");
					}
				}
				
			});
		}else{
			//取消收藏
			
			$.ajax({
				type:"POST",
				url:"<%=basePath%>/collection/remove",
				contentType:"application/json",
				data:JSON.stringify({
					userId:"${user.userId}",
					poemId:$li.parent().attr("id")
				}),
				dataType:"text",
				success:function(json){
					if("success"==json){
						$li.removeClass("orangeLi").addClass("grayLi");
						alert("取消收藏！");
					}else{
						alert("取消失败！");
					}
				}
			});
		}
	});
	//点赞处理
	$(document).on("click","li.support span",function(){
		$li=$(this).parent();
		var $thumb_number = $li.find(".thumb-number");
        var thumb_number_text = parseInt($thumb_number.html());   /*parseInt转换为数字*/
        // 由于需要更新点赞次数，就不调用clickLi()仅改变颜色
        if($li.hasClass("grayLi")){
        	$.ajax({
        		type:"POST",
        		url:"<%=basePath%>/support/add",
        		contentType:"application/json",
        		data:JSON.stringify({
        			userId:"${user.userId}",
        			poemId:$li.parent().attr("id")
        		}),
        		dataType:"text",
        		success:function(json){
        			if(json=="success"){
        				alert("成功");
        				var new_thumb = thumb_number_text + 1;  /*new_thumb需传送给后台*/
        	            $thumb_number.html(new_thumb);  /*不能用++*/
        	            $li.removeClass("grayLi").addClass("orangeLi");
        			}else{
        				alert("失败");
        			}
        		}
        	});
            
        }else if($li.hasClass("orangeLi")){
        	$.ajax({
        		type:"POST",
        		url:"<%=basePath%>/support/remove",
        		contentType:"application/json",
        		data:JSON.stringify({
        			userId:"${user.userId}",
        			poemId:$li.parent().attr("id")
        		}),
        		dataType:"text",
        		success:function(json){
        			if(json=="success"){
        				alert("成功");
        				var new_thumb = thumb_number_text - 1;
        	            $thumb_number.html(new_thumb);
        	            $li.removeClass("orangeLi").addClass("grayLi");
        			}else{
        				alert("失败");
        			}
        		}
        	});
            
        }
	});
	//转发处理
	$(document).on("click","li.share span",function(){
		$current_article=$(this).parents(".dynamic");
		$ul=$(this).parents("ul");
		var author = $current_article.find(".dynamic-author a").html();
		var title = $current_article.find(".dynamic-title a").html();
		var poemId=$current_article.find().html();
		$("#myModal .share-author").html(author);
		$("#myModal .share-title").html(title);
		$("#modal-poemId").val($ul.attr("id"));
		
	});
});
</script>

<script type="text/javascript">
function addPoem(data){
	var str='<article  class="dynamic" id="article-'+data.poemId+'">';
	str+='<div class="dynamic-head">';
	str+=' <h1 class="dynamic-title">';
	str+='<a href="zheyeshiyiqie.html">';
	str+=data.poemTitle;
	str+='</a></h1><div class="dynamic-meta"><span class="dynamic-author">';
	str+='作者:<a target="_blank" href="wangsai.html">';
	str+='${user.userName}';
	str+='</a></span><time class="dynamic-time">刚刚</time></div></div>';
	str+='<div class="dynamic-content">';
	var content=data.poemText.split("|");
	if(content.length<=5){
		for(var i in content){
			str+='<p>'+content[i]+'</p>';
		}
	}else{
		for(var i=0;i<5;i++){
			str+='<p>'+content[i]+'</p>';
		}
		str+='<span class="expand">展开全文</span>';
		for(var i=5;i<content.length;i++){
			str+='<p class="hide">'+content[i]+'</p>';
		}
		str+='<span class="pack-up hide">收起全文</span>';
	}
	
	str+='</div>';
	if(data.poemImg){
		str+='<div class="row"><div class="dynamic-img col-sm-7 col-xs-9">';
		str+='<img src="<%=basePath %>/img/poem/'
		str+=data.poemImg;
		str+='" alt="这也是一切" /></div></div>';
	}
	str+='<div class="dynamic-action"><div class="row"><ul id="';
	str+=data.poemId+'">'
	str+='<li class="col-xs-3 keep grayLi collection" >';
	str+='<span class="glyphicon glyphicon-heart-empty"></span><span>收藏</span>';
	str+='</li><li class="col-xs-3 share"><a href="#" data-toggle="modal" data-target="#myModal">';
	str+='<span class="glyphicon glyphicon-share"></span><span class="share-number" id="share-span-'+data.poemId+'">0</span></a></li>';
	str+='<li class="col-xs-3 comment"><span class="glyphicon glyphicon-comment"></span><span class="comment-number" id="comment-span-'+data.poemId+'">0</span>';
	str+='</li><li class="col-xs-3 thumb support grayLi"><span class="glyphicon glyphicon-thumbs-up"></span><span class="thumb-number">0</span>';
	str+='</li></ul></div></div>';
	
	str+='<div class="comment-wrap"><div class="dynamic-comment"><div class="send-comment">';
	str+='<a href="mine.html"><img src="<%=basePath %>/img/common/writeComment.jpg" alt="输入你的评论" />';
	str+='</a><textarea name="comment" class="input-comment" rows="2"></textarea><br />';
	str+='<button class="btn-comment btn btn-default">评论</button></div>';
	str+='<div class="more-comment"><span>加载更多</span><span class="no-more hide">没有更多评论了</span></div>';
	str+='</div></div></article>';
	$("#articleDiv").prepend(str);
}
$("#addPoem").click(function(){
	//如果有图片
	if($("#file").val()){
		var uid=$("#userId").val();
		var imgPath="";
		$.ajaxFileUpload({  
	        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)  
	        url:'<%=basePath%>/poem/imageUpload?uid='+uid,  
	        secureuri:false,                           //是否启用安全提交,默认为false   
	        fileElementId:'file',               //文件选择框的id属性  
	        dataType:'text',                           //服务器返回的格式,可以是json或xml等  
	        success:function(data, status){ 
	        	$("#data").empty();
	        	$("#data").append(data);
	        	imgPath=$("#data").text();
	        //	alert("dataText:"+imgPath);
	        },
	        complete:function(){
	        	if(imgPath.search(/poem/)!=-1){
	        		$.ajax({
	        			type:"POST",
	        			url:"<%=basePath%>/poem/addPoem",
	        			contentType:"application/json",
	        			data:JSON.stringify({
	        				userId:$("#userId").val(),
	        				poemTitle:$("#put-out-title").val(),
	        				poemText:$("#put-out-content").val(),
	        				poemImg:imgPath
	        			}),
	        			dataType:"json",
	        			success:function(data){
	        				if(!data.poemId){
	        					alert("发表失败！");
	        				}else{
	        					addPoem(data);
	        					alert("发表成功");
	        				}
	        				clearPutting();
	        			}
	        		});
	        	}else{
	        		alert("图片上传失败！");
	        	}
	        }
	    });
	}else{
		$.ajax({
			type:"POST",
			url:"<%=basePath%>/poem/addPoem",
			contentType:"application/json",
			data:JSON.stringify({
				userId:$("#userId").val(),
				poemTitle:$("#put-out-title").val(),
				poemText:$("#put-out-content").val(),
			}),
			dataType:"json",
			success:function(data){
				if(!data.poemId){
					alert("发表失败！");
				}else{
					addPoem(data);
					alert("发表成功");
				}
				
				clearPutting();
			}
		});
	
	}
});


</script>
-->
<script type="text/javascript">
$(document).ready(function(){
	if("${user}"!=""){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	$(".menu li:eq(2)").addClass("current-page");
});
	
</script>
</html>