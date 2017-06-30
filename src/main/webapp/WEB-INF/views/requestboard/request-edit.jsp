<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<style>
body {
   background-color: rgb(238, 238, 238);
}

body, html {
   font-family: 'Abel', sans-serif;
   color: #846C63;
}

.card-panel {
    transition: box-shadow .25s;
    padding: 20px;
    margin: 0.5rem 0 1rem 0;
    border-radius: 2px;
     background-color: #F0E5D7 !important; 
    min-height: 500px;
    margin-top: 100px;
    border-radius: 10px;
    
    
    
}

#main {
   width: 100%;
   min-height: 500px;
   font-size: 14px;
   line-height: 1.5em;
   border-radius: 10px;
   -moz-border-radius: 10px;
   -webkit-border-radius: 3px;
   box-shadow: 1px 1px 5px #383838;
   background: #F6F4F1 !important,;
 
  
}

#title {
   width: 20px;
   font-family: bold;
   display: inline;
   font-style: black;
   font-weight: bolder;
   margin-left: 10px;
   
}

#address {
   width: 20px;
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
   width: 100%;
   margin-right: 10%;
}

#input-field1 {
   width: 100px;
}

#input-field2 {
   width: 100px;
   float: left;
   margin-left: 10px;
}

.btn{
   background: rgb(210, 178, 149);
   
   
}

 #label{
	font-size: 15px;
}


#hehe{
	padding-top: 50px;
}

 .imgpencil{
	margin-bottom:50px;
}	


	







</style>



<body>

	<main id="main">

	<div class="container">
		<div class="section">
			
			<div class="row" >

				<div class="col s12 l6">
					<h2 class="title">Request Board</h2>

					<div class="content">
						<h5>Request Edit</h5>
					</div>

					<div class="imgpencil">
		
							<img src="${root }/resource/images/notepad.jpg" 
								style="width: 500px; height: 350px; ; margin-top: 100px; margin-right: 50px; border-radius: 10px; " />
					
					</div> 

				</div>

				<div class="col s12 l6">
					
					<form id="reg" action="update" method="post"
						enctype="multipart/form-data" class="card-panel" 
								style="width: 500px; height: 350px; ; margin-top: 100px; margin-right: 50px; ">

						<div class="row" id="hehe">
							<div class="input-field col s12">
								<input placeholder="" id="titleinput" type="text"
									name="title" class="validate" value="" required="required">
								<label for="name" class="active" id="label"><i
									class="tiny material-icons" id="titleIcon">mode_edit</i> 제목 입력 : </label>
							</div>
						</div>
		


						<div class="row">
							<div class="input-field col s12">
								<textarea name="content"
									class="form-control materialize-textarea" rows="15"
									id="comment" data-length="130" required="required"></textarea>
								<label for="name" class="active" id="label"><i
									class="tiny material-icons">textsms</i> 내용 입력 : </label>
							</div>
						</div>

						<div id="btn">
							<button class="btn waves-effect waves-light right" type="submit"
								name="action" id="">
								등록 <!-- <i class="material-icons right">send</i> -->
							</button>
						</div>

						<input type="hidden" name="id" value=${n.id }> <input
							type="hidden" name="p" value="${page }" />
						</form>
						<script>
							$(function() {
								$("#comment").keydown(function(e) {

									if ($("#comment").val().length > 130) {
										if (e.keyCode != 8) {
											alert("글자수 초과!!");
										}
									}

								});
							});
						</script>

					
				</div>
			</div>
		</div>
	</div>




	<!------------------------------------------------  --> <%-- <form action="update" method="post">
	<div id="main">
	<div>요청등록</div>
		<table>
			<thead>
				<tr>
					<th>
						<div class="input-field">
							<select>
								<option value="" disabled selected>카테고리 one</option>
								<option value="1">Option 1</option>
								<option value="2">Option 2</option>
								<option value="3">Option 3</option>
							</select>
						</div>
					</th>
					<th>
						<div id="input-field2" class="input-field">
							<select>
								<option value="" disabled selected>카테고리 two</option>
								<option value="1">Option 1</option>
								<option value="2">Option 2</option>
								<option value="3">Option 3</option>
							</select>
						</div>
					</th>
				</tr>
				<tr>
					<th>
						<div id="title">제목</div>
					</th>
					<th><input name="title" id="titleinput" type="text" value="${n.title}"></th>

				</tr>
			
				
			</thead>

			<tbody>
				<tr>
					<td colspan="2">
						<div id="divcontent">
							<form>
								<div class="form-group">
									<label for="comment">Comment:</label>
									<textarea name="content" class="form-control" rows="15" id="comment" value="">${n.content}</textarea>
								</div>
							</form>
						</div>

					</td>

				</tr>
				<tr>
					<td><div id="title">Tag</div></td>
					<td><input id="titleinput" type="text" value=""></td>
				</tr>
				<tr>
					<td colspan="2">
					
					<div id="btn">
					  <input type="hidden" name="id" value =${n.id }>
					 <button class="btn waves-effect waves-light" type="submit" name="action"  >Submit
   					 <i class="material-icons right">send</i>
   					 </div>
  					</button>
  					
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<input type="hidden" name="memberId" value="22323@bb.v">
	</form>
	 --%> <!------------------------------------------------  --> <!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script> <script
		src="${root }/resource/js/materialize.js"></script> <script
		type="text/javascript">
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