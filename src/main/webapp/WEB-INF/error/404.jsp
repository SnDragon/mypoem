<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>404 找不到页面</title>
    <link rel="stylesheet" href="<%=basePath %>/css/lib/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath %>/css/style/errorPage.css" />
</head>
<body>
    <div class="word">
        很抱歉！您访问的页面不存在......
    </div>
    <img src="<%=basePath %>/img/common/error.PNG" alt="error" />
    <a href="<%=basePath%>">
        <button class="btn btn-default">返回首页</button>
    </a>
    <a href="#" onclick="javascript:history.go(-1);">
        <button class="btn btn-default">返回</button>
    </a>

</body>
</html>