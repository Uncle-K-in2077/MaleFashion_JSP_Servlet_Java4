<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/helper" prefix="f"%>
<!-- Latest Blog Section Begin -->
<script type="text/javascript">
	function letScroll() {

		window.scrollTo(0, 1150);
	}
</script>

<section class="latest spad">
	<div class="" style="margin: auto 180px">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<span>Trending Videos</span>
					<h2>Our Latest Video</h2>
				</div>
			</div>
		</div>
		<div class="row">

			<%-- Tim Kiem Start --%>

			<c:if test="${param.keyword == null}">
				<c:set var="keyword" value=""></c:set>
			</c:if>
			<c:if test="${param.keyword != null}">
				<c:set var="keyword" value="${(param.keyword)}"></c:set>
				<script type="text/javascript">
					const myTimeout = setTimeout(letScroll, 1);
				</script>
				<c:set var="nullValue" value=""></c:set>
			</c:if>

				<%--  
				<input type="text" name="keyword">
				<button type="submit" class=" btn-primary m-1">Search</button>--%>

			<form action="home.jsp" method="get">
				
			 <div  class="input-group mb-3 mt-3">
                <input name="keyword" class="form-control border-end-0 border" type="search" placeholder="search" id="example-search-input">
                <span class="input-group-append">
                    <button class="btn btn-outline-secondary bg-white border-start-0 border-bottom-0 border ms-n5" type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
       
			</form>

			<%-- Tim Kiem End --%>

			<c:if test="${param.keyword != nullValue}">



				<c:forEach var="videos" items="${f:timKiemVideos(keyword) }">
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
			</c:if>
			
			<hr>

			<c:set var="limit" value="3"></c:set>
			<c:choose>
				<c:when test="${param.page == null}">
					<c:set var="page" value="0"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="page" value="${(param.page - 1)*3}"></c:set>
					<%-- Reload on every single page --%>
					<script type="text/javascript">
					const myTimeout = setTimeout(letScroll, 1);
				</script>
				</c:otherwise>
			</c:choose>
			
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

			<hr>

			<c:set var="total" value="${f:getTotal()}"></c:set>
			<c:choose>
				<c:when test="${total%3!=0 }">
					<c:set var="totalPages" value="${total/3 + 1}"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="totalPages" value="${total/3}"></c:set>
				</c:otherwise>
			</c:choose>

			<nav aria-label="Page navigation example">
				<ul class="pagination" style="margin: auto 45% auto 45%">
					<li class="page-item"><a class="page-link" href="#" style="text-decoration: none; color: black;"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					
					<c:forEach var="i" begin="1" end="${totalPages}" step="1">
					
						<li class="page-item"><a class="page-link" style="text-decoration: none; color: black;"
							href="home.jsp?page=${i }">${i }</a></li>
					</c:forEach>
					
					<li class="page-item"><a class="page-link" href="#" style="text-decoration: none; color: black;"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>


		</div>
	</div>
</section>
<!-- Latest Blog Section End -->