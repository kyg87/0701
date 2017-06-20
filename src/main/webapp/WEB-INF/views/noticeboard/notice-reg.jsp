<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
    min-height: 640px;
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
	background: #F6F4F1 !important;
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


</style>

<script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
                $("#blah").attr('style', "visibility:visible; width:300px; height:300px; float:right;");
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }


    </script>

<main id="main">

<div class="container">
	<div class="section">
		<div class="row">

			<div class="col s12 l6">
				<h2 class="title">Notice Board</h2>

				<div class="content">
					<h5>Notice Reg</h5>
				</div>
				
				<div class = "preview">
				
			        <img id="blah" src="#" style="width:300px; height:300px; float:right; visibility:hidden;" />
					
				</div>
				
			</div>
			

			<div class="col s12 l6">
				<form id="noticeReg" action="noticeBoard-reg?p=${page }"
					method="post" enctype="multipart/form-data" class="card-panel">

					<div class="row">
						<div class="input-field col s12">
							<input placeholder=" title " id="titleinput" type="text"
								name="title" class="validate" value="" required="required"> <label
								for="name" class="active"><i class="tiny material-icons">mode_edit</i> 제목 입력 : </label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<input placeholder=" http:// " id="contentSrc" type="text"
								name="contentSrc" class="contentSrc" value="" required="required"> <label
								for="name" class="active"><i class="tiny material-icons">language</i> 주소 입력 : </label>
						</div>
					</div>

					<div class="file-field input-field">

						<div class="btn">
							<span>파일 첨부  </span>
							<input type="file" id="imgInp" class="btn" name="file" multiple />
						</div>

						<div class="file-path-wrapper">
							<input class="file-path validate" type="text">
						</div>

					</div>


					<div class="row">
						<div class="input-field col s12">
							<textarea name="content"
								class="form-control materialize-textarea" rows="15" id="comment"
								data-length="130" required="required"></textarea>
							<label for="name" class="active"><i class="tiny material-icons">textsms</i> 내용 입력 : </label>
						</div>
					</div>
					

					<div id="btn">
						<button class="btn waves-effect waves-light" type="submit"
							name="action" id="test">
							등록 완료 <i class="material-icons right">send</i>
						</button>
					</div>




					<script>
							$(function() {
								
								/* var comment = $("#comment"); */
								
								$("#comment").keydown(function(e) {

									if ($("#comment").val().length > 130) {
										if (e.keyCode != 8) {
											alert("글자수 초과!!");
										}
									}

								});
																								
								comment = comment.replaceAll("\n", "test"); // 줄바꿈 처리
								comment = comment.replaceAll("\u0020", "&nbsp;"); // 스페이스바 처리 
								
								/* $("#comment").val().replace("\\n", "--enter"); */
								
							});
					</script>



					<input type="hidden" name="memberId"
						value=<security:authentication property="name"/> />
				</form>
			
		</div>
	</div>
</div>
</main>




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
