var basePath=$("#basePath").val();
$(document).ready(function(){
	$(document).on("click","li.collection span",function(){
		var $li=$(this).parent();
		if($li.hasClass("grayLi")){
			//收藏
			$.ajax({
				type:"POST",
				url:basePath+"/collection/add",
				contentType:"application/json",
				data:JSON.stringify({
					userId:$("#userId").val(),
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
				url:basePath+"/collection/remove",
				contentType:"application/json",
				data:JSON.stringify({
					userId:$("#userId").val(),
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
        		url:basePath+"/support/add",
        		contentType:"application/json",
        		data:JSON.stringify({
        			userId:$("#userId").val(),
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
        		url:basePath+"/support/remove",
        		contentType:"application/json",
        		data:JSON.stringify({
        			userId:$("#userId").val(),
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