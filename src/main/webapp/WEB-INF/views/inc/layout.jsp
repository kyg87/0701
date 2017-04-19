<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
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
		<tiles:insertAttribute name="header" />
<div class="wrapper">	
		<tiles:insertAttribute name="aside" />	
	<div class="container">
		<div class="row">
		
		<tiles:insertAttribute name="main" />
		</div>
	</div>
</div>
	<!-- 풋터 -->
<tiles:insertAttribute name="footer" />
	
	
	
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
