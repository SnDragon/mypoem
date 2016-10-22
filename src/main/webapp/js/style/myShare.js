/**
 * Created by Administrator on 2016/10/19.
 */
window.onresize = function () {
    // 设置原文图片
    if($(".my-shares").length != 0){
        setImg($(".my-shares"));
    }
};

$(function () {
    // 定义全局变量
    var totalItems = null;
    var itemsEachPage = null;
    var pages = null;
    var $totalText = null;

    window.onresize();

    // 点击侧栏的li跳转到对应页面
    $(document).on("click", ".mine-sidebar li", function () {
        var h = $(this).find("a").attr("href");
        window.location.href = h;
    });

    // 我的转发
    if($(".my-shares").length != 0){
        // 设置原文题目超过15字的部分隐藏并显示...
        var txt = 15;
        var o = document.getElementsByClassName("orig-title");
        for(var i = 0; i < o.length; i ++){
            var s = o[i].innerHTML;
            var p = document.createElement("span");
            var n = document.createElement("font");
            p.innerHTML = s.substring(0,txt);
            n.innerHTML = s.length > txt ? "..." : "";
            o[i].innerHTML = "";
            o[i].appendChild(p);
            o[i].appendChild(n);
        }

        $totalText = $(".my-shares .title");
        totalItems = parseInt($totalText.html().slice(5));
        itemsEachPage = 2;
        pages = Math.ceil(totalItems / itemsEachPage);
        if(pages > 1){
            showPage($("#sharePage"), totalItems, itemsEachPage);   //调用实现分页插件的函数
            $("#sharePage").on("pageClicked", function (event, pageIndex) {
            	window.location.href=$("#basePath").val()+"/user/transmition/"+$("#userId").val()+"?page="+pageIndex;
            }).on("jumpClicked", function (event, pageIndex){
            	
            });
        }

        if(totalItems == 0){
            $(".no-share").removeClass("hide");
        }

        // 移除转发
        $(document).on("click", ".share-remove", function () {
//            var id = $(this).parents(".share").attr("id");
//            $("#shareModal").attr("remove-id", id);
            var title = $(this).parent().siblings(".orig").find(".orig-title").html();
            $("#shareModal .modal-body span").html(title);
            
            var transmitId=$(this).parents(".share").attr("id").slice(9);
            $("#remove-id-input").val(transmitId);
            
        });
        $(document).on("click", "#shareModal .yes", function () {
//            var id = $(this).parents("#shareModal").attr("remove-id");
//            totalItems = parseInt($totalText.html().slice(5)) - 1;
//            $totalText.html("我的转发 " + totalItems);
//            var pages_new = Math.ceil(totalItems / itemsEachPage);
//            if(totalItems == 0){
//                $(".no-share").removeClass("hide");
//            }
//            var current_page = null;
//            if(pages_new < pages){
//                $(".m-pagination-page li").each(function () {
//                    if($(this).hasClass("active")){
//                        current_page = $(this).find("a").html();
//                        if(current_page == pages){
//                            current_page -= 1;
//                        }
//                    }
//                })
//                $("#sharePage").page("destroy");
//                if(pages_new > 1){
//                    showPage($("#sharePage"), totalItems, itemsEachPage, current_page);  //更新分页并定位到原来的页数
//                }
//                pages = pages_new;
//            }
//            $(".share").each(function () {
//                if($(this).attr("id") == id){
//                    $(this).remove();
//                    return false;
//                }
//            });
        	var transmitId=$("#remove-id-input").val();
        	$.ajax({
        		type:"POST",
        		url:$("#basePath").val()+"/transmit/remove/"+transmitId,
        		dataType:"text",
        		success:function(data){
        			if(data=="success"){
        				alert("删除成功");
        				
        				var num=$("div.share").length;
        				$("#transmit-"+transmitId).remove();
        				 var page=Number($("ul.m-pagination-page li.active a").html());
                         if($("ul.m-pagination-page li.active").length==0){
                         	page=1;
                         }
             			if(num==1 && page>1){
             				page=(page-1);
             			}
             			window.location.href=$("#basePath").val()+"/user/transmition/"
 						+$("#userId").val()+"?page="+page;
        				
        			}else{
        				alert("删除失败");
        			}
        		}
        	});
            $(this).next().click();
        });
    }
});


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

// 分页插件实现
function showPage(target, totalItems, itemsEachPage, pageIndex){
    var p;
    if(pageIndex > 0){
        p = pageIndex;
    }else{
        p = 1;
    }
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
        showPageSizes: false,
        toPageIndex: p - 1
    });
}