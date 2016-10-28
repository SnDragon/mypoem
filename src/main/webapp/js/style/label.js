/**
 * Created by Administrator on 2016/10/23.
 */
/*
window.onscroll = function () {
    var ks_area = $(window).height();
    var wholeHeight = $(document).height();
    var scrollTop = $(window).scrollTop();
    if(ks_area + scrollTop >= wholeHeight){
        $(".more").addClass("hide");
        $(".loading").removeClass("hide");
    }
};
*/
$(function () {
    //window.onscroll();

    var $assit_menu = $(".assit-menu .menu");
    if($assit_menu.find("li").eq(2).hasClass("hide")){
        $(".content-wrap").css("margin-top", "80px");
    }else{
        $(".content-wrap").css("margin-top", "3px");
    }

    setImg($(".main-content"));
});

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
            $inner.css("margin-left", - margin_w)
        }else{
            $inner.css("width", "100%");
            var inner_new_h = $inner.css("height");
            var margin_h = (parseInt(inner_new_h) - img_h) / 2;
            $inner.css("margin-top", - margin_h);
        }
    });
}