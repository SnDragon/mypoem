<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=contextPath%>/js/lib/jquery-1.11.1.min.js"></script>
</head>
<body id="body">
<h1>发表诗歌</h1>
<hr/>
		<form method="post" action="<%=contextPath%>/poem/test" >
			标题:<input type="text" name="poemTitle" id="title"/>
			正文:<textarea name="content" id="content" rows="20" cols="20"></textarea>
			<hr/>
			<input id="uid" type="hidden" name="userId" value="2" />
			文件名:<input type="file" id="file" name="file" />
			<br/>
			<input type="submit" id="button" value="点我">
		</form>
		
<!--
	<input name="file_img" type="file" value="" id="file_img" />
    <input type="submit" value="上传" name="upload" onclick="uploadImage();" />
    <p>提示：小于100K jpg、png、gif图片，图片尺寸：960*100</p>
    <div>
        <p class="tip" style="display: none;">文件正在上传...</p>
        <img id="show_img" style="display: none;" src="" />
    </div>
    -->
    <div id="data"></div>
    
<script type="text/javascript" src="<%=contextPath %>/js/lib/jquery.ajaxfileupload.js"></script>
</body>

</html>