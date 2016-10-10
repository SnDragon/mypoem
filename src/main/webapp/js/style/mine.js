window.onresize = function () {
    // 调整friends的padding-left，以使关注人居中，每个关注加上其margin，宽度为230px
    var $friends = $(".friends");
    // 计算每行可放的关注人的数量
    var num_one_row = Math.floor($friends.width() / 230);
    $friends.css("padding-left", ($friends.width() - 230 * num_one_row) / 2);
};

$(function () {
    window.onresize();

    // 取消关注
    if($(".my-friends").length != 0){
        $(document).on("click", ".friend .delete", function () {
            var name = $(this).parents(".friend").find(".info .name").html();
            $(".modal .modal-body span").html(name);
        });
        $(document).on("click", "#myModal .modal-footer .yes", function () {
            var name = $(this).parents(".modal-content").find(".modal-body span").html();
            $(".friend").each(function () {
                var n = $(this).find(".info .name").html();
                if(n == name){
                    $(this).remove();
                    return false;
                }
            });
            // 关闭弹出框
            $(this).parents(".modal-content").find(".close").click();
        });
    }

    // 个人资料
    if($(".my-infos").length != 0){
        // 设置密码为*
        var $pass = $(".my-infos .content .password .value");
        var real_pass = $pass.html();
        var hide_pass = "";
        for(var i = 0; i < real_pass.length; i ++){
            hide_pass += "*";
        }
        $pass.html(hide_pass);
        // 更换头像
        var src_of_img;
        $(document).on("click", ".my-infos .content .icon button.change", function () {
            src_of_img = $(this).siblings("img").attr("src");
            $(this).next("input").click();
        });

        if(document.getElementById("icon-file")) {
            var input = document.getElementById("icon-file");
            if (typeof FileReader === 'undefined') {
                alert("抱歉，你的浏览器不支持 FileReader，无法上传图片");
                input.setAttribute('disabled', 'disabled');
            } else {
                input.addEventListener('change', readFile, false);
            }
        }
        // 选择是否保存头像的更改
        $(document).on("click", ".icon-change-btn button", function () {
            var index = $(this).index();
            var $parent = $(this).parent();
            if(index == 0){
                // 保存头像的修改

                $parent.addClass("hide");
            }else{  /*取消修改时，头像图片恢复为原来的*/
                $parent.siblings("img").attr("src", src_of_img);
                $parent.addClass("hide");
            }
        });
        // 个性签名字数限制
        $(document).on("keydown", ".signature .new textarea", function () {
            checkLength($(this), $(this).next(), 30);
        });
        $(document).on("keypress", ".signature .new textarea", function () {
            checkLength($(this), $(this).next(), 30);
        });
        $(document).on("keyup", ".signature .new textarea", function () {
            checkLength($(this), $(this).next(), 30);
        });
        // 个性签名的“修改”
        $(document).on("click", ".info .not-to", function () {
            if($(this).html() == "编辑"){
                $(this).parent().css("background-color", "white");
                $(this).siblings(".value").addClass("hide");
                $(this).siblings("div").removeClass("hide");
                $(this).siblings("button").removeClass("hide");
                // 设置扩展中的“现个性签名”
                var old_sig = $(this).siblings(".value").html();
                $(this).siblings(".old").find("span").eq(1).html(old_sig);
                // 清空输入框并重设剩余字数
                $(".signature .new textarea").val("");
                $(".signature .new textarea").keydown();
                $(this).html("收起");
            }else if($(this).html() == "收起"){
                $(this).parent().css("background-color", "#F2F2F2");
                $(this).siblings(".value").removeClass("hide");
                $(this).siblings("div").addClass("hide");
                $(this).siblings("button").addClass("hide");
                $(this).html("编辑");
            }
        });
        // 保存个性签名的修改
        /*
        $(document).on("click", ".signature button", function () {
            var $count = $(this).siblings(".new").find("span").eq(1);
            if($count.html() < 0){
                return false;
            }else{
                var new_sig = $(this).siblings(".new").find("textarea").val();
                $(this).siblings(".value").html(new_sig);
                $(".info .not-to").click();    
            }
        });
         */
    }

    // 安全中心
    if($(".my-security").length != 0){
        // jquery.validate插件对“修改密码”进行表单验证
        // 自定义验证规则  function (value, element, params)
        jQuery.validator.addMethod("chrnum", function(value, element) {
            var chrnum = /^([a-zA-Z0-9]+)$/;
            return this.optional(element) || (chrnum.test(value));
        }, "只能输入数字和字母(字符A-Z, a-z, 0-9)");
        $("#passwordForm").validate({
            rules: {
                oldpass: "required",
                newpass: {
                    required: true,
                    minlength: 5,
                    chrnum: true
                },
                againpass: {
                    required: true,
                    equalTo: "#newpass"
                }
            },
            messages: {
                oldpass: "请输入您的原密码",
                newpass: {
                    required: "请设置您的新密码",
                    minlength: "密码长度不能小于5个字母"
                },
                againpass: {
                    required: "请再次输入您的新密码",
                    equalTo: "两次密码输入不一致"
                }
            },
            // 表单提交成功后
            submitHandler: function () {

            }
        });
    }
});


function readFile(){
    var file = this.files[0]; //获取file对象
    //判断file的类型是不是图片类型。
    if(!/image\/\w+/.test(file.type)){
        alert("请上传图片");
        return false;
    }

    var reader = new FileReader(); //声明一个FileReader实例
    reader.readAsDataURL(file);    //调用readAsDataURL方法来读取选中的图像文件
    reader.onload = function(e){
        var $img = $(".my-infos .content .icon img");
        var img = $img[0];
        img.src = this.result;
    }
    $(".icon-change-btn").removeClass("hide");
}

function checkLength(target, changeOne, maxLength) {
    var len = target.val().length;
    changeOne.html(maxLength - len);
    if((maxLength - len) < 0){
        changeOne.css("color", "red");
    }else{
        changeOne.css("color", "black");
    }
}