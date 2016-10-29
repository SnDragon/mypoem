$(document).ready(function(){
	// 评论功能
    var $send_comment = $(".send-transmit-comment");
    $send_comment.find("textarea").val("");
    // 点击“评论”
    $(document).on("click", ".send-transmit-comment button", function(){
        var $content = $(this).prev().prev();
        var value = $content.val().replace(/\s+/g,"");
        if(value == ""){
            return false;
        }else{
        	var $article=$(this).parents("article");
        	var poemId=$article.attr("id").slice(9);
        	var $text=$(this).siblings("textarea");
        	$this=$(this);
        	$.ajax({
        		type:"POST",
        		url:$("#basePath").val()+"/transmitComment/add",
        		contentType:"application/json",
        		data:JSON.stringify({
        			poemId:poemId,
        			commentorId:$("#userId").val(),
        			commentorName:$("#userName").val(),
        			commentText:$text.val()
        		}),
        		dataType:"json",
        		success:function(data){
        			if(data.msg=="success"){
        				alert("评论成功");
        				var $span=$("#transmit-number-"+poemId);
        				var num=Number($span.html());
        				$span.html(num+1);
        				 // 将新评论放入评论框
        	            var $send = $this.parent();
        	            var $head = $send.find(".head-icon img");
        	            var new_comment='<div class="comment" id="comment-'+data.commentId+'"><div class="content">'
                            			+'<a target="_blank" href="#" class="reviewer">'+$("#userName").val()
                            			+'</a><div class="reviewer-words"><div class="triangle"></div><div class="words">'
                            			+$content.val()
                            			+'</div></div></div><span class="reply-or-delete-transmit">删除</span>'
                            			+'<input type="hidden" id="hidden-input-'+data.commentId+'" value="'+data.commentThread+'" />'
                            			+'</div>';
        	            $(new_comment).insertAfter($send);
        	            // 清除评论框内容
        	            $send.find("textarea").val("");
        			}else{
        				alert("评论失败");
        			}
        		}
        	});
           
        }
    });
    // 初始化回复框为空
    $(".reply textarea").val("");
    // 点击“回复”，显示回复框
    var $to_reply = $(".dynamic-comment .comment span");
    $(document).on("click", ".reply-or-delete-transmit", function () {
        if($(this).html() == "回复"){
            $(this).next().removeClass("hide");
            $(this).html("取消回复");
        }else if($(this).html() == "取消回复"){
            $(this).next().addClass("hide");
            $(this).html("回复");
        }else if($(this).html() == "删除"){
            // 删除评论或回复
        	$comment=$(this).parents(".comment");
        	var commentId=$(this).parent().attr("id").slice(8);
        	$parent=$(this).parent();
        	var poemId=$(this).parents(".dynamic").attr("id").slice(9);
        	var commentThread=$("#hidden-input-"+commentId).val();
//        	alert(commentId);
        	$.ajax({
        		type:"POST",
        		url:$("#basePath").val()+"/transmitComment/remove",
        		dataType:"json",
        		data:{
        			commentId:commentId,
        			poemId:poemId,
        			commentThread:commentThread
        		},
        		success:function(data){
        			if(data.msg=="success"){
        				alert("删除成功");
        				$parent.remove();
        				var $span=$("#transmit-number-"+poemId);
        				var num=Number($span.html());
        				$span.html(num-data.num);
        			}else{
        				alert("删除失败！");
        			}
        		}
        	});
//            $(this).parent().remove();
        }else{
            return false;
        }
    });
    // 点击“提交回复”
    $(document).on("click", ".reply button", function(){
    	if($(this).parents(".dynamic").attr("id").slice(0,1)!='t'){
    		return;
    	}
        // 提交回复时，检查回复框内容
        var $input_reply = $(this).prev();
        var reply_value = $input_reply.val().replace(/\s+/g,"");  /*消除字符串所有空格*/
        if(reply_value == ""){
            return false;
        }else{
        	var $article=$(this).parents("article");
        	var poemId=$article.attr("id").slice(9);
        	var $comment=$(this).parents(".comment");
//        	alert($comment.html());
        	var commentId=$comment.attr("id").slice(8);
        	var author=$(this).parent().siblings(".content").find("a").html();
        	var content=$(this).prev().val();
        	var commentThread=$("#hidden-input-"+commentId).val();
        	var $reply = $(this).parent();
            var $head = $reply.find(".head-icon img");
            var $this_comment = $(this).parents(".comment");
        	$.ajax({
        		type:"POST",
        		url:$("#basePath").val()+"/transmitComment/addReplyComment",
        		contentType:"application/json",
        		data:JSON.stringify({
        			poemId:poemId,
        			parentId:commentId,
        			parentUserName:author,
        			commentorId:$("#userId").val(),
        			commentorName:$("#userName").val(),
        			commentText:content,
        			commentThread:commentThread+commentId+"/"
        		}),
        		dataType:"json",
        		success:function(data){
        			if(data.msg=="success"){
        				alert("回复成功");
        				$reply.prev().html("回复");
        				var $span=$("#transmit-number-"+poemId);
        				var num=Number($span.html());
        				$span.html(num+1);
        				
        				 var new_reply = '<div class="reply-n" id="comment-'
         	                +data.commentId+'"><div class="content"><a target="_blank" href="' +
        	                'mine.html'//个人主页 
        	                +'" class="reviewer">' 
        	                +$("#userName").val()
        	                +'</a> 回复 <a target="_blank" href="' +
        	                $reply.parent().find(".content a").attr("href") +    /*原评论者的主页链接*/
        	                '" class="reviewer">' +
        	                $reply.parent().find(".content a").html() +  /*原评论者的用户名*/
        	                '</a><div class="reviewer-words"><div class="triangle"></div><div class="words">' +
        	                $input_reply.val() +  /*用户回复的内容*/
        	                '</div></div></div><span class="reply-or-delete-transmit">删除</span>'
        	                +'<input type="hidden" id="hidden-input-'+data.commentId+'" value="'+data.commentThread+'" />'
        	                +'</div>';

        	            var $new_reply = $(new_reply);
        	            $new_reply.appendTo($this_comment);
        	            // 隐藏回复框，并清除回复框内容
        	            $reply.addClass("hide");
        	            $reply.find("textarea").val("");
        	            $to_reply.html("回复");
        			}else{
        				alert("回复失败");
        			}
        		}
        	});

           
        }
    });
});