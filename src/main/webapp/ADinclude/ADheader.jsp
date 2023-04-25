
    	<audio id="myAudio">
		<source src="include/quack.mp3" type="audio/mpeg">
	</audio>
	<script>
		var x = document.getElementById("myAudio");
		function playAudio() {
			x.play();
		}
	</script>
    <!-- Header Section Begin -->
    
    <% 
    	HttpSession session2 = request.getSession();    
    	String username = (String) session2.getAttribute("username");
    %>
    
    <header class="header">
        <div class="header__top">
            <div class="">
                <div class="row" style="margin: auto 180px">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>Bonjour senior <span style="font-size: 20px; color: #E69988;"> <%= username %>! </span> Ceci est votre page d'administration</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <%-- emty --%>
                            <div class="header__top__links"> 
                            <a href="Logout">Logn Out</a>
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
                            <li><a href="./videos">Videos</a>
								<ul class="dropdown" style="background-color: rgb(230, 153, 136, 0.2);">
									<li style="background: rgb(230, 153, 136);"><a
										href="./videos">Sort by View.asc</a></li>
									<li style="background: rgb(230, 153, 136);"><a 
										href="./videoss">Sort by View.desc</a></li>
							</ul>                            
                            </li>
                            
                            <li><a href="./user">User</a></li>
                            <li><a href="">Email</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                        <a href="#"><img src="img/icon/heart.png" alt=""></a>
                        <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                        <div class="price">$0.00</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->