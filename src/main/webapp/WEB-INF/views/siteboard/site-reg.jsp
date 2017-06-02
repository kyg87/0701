<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<style>
td{
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.table{
	border-radius: 2px;
	width:100%;
	background:white;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.input-border{
	border-bottom: 0px;
}
</style>

<main id="main">
<form action="reg" method="post">
		<table class="table">
			<thead>
				<tr>
					<td>
				<%-- 	<select class="browser-default" name="bigCategoryId" id="bigCategoryId">
						<option value="" disabled selected>대분류</option>
						<c:forEach var="bc" items="${bcList }">
							<option value="${bc.id }">${bc.name }</option>
						</c:forEach>
					</select>  --%>
					<%-- <div class="input-field">
							<select name="bigCategoryId" id="bigCategoryId">
								<option value="" disabled selected>대분류</option>
								<c:forEach var="bc" items="${bcList }">
									<option value="${bc.id }">${bc.name }</option>
								</c:forEach>
							</select>
						</div> --%>
					<div class="input-field">
						<select name="bigCategoryId" id="bigCategoryId" required>
							<option id="default" value="" disabled selected>대분류를 선택하세요</option>
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
					</td>
					<td>
					<div class="input-field" id="scList">
						<select name="smallCategoryId" id="smallCategoryId" required>
							<option id="default" value="" disabled selected>소분류를 선택하세요</option>
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
					<!-- <div id="scList">
							<select class="browser-default"  name="smallCategoryId" id="smallCategoryId">
								<option value="" disabled selected>소분류</option>
							</select>
						</div> -->
					</td>
					<td>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan=4">
						<div class="input-field col s12">
							<input id="email" name="title" type="text" class=" input-border validate" required> 
							<label for="email">제목</label>
						</div>
					</td>
					<!-- <td colspan="3">
						<input  id="titleinput" type="" value="">
					</td> -->
				</tr>
				<tr>
					<td colspan="4">
						<div class="input-field col s12">
							<input id="url" name="url"" type="text" class="input-border validate" required> 
							<label for="email">http://</label>
						</div>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4">
						<div>
							<form>
								<div>
									<textarea name="content" class="form-control" rows="15" id="content" required></textarea>
								</div>
							</form>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="chips chips-placeholder">
							<!-- add생성될곳 -->
							<input class="tag" id="e385bafe-7ce5-436e-e3f3-12af51285ada" type="text"  placeholder="+Tag" />
							<!-- add가생성되는곳 -->
						</div>
						<!-- <script>
						$(document).ready(function(){
							$('.chips-placeholder').material_chip({
							    placeholder: 'Enter a tag',
							    secondaryPlaceholder: '+Tag'
							 });
							
							/* var value =	$(".chip").val();
							 alert(value); */
							
							 
						});
						</script> -->
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
							
							  /* $('.chips').on('chip.delete', function(e, chip){
							    // you have the deleted chip here
							  }); */
						</script>
				</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="btn">
						 <button class="btn waves-effect waves-light" type="submit" name="action">Submit<i class="material-icons right">send</i></button> 
		   				</div>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="memberId" value=<security:authentication property="name"/>	>
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
