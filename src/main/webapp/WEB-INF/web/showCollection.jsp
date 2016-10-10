<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>我的收藏</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/reset.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/main.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/head.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/mine.css" />
</head>
<body>
<%@include file="header.jsp" %>
<!--主体-->
<div class="content-wrap">
    <div class="container">
        <div class="row">
            <jsp:include page="navigation.jsp" />
            <div class="col-xs-8 col-xs-push-1 my-friends">
                <span class="amount">我的资料</span>
            </div>
        </div>
    </div>
</div>

<!--“取消关注”模态框-->
<div class="modal" id="myModal" data-backdrop="false" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title">取消关注</h4>
            </div>
            <div class="modal-body">
                确定要取消对
                <span></span>
                的关注？
            </div>
            <div class="modal-footer">
                <button class="yes btn btn-primary">确定</button>
                <button type="button" class="no btn btn-primary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<script src="<%=basePath %>/js/lib/jquery.min.js"></script>
<!--<script src="js/lib/bootstrap.js"></script>-->
<script src="<%=basePath %>/js/lib/bootstrap.min.js"></script>
<!--<script src="js/style/main.js"></script>-->
<script src="<%=basePath %>/js/style/common.js"></script>
<script src="<%=basePath %>/js/style/mine.js"></script>
<script>
$(document).ready(function(){
	if("${user}"!=""){
		$(".friendCircle").removeClass("hide");
		$(".person").removeClass("hide");
	}
	$(".menu li:eq(3)").addClass("current-page");
	$(".mine-sidebar li:eq(2)").addClass("active");
});
</script>
</body>
</html>