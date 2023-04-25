<!-- Page Preloder -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
	<div class="offcanvas__option">
		<div class="offcanvas__links">
			<a href="#">Sign in</a> <a href="#">FAQs</a>
		</div>
		<div class="offcanvas__top__hover">
			<span>Usd <i class="arrow_carrot-down"></i></span>
			<ul>
				<li>USD</li>
				<li>EUR</li>
				<li>USD</li>
			</ul>
		</div>
	</div>
	<div class="offcanvas__nav__option">
		<a href="#" class="search-switch"><img src="img/icon/search.png"
			alt=""></a> <a href="#"><img src="img/icon/heart.png" alt=""></a>
		<a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
		<div class="price">$0.00</div>
	</div>
	<div id="mobile-menu-wrap"></div>
	<div class="offcanvas__text">
		<p>Free shipping, 30-day return or refund guarantee.</p>
	</div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->

<%
HttpSession session2 = request.getSession();
String username = (String) session2.getAttribute("username");
Boolean role = (Boolean) session2.getAttribute("role");
Integer idUser = (Integer) session2.getAttribute("idUser");

if (username == null) {
	username = "";
} else {
	username = (String) session2.getAttribute("username");
}
%>

<header class="header">
	<div class="header__top">
		<div class="">
			<div class="row" style="margin: auto 180px">
				<div class="col-lg-6 col-md-7">
					<div class="header__top__left">
						<p>
							Hello <span style="font-size: 20px; color: #E69988;"> <%=username%>!
							</span> This is Uncle K's <span style="color: #E69988; font-size: 16px;">
								Youtube clone</span> Website
						</p>
					</div>
				</div>
				<div class="col-lg-6 col-md-5">
					<div class="header__top__right">
						<div class="header__top__links">

							<c:if test="${username == null }">
								<a href="login.jsp">Logn In</a>
							</c:if>
							<c:if test="${username != null }">
								<a href="Logout">Logn Out</a>
							</c:if>

							<c:if test="${role == false }">
								<a href="./videos">Admin Page</a>
							</c:if>
							<c:if test="${role == false }">
								<a href=""></a>
							</c:if>

						</div>
						<div class="header__top__hover">
							<span>Your mom gay <i class="arrow_carrot-down"></i></span>
							<ul>
								<li>True</li>
								<li>Sure</li>
								<li>Definitely</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="">
		<div class="row" style="margin: auto 180px">
			<div class="col-lg-3 col-md-3">
				<div class="header__logo">
					<a href="./home.jsp"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<nav class="header__menu mobile-menu">
					<ul>
						<li><a href="./home.jsp">Home</a></li>
						<li><a href="">Your Account</a></li>
						<li><a href="">Your Videos</a> 
							<c:if test="${idUser != null }">
								<ul class="dropdown"
									style="background-color: rgb(230, 153, 136, 0.2);">
									<li style="background: rgb(230, 153, 136);"><a
										href="./LikedByUser?id=${ idUser }">Liked Videos</a></li>
									<li style="background: rgb(230, 153, 136);"><a href="">Shared
											Videos</a></li>
								</ul>
							</c:if>
							<c:if test="${idUser == null }">
								<ul class="dropdown" style="background-color: rgb(230, 153, 136, 0.2);">
									<li style="background: rgb(230, 153, 136);"><a
										href="./login.jsp">You need to LogIn first</a></li>
								</ul>
							</c:if>
						</li>
						<li><a href="">Blog</a></li>
						<li><a href="./ContactPage.jsp">Contacts</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-lg-3 col-md-3">
				<div class="header__nav__option">
					<a href="#" class="search-switch"><img
						src="img/icon/search.png" alt=""></a> <a href="#"><img
						src="img/icon/heart.png" alt=""></a> <a href="#"><img
						src="img/icon/cart.png" alt=""> <span>0</span></a>
					<div class="price">$0.00</div>
				</div>
			</div>
		</div>
		<div class="canvas__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
<!-- Header Section End -->