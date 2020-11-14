<%@page import="model.Schedule"%>
<%@page import="dao.ScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/public/css/style.css">
<script>
	function check(){
		var x = document.getElementById("tenmonhoc").value;
		<%for (Schedule schedule : ScheduleDAO.getScheduleByID(request.getParameter("ID"))){%>
			if (x == "<%=schedule.getTenmonhoc()%>") {
				document.getElementById("message").innerHTML = "Môn học đã tồn tại";
				document.getElementById("message").style.opacity = "1";
				document.getElementById("message").style.color = "#FF5A5F";
				document.getElementById("add").disabled  = true;
				return true;
			}
			else{
				document.getElementById("message").style.opacity = "0";
			    document.getElementById("message").innerHTML = false;
			    document.getElementById("add").disabled  = false;
			}
			<%System.out.println(schedule.getTenmonhoc());%>
		<%}%>
	}
</script>
<body>
	<jsp:include page="NavbarAdmin.jsp"></jsp:include>
			<div class="container pt-3">
				<%
					String mssv = request.getParameter("ID");
				%>
				<h2 class="text-center text-muted mb-4">Thêm lịch học</h2>
				<form action="${pageContext.request.contextPath}/HandleAddSchedule?ID=<%=mssv%>" method="POST" onsubmit={return false}>
				<div class="row">
					<div class="col-6 mx-auto mb-2">
						<label class="text-muted">Mã sinh viên</label>
						<input type="text" value="<%=mssv%>" id="mssv" name="mssv" readonly/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Tên môn học</label>
						<input type="text" id="tenmonhoc"  name="tenmonhoc" onkeyup="check()" required/>
						<span id="message" class="message3"></span>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Số tín chỉ</label>
						<select id="sotinchi" name="sotinchi">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Giảng viên</label>
						<input type="text" id="giangvien" name="giangvien" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Thời khóa biểu</label>
						<input type="text" id="thoikhoabieu" name="thoikhoabieu" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto">
						<label class="text-muted">Tuần học</label>
						<input type="text" id="tuanhoc" name="tuanhoc" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-6 mx-auto  text-center">
						<input type="submit" class="btn btn-success" id="add" name="add" value="Add"/>
						<a href="/admin/schedule?ID=<%=mssv%>" class="btn btn-primary">Back</a>
					</div>
				</div>
				</form>
			</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>