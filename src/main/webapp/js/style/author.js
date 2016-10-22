/**
 * Created by Administrator on 2016/10/10.
 */
$(function () {
    $(".author .concern").addClass("hide");
    $(".author .fans").addClass("hide");
    $(document).on("click", ".clickable", function () {
        var $parent = $(this).parent();
        if($(this).hasClass("author-concern")){
            $(this).next().removeClass("clicked");
            $parent.siblings(".fans").addClass("hide");

            $(this).toggleClass("clicked");
            var $concern = $parent.siblings(".concern");
            if($(".concern-number").html() > 15){
                $concern.find(".show-all").removeClass("hide");
                $concern.find(".more").addClass("hide");
            }else{
                $concern.find(".show-all").addClass("hide");
            }
            $concern.toggleClass("hide");
        }else if($(this).hasClass("author-fans")){
            $(this).prev().removeClass("clicked");
            $parent.siblings(".concern").addClass("hide");

            $(this).toggleClass("clicked");
            var $fans = $parent.siblings(".fans");
            if($(".fans-number").html() > 15){
                $fans.find(".show-all").removeClass("hide");
                $fans.find(".more").addClass("hide");
            }else{
                $fans.find(".show-all").addClass("hide");
            }
            $fans.toggleClass("hide");
        }else{
            return false;
        }
    });


    $(".more").addClass("hide");
    $(document).on("click", ".show-all", function () {
        $(this).addClass("hide");
        $(this).next().removeClass("hide");
    });
});