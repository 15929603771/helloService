<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

</head>
<body>
	<center>
		<form action="${pageContext.request.contextPath}/user/login.do" method="post">
			<table>
				<tr>
					<td>登录名：</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>登录密码：</td>
					<td><input type="text" name="password"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="登录"/>&nbsp;&nbsp;&nbsp;
						<input type="button" value="注册" 
							onclick="javascript: window.location.href='${pageContext.request.contextPath}/register.jsp'"/>
					</td>
				<tr/>
			</table>
		</form>
	</center>
</body>
</html>