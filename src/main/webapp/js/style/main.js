
// 朋友圈功能
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
            input.addEventListener('change',readFile,false); //如果支持就监听改变事件，一旦改变了就运行readFile函数

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
    
    // 标签选择
    var $label = $(".label");
    var $label_btn = $label.find("button");
    var $options2 = $label.find("a");
    $options2.click(function () {
    	$(".dropdown-menu li a").removeClass("selected");
    	$(this).addClass("selected");
        var text = $(this).text() + " <span class='caret'></span>";
        $label_btn.html(text);
//        alert($("a.selected").html());
//        alert($("a.selected").attr("id").slice(6));
    });
});

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
