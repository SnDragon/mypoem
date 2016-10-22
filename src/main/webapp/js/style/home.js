/**
 * Created by Administrator on 2016/10/19.
 */


$(function () {
    // 先初始化旋转木马，再调用setImg
    Caroursel.init($('.caroursel'));
    setImg($(".poster-list"));

    var $lis = $(".caroursel li");
    var $title = $(".caroursel .title");
    var $firstLi = $lis.eq(0);
    $lis.each(function () {                           // 设置图片的title值等于其alt值，即诗歌标题
        var alt = $(this).find(".img img").attr("alt");
        $(this).find(".img img").attr("title", alt);
    });
    $title.html($firstLi.find(".img img").attr("alt"));           // 设置初始标题为第一张图片的alt
    $title.attr("href", $firstLi.find(".img").attr("href"));      // 设置初始标题的跳转页面
    $title.attr("title", $firstLi.find(".img img").attr("alt"));  // 设置初始标题的title属性
    // 当点击“上一张”或“下一张”的时候，改变标题及标题的href属性
    // 由于自动切换的原理即是点击“上一张”，故也可实现
    $(document).on("click", ".caroursel .poster-next-btn, .caroursel .poster-prev-btn", function () {
        var prevOrNext = null;
        if($(this).hasClass("poster-next-btn")){
            prevOrNext = "next";
        }else{
            prevOrNext = "prev";
        }
        $lis.each(function () {
            var alt = null;
            var href = null;
            var title = null;
            if($(this).width() == 770){
                if(prevOrNext == "next"){
                    if($(this).next().html() == undefined){  // 若没有下一张图片，标题显示为第一张
                        var $f = $lis.first().find(".img");
                        alt = $f.find("img").attr("alt");
                        href = $f.attr("href");
                    }else{
                        alt = $(this).next().find(".img img").attr("alt");
                        href = $(this).next().find(".img").attr("href");
                    }
                }else{
                    if($(this).prev().html() == undefined){
                        var $l = $lis.last().find(".img");
                        alt = $l.find("img").attr("alt");
                        href = $l.attr("href");
                    }else{
                        alt = $(this).prev().find(".img img").attr("alt");
                        href = $(this).prev().find(".img").attr("href");
                    }
                }
                $title.html(alt);
                $title.attr("href", href);
                $title.attr("title", alt);
            }
        });
    });

    // 设置画布渐变效果
    var c = document.getElementById("labelCanvas");
    var ctx = c.getContext("2d");
    var my_gradient = ctx.createLinearGradient(0,0,320,0);
    my_gradient.addColorStop(0.3,"#E67E22");
    my_gradient.addColorStop(0.2,"#E67E22");
    my_gradient.addColorStop(1,"#EBEBEB");  // 背景色
    ctx.fillStyle = my_gradient;
    ctx.fillRect(0,0,1020,30);

    // 设置提示框内容
    var $authors = $(".recom-author .author");
    $authors.each(function () {
        var title = $(this).find("a .name").html();
        $(this).find("a").attr("title", title);
    });
    var $icons = $(".recom-author .icon");
    $icons.each(function () {
        var title = $(this).find(".info .name").html();
        $(this).attr("title", title);
        $(this).find("img").attr("alt", title);
    });
    var $poems = $(".others-poem .poem");
    $poems.each(function () {
        var title = $(this).find("a").html();
        $(this).find("a").attr("title", title);
    });
    // 利用插件设置提示框
    $('.mytooltip').toolTip();
});


// 图片根据宽高超出容器宽高的比例，进行合适的大小设置
function setImg(target) {
    var $img = target.find(".img");
    $img.each(function () {
        var img_w = null;
        var img_h = null;
        // 若不是第一张图片（当前放大显示的图片），包裹的.img的大小应为0.8缩放值
        if($(this).parent().index() == 0){
            img_w = $img.width();
            img_h = $img.height();
        }else{
            img_w = $img.width() * 0.8;
            img_h = $img.height() * 0.8;
        }
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


