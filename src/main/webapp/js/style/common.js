
// 搜索框及小菜单
$(function () {
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