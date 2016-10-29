$(function(){
	$(document).on("click","li.comment span",function(){
		var $more_comment=$(this).parents(".dynamic-action").next().find(".more-comment");
		var $li = $(this).parent();
		var $current_article = $li.parents(".dynamic");
		$current_article.css("border-bottom", "none");
        var $current_comment = $current_article.find(".comment-wrap");
        $current_comment.toggle("slow");
        
        
		if($current_article.attr("count")){
			alert("no");
		}else{
			alert("yes");
			$current_article.attr("count",1);
//			var $article=$li.parents("article");
			var poemId=$current_article.attr("id").slice(8);
			$more_div=$(this).parents(".dynamic-action").next().find('.more-comment');
			if($("#comment-span-"+poemId).html()==0){
				$more_comment.addClass("hide");
				return;
			}
			$.ajax({
				type:"POST",
				url:$("#basePath").val()+"/comment/getCommentList",
				data:{
					poemId:poemId,
					count:$current_article.attr("count")
				},
				dataType:"json",
				success:function(data){
					if(data.length==0){
						alert("没有了");
						return;
					}
					
					$.each(data,function(){
						var str='<div class="comment" id="comment-'+this.commentId
								+'"><div class="content"><a target="_blank" href="#" class="reviewer">'+this.commentorName
								+'</a><div class="reviewer-words"><div class="triangle"></div><div class="words">'
								+this.commentText+'</div></div></div><span class="reply-or-delete">';
						if(this.commentorId==$("#userId").val()){
							str+='删除';
						}else{
							str+='回复';
						}
						var remainStr='</span>'
								+'<div class="reply hide">'
								+'<a href="mine.html" target="_blank" class="head-icon"><img src="'+$("#basePath").val()+'/img/user/'+$("#userIcon").val()+'" alt="" />'
								+'</a><textarea name="reply" class="input-reply" rows="2"></textarea><button class="btn btn-default btn-sm">提交回复</button>'
								+'</div>'
								+'<input type="hidden" id="hidden-input-'+this.commentId+'" value="'+this.commentThread+'" />';
						str+=remainStr;
						$.each(this.children,function(){
							
							var strChild='<div class="reply-n" id="comment-'+this.commentId+'"><div class="content"><a target="_blank" href="#" class="reviewer">'
										+ this.commentorName+
										'</a>回复<a target="_blank" href="#" class="reviewer">'
										+this.parentUserName
										+'</a><div class="reviewer-words"><div class="triangle"></div><div class="words">'
										+this.commentText
		                                +'</div></div></div><span class="reply-or-delete">';
							str+=strChild;
							if(this.commentorId==$("#userId").val()){
								str+='删除';
							}else{
								str+='回复';
							}   
                            var remainStr='</span>'
		                                +'<div class="reply hide"><a href="mine.html" target="_blank" class="head-icon">'
		                                +'<img src="'+$("#basePath").val()+'/img/user/'+$("#userIcon").val()+'" alt="" />'
		                                +'</a><textarea name="reply" class="input-reply" rows="2"></textarea>'
		                                +'<button class="btn btn-default btn-sm">提交回复</button></div>'
		                                +'<input type="hidden" id="hidden-input-'+this.commentId+'" value="'+this.commentThread+'" /></div>';
                            str+=remainStr;
							
						});
						str+='</div>';
						$(str).insertBefore($more_div);
					});
					var poemNumber=$("#comment-span-"+poemId).html();
					var currentNumber=$("#article-"+poemId+" div.comment").length+$("#article-"+poemId+" div.reply-n").length;
					if(poemNumber==currentNumber){
						$more_comment.addClass("hide");
					}
				}
			});
		}
		 
		 
	});
	
	$(document).on("click","span.more-comment-span",function(){
		$more_comment=$(this).parent();
		$current_article=$(this).parents(".dynamic");
		var count=Number($current_article.attr("count"));
		alert("count"+count);
		$current_article.attr("count",count+1)
		var poemId=$current_article.attr("id").slice(8);
		$more_div=$(this).parent();
		$.ajax({
			type:"POST",
			url:$("#basePath").val()+"/comment/getCommentList",
			data:{
				poemId:poemId,
				count:$current_article.attr("count")
			},
			dataType:"json",
			success:function(data){
				if(data.length==0){
					alert("没有了");
					return;
				}
				$.each(data,function(){
					
					var str='<div class="comment" id="comment-'+this.commentId
							+'"><div class="content"><a target="_blank" href="#" class="reviewer">'+this.commentorName
							+'</a><div class="reviewer-words"><div class="triangle"></div><div class="words">'
							+this.commentText+'</div></div></div><span class="reply-or-delete">'
					if(this.commentorId==$("#userId").val()){
						str+='删除';
					}else{
						str+='回复';
					}		
					var remainStr='</span>'
								+'<div class="reply hide">'
								+'<a href="mine.html" target="_blank" class="head-icon"><img src="'+$("#basePath").val()+'"/img/user/'+$("#userIcon").val()+'" alt="" />'
								+'</a><textarea name="reply" class="input-reply" rows="2"></textarea><button class="btn btn-default btn-sm">提交回复</button>'
								+'</div>'
								+'<input type="hidden" id="hidden-input-'+this.commentId+'" value="'+this.commentThread+'" /></div>';
					str+=remainStr;
					$.each(this.children,function(){
						
						var strChild='<div class="reply-n" id="comment-'+this.commentId+'"><div class="content"><a target="_blank" href="#" class="reviewer">'
									+ this.commentorName+
									'</a>回复<a target="_blank" href="#" class="reviewer">'
									+this.parentUserName
									+'</a><div class="reviewer-words"><div class="triangle"></div><div class="words">'
									+this.commentText
	                                +'</div></div></div><span class="reply-or-delete">';
						str+=strChild;
						if(this.commentorId==$("#userId").val()){
							str+='删除';
						}else{
							str+='回复';
						}   
                        var remainStr='</span>'
	                                +'<div class="reply hide"><a href="mine.html" target="_blank" class="head-icon">'
	                                +'<img src="'+$("#basePath").val()+'/img/user/'+$("#userIcon").val()+'" alt="" />'
	                                +'</a><textarea name="reply" class="input-reply" rows="2"></textarea>'
	                                +'<button class="btn btn-default btn-sm">提交回复</button></div>'
	                                +'<input type="hidden" id="hidden-input-'+this.commentId+'" value="'+this.commentThread+'" /></div>';
                        str+=remainStr;
						
					});
					str+='</div>';
					$(str).insertBefore($more_div);
				});
				var poemNumber=$("#comment-span-"+poemId).html();
				var currentNumber=$("#article-"+poemId+" div.comment").length+$("#article-"+poemId+" div.reply-n").length;
				if(poemNumber==currentNumber){
					$more_comment.addClass("hide");
				}
			}
		});
	});
	
	//转发的评论
	$(document).on("click","li.transmitComment span",function(){
		var $more_comment=$(this).parents(".dynamic-action").next().find(".more-comment");
		var $li = $(this).parent();
		var $current_article = $li.parents(".dynamic");
		$current_article.css("border-bottom", "none");
        var $current_comment = $current_article.find(".comment-wrap");
        $current_comment.toggle("slow");
        
        
		if($current_article.attr("count")){
			alert("no");
		}else{
			alert("yes");
			$current_article.attr("count",1);
//			var $article=$li.parents("article");
			var poemId=$current_article.attr("id").slice(9);
			if($("#transmit-number-"+poemId).html()==0){
				$more_comment.addClass("hide");
				return;
			}
			$more_div=$(this).parents(".dynamic-action").next().find('.more-comment');
			if($("#comment-span-"+poemId).html()==0){
				$more_comment.addClass("hide");
				return;
			}
			$.ajax({
				type:"POST",
				url:$("#basePath").val()+"/transmitComment/getCommentList",
				data:{
					poemId:poemId,
					count:$current_article.attr("count")
				},
				dataType:"json",
				success:function(data){
					if(data.length==0){
						alert("没有了");
						return;
					}
					
					$.each(data,function(){
						var str='<div class="comment" id="comment-'+this.commentId
								+'"><div class="content"><a target="_blank" href="#" class="reviewer">'+this.commentorName
								+'</a><div class="reviewer-words"><div class="triangle"></div><div class="words">'
								+this.commentText+'</div></div></div><span class="reply-or-delete-transmit">';
						if(this.commentorId==$("#userId").val()){
							str+='删除';
						}else{
							str+='回复';
						}
						var remainStr='</span>'
								+'<div class="reply hide">'
								+'<a href="mine.html" target="_blank" class="head-icon"><img src="'+$("#basePath").val()+'/img/user/'+$("#userIcon").val()+'" alt="" />'
								+'</a><textarea name="reply" class="input-reply" rows="2"></textarea><button class="btn btn-default btn-sm">提交回复</button>'
								+'</div>'
								+'<input type="hidden" id="hidden-input-'+this.commentId+'" value="'+this.commentThread+'" />';
						str+=remainStr;
						$.each(this.children,function(){
							
							var strChild='<div class="reply-n" id="comment-'+this.commentId+'"><div class="content"><a target="_blank" href="#" class="reviewer">'
										+ this.commentorName+
										'</a>回复<a target="_blank" href="#" class="reviewer">'
										+this.parentUserName
										+'</a><div class="reviewer-words"><div class="triangle"></div><div class="words">'
										+this.commentText
		                                +'</div></div></div><span class="reply-or-delete-transmit">';
							str+=strChild;
							if(this.commentorId==$("#userId").val()){
								str+='删除';
							}else{
								str+='回复';
							}   
                            var remainStr='</span>'
		                                +'<div class="reply hide"><a href="mine.html" target="_blank" class="head-icon">'
		                                +'<img src="'+$("#basePath").val()+'/img/user/'+$("#userIcon").val()+'" alt="" />'
		                                +'</a><textarea name="reply" class="input-reply" rows="2"></textarea>'
		                                +'<button class="btn btn-default btn-sm">提交回复</button></div>'
		                                +'<input type="hidden" id="hidden-input-'+this.commentId+'" value="'+this.commentThread+'" /></div>';
                            str+=remainStr;
							
						});
						str+='</div>';
						$(str).insertBefore($more_div);
					});
					var poemNumber=$("#transmit-number-"+poemId).html();
					var currentNumber=$("#transmit-"+poemId+" div.comment").length+$("#transmit-"+poemId+" div.reply-n").length;
					if(poemNumber==currentNumber){
						$more_comment.addClass("hide");
					}
				}
			});
		}
		 
		 
	});
	
	$(document).on("click","span.more-transmit-comment-span",function(){
		$more_comment=$(this).parent();
		$current_article=$(this).parents(".dynamic");
		var count=Number($current_article.attr("count"));
		alert("count"+count);
		$current_article.attr("count",count+1)
		var poemId=$current_article.attr("id").slice(9);
		$more_div=$(this).parent();
		$.ajax({
			type:"POST",
			url:$("#basePath").val()+"/transmitComment/getCommentList",
			data:{
				poemId:poemId,
				count:$current_article.attr("count")
			},
			dataType:"json",
			success:function(data){
				if(data.length==0){
					alert("没有了");
					return;
				}
				$.each(data,function(){
					
					var str='<div class="comment" id="comment-'+this.commentId
							+'"><div class="content"><a target="_blank" href="#" class="reviewer">'+this.commentorName
							+'</a><div class="reviewer-words"><div class="triangle"></div><div class="words">'
							+this.commentText+'</div></div></div><span class="reply-or-delete-transmit">'
					if(this.commentorId==$("#userId").val()){
						str+='删除';
					}else{
						str+='回复';
					}		
					var remainStr='</span>'
								+'<div class="reply hide">'
								+'<a href="mine.html" target="_blank" class="head-icon"><img src="'+$("#basePath").val()+'"/img/user/'+$("#userIcon").val()+'" alt="" />'
								+'</a><textarea name="reply" class="input-reply" rows="2"></textarea><button class="btn btn-default btn-sm">提交回复</button>'
								+'</div>'
								+'<input type="hidden" id="hidden-input-'+this.commentId+'" value="'+this.commentThread+'" /></div>';
					str+=remainStr;
					$.each(this.children,function(){
						
						var strChild='<div class="reply-n" id="comment-'+this.commentId+'"><div class="content"><a target="_blank" href="#" class="reviewer">'
									+ this.commentorName+
									'</a>回复<a target="_blank" href="#" class="reviewer">'
									+this.parentUserName
									+'</a><div class="reviewer-words"><div class="triangle"></div><div class="words">'
									+this.commentText
	                                +'</div></div></div><span class="reply-or-delete-transmit">';
						str+=strChild;
						if(this.commentorId==$("#userId").val()){
							str+='删除';
						}else{
							str+='回复';
						}   
                        var remainStr='</span>'
	                                +'<div class="reply hide"><a href="mine.html" target="_blank" class="head-icon">'
	                                +'<img src="'+$("#basePath").val()+'/img/user/'+$("#userIcon").val()+'" alt="" />'
	                                +'</a><textarea name="reply" class="input-reply" rows="2"></textarea>'
	                                +'<button class="btn btn-default btn-sm">提交回复</button></div>'
	                                +'<input type="hidden" id="hidden-input-'+this.commentId+'" value="'+this.commentThread+'" /></div>';
                        str+=remainStr;
						
					});
					str+='</div>';
					$(str).insertBefore($more_div);
				});
				var poemNumber=$("#transmit-number-"+poemId).html();
				var currentNumber=$("#transmit-"+poemId+" div.comment").length+$("#transmit-"+poemId+" div.reply-n").length;
				if(poemNumber==currentNumber){
					$more_comment.addClass("hide");
				}
			}
		});
	});
});