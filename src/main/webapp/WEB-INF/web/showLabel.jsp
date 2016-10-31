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
    <!--<link rel="stylesheet" href="<%=basePath %>/css/style/dynamic.css" />  -->
    <link rel="stylesheet" href="<%=basePath %>/css/style/recommend.css" />
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
                    <h2>
                        <small>${label.labelName }</small>
                        <small></small>
                        <small>${label.labelDescription }</small>
                    </h2>
                </div>
				
				<div id="no-poem" class="none-hint hide" >
                    暂时没有这个类型的诗歌，去看看其他类型的吧~
                </div>
                
               <c:forEach items="${poemUtilList }" var="poemUtil">
                <div class="recommend">
                    <div class="row">
                        <div class="img col-sm-4">
                        	<div class="img-wrap">
                        	<c:choose>
                        		<c:when test="${poemUtil.poemImg!=null }">
                        			<img src="<%=basePath %>/img/poem/${poemUtil.poemImg }" alt="今日推荐" />
                        		</c:when>
                        		<c:otherwise>
                             		<img src="<%=basePath %>/img/attached/zheyeshiyiqie.jpg" alt="今日推荐" />
                             	</c:otherwise>
                        	</c:choose>
                            </div>
                        </div>
                        <div class="words col-sm-8">
                            <div class="recom-title">
                                <a href="<%=basePath%>/poem/pid/${poemUtil.poemId}">${poemUtil.poemTitle }</a>
                            </div>
                            <div class="recom-content">  <!--显示三句-->
								<c:forEach items="${poemUtil.poemRow }" var="row" begin="0" end="2" varStatus="status">
									<p>${row }
									<c:if test="${status.count==3 }" >
									...
									</c:if>
									</p>
								</c:forEach>
                            </div>
                            <div class="recom-meta">
                                <span class="recom-author">
                                    <a target="_blank" href="<%=basePath%>/user/aid/${poemUtil.userId}">${poemUtil.userName }</a>
                                </span>
                                <time class="recom-time" id="time_${poemUtil.poemId }">${poemUtil.poemPublishTime }</time>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>

                <div class="footer" id="recommend-more">
                    <span class="more">加载更多>></span>
                    <span class="loading hide"><img src="<%=basePath %>/img/common/loading.gif" alt="加载中"></span>
                </div>
            </main>
        </div>
    </div>
</div>

<input type="hidden" value="<%=basePath%>" id="basePath"/>
<input type="hidden" value="${user.userId }" id="userId"/>
<input type="hidden" value="${user.userName }" id="userName"/>


<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/label.js"></script>
<script src="<%=basePath %>/js/style/common.js"></script>
<script type="text/javascript">
	function formatTime(){
		$.each($(".recom-time"),function(){
			$(this).html($(this).html().slice(0,16));
		});
	}
	formatTime();
	var finish=false;
	var length=$(".recommend").length;
	if(length==0){
		$("#no-poem").removeClass("hide");
	}
	if(length<5){
		$("#recommend-more").addClass("hide");
		finish=true;
	}
	
	
	$(window).scroll(function() {  
		var ks_area = $(window).height();
	    var wholeHeight = $(document).height();
	    var scrollTop = $(window).scrollTop();
	    if(ks_area + scrollTop >= wholeHeight){
	    	if(finish){
	    		return;
	    	}
	    	
	    	$(".more").addClass("hide");
	    	$(".loading").removeClass("hide");
	    	if(!this.index){
				this.index=2;
			}else{
				this.index++;
			}
			var index=this.index;
			$.ajax({
				type:"GET",
				url:$("#basePath").val()+"/poem/label/"+"${label.labelId}/page/"+index,
				dataType:"json",
				success:function(data){
					$.each(data,function(){
						var str='<div class="recommend"><div class="row"><div class="img col-sm-4">'
	                    		+'<div class="img-wrap">';
	                    if(this.poemImg){
	                    	str=str+'<img src="'+$("#basePath").val()+'/img/poem/'+this.poemImg+'" alt="今日推荐" />';                    			
	                    }else{
	                    	str=str+'<img src="'+$("#basePath").val()+'/img/attached/zheyeshiyiqie.jpg" alt="今日推荐" />';
	                    }
	                     str+='</div></div><div class="words col-sm-8"><div class="recom-title">'
	                     	+'<a href="'
	                     	+$("#basePath").val()
	                     	+'/poem/pid/'+this.poemId+'">'
							+this.poemTitle
							+'</a></div><div class="recom-content">';
						for(var i=0;i<3;i++){
							str=str+'<p>'+this.poemRow[i];
							if(i==2){
								str+='...</p>';
							}else{
								str+='</p>';
							}
						}
	                    str=str+'</div><div class="recom-meta"><span class="recom-author">'
	                    	+'<a target="_blank" href="'
	                    	+$("#basePath").val()+'/user/aid/'
	                    	+this.userId+'">'
	                    	+this.userName
	                    	+'</a></span><time class="recom-time" id="time_'
	                    	+this.poemId
	                    	+'">'+this.poemPublishTime+'</time></div></div></div></div>';
	            		
	                    $("#recommend-more").before(str);
	                    $("#time_"+this.poemId).html(transferTime(this.poemPublishTime));
					});
					$(".more").removeClass("hide");
			        $(".loading").addClass("hide");
			        setImg($(".main-content"));
					if(data.length<5){
						finish=true;
						$(".more").addClass("hide");
					}
				}
			});
	    }
	});  
</script>
</body>
</html>