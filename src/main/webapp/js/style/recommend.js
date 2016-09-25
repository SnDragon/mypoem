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
        if(clientWidth <= 992){
            setMiddle(2);
        }else if(clientWidth <= 1200){
            setMiddle(3);
        }else{
            setMiddle(4);
        }
    }else{
        // 当屏幕宽度小于768时，图片与文字竖直排列，需另外设置样式
        setSmall();
    }
};

$(function () {
    window.onresize();
});


// 将每条推荐的图片和文本尽量垂直居中
function setMiddle(n) {
    // 判断图片加载状况，加载完成后回调，若图片未加载完成便尝试设置margin-top使其居中，样式出错
    isImgLoad(function(){
        // 加载完成
        var $recom = $(".recommend");
        var recom_height = $recom.css("height");
        $recom.each(function () {
            var $img = $(this).find(".img");

            var $words = $(this).find(".words");
            var img_height = $img.css("height");
            var words_height = $words.css("height");

            var img_target = (parseInt(recom_height) - parseInt(img_height)) / n;
            var words_target = (parseInt(recom_height) - parseInt(words_height)) / 2;
            $img.css("margin-top", img_target + "px");
            $words.css("margin-top", words_target + "px");
        });
    });
}
// 设置768px以下，“推荐”的样式
function setSmall() {
    var $recom = $(".recommend");
    var $img = $recom.find(".img");
    var $words = $recom.find(".words");
    $img.addClass("setImgSmall");
    $words.addClass("setWordsSmall");

    $recom.css("margin-bottom", "0");
}
// 判断图片是否加载完成
function isImgLoad(callback){
    var t_img; // 定时器
    var isLoad = true;
    // 这里只针对推荐里的图片
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