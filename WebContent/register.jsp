<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<style type="text/css">
	.spangreen{
		color: green;
	}
	.spanred{
		color: red;
	}
</style>
<script type="text/javascript">
	var flag = true;
	
	$(function(){
		$.ajax({
			'url':'${pageContext.request.contextPath}/user/querType.do',
			'type':'post',
			'success':function(data){
				for(var i = 0 ; i < data.length ; i++){//<option value="1" >管理员</option>
					var utype = document.getElementById('userType');
					var tr="";
					tr +="<option value="+data[i].id+" >"+data[i].name+"</option>";
					$(utype).append(tr);
				}
			}
		});
	})
	

	function checkUname(){
		var username = $("#username").val();
		$.ajax({
			'url':'${pageContext.request.contextPath}/user/querUsername.do',
			'data':'username='+username,
			'type':'post',
			'success':function(data){
				if(data.exist == 1){
					var span=document.getElementById("usernameSpan");
					span.className="spanred";
					span.innerHTML="用户名已存在";
					flag = false;
				}else{
					var regex=/^[a-z]{4,10}$/ig;
					flag = checkedField("username",regex);
				}
			}
		});
		
		return flag;
		
		/* 
		//获取id
		var obj=document.getElementById("username");
		//获取span标签
		var span=document.getElementById("usernameSpan");
		//验证
		
		if(obj.value.length==0){
			span.className="spanred";
			span.innerHTML=obj.alt+"不能为空";
			return false;
		}else if(regex.test(obj.value)){
			span.className="spangreen";
			span.innerHTML=obj.alt+"输入正确";
			return true;
		}else{
			span.className="spanred";
			span.innerHTML=obj.alt+"不符合验证规则";
			return false;
		} */
		
	}
	function checkPwd(){
		var regex=/^[a-zA-Z0-9_@!]{2,8}$/;
		return checkedField("password",regex)&&reviewPwd();
	}
	
	function reviewPwd(){
		var pwd2=document.getElementById("repassword");
		var pwd=document.getElementById("password");
		var span=document.getElementById("repasswordSpan");
		if(pwd2.value.length==0){
		    span.className="spanred";
			span.innerHTML="密码不能为空";
			return false;
		}else if(pwd2.value==pwd.value){
			span.className="spangreen";
			span.innerHTML="两次输入密码相同";
			return true;
		}else{
			span.className="spanred";
			span.innerHTML="两次输入密码不同";
			return false;
		}
	}
	
	function checkedField(objID,regex){
		//获取id
		var obj=document.getElementById(objID);
		//获取span标签
		var span=document.getElementById(objID+"Span");
		//验证
		
		if(obj.value.length==0){
			span.className="spanred";
			span.innerHTML=obj.alt+"不能为空";
			return false;
		}else if(regex.test(obj.value)){
			span.className="spangreen";
			span.innerHTML=obj.alt+"输入正确";
			return true;
		}else{
			span.className="spanred";
			span.innerHTML=obj.alt+"不符合验证规则";
			return false;
		}
	}
	
	function testReset(){
		var flag=window.confirm("亲，你确定要重置吗？");
		return flag;
	}
	 function testSubmit(){
		var flag1=checkUname();
		var flag2=checkPwd();
		var flag3=reviewPwd();
		return  flag&&flag1&&flag2&&flag3;
	} 
	
</script>
</head>
<body >
	<center>
		<form action="${pageContext.request.contextPath}/user/register.do" method="post" 
					onsubmit="return testSubmit();" onreset="testReset();">
			<table>
				<tr>
					<td>用户名：</td>
					<td>
						<input type="text" id="username" alt="用户名" name="username"  onblur="checkUname();"/>
						<span id="usernameSpan"></span>
					</td>
				</tr>
				<tr>
					<td>用户密码：</td>
					<td>
						<input type="text" id="password" alt="密码" name="password" onblur="checkPwd();"/>
						<span id="passwordSpan"></span>
					</td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td>
						<input type="text" id="repassword"  name="repassword"  onblur="reviewPwd();"/>
						<span id="repasswordSpan"></span>
					</td>
				</tr>
				<tr>
					<td>用户类型：</td>
					<td>
						<select id="userType" name="groupId">
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit"  value="提交" />
						<input type="reset"  value="重置" />
					</td>
				<tr/>
			</table>
		</form>
	</center>
</body>
</html>