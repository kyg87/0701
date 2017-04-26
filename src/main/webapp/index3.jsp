<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Starter Template - Materialize</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="/WiynPrj/resource/css/materialize.css" type="text/css"
	rel="stylesheet" media="screen,projection" />

<link href="/WiynPrj/resource/css/main222.css" type="text/css"
	rel="stylesheet" media="screen,projection" />


</head>
<body>
	<header>
		<nav class="nav-extended">
			<div class="nav-wrapper">
				<a href="#" class="brand-logo">Logo</a> <a href="#"
					data-activates="mobile-demo" class="button-collapse"><i
					class="material-icons">menu</i></a>
				<ul id="nav-mobile" class="right hide-on-med-and-down">
					<li><a href="">Sass</a></li>
					<li><a href="">Components</a></li>
					<li><a class="waves-effect waves-light btn" href="#modal1">Login</a></li>
				</ul>
				<ul class="side-nav" id="mobile-demo">
					<li><a href="">Sass</a></li>
					<li><a href="">Components</a></li>
					<li><a href="">JavaScript</a></li>
				</ul>
			</div>
			<div class="nav-content">
				<ul class="tabs tabs-transparent">
					<li class="tab"><a href="">공지사항</a></li>
					<li class="tab"><a class="active" href="">자유게시판</a></li>
					<li class="tab"><a href="">요청게시판</a></li>
					<div class="indicator" style="right: 988px; left: 104px;"></div>
				</ul>
			</div>
		</nav>
	</header>
	<!-- 	<div id="test1" class="col s12">Test 1</div>
	<div id="test2" class="col s12">Test 2</div>
	<div id="test3" class="col s12">Test 3</div>
	<div id="test4" class="col s12">Test 4</div> -->

	<div class="container">
		<div class="row">
s
			<div class="col-xs-12 col-md-8">

				<div class="col s12">
					<ul class="tabs">
						<li class="tab col s3"><a href="#test1">최신순</a></li>
						<li class="tab col s3"><a class="active" href="#test2">점수순</a></li>

						<li class="tab col s3"><a href="#test4">댓글순</a></li>
					</ul>
				</div>


				<table class="striped">
					<thead>
						<tr>
							<th>Option Name</th>
							<th>설명</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>inDuration</td>
							<td>The duration of the transition enter in milliseconds.
								Default: 300 [1]</td>
							<td><img alt="" src="/WiynPrj/resource/images/1.jpg">
							</td>

						</tr>
						<tr>
							<td>outDuration</td>
							<td>The duration of the transition out in milliseconds.
								Default: 225 [2]</td>
							<td><img alt="" src="/WiynPrj/resource/images/1.jpg">
							</td>
						</tr>
						<tr>
							<td>constrainWidth</td>
							<td>If true, constrainWidth to the size of the dropdown
								activator. Default: true [1]</td>
							<td><img alt="" src="/WiynPrj/resource/images/1.jpg">
							</td>
						</tr>

					</tbody>
				</table>

				<ul class="pagination center">
					<li class="disabled"><a href="#!"><i
							class="material-icons">chevron_left</i></a></li>
					<li class="active"><a href="#!">1</a></li>
					<li class="waves-effect"><a href="#!">2</a></li>
					<li class="waves-effect"><a href="#!">3</a></li>
					<li class="waves-effect"><a href="#!">4</a></li>
					<li class="waves-effect"><a href="#!">5</a></li>
					<li class="waves-effect"><a href="#!"><i
							class="material-icons">chevron_right</i></a></li>
				</ul>
			</div>



		</div>
	</div>





	<!-- Modal Structure -->
	<div id="modal1" class="modal">
		<div class="modal-content">
			<h4>Modal Header</h4>
			<div class="row">
				<div class="input-field col s12">
					<input id="email" type="email" class="validate"> <label
						for="email">Email</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input id="password" type="password" class="validate"> <label
						for="password">Password</label>
				</div>
			</div>
		
			<div>
				<a class="waves-effect waves-light btn"><i
					class="material-icons left">cloud</i>LogIn</a>
			</div>

			<div class="row or-divider">
				<span>OR</span>
			</div>
			<div>
				<a class="waves-effect waves-light btn"><i
					class="material-icons left">cloud</i>Naver LogIn</a>
			</div>
			<div>
				<a class="waves-effect waves-light btn"><i
					class="material-icons left">cloud</i>FaceBook LogIn</a>
			</div>
			<!--<div class="modal-footer">
				<a href="#!"
					class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
			</div> -->
		</div>





		<!--  Scripts-->
		<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script src="/WiynPrj/resource/js/materialize.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
				$('.modal').modal();
			});
			$(".button-collapse").sideNav();
		</script>
</body>
</html>
