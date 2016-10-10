<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>我的关注</title>
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
                <span class="title">全部关注 20</span>
                <ul class="friends">
                    <li class="friend">
                        <div class="head">
                            <a href="wangsai.html" title="进入作者主页">
                                <img src="<%=basePath %>/img/attached/head-icon1.jpg" alt="" />
                            </a>
                        </div>
                        <div class="info">
                            <span class="name">张三</span>
                            <span class="poems">13首诗</span>
                        </div>
                        <a href="#" data-toggle="modal" data-target="#myModal">
                            <span class="delete">取消关注</span>
                        </a>
                    </li>
                    <li class="friend">
                        <div class="head">
                            <a href="wangsai.html" title="进入作者主页">
                                <img src="<%=basePath %>/img/attached/head-icon4.jpg" alt="" />
                            </a>
                        </div>
                        <div class="info">
                            <span class="name">李四</span>
                            <span class="poems">3首诗</span>
                        </div>
                        <a href="#" data-toggle="modal" data-target="#myModal">
                            <span class="delete">取消关注</span>
                        </a>
                    </li>
                    <li class="friend">
                        <div class="head">
                            <a href="wangsai.html" title="进入作者主页">
                                <img src="<%=basePath %>/img/attached/head-icon2.PNG" alt="" />
                            </a>
                        </div>
                        <div class="info">
                            <span class="name">王五</span>
                            <span class="poems">23首诗</span>
                        </div>
                        <a href="#" data-toggle="modal" data-target="#myModal">
                            <span class="delete">取消关注</span>
                        </a>
                    </li>
                    <li class="friend">
                        <div class="head">
                            <a href="wangsai.html" title="进入作者主页">
                                <img src="<%=basePath %>/img/attached/head-icon3.jpeg" alt="" />
                            </a>
                        </div>
                        <div class="info">
                            <span class="name">王赛</span>
                            <span class="poems">20首诗</span>
                        </div>
                        <a href="#" data-toggle="modal" data-target="#myModal">
                            <span class="delete">取消关注</span>
                        </a>
                    </li>
                </ul>
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
<script src="<%=basePath %>/js/lib/bootstrap.js"></script>
<!--<script src="js/lib/bootstrap.min.js"></script>-->
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
	$(".mine-sidebar li:eq(1)").addClass("active");
});
</script>
</body>
</html>