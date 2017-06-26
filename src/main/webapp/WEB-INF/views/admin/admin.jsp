<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.wiyn.web.entity.SmallCategory"%>
<%@page import="com.google.gson.*"%>

<!DOCTYPE html>
<style>

#main{
	min-height: 700px;
}

.view{
	display: flex;
}

.category-admin{
}

.divv{
	margin-left: 50px;
	width: 5px;
	border-left: 1px solid black;
	border-right: 1px solid black;
}

.btn{
	float:right;
	margin-left: 5px;
	background: rgb(210, 178, 149);
}

.btn:hover {
	/* background: rgb(210, 178, 149); */
	background-color: rgb(195, 143, 95) !important;
}

.col.l5.s12{
box-shadow:  2px 2px 0 rgba(0,0,0,0.12);
background: #fff;
min-height: 400px;
}

.row .cate{
	margin-right: 100px;
}


</style>

<main id="main">
<div class="container">
<div class="section">
		<div class="row">
		<div class="col l5 s12 cate">
		<div class="view">
		<div class="category-admin">
			
			<div class="input-field header-down">
			
			<ul class="collection with-header">
				<li class="collection-header"><h4>카테고리 관리</h4></li>
			</ul>

			
				<select name="bigCategoryId" id="bigCategoryId">
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

			<div class="input-field" id="scList">
				<select name="smallCategoryId" id="smallCategoryId">
					<option id="default" value="" disabled selected >소분류를 선택하세요</option>
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


			<!-- Modal Trigger -->
			<a class="waves-effect waves-light btn" href="#modal11" id="CategoryModifyStart">수정</a>

			<!-- Modal Structure -->



			<!-- Modal Trigger -->
			<a class="waves-effect waves-light btn" href="#modal2">삭제</a>

			<!-- Modal Structure -->


			<a class="waves-effect waves-light btn" href="#modal3">대분류 추가</a>

			<!-- Modal Structure -->



			<a class="waves-effect waves-light btn" href="#modal4">소분류 추가</a>

			<!-- Modal Structure -->

		</div>
		</div>
		</div>

		<div class="col l5 s12">
		<form id="selHot" action="hotSelect" method="post">
			<div class="admin-hot">
				<div class="input-field">
				
				<ul class="collection with-header">
					<li class="collection-header"><h4>인기 게시물 관리</h4></li>
				</ul>
	
					<div>
						
							<select name="hotLine" id="hotLine">
								<option id="default" value="" disabled selected>Line Select</option>
								<option id="first" value="1" > 첫 번째 Hot </option>
								<option id="second" value="2" > 두 번째 Hot </option>
							</select>
						
							<select name="hotName" id="hotName">
								<option id="default" value="" disabled selected >Name Select</option>
								
								<c:forEach var="hotList" items="${hotList }">
									<option id="${hotList.id }" value="${hotList.id }" > ${hotList.name } </option>
								</c:forEach>
								
							</select>
						
					</div>
				</div>
				
				<div>
					<button class="btn waves-effect waves-light" type="button" id="hotLineBtn">등록</button>
				</div>
						
				<script>
						
					$(function() {
						$("#hotLineBtn").on('click', function() {
							
							if($("#hotLine").val() == null || $("#hotName").val() == null){
								alert("HotLine 혹은 HotName 선택이 올바르지 않습니다.");
								
								location.href='http:\/\/localhost\/WiynPrj\/admin\/admin';
							}
							
							else{
								$("#selHot").submit();
							}
							
						});
					});
					
				</script>
			
			</div>
		
		</form>
		</div>

	<!-- </form> -->
	

	<div id="modal11" class="modal">
		<form class="col s12" id="Category-Modify" action="admin-category-modify" method="post">
			<div class="modal-content">
				<h4>카테고리 수정</h4>
					<div class="row">
						<div class="row">
							<div class="input-field col s12">
								<textarea id="modify-name" class="materialize-textarea"
									name="modifyName" onkeypress="noEnter()"></textarea>
								<label for="textarea1">수정할 카테고리명 입력</label>
							</div>
						</div>
					</div>
			</div>
			<div class="modal-footer">
	
				<button class="btn waves-effect waves-light" id="modCancel">Cancel</button>
	
				<button class="btn waves-effect waves-light" type="button"
					id="CategoryModBtn" name="action">Submit</button>
			</div>
			
			<input type="hidden" value="" name="smallCategoryId" id="scmod" />
			<input type="hidden" value="" name="bigCategoryId" id="bcmod" />
			
		</form>
	</div>

	<script>
	$(function(){
		$("#CategoryModBtn").on('click', function(){
			
			var name = $("#modify-name").val();
			var ModForm = $("#Category-Modify");
			var modCheckBc = $("#bigCategoryId").val();
			var modCheckSc = $("#smallCategoryId").val();
			
			if(modCheckSc == null && modCheckBc == null)
				alert("수정할 카테고리를 정확히 선택해주세요!");
			
			else if(modCheckSc == null && modCheckBc != null){
				// 대분류 수정
				name = name.trim();
			
				if(name == "")
					alert("카테고리명을 정확히 입력하세요!");
				
				else{
					
					$.post("BCAddCheck", {"name":name}, function(bm){
						
						if(bm == 0){
								ModForm.submit();
								alert("대분류 수정 성공!");
						}
						
						else
							alert("중복된 이름 존재");
						
					});
					
				}
			}
			
			else if(modCheckSc != null && modCheckBc != null){
				// 소분류 수정
				
				var data = ModForm.serialize();
				
				name = name.trim();
				
				if(name == "")
					alert("카테고리명을 정확히 입력하세요!");
				
				else{
					
					$.post("SCModCheck", {"data":data}, function(sm){
						
						if(sm == 0){
							ModForm.submit();
							alert("소분류 수정 성공!");
						}
						
						else
							alert("중복된 이름 존재");
						
					});
					
				}	
				
				
			}
			
				
		});
		
		$("#modCancel").on('click', function(){
			
			location.href='http:\/\/localhost\/WiynPrj\/admin\/admin';
			
		});
		
	});
	</script>

	<div id="modal2" class="modal">
		<form id="Category-Delete" action="admin-category-del" method="post">
			<div class="modal-content">
				<h4>카테고리 삭제</h4>
				<p>정말 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">

				<input type="hidden" value="" name="smallCategoryId" id="scdel" />
				<input type="hidden" value="" name="bigCategoryId" id="bcdel" />

				<button class="btn waves-effect waves-light" type="button" id="delCancel">Cancel</button>

				<button class="btn waves-effect waves-light" type="button" id="CategoryDelBtn"
					name="action">Submit</button>

			</div>
		</form>
	</div>
	
	<script>
		$(function(){
			$("#CategoryDelBtn").on('click', function(){
				
				var delCheckId = $("#bigCategoryId");
				var delForm = $("#Category-Delete");
				var delCheckSm = $("#smallCategoryId");

				if(delCheckSm.val() == null && delCheckId.val() == null)
					alert("삭제할 카테고리를 정확히 선택해주세요!");
				
				else{
					$.post("getListWithBC", delCheckId, function(c) {

						var delCheck = JSON.parse(c);
						
						if(delCheck.length != 0 && delCheckSm.val() == null){
							alert("소분류가 포함되어있는 대분류는 삭제가 불가능합니다.");						
						}
						
						else
							delForm.submit();
						
					});
				}
				
			});
			
			$("#delCancel").on('click', function(){
				
				location.href='http:\/\/localhost\/WiynPrj\/admin\/admin';
				
			});
			
		});
	</script>
	
	<div id="modal3" class="modal">
		<div class="modal-content">
			<h4>대분류 추가</h4>
			<div class="row">
				<form class="col s12" id="bigCategory" action="admin-bcadd"
					method="post">
					<div class="row">
						<div class="input-field col s12">
							<textarea id="BCaddName" class="materialize-textarea" name="name"
							 onkeypress="noEnter()"></textarea>
							<label for="BCaddName">추가할 대분류 카테고리명</label>
						</div>

						<div class="modal-footer">

							<button class="btn waves-effect waves-light" id="BCaddCancel">Cancel</button>

							<button class="btn waves-effect waves-light" type="button"
								id="BCAddBtn">Submit</button>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	
	<script>
	
	$(function(){
		$("#BCAddBtn").on('click', function(){
			
			var name = $("#BCaddName").val();
			var bcAddForm = $("#bigCategory");
						
			name = name.trim();
			
			if(name == "")
				alert("카테고리명을 정확히 입력하세요!");
			
			else{
				
				$.post("BCAddCheck", {"name":name}, function(e){
					
					if(e == 0){
							bcAddForm.submit();
							alert("대분류 추가 성공!");
					}
					
					else
						alert("중복된 이름 존재");
					
				});
				
			}	
		});
		
		$("#BCaddCancel").on('click', function(){
			
			location.href='http:\/\/localhost\/WiynPrj\/admin\/admin';
			
		});
		
	});
	
	</script>


	<div id="modal4" class="modal">
		<div class="modal-content">
			<h4>소분류 추가</h4>
			<div class="row">
				<form class="col s12" id="smallCategory" action="admin-scadd"
					method="post">
					<div class="row">
						<div class="input-field">
							<select name="bigCategoryId" id="SCaddCheck">
								<option value="" disabled selected>대분류 선택</option>

								<c:forEach var="bc" items="${bcList }">
									<option value="${bc.id }">${bc.name }</option>
								</c:forEach>
							</select>
						</div>

						<div class="input-field col s12">
							<textarea id="SCaddName" class="materialize-textarea" name="name"
							onkeypress="noEnter()"></textarea>
							<label for="SCaddName">추가할 소분류 카테고리명</label>
						</div>

						<div class="modal-footer">

							<button class="btn waves-effect waves-light" id="SCaddCancel" type="button">Cancel</button>

							<button class="btn waves-effect waves-light" type="button"
								id="SCAddBtn">Submit</button>

						</div>

					</div>
					
					
				</form>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		$("#SCAddBtn").on('click', function(){
			
			var scaddname = decodeURIComponent($("#SCaddName").val());
			var scAddCheck = $("#SCaddCheck").val();
			var scAddForm = $("#smallCategory");
			
			var data = scAddForm.serialize();
			
			scaddname = scaddname.trim();
			
			if(scaddname == "")
				alert("카테고리명을 정확히 입력하세요!");
			
			else{
				
				$.post("SCAddCheck", {"data":data}, function(t){
					
					if(t == 0){
						scAddForm.submit();
						alert("소분류 추가 성공!");
					}
					
					else
						alert("중복된 이름 존재");
					
				});
				
			}	
		});
		
		$("#SCaddCancel").on('click', function(){
			
			location.href='http:\/\/localhost\/WiynPrj\/admin\/admin';
			
		});
		
	});
	</script>


	<!--  Scripts-->

	<script type='text/javaScript'>
		// textarea 줄바꿈 제한
		function noEnter() {
			if (event.keyCode == 13)
				event.returnValue = false;
		}
	</script>

	<script type="text/javascript">
	
		$(document).ready(function() {
	    	$('select').material_select();
	  	});
	
	
		$(document).ready(function() {
			// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
			$('.modal').modal();
		});

	</script>
</div>
</div>
</div>
</main>
</html>