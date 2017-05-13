<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var lineid=0;
		lineid=window.setInterval(function(){
			//获取font元素对象
			var time=window.document.getElementById("a");
			time.innerHTML=time.innerHTML-1;
			
			if(time.innerHTML==0){
				window.location.href="${pageContext.request.contextPath}/register.jsp";
			}
		},1000);
	})
</script>
</head>
<body>
	<center>
		<h1>注册失败</h1>
		<font id="a" style="color: red;font-size: 30px;">3</font>秒后跳转到<b>注册</b>页面
	</center>
</body>
</html>