/**
 * Created by Administrator on 2016/9/21.
 */
window.onresize = function () {
    // 由于两个js的onresize()只会执行一个，所以将部分内容从main.js复制过来，不放在common.js
    // 当屏幕宽度小于600px时，设置文本的margin-left和margin-right
    // 设置“生活除了眼前的苟且，还有诗和”和“远方”为一个h2
    var clientWidth = parseInt(document.body.clientWidth);
    var $main_content = $(".main-content");
    var $header_text = $(".main-header .col-sm-12");
    if(clientWidth < 600){
        // 发布内容
        $main_content.css("padding-left", "7px");
        $main_content.css("padding-right", "7px");
        // 图片无法显示时的文字格式
        $header_text.html("<h2>生活除了眼前的苟且，还有诗和远方</h2>");
    }else{
        $header_text.html("<h2>生活除了眼前的苟且，还有诗和</h2><h2>远方</h2>");
    }


    // 屏幕宽度小于800时，导航栏变化
    if(clientWidth < 800){
        var $menu = $("#main-menu");
        $menu.find("ul").addClass("hide");
        $menu.find(".menu-small").removeClass("hide");
    }else{
        var $menu = $("#main-menu");
        $menu.find("ul").removeClass("hide");
        $menu.find(".menu-small").addClass("hide");
        // 隐藏小屏幕打开的下拉菜单，并恢复“向上”图标为“向下”
        $(".assit-menu").css("margin-top", "-105px");
        $(".menu-small").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
    }

    // 根据屏幕大小不同调整“推荐”的样式
    if(clientWidth >= 768){
        setSmall(false);
        setImg($(".main-content"));
    }else{
        // 当屏幕宽度小于768时，图片与文字竖直排列，需另外设置样式
        setSmall(true);
    }
};

$(function () {
    window.onresize();
});


// 将每条推荐的图片和文本尽量垂直居中
// function setMiddle(n) {
//     // 判断图片加载状况，加载完成后回调，若图片未加载完成便尝试设置margin-top使其居中，样式出错
//     isImgLoad(function(){
//         // 加载完成
//         var $recom = $(".recommend");
//         // var recom_height = $recom.css("height");
//         $recom.each(function () {
//             var recom_height = $(this).css("height");
//             var $img = $(this).find(".img");
//
//             var $words = $(this).find(".words");
//             var img_height = $img.css("height");
//             var words_height = $words.css("height");
//
//             var img_target = (parseInt(recom_height) - parseInt(img_height)) / n;
//             var words_target = (parseInt(recom_height) - parseInt(words_height)) / 2;
//             $img.css("margin-top", img_target + "px");
//             $words.css("margin-top", words_target + "px");
//         });
//     });
// }
// // 判断图片是否加载完成
// function isImgLoad(callback){
//     var t_img; // 定时器
//     var isLoad = true;
//     // 这里只针对推荐里的图片
//     $('.img img').each(function(){
//         // 找到为0就将isLoad设为false，并退出each
//         if(this.height === 0){
//             isLoad = false;
//             return false;
//         }
//     });
//     if(isLoad){              // 为true，加载完毕
//         clearTimeout(t_img); // 清除定时器
//         callback();          // 调用回调函数
//     }else{             // 为false，由于还有图片未加载完成，将调用定时器递归
//         isLoad = true;
//         t_img = setTimeout(function(){
//             isImgLoad(callback);    // 递归扫描（这里设置0.3秒）
//         },300);
//     }
// }

// 设置768px以下，“推荐”的样式
function setSmall(small) {
    var $recom = $(".recommend");
    var $img = $recom.find(".img");
    var $words = $recom.find(".words");

    if(small){
        $img.addClass("setImgSmall");
        $words.addClass("setWordsSmall");
        $recom.css("margin-bottom", "0");
    }else{
        $img.removeClass("setImgSmall");
        $words.removeClass("setWordsSmall");
        $recom.css("margin-bottom", "8px");
    }
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
            $inner.css("margin-left", - margin_w)
        }else{
            $inner.css("width", "100%");
            var inner_new_h = $inner.css("height");
            var margin_h = (parseInt(inner_new_h) - img_h) / 2;
            $inner.css("margin-top", - margin_h);
            
        }
    });
}