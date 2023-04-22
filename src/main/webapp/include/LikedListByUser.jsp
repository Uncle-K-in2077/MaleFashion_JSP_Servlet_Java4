<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/helper" prefix="f"%>
<!-- Latest Blog Section Begin -->

<section class="latest spad">
	<div class="" style="margin: auto 180px">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<span>Your Favorite Videos</span>
					<h2>Latest Videos You Liked</h2>
				</div>
			</div>
		</div>
		<div class="row">
			
					<%-- oanh khung --%>
			<c:forEach var="videos"
				items="${f:getVideosPagination(page, limit) }">
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic set-bg">
							<img alt="/" src="images/${videos.thumbnail }">
						</div>
						<div class="blog__item__text">
							<span><img src="img/icon/calendar.png" alt=""> 27
								February 2001</span>
							<h5>${videos.title }</h5>
							<a href="./videos/detail?id=${videos.id }"
								style="text-decoration: none">See More</a>
							<button
								style="margin-left: 140px; border: none; background-color: white;">
								<img src="img/icon/heart.png" alt="">
							</button>
							<button style="border: none; background-color: white;">
								<img src="img/icon/compare.png" alt="">
							</button>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
</section>
<!-- Latest Blog Section End -->