/**
 * Created by Administrator on 2016/10/23.
 */
$(function () {
    // 设置诗歌内容超过150字的部分隐藏
    var txt = 140;
    var o = document.getElementsByClassName("plat-content");
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

    $(document).on("click", ".plat", function () {
        var h = $(this).find("a").attr("href");
        window.open(h);
    });

    // 设置分页
    /*
    var totalItems = 20;
    var itemsEachPage = 6;
    var pages = Math.ceil(totalItems / itemsEachPage);
    if(pages > 1){
        showPage($("#platPage"), totalItems, itemsEachPage);  //调用实现分页插件的函数
        $("#platPage").on("pageClicked", function (event, pageIndex) {

        });
    }
    */
});

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