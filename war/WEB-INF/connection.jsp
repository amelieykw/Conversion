<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.google.appengine.api.users.*"%>

<%
	UserService userService = UserServiceFactory.getUserService();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Connection</title>
</head>
<style>
.userConnectionContainer {
	width: 100%;
	height: 25px;
	display: block;
	font-family: Arial, "Helvetica", sans-serif;
	font-size: 16px;
	font-weight: bold;
	color: #fff;
	text-decoration: none;
	text-transform: uppercase;
	text-align: center;
	text-shadow: 1px 1px 0px #37a69b;
	padding-top: 6px;
	position: relative;
	cursor: pointer;
	border: none;
	background-color: #37a69b;
	background-image: linear-gradient(top, #3db0a6, #3111);
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	box-shadow: inset 0px 1px 0px #2ab7ec, 0px 5px 0px 0px #497a78, 0px 10px
		5px #999;
}

.userNickName {
	display: inline-block;
	float: left;
	margin-left: 50px;
}

.connection {
	display: inline-block;
	float: center;
	color: #fff;
}

.deconnection {
	display: inline-block;
	float: right;
	color: #fff;
	margin-right: 50px;
}

.container {
	width: 100%;
	height: 500px;
	margin: 60px auto;
	position: relative;
	text-align: center;
	display: inline-block;
}

.services {
	position: relative;
	border: 1px solid #42464b;
	border-radius: 6px;
	height: auto;
	width: 297px;
	margin: 0 2% 0 2%;
	display: inline-block;
}

.imgcontainer {
	text-align: center;
	width: 257px;
	height: 120px;
	position: relative;
}

/* resize images */
.imgcontainer img {
	text-align: center;
	width: 100%;
	height: auto;
	position: relative;
	left: 8%;
	right: 8%;
}

.videoFormat {
	position: relative;
	display: inline-block;
	width: 100%;
	height: auto;
	top: 80px;
	color: #37a69b;
}

.choice {
	padding: 10px;
	float: left;
}

input[type="upload"] {
	position: relative;
	width: 240px;
	height: 35px;
	top: -15px;
	display: block;
	font-family: Arial, "Helvetica", sans-serif;
	font-size: 16px;
	font-weight: bold;
	color: #fff;
	text-decoration: none;
	text-transform: uppercase;
	text-align: center;
	text-shadow: 1px 1px 0px #37a69b;
	padding-top: 6px;
	margin: 110px 0 0 29px;
	position: relative;
	cursor: pointer;
	border: none;
	background-color: #37a69b;
	background-image: linear-gradient(top, #3db0a6, #3111);
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	box-shadow: inset 0px 1px 0px #2ab7ec, 0px 5px 0px 0px #497a78, 0px 10px
		5px #999;
}
</style>
<body>
	<h1 style="text-align: center;">Bienvenue dans mon application</h1>

	<div class="userConnectionContainer">
		<%
			if (userService.getCurrentUser() == null) {
		%>
		<div class="connection">
			<a href="<%=userService.createLoginURL("/connection")%>">Se
				connecter</a>
		</div>
		<%
			} else {
		%>
		<div class="userNickName">
			Bonjour
			<%=userService.getCurrentUser().getNickname()%>
		</div>
		<div class="deconnection">
			<a href="<%=userService.createLogoutURL("/connection")%>">Se
				déconnecter</a>
		</div>
		<div class="container">
			<div class="services">
				<div>
					<h4 style="text-align: center; color: #37a69b;">Bronze</h4>
				</div>
				<div class="imgcontainer">
					<img src="video.jpg" alt="Avatar" class="avatar">
				</div>
				<div class="videoFormat">
					<h3>Bronze (only 1 choice):</h3>
					<div class="choice">1-AVI</div>
					<div class="choice">2-WMV</div>
					<div class="choice">3-MOV</div>
					<div class="choice">4-FLV</div>
					<div class="choice">5-MKV</div>
					<div class="choice">6-Real Video</div>
				</div>
				<input type="upload" value="Transcodage"
					onclick="window.location='/upload/bronzeFormat';">
			</div>
			<div class="services">
				<div>
					<h4 style="text-align: center; color: #37a69b;">Silver</h4>
				</div>
				<div class="imgcontainer">
					<img src="video.jpg" alt="Avatar" class="avatar">
				</div>
				<div class="videoFormat">
					<h3>Silver (3 maximum):</h3>
					<div class="choice">1-AVI</div>
					<div class="choice">2-WMV</div>
					<div class="choice">3-MOV</div>
					<div class="choice">4-FLV</div>
					<div class="choice">5-MKV</div>
					<div class="choice">6-Real Video</div>
				</div>
				<input type="upload" value="Transcodage"
					onclick="window.location='/upload/silverFormat';">
			</div>
			<div class="services">
				<div>
					<h4 style="text-align: center; color: #37a69b;">Gold</h4>
				</div>
				<div class="imgcontainer">
					<img src="video.jpg" alt="Avatar" class="avatar">
				</div>
				<div class="videoFormat">
					<h3>gold_format (no limit):</h3>
					<div class="choice">1-AVI</div>
					<div class="choice">2-WMV</div>
					<div class="choice">3-MOV</div>
					<div class="choice">4-FLV</div>
					<div class="choice">5-MKV</div>
					<div class="choice">6-Real Video</div>
				</div>
				<input type="upload" value="Transcodage"
					onclick="window.location='/upload/goldFormat';">
			</div>
		</div>
	</div>
	<%
		}
	%>

</body>
</html>