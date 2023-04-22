<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Videos Management</title>
<%@include file="include/Head.jsp"%>
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
								id="exampleFormControlInput1" placeholder="Your Name please">

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
								placeholder="Your Name please"> <label
								for="exampleFormControlInput1" class="form-label">Description</label>
							<input name="descrip" type="text" class="form-control mb-3"
								id="exampleFormControlInput1" placeholder="Your Name please">


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

		<h1>This is your Video Page <button onclick="playAudio()" type="button"
				style="border: none; background-color: white; font-size: 30px;">🦆</button></h1>


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
						<td><c:if test="${videos.status == true }">
								<span style="color: green;">Online</span>
							</c:if> <c:if test="${videos.status == false }">
								<span style="color: red;">Offline</span>
							</c:if></td>
						<td>
							<div class="buttonGroup">
								<a href="./videos/detail?id=${videos.id }"
									style="text-decoration: none; color: white;">
									<button class="btn-warning" onclick="playAudio()"
										style="width: 48%; padding: 5px; border-radius: 5px; width: 4rem">Detail</button>
								</a> <a href="./videos/delete?id=${videos.id }"
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