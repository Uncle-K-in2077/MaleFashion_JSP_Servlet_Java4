<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaleFashion | DetailVideo</title>
<%@include file="include/Head.jsp"%>
<script src="../ckeditor/ckeditor/ckeditor.js"></script>
</head>
<style>
.gradient-custom-2 {
	/* fallback for old browsers */
	background: #fbc2eb;
	/* Chrome 10-25, Safari 5.1-6 */
	background: -webkit-linear-gradient(to right, rgba(251, 194, 235, 1),
		rgba(166, 193, 238, 1));
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	background: linear-gradient(to right, rgba(251, 194, 235, 1),
		rgba(166, 193, 238, 1))
}
</style>
<body>
	<section class="h-100 gradient-custom-2">
		<div class="py-5 h-100">
			<%-- 1 --%>
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-lg-9 col-xl-7">
					<div class="card">
						<div class="rounded-top text-white d-flex flex-row"
							style="background-color: #000; height: 200px;">
							<div class="ms-4 mt-5 d-flex flex-column" style="">
								<img alt="" src="../images/${videos.thumbnail }"
									class="img-fluid img-thumbnail mt-4 mb-2"
									style="width: 300px; z-index: 1">
							</div>
							<div class="ms-3" style="margin-top: 130px;">
								<h5>${videos.title }</h5>
								<p style="color: yellow;">
									<a style="text-decoration: none; color: white" href="../videos">Back
										<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAATZJREFUSEvt1t1twjAQAOC7KkWc7UrdpGWDMknLBnQDNoAR0knKCGGDjoDU/PB2lQNBxoqduIpBCPJoWf5yl/NdEC704IVcuMNny/x1pbrMy1UCSTpSo6wtRcz8XBa7pZDjT0Tctu0JjrjIqxQB3pl5+4jJ1Mb3aPWNgK8MnAlJ0zY8CG7QJgKNPyQ4IaIfvWaixz3AmVRiYkfdG7bRGgL4koo+XKheR4AZKUr/BQ+NHl7If4NioJ1wLNQLx0SdcGw0FE6loplRwWsEfDErxFXBQQ3EEfVguPcex8Q7G0gsvBPW3ycG3guOgfeG23AG3ghJb830OQyJk2o3+7l1A8J+Oo5j0UKNiaXHYo270M6W6Xql4rdaCDVeuYZ8HXm+m8snWrjOCEp1WG78u+/wkNn0nnV7qf4DCAIKLuwoAPoAAAAASUVORK5CYII=" />
									</a>
								</p>
							</div>
						</div>
						<%--2 --%>
						<div class="p-4 text-black" style="background-color: #f8f9fa;">

							<div class="colapseForm">
								<p>
									<button class="btn-dark"
										style="padding: 5px; border: 1px solid: white; border-radius: 5px; width: 300px; margin-top: 20px"
										type="button" data-bs-toggle="collapse"
										data-bs-target="#collapseExample" aria-expanded="false"
										aria-controls="collapseExample">Edit ❤</button>
								</p>
								<div class="collapse" id="collapseExample">
									<div class=" container card card-body"
										style="border: 2px solid; background-color: #212529; color: white">

										<%-- Your input here --%>
										<form action="../video/update?id=${videos.id }" method="post"
											enctype="multipart/form-data">
											<div class="mb-3" style="padding: 20px">

												<label for="exampleFormControlInput1" class="form-label">Title
													Video</label> <input name="title" type="text"
													class="form-control mb-3" id="exampleFormControlInput1"
													value="${videos.title }"> <label
													for="exampleFormControlInput1" class="form-label">Thumbnail
													Img</label> <input name="newThumbnail" type="file"
													class="form-control mb-3" id="exampleFormControlInput1">

												<input name="oldThumbnail" type="hidden"
													class="form-control mb-3" id="exampleFormControlInput1"
													value="${videos.thumbnail }"> <label
													for="exampleFormControlInput1" class="form-label">Video's
													Link</label> <input name="linkVideo" type="text"
													class="form-control mb-3" id="exampleFormControlInput1"
													value="${videos.linkVideo }"> <label
													for="exampleFormControlInput1" class="form-label">Description</label>

												<textarea class="form-control mb-3" name="descrip" cols="15">${videos.descrip }</textarea>

												<button type="submit" class="btn-success"
													style="margin-top: 20px; padding: 5px; border-radius: 5px; width: 4rem">Save</button>
												<button type="reset" class="btn-danger"
													style="margin-top: 20px; padding: 5px; border-radius: 5px; width: 4rem">Cancel</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<div class="d-flex justify-content-end text-center py-1">
								<div>
									<p class="mb-1 h5">${videos.views }</p>
									<p class="small text-muted mb-0">Views</p>
								</div>
								<div class="px-3">
									<p class="mb-1 h5">000</p>
									<p class="small text-muted mb-0">Likes</p>
								</div>
								<div>
									<p class="mb-1 h5">000</p>
									<p class="small text-muted mb-0">Shares</p>
								</div>
							</div>
						</div>
						<div class="card-body p-4 text-black">
							<div class="mb-5">
								<p class="lead fw-normal mb-1">Detail</p>
								<div class="p-4" style="background-color: #f8f9fa;">
									<p class="font-italic mb-1">
										<span style="font-size: larger; font-weight: bold;">Title:
										</span> ${videos.title }
									</p>
									<p class="font-italic mb-1">
										<span style="font-size: larger; font-weight: bold;">Thumbnail:
										</span> ${videos.thumbnail }
									</p>
									<p class="font-italic mb-1">
										<span style="font-size: larger; font-weight: bold;">Youtube
											Link: </span> ${videos.linkVideo }
									</p>
									<p class="font-italic mb-1">
										<span style="font-size: larger; font-weight: bold;">Description:
										</span> ${videos.descrip }
									</p>
									<p class="font-italic mb-1">
										<span style="font-size: larger; font-weight: bold;">Status:
										</span>
										<c:if test="${videos.status == true }">
											<span style="color: green;">Online</span>
										</c:if>
										<c:if test="${videos.status == false }">
											<span style="color: red;">Offline</span>
										</c:if>
									</p>


								</div>
							</div>
							<div
								class="d-flex justify-content-between align-items-center mb-4">
								<p class="lead fw-normal mb-0">Live Video</p>

							</div>
							<%--Ratio Here --%>
							<div class="ratio ratio-16x9">
								<iframe src="${videos.linkVideo }" title="YouTube video"
									allowfullscreen></iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>

	<script>
		CKEDITOR.replace('descrip');
	</script>






</body>
<!-- Js Plugins -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>


<!-- MDB -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>

</html>
