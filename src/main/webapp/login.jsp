<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN" xmlns:th="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8">
    <title>校园招聘平台</title>
<link rel="stylesheet" th:href="@{/css/style.css}">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>

<body>
    <div class="content">
        <div class="form sign-in">
       		<form class="form-horizontal"  action="${pageContext.request.contextPath}/login" onsubmit="return login()" method="post">
	            <h2>欢迎回来</h2>
	            <label>
	                <span>用户名</span>
	                <input class='input' type="text" id="username" name='username' />
	            </label>
	            <label>
	                <span>密码</span>
	                <input class='input' type="password" id="password" name='password' />
	            </label>
	           <!-- 	<div style='width:50%;height:20px;line-height:74px;text-align:center;margin:auto'>
	             <input type="radio" name='role' value='2' checked/>用户  
	             <input type="radio" name='role' value='0'/>管理员
	            </div> -->
	            <button type="submit" class="submit" >登 录</button>
            </form>
        </div>
        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                    <h2>还未注册？</h2>
                    <p>立即注册，发现大量机会！</p>
                </div>
                <div class="img__text m--in">
                    <h2>已有帐号？</h2>
                    <p>有帐号就登录吧，好久不见了！</p>
                </div>
                <div class="img__btn">
                    <span class="m--up">注 册</span>
                    <span class="m--in">登 录</span>
                </div>
            </div>
            <div class="form sign-up">
	            <form class="form-horizontal"  action="${pageContext.request.contextPath}/regist"  onsubmit="return rigst()" method="post">
	                <h2>立即注册</h2>
	                <label>
	                    <span>用户名</span>
	                    <input class='input' type="text" id="rgusername" name='username' />
	                </label>
	                <label>
	                    <span>密码</span>
	                    <input class='input' type="password" id="rgpassword" name='password'/>
	                </label>
	                <button type="submit" class="submit">注 册</button>
	            </form>
            </div>
        </div>
        <input hidden id='contextPath' value='${pageContext.request.contextPath}'>
    </div>
</body>
<SCRIPT>
document.querySelector('.img__btn').addEventListener('click', function() {
    document.querySelector('.content').classList.toggle('s--signup')
})
    var contextPath = $("#contextPath").attr("src")

    function rigst(){
        if($("#rgusername").val()=='' || $("#rgpassword").val()==''){
        	 alert("请输入用户名和密码")
             return false
        }
 
    }
    function login(){
        if($("#username").val()=='' || $("#password").val()==''){
           alert("请输入用户名和密码")
            return false
        }
        return true
     
    }
</SCRIPT>
</html>


<%-- <!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<style type="text/css">
	body{
	   background: url("${pageContext.request.contextPath}/images/a.jpg")repeat;
	}
	#login-box {
		/*border:1px solid #F00;*/
		padding: 35px;
		border-radius:15px;
		background: #56666B;
		color: #fff;
	}

	</style>
</head>
<body>
	<div class="container" id="top">
		<div class="row" style="margin-top: 280px; ">
			<div class="col-md-4"></div>
			<div class="col-md-4" id="login-box">
				<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/login" id="from1" method="post">
				  <div class="form-group">
				    <label for="firstname" class="col-sm-3 control-label">用户id</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="userID" placeholder="请输入名字" name="username">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-3 control-label">密码</label>
				    <div class="col-sm-9">
				      <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="checkbox">
				        <label class="checkbox-inline">
							<input type="radio" name="role" value="1" checked>管理员
						</label>
						<label class="checkbox-inline">
							<input type="radio" name="role" value="2">老师
						</label>
						<label class="checkbox-inline">
							<input type="radio" name="role" value="3">学生
						</label>
				      </div>
				    </div>
				  </div>
				  <div class="form-group pull-right" style="margin-right: 15px;">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default btn-info">登录</button>
				    </div>
				  </div>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>		
	</div>
</body>
</html> --%>