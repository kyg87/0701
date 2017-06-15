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
	width: 100%;
	margin-top: 30px;
	/* margin: 0px auto; */
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
	/* margin: 0px auto; */
}

#title {
	width: 20px;
	/* border: 1px solid black; */
	font-family: bold;
	display: inline;
	font-style: black;
	font-weight: bolder;
	margin-left: 10px;
}

#address {
	width: 20px;
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
#btn{
 margin-left: 500px;
}




</style>



	<form id="noticeReg" action="noticeBoard-reg?p=${page }" method="post" enctype="multipart/form-data">
		<main id="main">
		
			<div><h3>공지사항 등록</h3></div>
			
			<div>
				<span> 제목 입력 : </span>
				<textarea></textarea>
			</div>
			
			<div>
				<span> 페이지 주소 입력 : </span>
				<textarea></textarea>
			</div>
			
			<div>
				<span>파일 첨부 : </span>
				<input type="file" name="file" multiple/>
			</div>
			
			<div>
				<span>내용 입력 : </span>
				<textarea rows="20" cols="50"></textarea>
			</div>
		
		
			<!-- <div><h3>공지사항 등록하기~</h3></div>
			<table>
				<thead>					
					<tr>
						<th>
							<div id="title">제목 입력하기 : </div>
						</th>
						<th><input name="title" id="titleinput" type="text" value=""></th>
					</tr>
					<tr>
						<th>
							<div id="address">주소 입력하기 : </div>
						</th>
						<th><input id="contentSrc" type="text" value="" name="contentSrc"></th>
					</tr>
					
					<tr>
						<th>파일 첨부하기~</th>
						<td><input type="file" name="file" multiple/></td>
					</tr>
				</thead>
	
				<tbody>
					<tr>
						<td colspan="2">
							<div id="divcontent">
								<div class="form-group">
									<label for="comment">내용 입력하기 :</label>
									<div id="preView"></div>
									<textarea name="content" class="form-control materialize-textarea" rows="15" id="comment"
									data-length="130"></textarea>
								</div>								
							</div>
							
							<script>
								$(function(){
									$("#comment").keydown(function(e){
										
										if($("#comment").val().length > 130){
											if(e.keyCode != 8){
												alert("글자수 초과!!");
											}
										}
										
									});
								});
							</script>
	
						</td>
	
					</tr>
					
					<tr>
						<td colspan="2">
							<div id="btn">
								<button class="btn waves-effect waves-light" type="submit" name="action">
									등록 완료 <i class="material-icons right">send</i>
								</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table> -->
			
			
	<!-- <fieldset>
		<legend>레시피 등록하기</legend>

		<dl>
			<dt>
				<h5>제목 입력하기</h5>
			</dt>
			<dd>
				<div class="dd-chunk">
					<input placeholder="레시피의 제목을 입력해주세요" type="text"
						name="recipe[title]" />
					<div class="input-error"></div>
				</div>
			</dd>

			<dt>
				<h2>한줄설명 입력하기</h2>
			</dt>
			<dd>
				<div class="dd-chunk">
					<input placeholder="레시피를 소개할 수 있는 한줄설명을 입력해주세요" type="text"
						name="recipe[sub_title]" />
					<div class="input-error"></div>
				</div>
			</dd>

			<dt class="mate">
				<h2>음식정보</h2>
			</dt>
			<dd>
				<div class="dd-chunk">
					<h3>음식이름</h3>
					<ul class="lst_mate">
						<li class="food-info"><input class="lft input-name"
							placeholder="음식명을 입력하세요" type="text" name="recipe[name]" /> <input
							class="rgt" placeholder="조리분량" type="text"
							name="recipe[serving_for]" /> 인분</li>
					</ul>
					<div class="input-error"></div>
				</div>



			</dd>
		</dl>

		</dl>
	</fieldset> -->

	</main>
		<input type="hidden" name="memberId" value=<security:authentication property="name"/> />
	</form>
	
	<script>
		
	</script>



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
