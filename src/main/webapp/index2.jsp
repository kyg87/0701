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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="/WiynPrj/resource/css/materialize.css" type="text/css"rel="stylesheet" media="screen,projection" />
<link href="/WiynPrj/resource/css/style.css" type="text/css"rel="stylesheet" media="screen,projection" />
<link href="/WiynPrj/resource/css/main.css" type="text/css"rel="stylesheet" media="screen,projection" />


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

		<aside>
			<div class="col-xs-12 col-md-4">
				<nav>
					<div class="nav-wrapper">
						<form>
							<div class="input-field">
								<input id="search" type="search" required=""> <label
									class="label-icon" for="search"><i
									class="material-icons">search</i></label> <i class="material-icons">close</i>
							</div>
						</form>
					</div>
				</nav>
				
				<div>
				  <!-- Dropdown Trigger -->
					<a class='dropdown-button btn' href='#' data-activates='dropdown1'>Category1</a>

					<!-- Dropdown Structure -->
					<ul id='dropdown1' class='dropdown-content'>
						<li><a href="#!">one</a></li>
						<li><a href="#!">two</a></li>
						<li class="divider"></li>
						<li><a href="#!">three</a></li>
						<li><a href="#!"><i class="material-icons">view_module</i>four</a></li>
						<li><a href="#!"><i class="material-icons">cloud</i>five</a></li>
					</ul>
				</div>

				<div>
					<!-- Dropdown Trigger -->
					<a class='dropdown-button btn' href='#' data-activates='dropdown1'>Category2</a>

					<!-- Dropdown Structure -->
					<ul id='dropdown1' class='dropdown-content'>
						<li><a href="#!">one</a></li>
						<li><a href="#!">two</a></li>
						<li class="divider"></li>
						<li><a href="#!">three</a></li>
						<li><a href="#!"><i class="material-icons">view_module</i>four</a></li>
						<li><a href="#!"><i class="material-icons">cloud</i>five</a></li>
					</ul>
				</div>

				<button class="btn waves-effect waves-light right" type="submit"name="action">
					Search <i class="material-icons right">send</i>
				</button>

			</div>
	</aside>
	
	<div class="container">
		<div class="row">
		<main>

			<div class="col-xs-12 col-md-8">

				<div class="col s12">
					<ul class="tabs">
						<li class="tab col s3"><a href="#test1">최신순</a></li>
						<li class="tab col s3"><a class="active" href="#test2">점수순</a></li>
				
						<li class="tab col s3"><a href="#test4">댓글순</a></li>
					</ul>
				</div>
		

				<div class="collection">
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 

				</div>

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

		</main>
		</div>
	</div>





	<!-- Modal Structure -->
	<div id="modal1" class="modal">
		<div class="modal-content">
			<h4>Modal Header</h4>
			<p>A bunch of text</p>
		</div>
		<div class="modal-footer">
			<a href="#!"
				class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
		</div>
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
