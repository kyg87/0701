<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>


<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
/* td{
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
	text-align: left;
	
}

.table{
	border-radius: 2px;
	width:100%;
	background:white;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
	padding:10px;
	font-family: ''Nanum Gothic Coding', serif;
}

.table tr{
	
}

.input-border{
	border-bottom: 0px;
}

.div-bar{
	width: auto;
	height: 20px;
	background: #e9e9e9;
	border-radius: 2px;
	font:20px;
}

.table-head {
	font-family: 'Jeju Gothic', serif;
	font: menu;
	border-bottom:none;
}

.flex{
	width:auto;
	display: flex;
	justify-direction:space-around;
}

textarea{
    height: auto;
    border:none;
}

.td-border{
border:1px solid #e9e9e9;
border-radius: 2px;
}



input:not([type]):focus:not([readonly]), input[type=text]:focus:not([readonly]), input[type=password]:focus:not([readonly]), input[type=email]:focus:not([readonly]), input[type=url]:focus:not([readonly]), input[type=time]:focus:not([readonly]), input[type=date]:focus:not([readonly]), input[type=datetime]:focus:not([readonly]), input[type=datetime-local]:focus:not([readonly]), input[type=tel]:focus:not([readonly]), input[type=number]:focus:not([readonly]), input[type=search]:focus:not([readonly]), textarea.materialize-textarea:focus:not([readonly]){
	border-bottom: none;
	box-shadow:none;
	background:#e9e9e9;
}
#btn{
	float:right;
}

#btn .btn{
	background: rgba(27, 80, 162, 0.69);
}
#btn .btn:hover{
	background: rgba(23, 56, 125, 0.79);
}

#btn .btn i{
	margin-left: 5px;
} */

.chips{
border-bottom: none;
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

.btn {
	background: rgb(210, 178, 149); 
}

.btn:hover {
	/* background: rgb(210, 178, 149); */
	background-color: rgb(195, 143, 95) !important;
}
</style>

<main id="main">

<div class="container">
	<div class="section">
		<div class="row">

			<div class="col s12 l6">
				<h2 class="title">Site Board</h2>
								
				<div class="preview">

				</div>

			</div>
			
			<div class="col s12 l6">
			<form action="reg" method="post" class="card-panel"">
						<div class="row">
							<div class="input-field">
								<select name="bigCategoryId" id="bigCategoryId" required>
									<option id="default" value="" disabled selected>대분류를 선택하세요.</option>
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
							</div> 
							
							<div class="input-field" id="scList">
						<select name="smallCategoryId" id="smallCategoryId" required>
							<option id="default" value="" disabled selected>소분류를 선택하세요.</option>
						</select>
						
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
					</div> 
						</div>
						
						<div class="row">
							<div class="input-field col s12">
								<input placeholder=" title " id="titleinput" type="text"
									name="title" class="validate" value="" required="required">
								<label for="name" class="active"><i
									class="tiny material-icons">mode_edit</i> 제목 </label>
							</div>
						</div>

						<div class="row">
							<div class="input-field col s12">
								<input placeholder=" http:// " id="contentSrc" type="text"
									name="url" class="contentSrc" value=""
									required="required"> <label for="name" class="active"><i
									class="tiny material-icons">language</i> 주소 </label>
							</div>
						</div>


						<div class="row">
							<div class="input-field col s12">
								<textarea name="content"
									class="form-control materialize-textarea" rows="15"
									id="comment" data-length="130" required="required"></textarea>
								<label for="name" class="active">
								<i class="tiny material-icons">textsms</i> 내용 </label>
							</div>
						</div>
						
						<div class="chips chips-placeholder">
							<!-- add생성될곳 -->
							<input class="tag" id="e385bafe-7ce5-436e-e3f3-12af51285ada" type="text"  placeholder="+Tag" />
							<!-- add가생성되는곳 -->
						</div>

						<div class="row">
						<div id="btn">
							<button class="btn waves-effect waves-light right" type="submit"
								name="action" id="test">등록</button>
						</div>
						<input type="hidden" name="memberId"
							value=<security:authentication property="name"/> />

					</div>
			</form>

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

							});
						</script>



						
					
				</div>
				
		</div>
	




	
						<script>	
						
							$('.tag').keydown(function(e){
								
								   if(e.keyCode == 32){
									   
									   var value = $(this).val();
									   
									   /*  $("<div class='chip'>"+value+"<i class='material-icons close'>close</i></div>").appendTo('.chips');  */
									   $("<div class='chip'><input type='hidden' name='tag' value='"+value+"'>"+value+"</input><i class='material-icons close'>close</i></div>").appendTo('.chips');
									   /* alert(value); */
									   $(this).val(null);
								   }	  
								
							});				
							</script>
							
						

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
