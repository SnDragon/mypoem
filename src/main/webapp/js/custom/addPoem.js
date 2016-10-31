var basePath=$("#basePath").val();
function addPoem(data){
	var str='<article  class="dynamic" id="article-'+data.poemId+'">';
	str=str+'<button type="button" class="del btn btn-default" data-toggle="modal" data-target="#myModal2">'
        +'删除</button>'
	str+='<div class="dynamic-head">';
	str+=' <h1 class="dynamic-title">';
	str=str+'<a href="'
		+$("#basePath").val()+'/poem/pid/'+data.poemId+'">';
	str+=data.poemTitle;
	str+='</a></h1><div class="dynamic-meta"><span class="dynamic-author">';
	str=str+'作者:<a target="_blank" href="'
		+$("#basePath").val()+'/user/aid/'+$("#userId").val()+'">';
	str+=$("#userName").val();
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
		str+='<img src="'+basePath+'/img/poem/';
		str+=data.poemImg;
		str+='" alt="这也是一切" /></div></div>';
	}
	str+='<div class="dynamic-action"><div class="row"><ul id="';
	str+=data.poemId+'">'
	str+='<li class="col-xs-3 keep grayLi collection" >';
	str+='<span class="glyphicon glyphicon-heart-empty"></span><span>收藏</span>';
	str+='</li><li class="col-xs-3 share"><a href="#" data-toggle="modal" data-target="#myModal" class="btn disabled">';
	str+='<span class="glyphicon glyphicon-share"></span><span class="share-number" id="share-span-'+data.poemId+'">0</span></a></li>';
	str+='<li class="col-xs-3 comment"><span class="glyphicon glyphicon-comment"></span><span class="comment-number" id="comment-span-'+data.poemId+'">0</span>';
	str+='</li><li class="col-xs-3 thumb support grayLi"><span class="glyphicon glyphicon-thumbs-up"></span><span class="thumb-number">0</span>';
	str+='</li></ul></div></div>';
	
	str+='<div class="comment-wrap"><div class="dynamic-comment"><div class="send-comment">';
	str+='<a href="mine.html"><img src="'
	str+=basePath;
	str=str+'/img/user/'+$("#userIcon").val()+'" alt="输入你的评论" />';
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
	        url:$("#basePath").val()+'/poem/imageUpload?uid='+uid,  
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
	        			url:$("#basePath").val()+"/poem/addPoem",
	        			contentType:"application/json",
	        			data:JSON.stringify({
	        				userId:$("#userId").val(),
	        				poemTitle:$("#put-out-title").val(),
	        				poemText:$("#put-out-content").val(),
	        				poemImg:imgPath,
	        				labelId:$("a.selected").attr("id").slice(6),
	        				labelName:$("a.selected").html()
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
			url:$("#basePath").val()+"/poem/addPoem",
			contentType:"application/json",
			data:JSON.stringify({
				userId:$("#userId").val(),
				poemTitle:$("#put-out-title").val(),
				poemText:$("#put-out-content").val(),
				labelId:$("a.selected").attr("id").slice(6),
				labelName:$("a.selected").html()
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

