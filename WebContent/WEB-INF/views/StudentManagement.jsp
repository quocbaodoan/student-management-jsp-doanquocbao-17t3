<%@page import="model.Student"%>
<%@page import="dao.StudentDAO"%>
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
</head>
<body>
			<div class="container pt-3">
				<div class="row">
					<div class="col-12 mx-auto">
						<h2 class="text-center text-muted mb-1">Quản lý sinh viên</h2>
						<a href="${pageContext.request.contextPath}/admin/student/add" class="btn btn-info">Add new student</a>
						<table class="table mt-2">
							<tr class="table-header">
								<th class="header-item text-muted">STT</th>
								<th class="header-item text-muted">Mã sinh viên</th>
								<th class="header-item text-muted">Tên sinh viên</th>
								<th class="header-item text-muted">Giới tính</th>
								<th class="header-item text-muted">Ngày sinh</th>
								<th class="header-item text-muted">Địa chỉ</th>
								<th class="header-item text-muted">Chức năng</th>
							</tr>
							<%
								int count = 0;
								for (Student student : StudentDAO.getAllStudent()) {
									count++;
							%>
							<tr class="table-row">
								<td class="table-data"><%=count%></td>
								<td class="table-data"><%=student.getMssv()%></td>
								<td class="table-data"><%=student.getTensinhvien()%></td>
								<td class="table-data"><%=student.getGioitinh()%></td>
								<td class="table-data"><%=student.getNgaysinh()%></td>
								<td class="table-data"><%=student.getDiachi()%></td>
								<td class="table-data" style="padding: 0.4rem 0.75rem 0.4rem 0.75rem">
									<div class="row">
										<div class="col-6" style="padding-right:0px">
											<a href="${pageContext.request.contextPath}/admin/student/update?ID=<%=student.getMssv()%>" class="btn btn-success">Update</a>
										</div>
										<div class="col-6" style="padding-right:0px">
											<a href="${pageContext.request.contextPath}/admin/student/delete?ID=<%=student.getMssv()%>"class="btn btn-danger">Delete</a>
										</div>
									</div>
								</td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>
</body>
</html>