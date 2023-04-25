<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="include/Head.jsp"%>
<title>Insert title here</title>
<script>
	var tooltipTriggerList = [].slice.call(document
			.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
		return new bootstrap.Tooltip(tooltipTriggerEl)
	})
</script>
<script type="text/javascript">
	function showToast() {
		var x = document.getElementById("toast");
		x.className = "show";
		setTimeout(function() {
			x.className = x.className.replace("show", "");
		}, 1000);
	}
</script>
<script type="text/javascript">
	function closeToast() {
		var x = document.getElementById("toast");
		x.className = "close";
	}
</script>

<link rel="stylesheet" href="./css/bootstrap.fa.min.css">

</head>
<body>
	<%@include file="include/Header.jsp"%>
	<div class="" style="margin: auto 180px">
		<!-- Breadcrumb Section Begin -->
		<section class="breadcrumb-blog set-bg"
			data-setbg="img/breadcrumb-bg.jpg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h2>Your Favorite</h2>
					</div>
				</div>
			</div>
		</section>
		<!-- Breadcrumb Section End -->


		<!-- Blog Section Begin -->
		<section class="blog spad">
			<div class="">
				<div class="row">
					<c:forEach var="videos" items="${likeList}">

						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__pic set-bg">
									<img alt="/" src="images/${videos.getVideos().getThumbnail() }">
								</div>
								<div class="blog__item__text">
									<span><img src="img/icon/calendar.png" alt=""> 27
										February 2001</span>
									<h5>${videos.getVideos().getTitle() }</h5>
									<a href="./videos/detail?id=${videos.getVideos().getId() }"
										style="text-decoration: none">See More</a>
								
									<a href="./deleteLike?idLike=${ videos.getId()}" style="margin-left: 140px;">
										<button onclick="showToast()" data-bs-toggle="tooltip"
											title="UnLike?"
											style=" border: none; background-color: white; font-size: 24px">
											❤</button>
									</a>
									
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>

		</section>
		<!-- Blog Section End -->
		<!-- Toast Begin -->
		<div class="toast" role="alert" id="toast"
			style="border: 2px solid rgb(230, 153, 136); width: 30%; margin-left: 70%">
			<div class="toast-header " style="justify-content: between;">
				<img alt="" src="img/Vahir.jpg" style="width: 40px"> <strong
					class="mr-auto" style="margin-left: 20px">Vahir told you
					that: </strong> <small>2 mins ago</small>
				<button onclick="closeToast()" class="close">
					<span>&times;</span>
				</button>
			</div>
			<div class="toast-body text-left">You unliked this Video 🦆</div>
		</div>

		<!-- Toast End -->
		<hr>


	</div>
	<%@include file="include/Footer.jsp"%>

</body>
</html>