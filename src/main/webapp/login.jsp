<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="include/Head.jsp"%>

<script>
	window.onload = function() {
		document.getElementById("section2").scrollIntoView();
	};
</script>

<title>Male Fashion | Login</title>
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	font-family: 'poppins', sans-serif;
}

section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	width: 100%;
	background-image: url("img/Mountain.jpg");
	background-position: center;
	background-size: cover;
}

.form-box {
	position: relative;
	width: 400px;
	height: 450px;
	background: transparent;
	border: 2px solid rgba(255, 255, 255, 0.5);
	border-radius: 20px;
	backdrop-filter: blur(15px);
	display: flex;
	justify-content: center;
	align-items: center;
}

h2 {
	font-size: 2em;
	color: #fff;
	text-align: center;
}

.inputbox {
	position: relative;
	margin: 30px 0;
	width: 310px;
	border-bottom: 2px solid #fff;
}

.inputbox label {
	position: absolute;
	top: 50%;
	left: 5px;
	transform: translateY(-50%);
	color: #fff;
	font-size: 1em;
	pointer-events: none;
	transition: .5s;
}

input:focus ~ label, input:valid ~ label {
	top: -5px;
}

.inputbox input {
	width: 100%;
	height: 50px;
	background: transparent;
	border: none;
	outline: none;
	font-size: 1em;
	padding: 0 35px 0 5px;
	color: #fff;
}

.inputbox ion-icon {
	position: absolute;
	right: 8px;
	color: #fff;
	font-size: 1.2em;
	top: 20px;
}

.forget {
	margin: -15px 0 15px;
	font-size: .9em;
	color: #fff;
	display: flex;
	justify-content: space-between;
}

.forget label input {
	margin-right: 3px;
}

.forget label a {
	color: #fff;
	text-decoration: none;
}

.forget label a:hover {
	text-decoration: underline;
}

button {
	width: 100%;
	height: 40px;
	border-radius: 40px;
	background: #fff;
	border: none;
	outline: none;
	cursor: pointer;
	font-size: 1em;
	font-weight: 600;
}

.register {
	font-size: .9em;
	color: #fff;
	text-align: center;
	margin: 25px 0 10px;
}

.register p a {
	text-decoration: none;
	color: #fff;
	font-weight: 600;
}

.register p a:hover {
	text-decoration: underline;
}
</style>
<body>
	<%@include file="include/Header.jsp"%>
	<section id="section2">
		<div class="form-box">
			<div class="form-value">

				<%
				String email = (String) session2.getAttribute("email");
				String password = (String) session2.getAttribute("password");
				if (email == null) {
					email = "";
				} else {
					email = (String) session2.getAttribute("email");
					password = (String) session2.getAttribute("password");
				}
				%>

				<form action="./LogIn" method="post">
					<h2>
						Login <img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAAQ5JREFUSEvtloENgkAMRf+fQDfQTdQR3EAm0A10A0cQNnAE3UQnqfkEEgThjlOOmNCEXEIOXtvrtZ8YyTgSF73BZjYHsAfwAHAnqbW3hYAPAM4VksC34vF2JAR8AnDsCNHLkVawmSkyAZTa0jYA1g5w3aeUZFJ/2QVW+la1D0LAINng+ICfANLCAa27nhEHg1UwSm9uZuY648bxh0Y8gadUq+p19VSAi0+NZaji2pK8mpmu2SUmOCGZjgEue7NSvYwZsXMkDnXGE/j/e7WqthyLWcyxWE1dFCEg6aOBMPtS+mQk1dXebAixV/buXHm2yd8QcF3eeoF+EbFUp+B5q4wm6J1tynND71R7/te57QWiUtwf2rf1bQAAAABJRU5ErkJggg==" />
					</h2>
					<%
					String error = (String) request.getAttribute("error");
					if (error != null) {
					%>
					<div style="color: white; border: 2px solid orange; margin-top: 10px; text-align: center; border-radius: 5px"><%=error%></div>
					<%
					}
					%>

					<div class="inputbox">
						<ion-icon name="mail-outline"></ion-icon>
						<input name="email" type="email" required value="<%= email %>"> <label for="">Email</label>
					</div>

					<div class="inputbox">
						<ion-icon name="lock-closed-outline"></ion-icon>
						<input name="password" type="password" required> <label for="">Password</label>
					</div>

					<div class="forget">
						<label for=""><input type="checkbox">Remember Me | <a
							href="#" style="color: #00153A">Forget Password ?</a></label>
					</div>
					<button type="submit">Log in</button>
					<div class="register">
						<p style="color: #00143D; font-weight: bold">
							Don't have an account yet? <a href="signUp.jsp">Register now</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<%@include file="include/Footer.jsp"%>
</body>
</html>