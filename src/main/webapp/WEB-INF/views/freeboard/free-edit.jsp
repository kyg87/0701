<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
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



<body>

<form action="free-details" method="post">
	<div id="main">
		<table>
			<thead>
				<tr>
				</tr>
				<tr>
					<th>
						<div id="title">제목</div>
					</th>
					
					<th><input id="titleinput" name="title" type="text" value="${n.title }"></th>
					
				</tr>
				<tr>
					<th>
						<div id="contentSrc">IMAGE : </div>
					</th>
					<th><input id="titleinput" name="contentSrc" type="text" value="${n.contentSrc }"></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td colspan="2">
						<div id="divcontent">
							<form>
								<div class="form-group">
									<label for="comment">Comment :</label>
									<textarea class="form-control" name="content" rows="15" id="comment">${n.content }</textarea>
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
							
							 <button class="btn waves-effect waves-light" type="submit" name="action">저장</button>
							 <a href="free-detail?c=${n.id}">취소</a>
  					 </div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<input type="hidden" name="memberId" value="large@a.a">
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