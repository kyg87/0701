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

#main {
	width: 100%;
	min-height: 500px;
	font-size: 14px;
	line-height: 1.5em;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 3px;
	box-shadow: 1px 1px 5px #383838;
	background: #F6F4F1!important;
}

/* #main {
	width: 600px;
	margin: 0px auto;
	min-height: 500px;
	font-size: 14px;
	line-height: 1.5em;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 3px;
	box-shadow: 1px 1px 5px #383838;
	background-color: white;
	background: pink;
	margin: 0px auto;
} */

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

#btn {
	margin-left: 500px;
}
</style>



<main id = "main">

<div class="container">
	<div class="section">
		<div class="row">

			<div class="col s12 l6">
				<h2 class="title">고옹지이사하아아아앙~~</h2>

				<div class="content">
					<h5>예압 췌키랏! 수정해봐 공지사항 예압 노티스!!</h5>
				</div>

			</div>

			<div class="col s12 l6">
				<form id="update" action="notice-update" method="post" enctype="multipart/form-data">

					<div class="row">
						<div class="input-field col s12">
							<input placeholder=" title " id="titleinput" type="text"
								name="title" class="validate" value="${list.title}">
								<label for="name" class="active"> 제목을 입력 : 하시오~ </label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<input placeholder=" http:// " id="contentSrc" type="text"
								name="contentSrc" class="contentSrc" value="${list.contentSrc }">
								<label for="name" class="active"> 주소를 입력 : 하시오오오오~~ </label>
						</div>
					</div>

					<div class="file-field input-field">

						<div class="btn">
							<span>파일을 첨부 : 해애봅시이다아 </span> <input type="file" name="file"
								multiple />
						</div>

						<div class="file-path-wrapper">
							<input class="file-path validate" type="text">
						</div>

					</div>


					<div class="row">
						<div class="input-field col s12">
							<textarea name="content"
								class="form-control materialize-textarea" rows="15" id="comment"
								data-length="130">${list.content}</textarea>
							<label for="name" class="active"> 내용을 입력 : 하시오오오오옹!~!~!~</label>
						</div>
					</div>

					<div id="btn">
						<input type="hidden" name="id" value=${list.id }>
						<button class="btn waves-effect waves-light" type="submit" name="action">
							등록 완료 <i class="material-icons right">send</i>
						</button>
					</div>




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



					<!-- <input type="hidden" name="memberId"
						value=<security:authentication property="name"/> /> -->
						<input type="hidden" name="p" value="${page }" />
				</form>
			</div>
		</div>
	</div>
</div>

<!-- ----------------------------------------------------------------------------------------------------------- -->

<%-- <form id="update" action="notice-update" method="post" enctype="multipart/form-data">
		
			<div>공지사항 수정</div>
			<table>
				<thead>

					<tr>
						<th>
							<div id="title">제목</div>
						</th>
						<th><input name="title" id="titleinput" type="text"
							value="${list.title}" /></th>

					</tr>
					
					<tr>
						<th>
							<div id="address">http://</div>
						</th>
						<th><input id="contentSrc" name="contentSrc" type="text" value="${list.contentSrc }"></th>
					</tr>
					<tr>
						<th>파일 첨부</th>
						<td><input type="file" name="file" /></td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td colspan="2">
							<div id="divcontent">
									<div class="form-group">
										<label for="comment">Comment:</label>
										<textarea name="content" class="form-control" rows="15"
											id="comment">${list.content}</textarea>
									</div>
							</div>

						</td>

					</tr>
					<!-- <tr>
						<td><div id="title">Tag</div></td>
						<td><input id="titleinput" type="text" value=""></td>
					</tr> -->
					<tr>
						<td colspan="2">

							<div id="btn">
								
								<button class="btn waves-effect waves-light" type="submit"
									name="action">Submit</button>
							</div>

						</td>
					</tr>
				</tbody>
			</table>
			
		
	</form> --%>

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