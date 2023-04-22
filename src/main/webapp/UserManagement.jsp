<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
<%@include file="include/Head.jsp"%>
</head>
<body>
	<%@include file="ADinclude/ADheader.jsp"%>
	
	<div class="" style="margin: auto 80px">
		<hr>
		<h1>This is your User Management Page 🦆</h1>
		<table
			class="table table-dark table-hover table-striped table-bordered border-secondary">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">Full name</th>
					<th scope="col">Role</th>
					<th scope="col">Status</th>
					<th scope="col">Custom</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${listUser }">
					<tr>
						<th scope="row">${user.id }</th>
						<td>${user.email }</td>
						<td>${user.password }</td>
						<td>${user.fullname }</td>
						<td><c:if test="${user.role == false }">
								<span style="color: orange;font-weight: bolder;">Admin</span>
							</c:if> 
							<c:if test="${user.role == true }">
								<span style="color: green;font-weight: bolder;">User</span>
							</c:if>
						</td>
						<td><c:if test="${user.status == true }">
								<span style="color: green;">Online</span>
							</c:if> <c:if test="${user.status == false }">
								<span style="color: red;">Offline</span>
							</c:if>
						</td>
						<td>
							<div class="buttonGroup">
								<a href=""
									style="text-decoration: none; color: white;">
									<button class="btn-warning"
										style="width: 48%; padding: 5px; border-radius: 5px; width: 4rem">Detail</button>
								</a> <a href=""
									style="text-decoration: none; color: white;">
									<button class="btn-danger"
										style="width: 48%; padding: 5px; border-radius: 5px; width: 4rem">Delete</button>
								</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@include file="include/Footer.jsp"%>
	</div>
</body>
</html>