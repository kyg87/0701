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
	margin-top:70px;
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

<main>

<form action="edit" method="post">
	<div id="main">
	<div>자유게시판등록</div>
		<table>
			<thead>
				<tr>
					<th>
						<div class="input-field">
							<select name="bigCategoryId" id="bigCategoryId">
								<option id="default" value="" disabled selected>${b }</option>
								<c:forEach var="bc" items="${bcList }">
									<option value="${bc.id }">${bc.name }</option>
								</c:forEach>
							</select>
							<script>
						$(function() {
				               $("#bigCategoryId").on('change', function() {

				                        var data = $("#bigCategoryId");
				                        var smallCategory = $("#smallCategoryId");
				                        var smli = $("#scList>div>select");
				      
				                        smli.empty();
				                        
				                        $.post("getListWithBC", data, function(d) {

				                           var obj = JSON.parse(d);
				               
				                           smallCategory.append( $('<option disabled selected><span> 소분류 선택 </span></option'));
				                           
				                           if(obj.length != 0){
				                              for (var i = 0; i < obj.length; i++) {
				                                    
				                                 smallCategory.append( $('<option value=' +obj[i].id +  '><span>'+ obj[i].name +'</span></option>'));
				                        
				                                    $('select').material_select();
				                              }
				                           }
				                           else if(obj.length == 0){
				                              $('select').material_select();
				                           }
				                        });
				                        
				                        var bcDelpost = $("#bcdel");
				                        var bcModpost = $("#bcmod");
				                        var scCheckpost = $("#scAddCheck");
				                        
				                        bcDelpost.val($(this).val());
				                        bcModpost.val($(this).val());
				                        scCheckpost.val($(this).val());
				                        
				                     });
				            });
						</script>
<!-- 							<select>
								 <option value="" disabled selected>${b }</option> 
								<option value="1">Option 1</option>
								<option value="2">Option 2</option>
								<option value="3">Option 3</option>
							</select> -->
						</div>
					</th>
					<th>
						
						<div class="input-field" id="scList">
						<select name="smallCategoryId" id="smallCategoryId">
							<option id="default" value="" disabled selected>${s }</option>
						</select>
					</div> 
					<script>
						$(function() {
							$("#smallCategoryId").on('change', function() {

								var smList = $("#smallCategoryId");

								var scDelpost = $("#scdel");
								var scModpost = $("#scmod");

								scDelpost.val($(this).val());
								scModpost.val($(this).val());

							});
						});
					</script> 
<%-- <div id="input-field2" class="input-field">							
<select>
								<option value="" disabled selected>${s }</option> 
								<option value="1">Option 1</option>
								<option value="2">Option 2</option>
								<option value="3">Option 3</option> 
							</select> --%>
						</div>
					</th>
				</tr>
				<tr>
					<th>
						<div id="title">제목</div>
					</th>
					
					<th><input id="titleinput" name="title" type="text" value=${n.title }></th>
					
				</tr>
				<tr>
					<th>
						<div id="address">주소</div>
					</th>
					<th><input id="titleinput" name="url"  type="text" value=" ${n.url }"></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td colspan="2">
						<div id="divcontent">
								<div class="form-group">
									<label for="comment">Comment :</label>
									<textarea class="form-control" name="content" rows="15" id="comment">${n.content }</textarea>
								</div>
						</div>

					</td>

				</tr>
				<tr>
					<td colspan="4">
						<div class="chips chips-placeholder">
							<input class="tag" id="e385bafe-7ce5-436e-e3f3-12af51285ada" type="text"  placeholder="+Tag" />
							<c:forEach var="tag" items="${t }">
								<div id="chip" class="chip">${tag }<i class='material-icons close'>close</i></div>
							</c:forEach>
						</div>
						<script>	
						
							$('.tag').keydown(function(e){
								
								   if(e.keyCode == 32){
									   
									   var value = $(this).val();
									   
									   /*  $("<div class='chip'>"+value+"<i class='material-icons close'>close</i></div>").appendTo('.chips');  */
									   $("<div class='chip'><input type='hidden' name='name' value='"+value+"'>"+value+"</input><i class='material-icons close'>close</i></div>").appendTo('.chips');
									   /* alert(value); */
									   $(this).val(null);
								   }	  
								
							});					
						</script>
				</td>
				</tr>
				<tr>
					<td colspan="2">
					<div id="btn">
							<input type="hidden" name="id" value =${n.id }>
							 <button class="btn waves-effect waves-light" type="submit" name="action">저장</button>
							 <a href="site-detail?c=${n.id}">취소</a>				
  					 </div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<input type="hidden" name="memberId" value="LSE@mb">
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

</main>