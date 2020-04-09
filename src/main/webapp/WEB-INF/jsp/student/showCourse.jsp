<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
	<title></title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 顶栏 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 中间主体 -->
		<div class="container" id="content">
		<div class="row">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-md-10">
				<div class="panel panel-default">
				    <div class="panel-heading">
						<div class="row">
					    	<h1 style="text-align: center;">个人信息</h1>
						</div>
				    </div>
				    <div class="panel-body">
						<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/editStudent" id="editfrom" method="post">
							  <div class="form-group ">
							    <label for="inputEmail3" class="col-sm-2 control-label" >用户名</label>
							    <div class="col-sm-10">
							      <input readonly="readonly" type="text" class="form-control" id="inputEmail3" name="userid" placeholder="请输入用户名"
										 value="${user.username }">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">会员等级</label>
							    <div class="col-sm-10" style='color:red' class="form-control">
							      <c:if test='${user.isvip==0 }'>
							      	未开通会员
							      </c:if>
							      <c:if test='${user.isvip==1 }'>
							      	黄金会员
							      </c:if>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">账户余额</label>
							    <div class="col-sm-10">
								    <input readonly class="form-control" type="number" value="${user.money }" />
							    </div>
							  </div>
							  
							  <%-- <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">性别</label>
							    <div class="col-sm-10">
								    <label class="checkbox-inline">
									   	<input type="radio" name="sex" value="男" checked>男
									</label>
									<label class="checkbox-inline">
										<input type="radio" name="sex" value="女">女
									</label>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">出生年份</label>
							    <div class="col-sm-10">
								    <input type="date" value="<fmt:formatDate value="${student.birthyear}" dateStyle="medium" pattern="yyyy-MM-dd" />" name="birthyear"/>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label" name="grade">入学时间</label>
							    <div class="col-sm-10">
								    <input type="date" value="<fmt:formatDate value="${student.grade}" dateStyle="medium" pattern="yyyy-MM-dd" />" name="grade"/>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label" name="grade">所属院系</label>
							    <div class="col-sm-10">
								    <select class="form-control" name="collegeid" id="college">
										<c:forEach items="${collegeList}" var="item">
											<option value="${item.collegeid}">${item.collegename}</option>
										</c:forEach>
								    </select>
							    </div>
							  </div> --%>
							  <div class="form-group" style="text-align: center">
								<button class="btn btn-default" type="button" onClick="location.href='${pageContext.request.contextPath}/addMoney'">充值</button>
								
							  </div>
						</form>
				    </div>
				    
				</div>

			</div>
		</div>
	</div>
	<div class="container" id="footer">
	<div class="row">
		<div class="col-md-12"></div>
	</div>
	</div>
</body>
	<script type="text/javascript">
		$("#nav li:nth-child(1)").addClass("active")

        var collegeSelect = $("#college option");
        for (var i=0; i<collegeSelect.length; i++) {
            if (collegeSelect[i].value == '${student.collegeid}') {
                collegeSelect[i].selected = true;
            }
        }
	</script>
</html>