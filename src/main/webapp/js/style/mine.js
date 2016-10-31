window.onresize = function () {
    // 关注的人和粉丝居中
    if($(".my-friends").length != 0){
        // 调整friends的padding-left，以使关注人居中，每个关注加上其margin，宽度为230px
        var $friends = $(".friends");
        // 计算每行可放的关注人的数量
        var num_one_row = Math.floor($friends.width() / 230);
        $friends.css("padding-left", ($friends.width() - 230 * num_one_row) / 2);
    }
    if($(".my-fans").length != 0){
        var $fans = $(".fans");
        var num_one_row = Math.floor($fans.width() / 230);
        $fans.css("padding-left", ($fans.width() - 230 * num_one_row) / 2);
    }

    if($(".my-poems").length != 0){
        setImg($(".my-poems"));
    }
};

$(function () {
	
    // 定义全局变量
    var totalItems = null;
    var itemsEachPage = null;
    var pages = null;

    window.onresize();

    // 点击侧栏的li跳转到对应页面
    $(document).on("click", ".mine-sidebar li", function () {
        var h = $(this).find("a").attr("href");
        window.location.href = h;
    });

    
    // 取消关注
    if($(".my-friends").length != 0){
        $(document).on("click", ".friend .delete", function () {
            var name = $(this).parents(".friend").find(".info .name").html();
            $("#concernModal .modal-body span").html(name);
            var concernId=$(this).parents("li").attr("id");
            $("#hidden-concernId").val(concernId.slice(7));
        });
        $(document).on("click", "#concernModal .modal-footer .yes", function () {
        	var num=$(".my-friends .title").html().slice(5);
        	num=Number(num)-1;
        	$(".my-friends .title").html("全部关注 "+num);
            var name = $(this).parents(".modal-content").find(".modal-body span").html();
            $(".friend").each(function () {
                var n = $(this).find(".info .name").html();
                if(n == name){
                    $(this).remove();
                }
            });
            if(num==0){
            	$(".no-friend").removeClass("hide");
            }
            // 关闭弹出框
            $(this).next().click();
            
        	var page=$(".m-pagination-page li.active a").html();
        	if(!page){
        		page=1;
        	}
        	$.ajax({
        		type:"POST",
        		url:$("#basePath").val()+"/concern/removeConcern",
        		data:{
        			concernedId: $("#hidden-concernId").val(),
        			concernerId: $("#userId").val(),
        			page:page//当前页。
        		},
        		dataType:"json",
        		success:function(data){
        			if(data.userId){
//        				alert(data);
        				var str='<li class="friend" id="author-'+data.userId+'"><div class="head">'
						+'<a href="'+$("#basePath").val()+'/user/aid/'+data.userId+'" title="进入作者主页" target="_blank">';
						if(this.userIcon){
							str+='<img src="'+$("#basePath").val()+'/img/user/'+data.userIcon+'" alt="" />';
						}else{
							str+='<img src="'+$("#basePath").val()+'/img/attached/head-icon2.PNG" alt="" />';
						}
						var remainStr='</a></div><div class="info"><span class="name" title="'+data.userName+'">'+data.userName
									  +'</span><span class="gender ';
						if(data.userSex==1){
							remainStr+="male";
						}else{
							remainStr+="female";
						}
						remainStr+=' glyphicon glyphicon-user"></span></div><a href="#" data-toggle="modal" data-target="#concernModal">';
		                remainStr+='<span class="delete">取消关注</span></a></li>';
		                str+=remainStr;
		                
		                $("ul.friends").append(str);
        			}else{
        				alert("没有了");
        			}
        		}
        	});
        	if($("ul.m-pagination-page li").length!=0){
        		$("#conPage").page("destroy");
                initConcernPage();
        	}
        	
        	
            if($("ul.m-pagination-page li").length!=0 && $("ul.m-pagination-page li").eq(page-1).html()){
            	$("ul.m-pagination-page li").removeClass("active");
                $("ul.m-pagination-page li").eq(page-1).addClass("active");
            }else if(page!=1){
            	window.location.reload(true);
            }
        });

    }

    // 粉丝
    if($(".my-fans").length != 0){
        totalItems = parseInt($(".my-fans .title").html().slice(5));
        itemsEachPage = 6;
        pages = Math.ceil(totalItems / itemsEachPage);
        if(pages != 1 && $("#fansPage").length != 0){
            showPage($("#fansPage"), totalItems, itemsEachPage);  //调用实现分页插件的函数
            $("#fansPage").on("pageClicked", function (event, pageIndex) {
            	$.ajax({
            		type:"POST",
            		url:$("#basePath").val()+"/concern/getFansByPage",
            		data:{
            			page: pageIndex,
            			uId: $("#userId").val()
            		},
            		dataType:"json",
            		success:function(data){
            			$(".fans li").remove();
            			$.each(data,function(){
            				var str='<li class="fan" id="author-'+this.userId+'"><div class="head">'
            						+'<a href="'+$("#basePath").val()+'/user/aid/'+this.userId+'" title="进入作者主页" target="_blank">';
            				if(this.userIcon){
            					str+='<img src="'+$("#basePath").val()+'/img/user/'+this.userIcon+'" alt="" />';
            				}else{
            					str+='<img src="'+$("#basePath").val()+'/img/attached/head-icon2.PNG" alt="" />';
            				}
            				var remainStr='</a></div><div class="info"><span class="name" title="'+this.userName+'">'+this.userName
            							  +'</span><span class="gender ';
            				if(this.userSex==1){
            					remainStr+="male";
            				}else{
            					remainStr+="female";
            				}
            				remainStr+=' glyphicon glyphicon-user"></span></div></li>';
                            str+=remainStr;
                            
                            $("ul.fans").append(str);
            			});
            				
            		}
            	});
            });
        }
    }

    // 个人资料
    if($(".my-infos").length != 0){
        // 设置密码为*
        // var $pass = $(".my-infos .content .password .value");
        // var real_pass = $pass.html();
        // var hide_pass = "";
        // for(var i = 0; i < real_pass.length; i ++){
        //     hide_pass += "*";
        // }
        // $pass.html(hide_pass);

        // 更换头像
        var src_of_img;
        $(document).on("click", ".my-infos .content .icon button.change", function () {
            src_of_img = $(this).siblings("img").attr("src");
            $(this).next("input").click();
        });
        if(document.getElementById("icon-file")) {
            var input = document.getElementById("icon-file");
            if (typeof FileReader === 'undefined') {
                alert("抱歉，你的浏览器不支持 FileReader，无法上传图片");
                input.setAttribute('disabled', 'disabled');
            } else {
                input.addEventListener('change', readFile, false);
            }
        }
        // 选择是否保存头像的更改
        $(document).on("click", ".icon-change-btn button", function () {
            var index = $(this).index();
            var $parent = $(this).parent();
            if(index == 0){
                // 保存头像的修改

                $parent.addClass("hide");
            }else{  /*取消修改时，头像图片恢复为原来的*/
                $parent.siblings("img").attr("src", src_of_img);
                $parent.addClass("hide");
            }
        });
        // 个性签名字数限制
        $(document).on("keydown", ".signature .new textarea", function () {
            checkLength($(this), $(this).next(), 30);
        });
        $(document).on("keypress", ".signature .new textarea", function () {
            checkLength($(this), $(this).next(), 30);
        });
        $(document).on("keyup", ".signature .new textarea", function () {
            checkLength($(this), $(this).next(), 30);
        });
        // 个性签名的“修改”
        $(document).on("click", ".info .not-to", function () {
            if($(this).html() == "编辑"){
                $(this).parent().css("background-color", "white");
                $(this).siblings(".value").addClass("hide");
                $(this).siblings("div").removeClass("hide");
                $(this).siblings("button").removeClass("hide");
                // 设置扩展中的“现个性签名”
                var old_sig = $(this).siblings(".value").html();
                $(this).siblings(".old").find("span").eq(1).html(old_sig);
                // 清空输入框并重设剩余字数
                $(".signature .new textarea").val("");
                $(".signature .new textarea").keydown();
                $(this).html("收起");
            }else if($(this).html() == "收起"){
                $(this).parent().css("background-color", "#F2F2F2");
                $(this).siblings(".value").removeClass("hide");
                $(this).siblings("div").addClass("hide");
                $(this).siblings("button").addClass("hide");
                $(this).html("编辑");
            }
        });
        // 保存个性签名的修改
        /*
        $(document).on("click", ".signature button", function () {
            var $count = $(this).siblings(".new").find("span").eq(1);
            if($count.html() < 0){
                return false;
            }else{
                var new_sig = $(this).siblings(".new").find("textarea").val();
                $(this).siblings(".value").html(new_sig);
                $(".info .not-to").click();     //收起编辑框
            }
        });
*/
        // 性别的修改
        $(':input').labelauty();
        $(document).on("click", ".gender .change", function () {
            var $val = $(this).siblings(".value");
            var $cho = $(this).siblings(".choose-gen");
            if($(this).html() == "修改"){
                $val.addClass("hide");
                $cho.removeClass("hide");
                $(this).parent().css("padding-bottom", "7px");

                if($val.html() == "男"){
                    $cho.find("input[value='male']").prop("checked", true);
                }else{
                    $cho.find("input[value='female']").prop("checked", true);
                }
                $(this).html("保存");
            }else{
                $val.removeClass("hide");
                $cho.addClass("hide");
                $(this).parent().css("padding-bottom", "15px");
                // 获得被选中的单选框的value
                var choose = $cho.find("input:radio[name='gender']:checked").attr("value");
                
                $.ajax({
                	type:"POST",
                	url:$("#basePath").val()+"/user/updateUser/"+$("#userId").val(),
                	data:{
                		"type":"sex",
                		"data":choose
                	},
                	dataType:"text",
                	success:function(data){
                		if(data=="success"){
                			alert("修改成功");
                			if(choose == "male"){
                                $val.html("男");
                            }else{
                                $val.html("女");
                            }
                		}else{
                			alert("保存失败！");
                		}
                	}
                });
                $(this).html("修改");
            }
        });
    }

    // 安全中心
    if($(".my-security").length != 0){
        // jquery.validate插件对“修改密码”进行表单验证
        // 自定义验证规则  function (value, element, params)
        jQuery.validator.addMethod("chrnum", function(value, element) {
            var chrnum = /^([a-zA-Z0-9]+)$/;
            return this.optional(element) || (chrnum.test(value));
        }, "只能输入数字和字母(字符A-Z, a-z, 0-9)");
        $("#passwordForm").validate({
            rules: {
                oldpass: "required",
                newpass: {
                    required: true,
                    minlength: 5,
                    chrnum: true
                },
                againpass: {
                    required: true,
                    equalTo: "#newpass"
                }
            },
            messages: {
                oldpass: "请输入您的原密码",
                newpass: {
                    required: "请设置您的新密码",
                    minlength: "密码长度不能小于5个字母"
                },
                againpass: {
                    required: "请再次输入您的新密码",
                    equalTo: "两次密码输入不一致"
                }
            },
            // 表单提交成功后
            submitHandler: function () {

            }
        });
    }

    // 我的诗集
    if($(".my-poems").length != 0){
        setImg($(".my-poems"));
        // title和content的hover及click
        $(document).on("mouseover mouseout", ".poem-title", function(event){
            if(event.type == "mouseover"){
                $(this).find("a").css("color", "black")
                    .parent().siblings(".poem-content").css("color", "black");
            }else if(event.type == "mouseout"){
                $(this).find("a").css("color", "#949494")
                    .parent().siblings(".poem-content").css("color", "#949494");
            }
        });
        $(document).on("mouseover mouseout", ".poem-content", function (event) {
            if(event.type == "mouseover"){
                $(this).css("color", "black")
                    .siblings(".poem-title").find("a").css("color", "black");
            }else if(event.type == "mouseout"){
                $(this).css("color", "#949494")
                    .siblings(".poem-title").find("a").css("color", "#949494");
            }
        });
        $(document).on("click", ".poem-title", function () {
            $(this).find("a").click();
        });
        $(document).on("click", ".poem-content", function () {
            var h = $(this).siblings(".poem-title").find("a").attr("href");
            window.open(h);
        });

        // 移除诗
        $(document).on("click", ".poem-remove", function () {
            var id = $(this).parents(".poem").attr("id");
            $("#poemModal").attr("remove-id", id);
            var title = $(this).parent().siblings(".poem-title").find("a").html();
            $("#poemModal .modal-body span").html(title);
            
            var poemId=$(this).parents("div.poem").attr("id").slice(5);
            $("#poem-id-input").val(poemId);
            
        });
        $(document).on("click", "#poemModal .yes", function () {
            var poemId=$("#poem-id-input").val();
            
            $.ajax({
            	type:"POST",
            	url:$("#basePath").val()+"/poem/removePoem",
            	data:{
            		poemId:poemId,
            		userId:$("#userId").val()
            	},
            	dataType:"text",
            	success:function(data){
            		if(data=="success"){
            			alert("删除成功");
//            			var $title=$("span.title");
//                    	var num=Number($title.html().slice(5));
//                    	num=num-1;
//                    	$title.html("我的诗集 "+num);
//                        if(num==0){
//                        	$(".no-poem").removeClass("hide");
//                        }
            			var num=$("div.poem").length;
                        $("#poem-"+poemId).remove();
                        var page=Number($("ul.m-pagination-page li.active a").html());
                        if($("ul.m-pagination-page li.active").length==0){
                        	page=1;
                        }
            			if(num==1 && page>1){
            				page=(page-1);
            			}
            			window.location.href=$("#basePath").val()+"/user/creation/"
						+$("#userId").val()+"?page="+page;
            		}else{
            			alert("删除失败");
            		}
            	}
            });
            
            $(this).next().click();
            
        });

        totalItems = parseInt($(".my-poems .title").html().slice(5));
        itemsEachPage = 4;
        pages = Math.ceil(totalItems / itemsEachPage);
        if(pages != 1 && $("#poemPage").length != 0){
            showPage($("#poemPage"), totalItems, itemsEachPage);  //调用实现分页插件的函数
            $("#poemPage").on("pageClicked", function (event, pageIndex) {
            	window.location.href=$("#basePath").val()+"/user/creation/"+$("#userId").val()+"?page="+pageIndex;
            });
        }
    }


    // 收藏
    if($(".my-collections").length != 0){
        // 设置图片大小及位置
        setImg($(".my-collections"));

        // 点击诗歌内容进入诗歌具体页面
        $(document).on("click", ".col-content", function () {
            var h = $(this).siblings(".col-title").find("a").attr("href");
            window.open(h);
        });

        // 移除收藏
        $(document).on("click", ".col-remove", function () {
            var id = $(this).parents(".collection").attr("id");
            $("#colModal").attr("remove-id", id);
            var title = $(this).parent().siblings(".col-title").find("a").html();
            $("#colModal .modal-body span").html(title);
            
            $("#poem-id-hidden").val(id.slice(11));
        });
        $(document).on("click", "#colModal .yes", function () {
//            var id = $(this).parents("#colModal").attr("remove-id");
//            $(".collection").each(function () {
//                if($(this).attr("id") == id){
//                    $(this).remove();
//                    if($(".collection").length == 0){
//                        $(".no-collection").removeClass("hide");
//                    }
//                    return false;
//                }
//            });
        	 $(this).next().click();
        	var poemId=$("#poem-id-hidden").val();
        	var page=$(".m-pagination-page li.active a").html();
        	if(!page){
        		page=1;
        	}
        	var num=$("span.title").html().slice(5);
			num=Number(num)-1;
			$("span.title").html("我的收藏 "+num);
			if(num==0){
				$(".no-collection").removeClass("hide");
			}
			$("#collection-"+poemId).remove();
        	$.ajax({
        		type:"POST",
        		url:$("#basePath").val()+"/collection/removeByAjax",
        		data:{
        			userId:$("#userId").val(),
        			poemId:poemId,
        			page:page
        		},
        		dataType:"json",
        		success:function(data){
        			if(data.poemId){
        				str='<div class="collection" id="collection-'
        					+data.poemId
        					+'"><div class="row"><div class="img col-sm-5">';
        				var img="";
        				if(data.poemImg){
        					img='<img src="'+$("#basePath").val()+'/img/poem/'+data.poemImg+'" alt="我的收藏" />';
        				}else{
        					img='<img src="'+$("#basePath").val()+'/img/attached/test.jpg" alt="我的收藏" />';
        				}
                        str+=img;
                        var remainStr='</div><div class="words col-sm-7"><a href="#" data-toggle="modal" data-target="#colModal">'
                        			  +'<span class="col-remove glyphicon glyphicon-trash"></span></a>'
                        			  +'<div class="col-title"><a href="'
                        			  +$("#basePath").val()
                        			  +'/poem/pid/'
                        			  +data.poemId
                        			  +'" target="_blank" title="'
                        			  +data.poemTitle
                        			  +'">'
                        			  +data.poemTitle
                        			  +'</a></div><span class="col-author"><a target="_blank" href="'
                        			  +$("#basePath").val()
                        			  +'/user/aid/'
                        			  +data.userId
                        			  +'" title="'
                        			  +data.userName
                        			  +'">'
                        			  +data.userName
                        			  +'</a></span><div class="col-content"><p>'
                        			  +data.poemText
                        			  +'</p></div></div></div></div>';
                        str+=remainStr;
                        $("#collection-wrap-div").append(str);
                        setImg($(".my-collections"));
        			}
        		}
        	})
        	if($("ul.m-pagination-page li").length!=0){
        		$("#colPage").page("destroy");
                initCollectionPage();
        	}
        	
            if($("ul.m-pagination-page li").length!=0 && $("ul.m-pagination-page li").eq(page-1).html()){
            	$("ul.m-pagination-page li").removeClass("active");
                $("ul.m-pagination-page li").eq(page-1).addClass("active");
            }else if(page!=1){
            	window.location.reload(true);
            }
           
        });

//        totalItems = parseInt($(".my-collections .title").html().slice(5));
//        itemsEachPage = 2;
//        pages = Math.ceil(totalItems / itemsEachPage);
//        if(pages != 1 && $("#colPage").length != 0){
//            showPage($("#colPage"), totalItems, itemsEachPage);   //调用实现分页插件的函数
//            $("#colPage").on("pageClicked", function (event, pageIndex) {
//            	
//            });
//        }
    }
});


function readFile(){
    var file = this.files[0]; //获取file对象
    //判断file的类型是不是图片类型。
    if(!/image\/\w+/.test(file.type)){
        alert("请上传图片");
        return false;
    }

    var reader = new FileReader(); //声明一个FileReader实例
    reader.readAsDataURL(file);    //调用readAsDataURL方法来读取选中的图像文件
    reader.onload = function(e){
        var $img = $(".my-infos .content .icon img");
        var img = $img[0];
        img.src = this.result;
    }
    $(".icon-change-btn").removeClass("hide");
}

function checkLength(target, changeOne, maxLength) {
    var len = target.val().length;
    changeOne.html(maxLength - len);
    if((maxLength - len) < 0){
        changeOne.css("color", "red");
    }else{
        changeOne.css("color", "black");
    }
}



function setMiddle(n) {
    // 判断图片加载状况，加载完成后回调，若图片未加载完成便尝试设置margin-top使其居中，样式出错
    isImgLoad(function(){
        // 加载完成
        var $poem = $(".poem");
        $poem.each(function () {
            var poem_height = $(this).css("height");
            var $img = $(this).find(".img");

            var $words = $(this).find(".words");
            var img_height = $img.css("height");
            var words_height = $words.css("height");

            var img_target = (parseInt(poem_height) - parseInt(img_height)) / n;
            var words_target = (parseInt(poem_height) - parseInt(words_height)) / 2;
            $img.css("margin-top", img_target + "px");
            $words.css("margin-top", words_target + "px");
        });
    });
}

// 图片根据宽高超出容器宽高的比例，进行合适的大小设置
function setImg(target) {
    var $img = target.find(".img");
    var img_w = $img.width();
    var img_h = $img.height();
    $img.each(function () {
            var $inner = $(this).find("img");
        var inner_w = $inner.width();
        var inner_h = $inner.height();
        var ratio_w = inner_w / img_w;
        var ratio_h = inner_h / img_h;
        if(ratio_w >= ratio_h){
            $inner.css("height", "100%");
            var inner_new_w = $inner.css("width");
            var margin_w = (parseInt(inner_new_w) - img_w) / 2;
            $inner.css("margin-left", - margin_w);
        }else{
            $inner.css("width", "100%");
            var inner_new_h = $inner.css("height");
            var margin_h = (parseInt(inner_new_h) - img_h) / 2;
            $inner.css("margin-top", - margin_h);
        }
    });
}

// 判断图片是否加载完成
function isImgLoad(callback){
    var t_img; // 定时器
    var isLoad = true;
    // 这里只针对收藏里的图片
    $('.img img').each(function(){
        // 找到为0就将isLoad设为false，并退出each
        if(this.height === 0){
            isLoad = false;
            return false;
        }
    });
    if(isLoad){              // 为true，加载完毕
        clearTimeout(t_img); // 清除定时器
        callback();          // 调用回调函数
    }else{             // 为false，由于还有图片未加载完成，将调用定时器递归
        isLoad = true;
        t_img = setTimeout(function(){
            isImgLoad(callback);    // 递归扫描（这里设置0.3秒）
        },300);
    }
}

// 分页插件实现
function showPage(target, totalItems, itemsEachPage){
    target.page({
        total: totalItems,
        firstBtnText: '首页',
        lastBtnText: '尾页',
        prevBtnText: '上一页',
        nextBtnText: '下一页',
        jumpBtnText:'跳转',
        pageSize: itemsEachPage,
        // infoFormat: '{start} ~ {end}条，共{total}条',
        showInfo: false,
        showJump: false,
        showPageSizes: false
    });
}
function initConcernPage(){
	
	// “关注”中的分页
    var total = parseInt($(".my-friends .title").html().slice(5));   //总共关注的人数
    var itemsEachPage = 6; 
    //每页的条目数量
    pages = Math.ceil(total / itemsEachPage);
    if(pages != 1 && $("#conPage").length != 0){
        showPage($("#conPage"), total, itemsEachPage);  //调用实现分页插件的函数
        $("#conPage").on("pageClicked", function (event, pageIndex) {
            //点击跳转到对应页面
        	$.ajax({
        		type:"POST",
        		url:$("#basePath").val()+"/concern/getConcernsByPage",
        		data:{
        			page: pageIndex,
        			uId: $("#userId").val()
        		},
        		dataType:"json",
        		success:function(data){
        			$(".friends li").remove();
        			$.each(data,function(){
        				var str='<li class="friend" id="author-'+this.userId+'"><div class="head">'
        						+'<a href="'+$("#basePath").val()+'/user/aid/'+this.userId+'" title="进入作者主页" target="_blank">';
        				if(this.userIcon){
        					str+='<img src="'+$("#basePath").val()+'/img/user/'+this.userIcon+'" alt="" />';
        				}else{
        					str+='<img src="'+$("#basePath").val()+'/img/attached/head-icon2.PNG" alt="" />';
        				}
        				var remainStr='</a></div><div class="info"><span class="name" title="'+this.userName+'">'+this.userName
        							  +'</span><span class="gender ';
        				if(this.userSex==1){
        					remainStr+="male";
        				}else{
        					remainStr+="female";
        				}
        				remainStr+=' glyphicon glyphicon-user"></span></div><a href="#" data-toggle="modal" data-target="#concernModal">';
                        remainStr+='<span class="delete">取消关注</span></a></li>';
                        str+=remainStr;
                        
                        $("ul.friends").append(str);
        			});
        				
        		}
        	});
        });
    }
}
function initCollectionPage(){
	// “收藏”中的分页
    var total = parseInt($(".my-collections .title").html().slice(5));   //总共关注的人数
    var itemsEachPage = 4; 
    //每页的条目数量
    pages = Math.ceil(total / itemsEachPage);
    if(pages != 1 && $("#colPage").length != 0){
        showPage($("#colPage"), total, itemsEachPage);  //调用实现分页插件的函数
        $("#colPage").on("pageClicked", function (event, pageIndex) {
            //点击跳转到对应页面
        	$.ajax({
        		type:"POST",
        		url:$("#basePath").val()+"/collection/getCollectionsByPage",
        		data:{
        			page: pageIndex,
        			uId: $("#userId").val()
        		},
        		dataType:"json",
        		success:function(data){
        			$("#collection-wrap-div").empty();
        			$.each(data,function(){
        				str='<div class="collection" id="collection-'
        					+this.poemId
        					+'"><div class="row"><div class="img col-sm-5">';
        				var img="";
        				if(this.poemImg){
        					img='<img src="'+$("#basePath").val()+'/img/poem/'+this.poemImg+'" alt="我的收藏" />';
        				}else{
        					img='<img src="'+$("#basePath").val()+'/img/attached/test.jpg" alt="我的收藏" />';
        				}
                        str+=img;
                        var remainStr='</div><div class="words col-sm-7"><a href="#" data-toggle="modal" data-target="#colModal">'
                        			  +'<span class="col-remove glyphicon glyphicon-trash"></span></a>'
                        			  +'<div class="col-title"><a href="'
                        			  +$("#basePath").val()
                        			  +'/poem/pid/'
                        			  +this.poemId
                        			  +'" target="_blank" title="'
                        			  +this.poemTitle
                        			  +'">'
                        			  +this.poemTitle
                        			  +'</a></div><span class="col-author"><a target="_blank" href="'
                        			  +$("#basePath").val()
                        			  +'/user/aid/'
                        			  +this.userId
                        			  +'" title="'
                        			  +this.userName
                        			  +'">'
                        			  +this.userName
                        			  +'</a></span><div class="col-content"><p>'
                        			  +this.poemText
                        			  +'</p></div></div></div></div>';
                        str+=remainStr;
                        $("#collection-wrap-div").append(str);
        			});
        			setImg($(".my-collections"));
        		}
        	});
        });
    }
}