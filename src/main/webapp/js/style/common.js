
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
    
 // 判断搜索框是否为空
    var $input = $("input.poem-search");
    var $btn = $input.next();
    $input.val("搜索");
    $btn.addClass("disabled");
    $input.keydown(function (event) {
        checkSearchEmpty($(this), $btn);
        if(event.keyCode == 13 && $btn.hasClass("disabled")){
            return false;
        }
    });
    $input.keypress(function () {
        checkSearchEmpty($(this), $btn);
        if(event.keyCode == 13 && $btn.hasClass("disabled")){
            return false;
        }
    });
    $input.keyup(function () {
        checkSearchEmpty($(this), $btn);
        if(event.keyCode == 13 && $btn.hasClass("disabled")){
            return false;
        }
    });
    //根据用户是否登录决定是否显示四个导航栏
    if($("#userId").val()){
    	$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
    }
    var $assit_menu = $(".assit-menu .menu");
	if($assit_menu.find("li").eq(2).hasClass("hide")){
	    $(".content-wrap").css("margin-top", "100px");
	}else{
	    $(".content-wrap").css("margin-top", "20px");
	}
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

$("#submit").click(function(){
	var key=$.trim($("#search").val());
	if(key==""){
		alert("搜索关键字不能为空！");
		return false;
	}
	var action=$("#form-search").attr("action")+"?q="+$("#search").val();
	$("#form-search").attr("action",action);
	$("#form-search").submit();
})

function checkSearchEmpty(target, btn) {
    var value = target.val().replace(/\s+/g,"");  /*消除字符串所有空格*/
    if(value == ""){
        btn.addClass("disabled");
    }else{
        btn.removeClass("disabled");
    }
}