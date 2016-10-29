
// 每条动态的基本功能（收藏、转发、评论、回复、点赞、展开全文）
$(function () {
    // 删除“点赞”右边的边框
    var $uls = $(".dynamic-action ul");
    var $last_lis = $uls.find("li:last");
    $last_lis.css("border-right", "none");

    // 移动端处理hover事件   ps：暂时没用上
    // document.body.addEventListener('touchstart', function(){ });
    // 设置评论点赞的悬停和点击事件
    // var $lis = $(".dynamic-action li");
    // $lis.attr("get", "false");    /*get属性初始化为false*/
    // $lis.addClass("grayLi");      /*给四个动作设置灰色*/

    //  $test=$("li.col-xs-3 span");
    //传入字符串，而不是对象
    $(document).on("mouseover","li.col-xs-3 span",function () {
        // $(this).parent().css("color", "#E67E22");
        $(this).css("cursor", "pointer");
    });
    


    // 转发
    // 重置转发框内容
    var $share_word = $("#share-word");
    var $remain_word = $(".remain-word");
    var $share_button = $("#share-button");
    $share_word.attr("disabled", false);
    resetShare($share_word, $remain_word, $share_button, 120);
    // 转发理由输入框设置focus样式
    $share_word.focus(function () {
        $(this).css("border-color", "#E67E22");
    }).blur(function () {
        $(this).css("border-color", "rgb(204,204,204)");
    });
    focusAndBlur($share_word, "请输入转发理由");
    // 转发理由限制字数，使用户更专注于表达核心内容
    $share_word.keydown(function () {
        checkLength($(this), $remain_word, 120);
    });
    $share_word.keypress(function () {
        checkLength($(this), $remain_word, 120);
    });
    $share_word.keyup(function () {
        checkLength($(this), $remain_word, 120);
    });
    // 转发框关掉后，重置转发框
    var $close_button = $("#close-button");
    $close_button.click(function () {
        resetShare($share_word, $remain_word, $share_button, 120);
    });

    // 点击“转发”按钮后，先检查剩余字数是否小于0，小于0则给予提示
    $share_button.attr("disabled", false);
    $close_button.attr("disabled", false);
    $share_button.click(function () {
        if($remain_word.html() < 0){
            // 提示字数超出限制
            $share_word.css("background-color", "rgb(255,221,220)");
            setTimeout(function () {
                $share_word.css("background-color", "white");
                setTimeout(function () {
                    $share_word.css("background-color", "rgb(255,221,220)");
                    setTimeout(function () {
                        $share_word.css("background-color", "white");
                    }, 300);
                }, 300);
            }, 300);
        }else{
            // 将该动态转发到用户的朋友圈（提示转发中）
            $(this).css("opacity", "0.9");
            $(this).html("转发中");
            $(this).attr("disabled", true);              //禁用转发按钮
            $(this).css("background-color", "#E67E22");  //避免禁用时默认背景颜色改变
            $share_word.attr("disabled", true);
            $share_word.css("background-color", "white");
            buffering();
            $.ajax({
                type:"POST",
                url:$("#basePath").val()+"/transmit/add",
                contentType:"application/json",
                data:JSON.stringify({
                    userId:$("#userId").val(),
                    poemId:$("#modal-poemId").val(),
                    transmitComment:$("#share-word").val()
                }),
                dataType:"text",
                success:function(json){
                    if("success"==json){
                        clearBuffering();
                        alert("转发成功!");
                        var $span=$("#share-span-"+$("#modal-poemId").val());
                        var num=Number($span.html());
                        $span.html(num+1);
                        $("#share-word").val("");//清除转发内容
                    }else{
                        alert("转发失败！");
                    }
                }
            });

            clearBuffering();
        }
    });


    // 评论功能
    var $send_comment = $(".send-comment");
    $send_comment.find("textarea").val("");
    // 点击“评论”
    $(document).on("click", ".send-comment button", function(){
        var $content = $(this).prev().prev();
        var value = $content.val().replace(/\s+/g,"");
        if(value == ""){
            return false;
        }else{
        	var $article=$(this).parents("article");
        	var poemId=$article.attr("id").slice(8);
        	var $text=$(this).siblings("textarea");
        	$this=$(this);
        	$.ajax({
        		type:"POST",
        		url:$("#basePath").val()+"/comment/add",
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
        				var $span=$("#comment-span-"+poemId);
        				var num=Number($span.html());
        				$span.html(num+1);
        				 // 将新评论放入评论框
        	            var $send = $this.parent();
        	            var $head = $send.find(".head-icon img");
        	            var new_comment='<div class="comment" id="comment-'+data.commentId+'"><div class="content">'
                            			+'<a target="_blank" href="#" class="reviewer">'+$("#userName").val()
                            			+'</a><div class="reviewer-words"><div class="triangle"></div><div class="words">'
                            			+$content.val()
                            			+'</div></div></div><span class="reply-or-delete">删除</span>'
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
    $(document).on("click", ".reply-or-delete", function () {
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
        	var poemId=$(this).parents(".dynamic").attr("id").slice(8);
        	var commentThread=$("#hidden-input-"+commentId).val();
//        	alert(commentId);
        	$.ajax({
        		type:"POST",
        		url:$("#basePath").val()+"/comment/remove",
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
        				var $span=$("#comment-span-"+poemId);
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
    	if($(this).parents(".dynamic").attr("id").slice(0,1)!='a'){
    		return;
    	}
        // 提交回复时，检查回复框内容
        var $input_reply = $(this).prev();
        var reply_value = $input_reply.val().replace(/\s+/g,"");  /*消除字符串所有空格*/
        if(reply_value == ""){
            return false;
        }else{
        	var $article=$(this).parents("article");
        	var poemId=$article.attr("id").slice(8);
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
        		url:$("#basePath").val()+"/comment/addReplyComment",
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
        				var $span=$("#comment-span-"+poemId);
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
        	                '</div></div></div><span class="reply-or-delete">删除</span>'
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
            // 将回复放在评论下方
          
            // var $first_comment = $(this).parents(".dynamic-comment").find(".comment").eq(0);

           
        }
    });

    // 展开全文
    $(document).on("click", ".dynamic .dynamic-content .expand", function(){
        $(this).siblings().removeClass("hide");
        $(this).addClass("hide");
    });
    // 收起全文
    $(document).on("click", ".dynamic .dynamic-content .pack-up", function(){
        var $p = $(this).siblings("p");
        for(var i = 5; i < $p.length; i ++){
            $p.eq(i).addClass("hide");
        }
        $(this).siblings("span").removeClass("hide");
        $(this).addClass("hide");
    });
    // 转发中的展开全文
    $(document).on("click", ".original .original-content .expand", function(){
        $(this).siblings().removeClass("hide");
        $(this).addClass("hide");
    });
    // 转发中的收起全文
    $(document).on("click", ".original .original-content .pack-up", function(){
        var $p = $(this).siblings("p");
        for(var i = 5; i < $p.length; i ++){
            $p.eq(i).addClass("hide");
        }
        $(this).siblings("span").removeClass("hide");
        $(this).addClass("hide");
    });
    
 // 删除
    if($(".del").length != 0){
        // 设置删除框内容
        $(document).on("click", ".del", function () {
            var id = $(this).parent().attr("id");   /*将模态框的自定义属性del-id设为要删除的动态的id*/
            $("#myModal2").attr("del-id", id);
            // 判断要删除的是原创还是转发的，从而决定删除框的文本
            if($(this).siblings(".original").length != 0){
            	$("#myModal2").attr("del-type","transmit");//将删除的类型设为转发
                var author = $(this).siblings(".original").find(".original-author a").html();
                var title = $(this).siblings(".original").find(".original-head>a").html();
                $("#myModal2 .modal-body span").html('转自“' + author + '”的《' + title + '》');
            }else{
            	$("#myModal2").attr("del-type","original");//将删除的类型设为原创
                var title = $(this).next().find("h1 a").html();
                $("#myModal2 .modal-body span").html('《' + title + '》');
            }
        });
        // “确定删除”或“取消”
        $(document).on("click", "#myModal2 .yes", function () {
        	var type=$("#myModal2").attr("del-type");
        	var id="";
        	if(type=="original"){
        		id = $(this).parents("#myModal2").attr("del-id").slice(8);
        		$.ajax({
        			type:"POST",
        			url:$("#basePath").val()+"/poem/removePoem",
        			data:{
        				poemId:id,
        				userId:$("#userId").val()
        			},
        			success:function(data){
        				if(data=="success"){
        					alert("成功");
        					$("#article-"+id).remove();
        				}else{
        					alert("失败");
        				}
        			}
        		});
        	}else{
        		
        	}
        	
            // 关闭模态框
            $(this).next().click();
        });
    }
});

function clickLi(target){
    if(target.hasClass("grayLi")){
        target.removeClass("grayLi").addClass("orangeLi");
    }else if(target.hasClass("orangeLi")){
        target.removeClass("orangeLi").addClass("grayLi");
    }
}

// 检查转发理由的长度
function checkLength(target, changeOne, maxLength) {
    var len = target.val().length;
    changeOne.html(maxLength - len);
    if((maxLength - len) < 0){
        changeOne.css("color", "red");
    }else{
        changeOne.css("color", "black");
    }
}

var t2;

// 重置转发框内容（刷新浏览器或重新点“转发”后用上）
function resetShare(share_word, remain_word, share_button, maxLength) {
	//用placeholder就行
//  share_word.val("请输入转发理由");
    share_word.attr("disabled", false);
    remain_word.html(maxLength);
    remain_word.css("color", "black");
    // 以下处理“用户在转发过程中关闭了转发框
    share_button.html("转发");
    share_button.attr("disabled", false);
    share_button.css("width", "55px");
    clearTimeout(t2);   /*直接调用clearBuffering会造成其与关闭按钮click的死循环*/
}

// 转发中...
function buffering() {
    var $share_button = $("#share-button");
    $share_button.css("width", "80px");
    $share_button.css("border-color", "#E67E22");
    var pre = $share_button.html();
    var text = "转发中";
    if(pre != (text + "...")){
        $share_button.html(pre + '.');
    }else{
        $share_button.html(text);
    }
    t2 = setTimeout("buffering()", 700);
}
// 停止转发
function  clearBuffering() {
    clearTimeout(t2);
    var $btn_share = $("#share-button");
    $("#close-button").click();
    $btn_share.attr("disabled", false);
    $btn_share.html("转发");
    $btn_share.css("width", "55px");
    $("#share-word").attr("disabled", false);
}
