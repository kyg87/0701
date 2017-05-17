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
<link href="/WiynPrj/resource/css/style.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<link href="/WiynPrj/resource/css/main.css" type="text/css"
	rel="stylesheet" media="screen,projection" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<style>
body {
	background-color: rgb(238, 238, 238);
}

#main {
	width: 600px;
	margin-top: 30px;
	margin: 0px auto;
	min-height: 500px;
	font-size: 14px;
	line-height: 1.5em;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 3px;
	box-shadow: 1px 1px 5px #383838;
	background-color: white;
	/* background: pink; */
	padding: 10px;
	margin: 0px auto;
}

#title {
	width: 40px;
	/* border: 1px solid black; */
	font-family: bold;
	display: inline;
	font-style: black;
	font-weight: bolder;
	margin-left: 10px;
}

#address {
	width: 40px;
	/* border: 1px solid black; */
	display: inline;
	font-style: black;
	font-weight: bolder;
	margin-left: 10px;
}

#divtitle {
	padding-top: 50px;
}

#divaddress {
	padding-top: 10px;
}

#divcontent {
	padding-top: 20px;
}

#divtag {
	padding-top: 20px;
}

#titleinput {
	width: 400px;
	margin-right: 100px;
}

#input-field1 {
	width: 100px;
}

#input-field2 {
	width: 100px;
	float: left;
	margin-left: 10px;
}
#btn{
 margin-left: 500px;
}



</style>



<body>
<form action="reg" method="post">
	<div id="main">
	
		<table>
			<thead>
				<tr>
					<th>
						<div class="input-field">
							<select name="bigCategoryId" id="bigCategoryId">
								<option value="" disabled selected>대분류</option>
								<c:forEach var="bc" items="${bcList }">
									<option value="${bc.id }">${bc.name }</option>
								</c:forEach>
							</select>
						</div>
					</th>
					<th>
						<div id="input-field2" class="input-field">
							<select  name="smallCategoryId" >
								<option value="" disabled selected>소분류</option>
								<option value="1">Option 1</option>
								<option value="2">Option 2</option>
								<option value="3">Option 3</option>
							</select>
						</div>
					</th>
				</tr>
				<tr>
					<th>
						<div id="title" >제목</div>
					</th>
					<th><input name="title" id="titleinput" type="text" value=""></th>
				</tr>
				<tr>
					<th>
						<div id="url">http://</div>
					</th>
					<th><input name="url" id="titleinput" type="text" value=""></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td colspan="2">
						<div id="divcontent">
							<form>
								<div class="form-group">
									<label for="comment">Comment:</label>
									<textarea name="content" class="form-control" rows="15" id="content"></textarea>
								</div>
							</form>
						</div>

					</td>

				</tr>
				<tr>
					<td colspan="2">
						<div class="chips chips-placeholder" data-index="0" data-initialized="true">
							<input id="f1b80b77-35ee-ead5-f62f-91f5eaa70be0" class="input" placeholder="+Tag">
						</div>
 					</td>
				</tr>
				<script>
					$('.chips').material_chip();
					  $('.chips-initial').material_chip({
					    data: [{
					      tag: 'Apple',
					    }, {
					      tag: 'Microsoft',
					    }, {
					      tag: 'Google',
					    }],
					  });
					  $('.chips-placeholder').material_chip({
					    placeholder: 'Enter a tag',
					    secondaryPlaceholder: '+Tag',
					  });
					  $('.chips-autocomplete').material_chip({
					    autocompleteOptions: {
					      data: {
					        'Apple': null,
					        'Microsoft': null,
					        'Google': null
					      },
					      limit: Infinity,
					      minLength: 1
					    }
					  });
					  
					  var chip = {
							    tag: 'chip content',
							    image: '', //optional
							    id: 1, //optional
							  };
					  
					  $('.chips-initial').material_chip('data');
					  
					  $('.chips').on('chip.add', function(e, chip){
						    // you have the added chip here
						  });

						  $('.chips').on('chip.delete', function(e, chip){
						    // you have the deleted chip here
						  });

						  $('.chips').on('chip.select', function(e, chip){
						    // you have the selected chip here
						  });
				</script>
				
				
				
				
				<tr>
					<td colspan="2">
					<div id="btn">
					 <button class="btn waves-effect waves-light" type="submit" name="action">Submit<i class="material-icons right">send</i></button> 
	   				</div>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="bigCategoryId" value="2"/>
		<input type="hidden" name="memberId" value="LSE@mb.com"/>
	</div>
</form>



	<!-- <div id="main">
		<div>
			<div>
				<div class="input-field">
					<select>
						<option value="" disabled selected></option>
						<option value="1">Option 1</option>
						<option value="2">Option 2</option>
						<option value="3">Option 3</option>
					</select>
				</div>

				<div id="input-field2" class="input-field">
					<select>
						<option value="" disabled selected></option>
						<option value="1">Option 1</option>
						<option value="2">Option 2</option>
						<option value="3">Option 3</option>
					</select>
				</div>
			</div>

			<div id="divtitle">
			<div id="title">제목</div>
			<input id="titleinput" type="text" value="">
		</div>


		<div id="divaddress">
			<div id="address">주소</div>
			<input id="titleinput" type="text" value="">
		</div>

		<div id="divcontent">
			<form>
				<div class="form-group">
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="15" id="comment"></textarea>
				</div>
			</form>
		</div>

		<div id="divtag">
			<div id="title">Tag</div>
			<input id="titleinput" type="text" value="">
		</div>




	</div> -->




	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="/WiynPrj/resource/js/materialize.js"></script>
	<script type="text/javascript">
	$('select').material_select('destroy');
		$(document).ready(function() {
			$('select').material_select();
		});

		$(document).ready(function() {
			// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
			$('.modal').modal();
		});
		$(".button-collapse").sideNav();
		
	
	</script>

</body>