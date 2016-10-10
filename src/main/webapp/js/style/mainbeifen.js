window.onresize = function () {
    // 当屏幕宽度小于600px时，设置文本的margin-left和margin-right
    // 设置“生活除了眼前的苟且，还有诗和”和“远方”为一个h2
    var clientWidth = parseInt(document.body.clientWidth);
    var $main_content = $(".main-content");
    var $content = $(".dynamic-content");
    var $title = $(".dynamic-title");
    var $header_text = $(".main-header .col-sm-12");
    if(clientWidth < 600){
        // 发布内容
        $main_content.css("padding-left", "7px");
        $main_content.css("padding-right", "7px");
        // 发布内容之文本
        $content.css("margin-left", "8%");
        $content.css("margin-right", "8%");

        // 字体大小
        $title.css("font-size", "25px");
        $content.css("font-size", "18px");

        // 图片无法显示时的文字格式
        $header_text.html("<h2>生活除了眼前的苟且，还有诗和远方</h2>");
    }else{
        $main_content.css("padding-left", "25px");
        $main_content.css("padding-right", "25px");

        $content.css("margin-left", "15%");
        $content.css("margin-right", "15%");

        $title.css("font-size", "36px");
        $content.css("font-size", "20px");

        $header_text.html("<h2>生活除了眼前的苟且，还有诗和</h2><h2>远方</h2>");
    }

    // 手机屏幕小于340时，“收藏”文字去除
    var $share_text = $(".dynamic-action li").eq(0).find("span").eq(1);
    if(clientWidth < 340){
        $share_text.html("");
    }else{
        $share_text.html("收藏");
    }

    /********************************************************************************/
    // 改善
    // 屏幕过小时，发布框样式改变
    var $put_out = $(".put-out");
    var $ins_picture = $(".insert-picture");
    var $prev_picture = $(".preview-picture");
    if(clientWidth < 463){
        $put_out.css("height", "300px");

        $ins_picture.css("clear", "both");
        $ins_picture.css("float", "right");
        $ins_picture.css("margin-right", "5%");

        $prev_picture.css("clear", "right");
        $prev_picture.css("float", "right");
        $prev_picture.css("width", "70px");
        $prev_picture.css("margin-right", "5%");
        $prev_picture.css("margin-top", "5px");
    }else{
        $put_out.css("height", "250px");

        $ins_picture.css("clear", "none");
        $ins_picture.css("float", "left");
        $ins_picture.css("margin-right", "0");

        $prev_picture.css("clear", "none");
        $prev_picture.css("float", "none");
        $prev_picture.css("width", "100px");
        $prev_picture.css("margin-right", "0");
        $prev_picture.css("margin-top", "0");
    }

    // 屏幕宽度改变时，可能引起的导航栏位置改变（固定/top=211px）
    // window.onscroll();


    // 屏幕宽度小于600时，导航栏变化
    if(clientWidth < 600){
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
};

// 窗口滑动时，800px（平板）以上的屏幕设置导航栏绝对定位
// 手机和平板不设置导航栏固定
// window.onscroll = function(){
//     if(parseInt(document.body.clientWidth) >= 800){
//         var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
//         var $nav = $(".main-navigation");
//         var $search = $("#main-search");
//         if(scrollTop >= 211){
//             $nav.css("top", scrollTop);
//             $search.css("top", "12px");
//         }else{
//             $nav.css("top", "211px");
//             $search.css("top", "-45px");
//         }
//     }else{     /*屏幕宽度小于800，不设置导航栏固定*/
//         var $nav = $(".main-navigation");
//         var $search = $("#main-search");
//         $nav.css("top", "211px");
//         $search.css("top", "-45px");
//     }
//
//
//     // 当搜索框位于导航栏上时，搜索框样式改变，设置为下拉模式
//     // var $main_search = $("#main-search");
//     // var $poem_search = $(".poem-search");
//     // if($main_search.css("top") == "12px"){
//     //     $poem_search.addClass("hide");
//     // }else{
//     //     $poem_search.removeClass("hide");
//     // }
//
//     // 当搜索框位于导航栏上时，input缩短
//     var $main_search = $("#main-search");
//     var $poem_search = $(".poem-search");
//     if($main_search.css("top") == "12px"){
//         $poem_search.css("width", "140px");
//     }else{
//         $poem_search.css("width", "160px");
//     }
// }





$(function(){
    window.onresize();
    // window.onscroll();

    // 搜索框
    var $search = $(".poem-search");
    focusAndBlur($search, "搜索");

    // 屏幕小于750px时，下拉菜单的显示（动画）
    var $menu_small = $(".menu-small");

    var $assit_menu = $(".assit-menu");
    $menu_small.click(function () {
        if($(this).hasClass("glyphicon-chevron-down")){
            $assit_menu.animate({"margin-top":"65px"}, "normal", function () {
                $menu_small.removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
            });
        }else if($(this).hasClass("glyphicon-chevron-up")){
            $assit_menu.animate({"margin-top":"-105px"}, "normal", function () {
                $menu_small.removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
            });
        }
    });


    // 删除“点赞”右边的边框
    var $uls = $(".dynamic-action ul");
    var $last_lis = $uls.find("li:last");
    $last_lis.css("border-right", "none");

    // 移动端处理hover事件   ps：暂时没用上
    // document.body.addEventListener('touchstart', function(){ });
    // 设置评论点赞的悬停和点击事件
    var $lis = $(".dynamic-action li");
    $lis.attr("get", "false");    /*get属性初始化为false*/
    $lis.addClass("grayLi");      /*给四个动作设置灰色*/

    //  $test=$("li.col-xs-3 span");
    //传入字符串，而不是对象
    $(document).on("mouseover","li.col-xs-3 span",function () {
        $(this).parent().css("color", "#E67E22");
        $(this).css("cursor", "pointer");
    });
    $(document).on("mouseout","li.col-xs-3 span",function(){
        if(!$(this).parent().hasClass("orangeLi")){
            $(this).parent().css("color", "#808080");
        }
    });

    $(document).on("click","li.col-xs-3 span",function () {
        var $li = $(this).parent();
        // 当“转发”被点击时，由于其还被<a>包裹，做下面处理
        if(!$li.hasClass("col-xs-3")){
            $li = $li.parent();
        }
        var index = $li.index();
        //var get_value = $li.attr("get");
        // 收藏处理
        if(index == 0){
            clickLi($li);
        }

        // 转发处理
        else if(index == 1){
            // $('#myModal').modal({
            //     show: false,
            //     backdrop: "static",
            //     keyboard: true  /*按下Esc可关闭弹出框*/
            // });
            // 从该条动态取得作者和诗，并显示在弹出框
            var content = $(".modal .modal-body .share-content");
            var $parents = $li.parents();
            var $current_article = null;        /*用户要转发的那个动态*/
            $parents.each(function () {
                if($(this).hasClass("dynamic")){
                    $current_article = $(this);
                }
            });
            var author = $current_article.find(".dynamic-author a").html();
            var title = $current_article.find(".dynamic-title a").html();
            content.find(".share-author").html(author);
            content.find(".share-title").html(title);
        }

        // 评论处理，还要设置“加载中”的样式
        else if(index == 2){
            //clickLi($li);
            var $parents = $li.parents();
            var $current_article = null;        /*展开评论的那个动态*/
            $parents.each(function () {
                if($(this).hasClass("dynamic")){
                    $current_article = $(this);
                }
            });
            if(!$current_article)
                alert("出错了，找不到评论图标对应的动态！");
            $current_article.css("border-bottom", "none");
            var $current_comment = $current_article.find(".comment-wrap");
            $current_comment.toggle("slow");

            // // 动画下滑显示（bug有点多）
            // // 正常显示评论框及避免下一条动态非正常显示，需考虑评论框的高度
            // var comment_height = $current_comment.height();
            // $current_comment.animate({"bottom": -comment_height}, "normal");
            // var $next_article = $current_article.next();
            // // $next_article.css("margin-top", comment_height + 15);
            // $next_article.animate({"margin-top": comment_height + 15}, "normal");
        }

        // 点赞处理
        else if(index == 3){
            var $thumb_number = $li.find(".thumb-number");
            var thumb_number_text = parseInt($thumb_number.html());   /*parseInt转换为数字*/
            // 由于需要更新点赞次数，就不调用clickLi()仅改变颜色
            clickLi($li);
            if($li.hasClass("grayLi")){
                var new_thumb = thumb_number_text + 1;  /*new_thumb需传送给后台*/
                $thumb_number.html(new_thumb);  /*不能用++*/
                //$li.removeClass("grayLi").addClass("orangeLi");
            }else if($li.hasClass("orangeLi")){
                var new_thumb = thumb_number_text - 1;
                $thumb_number.html(new_thumb);
                //$li.removeClass("orangeLi").addClass("grayLi");
            }
        }
    });

    // 若header的图片无法显示，显示header的文字




    // 转发
    // 重置转发框内容
    var $share_word = $("#share-word");
    var $remain_word = $(".remain-word");
    var $share_button = $(".modal-footer").find("button");
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
    var $close_button = $(".modal-header").find("button");
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
        }
    });


    // 页面刚加载时，重置发布框为空
    var $pre_title = $(".put-out .input-group-addon");
    var $put_out_title = $("#put-out-title");
    $pre_title.click(function () {   /*点击“标题”，对应input获得焦点*/
        $put_out_title.focus();
    });
    var $put_out = $("#put-out-content");
    $put_out_title.val("");
    $put_out.val("");
    // 检查发布框的内容，决定发布按钮的有效性
    $put_out.keydown(function () {
        checkEmpty($(this), $put_out_title);
    });
    $put_out.keypress(function () {
        checkEmpty($(this), $put_out_title);
    });
    $put_out.keyup(function () {
        checkEmpty($(this), $put_out_title);
    });
    $put_out_title.keydown(function () {
        checkEmpty($(this), $put_out);
    });
    $put_out_title.keypress(function () {
        checkEmpty($(this), $put_out);
    });
    $put_out_title.keyup(function () {
        checkEmpty($(this), $put_out);
    });

    // 选择发布内容公开或仅自己可见
    var $visibility = $(".visibility");
    var $visi_btn = $visibility.find("button");
    var $options = $visibility.find("a");
    $options.click(function () {
        var text = $(this).text() + " <span class='caret'></span>";
        $visi_btn.html(text);
    });

    // 上传图片，点击“图片”即点击<input type="file" />
    $pic_input = $("#file");
    $pic_insert = $(".insert-picture");
    $pic_insert.click(function () {
        $pic_input.click();
    });

    // 图片预览
    // 首先判断页面是否有发布框
    if(document.getElementById("preview") && document.getElementById("file")){
        var preview = document.getElementById("preview"); //获取显示图片的div元素
        var input = document.getElementById("file"); //获取选择图片的input元素
        //这边是判断本浏览器是否支持这个API。
        if(typeof FileReader === 'undefined'){
            preview.innerHTML = "抱歉，你的浏览器不支持 FileReader，无法上传图片";
            input.setAttribute('disabled','disabled');
        }else{
            input.addEventListener('change',readFile,false); //如果支持就监听改变事件，一旦改变了就运行readFile函数。

            //判断浏览器
            var isIE = navigator.userAgent.match(/MSIE (\d)/i);
            isIE = isIE ? isIE[1] : isIE;
            //声明变量
            var img, prev_button, mask;
            //获取元素
            img = document.getElementById("img");
            prev_button = document.getElementById("btn-preview");   /*获得预览按钮*/
            mask = document.getElementById("mask");
            mask.td = document.getElementById("mask_td");
            //计算mask的大小
            mask.setSize = function(){
                //获取文档可见区域宽度并设置到mask上
                var de = document.documentElement;
                mask.style.width = de.clientWidth + "px"
                mask.style.height = de.clientHeight + "px";
            };
            //添加show方法
            mask.show = function(){
                //隐藏页面的滚动条
                // document[
                //     isIE<9?"documentElement":"body"
                //     ].style.overflow="hidden";
                //计算并设置mask的大小
                mask.setSize();
                //显示
                mask.style.display = isIE == 6 ? "block" : "table";
            };
            //添加hide方法
            mask.hide = function(){
                //显示页面滚动条
                // document[
                //     isIE<9?"documentElement":"body"
                //     ].style.overflow="";
                //清空里面的内容
                mask.td.innerHTML = "";
                //隐藏
                mask.style.display = "none";
            };
            //添加append方法
            mask.append = function(e){
                //在mask的TD里面添加内容
                mask.td.appendChild(e);
            };
            //点击mask关闭
            mask.onclick = function(e){
                //判断事件来源，如果是空白区域被点击了就关闭mask
                e = e||event;
                (e.target||e.srcElement) == mask.td && mask.hide();
            };
            //窗体大小改变时也改变mask的大小，会导致上面的onresize得不到调用，故去除
            // window.onresize = function(){
            //     mask.setSize();
            // };
            //点击预览按钮
            prev_button.onclick = function(){
                this.style.backgroundColor = "#E67E22";
                this.style.borderColor = "#E67E22";
                this.style.color = "white";
                //创建一个图片对象
                var o = new Image;
                //设置图片的地址
                o.src = img.src;
                // 若图片的宽或高大于目前浏览器的宽或高，设置其适应为浏览器的大小
                // 暂时不做预览过程浏览器宽高改变，图片宽高重新自适应，好像没有必要
                setImgSize(o);
                //在mask内添加内容
                mask.append(o);
                //显示mask
                mask.show();
            };
        }
    }

    // 点击"X"时，隐藏预览按钮
    var $btn_remove = $(".preview-picture").find("span");
    $btn_remove.click(function () {
        $(".preview-picture").addClass("hide");
    });

    // 点击发布
    var $put_button = $(".put-out-footer .wrapper").find("button");
    var $btn_preview = $("#btn-preview");
    var $btn_visi = $(".visibility").find("button");
    $put_button.attr("disabled", false);   /*初始化为可用*/
    $btn_preview.attr("disabled", false);  /*初始化为可用*/
    $btn_visi.attr("disabled", false);     /*初始化为可用*/
    $("#put-out-title").attr("disabled", false);
    $("#put-out-content").attr("disabled", false);
    $put_button.click(function () {
        $(this).html("发布中");
        $(this).addClass("disabled");                /*禁用发布按钮*/
        $(this).css("background-color", "#E67E22");  /*避免禁用时默认背景颜色改变*/
        $btn_remove.unbind("click");                 /*禁用删除图片*/
        $pic_insert.unbind("click");                 /*禁用选择图片*/
        $btn_preview.attr("disabled", true);         /*禁用预览*/
        $btn_visi.attr("disabled", true);            /*禁止调节可见性*/
        $("#put-out-title").attr("disabled", true);
        $("#put-out-title").css("background-color", "white");
        $("#put-out-content").attr("disabled", true);
        $("#put-out-content").css("background-color", "white");
        $btn_preview.css("background-color", "#E67E22");
        $btn_preview.css("border-color", "#E67E22");
        putting();
    });
});



// 输入框获得焦点与失去焦点
function focusAndBlur(target, text){
    target.focus(function () {
        if($(this).val() == text){
            $(this).val("");
        }
    });
    target.blur(function () {
        var value = $(this).val().replace(/\s+/g,"");  /*消除字符串所有空格*/
        if(value == ""){
            $(this).val(text);
        }
    });
}

// “收藏”等被点击时的样式处理
/*function clickLi(target, get_value){
 if(get_value == "false"){
 target.attr("get", "true");
 target.removeClass("grayLi").addClass("orangeLi");
 }else if(get_value == "true"){
 target.attr("get", "false");
 target.removeClass("orangeLi").addClass("grayLi");
 }
 }*/
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
    share_word.val("请输入转发理由");
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
    var $share_button = $(".modal-footer").find("button");
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
    var $btn_share = $(".modal-footer").find("button");
    $(".modal-header").find("button").click();
    $btn_share.attr("disabled", false);
    $btn_share.html("转发");
    $btn_share.css("width", "55px");
    $("#share-word").attr("disabled", false);
}

// 发布中...
function putting() {
    var $put_button = $(".put-out-footer .wrapper").find("button");
    $put_button.css("width", "80px");
    $put_button.css("border-color", "#E67E22");
    var pre = $put_button.html();
    var text = "发布中";
    if(pre != (text + "...")){
        $put_button.html(pre + '.');
    }else{
        $put_button.html(text);
    }
    t = setTimeout("putting()", 700);
}
// 停止发布
function clearPutting() {
    clearTimeout(t);
    var $put_button = $(".put-out-footer .wrapper").find("button");
    var $title = $("#put-out-title");
    var $content = $("#put-out-content");
    // 还原发布框
    $put_button.html("发布");
    $put_button.css("width", "55px");
    $title.val("");
    $content.val("");
    $(".preview-picture").addClass("hide");
    $(".visibility").find("a").eq(0).click();  /*还原为公开*/
    checkEmpty($title, $content);    /*发布按钮设置为无效*/
    // 恢复一些元素的可用性
    $title.attr("disabled", false);
    $content.attr("disabled", false);
    $("#btn-preview").attr("disabled", false);
    $(".visibility").find("button").attr("disabled", false);
    $pic_insert.click(function () {
        $pic_input.click();
    });
    $(".preview-picture").find("span").click(function () {
        $(".preview-picture").addClass("hide");
    });
}

// 检查发布框是否为空
function checkEmpty(target1, target2) {
    var $btn = $(".put-out-footer .wrapper").find("button");
    var value1 = target1.val().replace(/\s+/g,"");  /*消除字符串所有空格*/
    var value2 = target2.val().replace(/\s+/g,"");
    if(value1 == "" || value2 == ""){
        $btn.removeClass("btn-valid").addClass("btn-invalid").addClass("disabled");
    }else{
        $btn.removeClass("btn-invalid").addClass("btn-valid").removeClass("disabled");
    }
}

// 获得并显示用户上传的图片
function readFile(){
    var file = this.files[0]; //获取file对象
    //判断file的类型是不是图片类型。
    if(!/image\/\w+/.test(file.type)){
        alert("请上传图片");
        return false;
    }

    var reader = new FileReader(); //声明一个FileReader实例
    reader.readAsDataURL(file); //调用readAsDataURL方法来读取选中的图像文件
    //最后在onload事件中，获取到成功读取的文件内容，并以插入一个img节点的方式显示选中的图片
    reader.onload = function(e){
        var img = document.getElementById("img");
        img.src = this.result;
    }
    // 若用户正确选择了图片，显示预览图片按钮
    var $prev_picture = $(".preview-picture");
    $prev_picture.removeClass("hide");
}

// 预览图片自适应浏览器的可见宽高
function setImgSize(target) {
    var innerWidth = parseInt(window.innerWidth);
    var innerHeight = parseInt(window.innerHeight);
    var diffWidth = target.width - innerWidth * 0.9;
    var diffHeight = target.height - innerHeight * 0.9;
    // 若图片的宽和高都超过浏览器的宽高
    if(diffWidth > 0 && diffHeight > 0){
        // 若宽的超出程度没有高的超出程度大
        if(innerWidth * 0.9 / diffWidth > innerHeight * 0.9 / diffHeight){
            target.height = innerHeight * 0.9;
        }else{
            target.width = innerWidth * 0.9;
        }
    }else if(diffWidth > 0){
        target.width = innerWidth * 0.9; /*设置了宽度之后，高度会根据比例自适应*/
    }else if(diffHeight > 0){
        target.height = innerHeight * 0.9;
    }
}

// 评论、点赞、转发处的错误，只要改变了li元素的"get"属性，li就会改变样式？？？