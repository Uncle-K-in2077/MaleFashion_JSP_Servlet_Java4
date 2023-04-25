<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Videos Management</title>
<%@include file="include/Head.jsp"%>
<script src="./ckeditor/ckeditor/ckeditor.js"></script>

</head>
<body>

	<audio id="myAudio">
		<source src="include/quack.mp3" type="audio/mpeg">
	</audio>
	<script>
		var x = document.getElementById("myAudio");
		function playAudio() {
			x.play();
		}
	</script>

	<%@include file="ADinclude/ADheader.jsp"%>
	<div class="" style="margin: auto 80px">

		<!-- Arlert for Create Video error -->
		<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path
				d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
  </symbol>
  <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
    <path
				d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
  </symbol>
  <symbol id="exclamation-triangle-fill" fill="currentColor"
				viewBox="0 0 16 16">
    <path
				d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
  </symbol>
</svg>
		<%
		String error = (String) request.getAttribute("error2");
		if (error != null) {
		%>
		<div class="alert alert-warning d-flex align-items-center"
			role="alert">
			<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
				aria-label="Warning:">
				<use xlink:href="#exclamation-triangle-fill" /></svg>
			<div><%=error%></div>
		</div>
		<%
		}
		%>

		<div class="colapseForm">
			<p>
				<button class="btn-dark" style="padding: 8px; border-radius: 5px"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseExample" aria-expanded="false"
					aria-controls="collapseExample">Create a new Video +</button>
			</p>

			<div class="collapse" id="collapseExample">
				<div class=" container card card-body"
					style="border: 2px solid; background-color: #212529; color: white">

					<%-- Your input here --%>
					<form action="./videos" method="post" enctype="multipart/form-data">
						<div class="mb-3" style="padding: 20px">

							<label for="exampleFormControlInput1" class="form-label">Title
								Video</label> <input name="title" type="text" class="form-control mb-3"
								id="exampleFormControlInput1" placeholder="Your Video Title">

							<label for="exampleFormControlInput1" class="form-label">Thumbnail
								Img</label>


							<%------ 
								<input name="thumbnail" type="text"
								class="form-control mb-3" id="exampleFormControlInput1"
								placeholder="Your Name please">
								--%>

							<input name="thumbnail" type="file" class="form-control mb-3"
								id="exampleFormControlInput1" placeholder="Your Name please">

							<label for="exampleFormControlInput1" class="form-label">Video's
								Link</label> <input name="linkVideo" type="text"
								class="form-control mb-3" id="exampleFormControlInput1"
								placeholder="Link to Youtube source"> <label
								for="exampleFormControlInput1" class="form-label">Description</label>
							<textarea class="form-control mb-2" name="descrip" cols="15"></textarea>


							<button type="submit" class="btn-success"
								style="margin-top: 20px; padding: 5px; border-radius: 5px; width: 4rem">Create</button>
							<button type="reset" class="btn-danger"
								style="margin-top: 20px; padding: 5px; border-radius: 5px; width: 4rem">Cancel</button>
						</div>
					</form>



				</div>
			</div>
		</div>
		<br />

		<h1>
			This is your Video Page
			<button onclick="playAudio()" type="button"
				style="border: none; background-color: white; font-size: 30px;">🦆</button>
		</h1>

		<table
			class="table table-dark table-hover table-striped table-bordered border-secondary">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Title</th>
					<th scope="col">Thumbnail</th>
					<th scope="col">Video's link</th>
					<th scope="col">Description</th>
					<th scope="col">Views</th>
					<th scope="col">Likes</th>
					<th scope="col">Status</th>
					<th scope="col">Custom</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="videos" items="${listVideos }">
					<tr>
						<th scope="row">${videos.id }</th>
						<td>${videos.title }</td>
						<td><img id="card123" alt="" onclick="playAudio()"
							src="images/${videos.thumbnail }"
							style="width: 300px; height: 150px;"></td>
						<td><iframe src="${videos.linkVideo }"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								allowfullscreen></iframe></td>
						<td>${videos.descrip }</td>
						<td>${videos.views }</td>
						<td>${videos.likes }</td>
						<td><c:if test="${videos.status == true }">
								<span style="color: green;">Online</span>
							</c:if> <c:if test="${videos.status == false }">
								<span style="color: red;">Offline</span>
							</c:if></td>
						<td>
							<div class="buttonGroup" style="display: flex">
								<a href="./videosAdmin/detail?id=${videos.id }"
									style="text-decoration: none; color: white;">
									<button class="btn-warning" onclick="playAudio()"
										style="padding: 5px; border-radius: 5px; width: 4rem">
										<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAAP1JREFUSEvtl98NgjAQxr/jxVgeZBPZQEdwAx3BUdxAR3ADYQPYwCVoIxjOQJAHUuSvqSblteR+7XffXa8EQx8Z4qIV/EiSXe446ykbc/I8XrjuVRejFaykDABspoABhEshthZcKGClrn1gzdUoiRDMdxDtO8pt9nIqAyqlDmA+f4B/B1wA0zT1n1kWENFKs4HhYCnliQBfdxoGIiHE8b3GzF5hRiJqttjh4DGtUiXJpZH3PwJXUmtvJwZijdQ3ImqmZviJOxpIHbAyVwH1ZjFXH7CRcjLVQPqafvYcW3CbAlbqWpnfm7nKgb7ldupraQeIBg/0fYOP/c/Y2+kFRLm+H63lQsAAAAAASUVORK5CYII=" />
									</button>
								</a>
								<button style="padding: 5px; border-radius: 5px; width: 4rem;"
									class="btn-danger"
									onclick="if(confirm('Bạn có muốn xóa video này không?')) { window.location.href = './videos/delete?id=${videos.id }'; }">
									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAAVFJREFUSEvtltFRwzAMhiXnLiDlgRUYgQ0oG5QNygR0A9oN6ARkBJiAdgNG6AjwUJtLLxWX5AJJcLCTPISH+NWSPuu3JQthpIUjcaET+FPrpSBe2A6LIu/nzBvfRLzBWutHBLj/K7AAbJh56QP3AhtjFiDy5BMQEO+IKHbZ1sDGmBmIvLqceu0j3hDRtvT9N+BLOJ0WvTJyOSkVE9HemnHVN0mSqzRNrS/YxSj3gyD4CMPwzVoFbUGM1tl9XPtCWux2xDybwJkCrXX8S2qRdS4ZYiZd8wp2IFKUCuJDRdrhUhNzfkhzOKwawQFE1hRFq3xfa5nAg171JHVNvulx/cgx1fG3Fv4ts2iVkP/XiPU/WyQGpYpxp2ydBWK41D2/x3HAAvDCzPNunavLZNkihxK5PYui507gzDgff45H64md0iu1rU6VTXuvudoJ6WEwGvgL2RwXLhYFuhoAAAAASUVORK5CYII=" />
								</button>
								
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


	</div>
	<%@include file="include/Footer.jsp"%>
	<script>
		CKEDITOR.replace('descrip');
	</script>
</body>
</html>