<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.wiyn.web.entity.SmallCategory"%>
<%@page import="com.google.gson.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Starter Template - Materialize</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link href="/WiynPrj/resource/css/materialize.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<!-- <link href="/WiynPrj/resource/css/style.css" type="text/css" rel="stylesheet" media="screen,projection" /> -->
<link href="/WiynPrj/resource/css/main.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<link href="/WiynPrj/resource/css/admin/admin.css" type="text/css"
	rel="stylesheet" />



</head>
<body>

	<%-- 
			<!-- --------------------- 게시판 ---------------------  -->
	<form action="#">
		
		<div class="big-div">
			<div class="content">
				<div class="menu">				
					<ul class="collection with-header">
						<li class="collection-header"><h4>Admin Page</h4></li>
						<li class="collection-item"><a href="#!"
							class="collection-item">카테고리 수정</a></li>
						<li class="collection-item"><a href="#!"
							class="collection-item active">공지사항 수정</a></li>
						<li class="collection-item"><a href="#!"
							class="collection-item">요청게시판 수정</a></li>
						<li class="collection-item"><a href="#!"
							class="collection-item">일반게시판 수정</a></li>
							<li class="collection-item"><a href="#!"
							class="collection-item">자유게시판 수정</a></li>
					</ul>
				</div>

				<div class="view">
					<ul class="collection with-header">
						<li class="collection-header"><h4>공지사항(10)</h4></li>
					</ul>
					
					<table class="article-list">
						<c:forEach var="list" begin="1" end="10">
							<tr>
								<td width="50">
									<input type="checkbox" class="filled-in" id="filled-in-box${list }"/>
      								<label for="filled-in-box${list }"></label>									
								</td>
								<td>
									<a href="#!" class="collection-item">${list } 번째 글 </a>
								</td>
							</tr>
						</c:forEach>					
					</table>
					
					<div class="article-btn right">
						<a class="waves-effect waves-light btn card-panel blue lighten-2">글쓰기</a>
						<a class="waves-effect waves-light btn card-panel blue lighten-2">선택 삭제</a>
					</div>
						
					<div class="pagenavi">
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
		</div>
				
	</form>
	<!-- --------------------- 게시판 end --------------------- --> --%>



	<div class="view">
		<ul class="collection with-header">
			<li class="collection-header"><h4>카테고리 관리</h4></li>
		</ul>

		<div class="category-admin">


			<div class="input-field">
				<select name="bigCategoryId" id="bigCategoryId">
					<option value="" disabled selected>대분류 선택</option>

					<c:forEach var="bc" items="${bcList }">
						<option value="${bc.id }">${bc.name }</option>
					</c:forEach>
				</select>
			</div>

			<script>
			
	

				$(function() {
					$("#bigCategoryId").on('change', function() {

								var data = $("#bigCategoryId");
								var smallCategory = $("#smallCategoryId");
								var smli = $("#scList>div>select");
		
								smli.empty();
								
								$.post("getListWithBC", data, function(d) {

									var obj = JSON.parse(d);
									console.log(obj);
		   		
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
							});
				});
			</script>

			<div class="input-field" id="scList">
				<select name="smallCategoryId" id="smallCategoryId">
					<option value="" disabled selected>소분류 선택</option>
				</select>
			</div>
			
			<script>
			
			$(function() {
				$("#smallCategoryId").on('change', function() {
					
					var smList = $("#smallCategoryId");
					
					console.log("change");
					alert("선택한 소분류 id 값 : " + $(this).val());
				});
			});
			
			</script>


			<!-- Modal Trigger -->
			<a class="waves-effect waves-light btn" href="#modal11">수정</a>

			<!-- Modal Structure -->



			<!-- Modal Trigger -->
			<a class="waves-effect waves-light btn" href="#modal2">삭제</a>

			<!-- Modal Structure -->


			<a class="waves-effect waves-light btn" href="#modal3">대분류 추가</a>

			<!-- Modal Structure -->



			<a class="waves-effect waves-light btn" href="#modal4">소분류 추가</a>

			<!-- Modal Structure -->



		</div>

		<!-- <div class="article-btn right">
						<a class="waves-effect waves-light btn card-panel blue lighten-2">글쓰기</a>
						<a class="waves-effect waves-light btn card-panel blue lighten-2">선택
							삭제</a>
					</div> -->

	</div>

	<!-- </form> -->

	<div id="modal11" class="modal">
		<div class="modal-content">
			<h4>카테고리 수정</h4>
			<div class="row">
				<form class="col s12">
					<div class="row">
						<div class="input-field col s12">
							<textarea id="textarea1" class="materialize-textarea"></textarea>
							<label for="textarea1">수정할 카테고리명 입력</label>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="modal-footer">

			<button class="btn waves-effect waves-light"
					name="action">Cancel</button>

				<button class="btn waves-effect waves-light" type="submit"
					name="action">Submit</button>
		</div>
	</div>


	<div id="modal2" class="modal">
		<form id="Category-Delete" action="admin-category-del" method="post">
			<div class="modal-content">
				<h4>카테고리 삭제</h4>
				<p>정말 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">

				<input type="hidden" value="" name="smallCategoryId" />
				<input type="hidden" value="" name="bigCategoryId" />

				<button class="btn waves-effect waves-light"
					name="action">Cancel</button>

				<button class="btn waves-effect waves-light" type="submit" id="CategoryDelBtn"
					name="action">Submit</button>

			</div>
		</form>
	</div>
	
	
	
	<div id="modal3" class="modal">
		<div class="modal-content">
			<h4>대분류 추가</h4>
			<div class="row">
				<form class="col s12" id="bigCategory" action="admin-bcadd"
					method="post">
					<div class="row">
						<div class="input-field col s12">
							<textarea id="textarea1" class="materialize-textarea" name="name"></textarea>
							<label for="textarea1">새로운 카테고리명 입력</label>
						</div>

						<div class="modal-footer">

							<button class="btn waves-effect waves-light"
								name="action">Cancel</button>

							<button class="btn waves-effect waves-light" type="submit"
								name="action">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="modal4" class="modal">
		<div class="modal-content">
			<h4>소분류 추가</h4>
			<div class="row">
				<form class="col s12" id="smallCategory" action="admin-scadd"
					method="post">
					<div class="row">
						<div class="input-field">
							<select name="bigCategoryId">
								<option value="" disabled selected>대분류 선택</option>

								<c:forEach var="bc" items="${bcList }">
									<option value="${bc.id }">${bc.name }</option>
								</c:forEach>
							</select>
						</div>

						<div class="input-field col s12">
							<textarea id="textarea1" class="materialize-textarea" name="name"></textarea>
							<label for="textarea1">새로운 카테고리명 입력</label>
						</div>

						<div class="modal-footer">

							<button class="btn waves-effect waves-light"
								name="action">Cancel</button>

							<button class="btn waves-effect waves-light" type="submit"
								name="action">Submit</button>

						</div>

					</div>
				</form>
			</div>
		</div>
	</div>


	<!--  Scripts-->

	<script type="text/javascript">
	
		$(document).ready(function() {
	    	$('select').material_select();
	  	});
	
	
		$(document).ready(function() {
			// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
			$('.modal').modal();
		});

	</script>

</body>
</html>