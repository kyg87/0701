<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.google.gson.*"%>
<%@page import="com.wiyn.web.entity.SmallCategory"%>
<style>
aside{
	background : rgba(250,250,250,0.95);
}
#nav-mobile{
background : rgb(250,250,250);
}
.input-field{
display: block;
}

.material-icons{
	height: 100%;
}

</style>



<aside id="left-sidebar-nav">
	<ul id="nav-mobile" class="side-nav fixed"
		style="overflow: auto; transform: translateX(0%);">
		<label>Search</label>
		<form action="http://localhost/WiynPrj/main/index" method="GET">
			<nav>
				<div class="nav-wrapper">
					<div class="input-field">
						<input type="hidden" name="p" value="1" /> <input name="q"
							id="search" type="search" value="${param.q}" required> <label
							class="label-icon" for="search"><i class="material-icons">search</i></label>
						<i class="material-icons">close</i>
						
					</div>

				</div>
			</nav>
			<button class="btn waves-effect waves-light right" type="search">
				<i class="material-icons">search</i>
			</button>
		</form>
		<label>Speed Search</label>
		
		<form action="http://localhost/WiynPrj/main/index" method="GET">
			<div class="input-field">
				<select name="bigCa" id="bigCategoryIdaside" required>
					<option id="default" value="" disabled selected>대분류를 선택하세요</option>
					<c:forEach var="bcb" items="${bcbList }">
						<option value="${bcb.id }">${bcb.name }</option>
					</c:forEach>
				</select>
			</div>
			
				<script>
					
						$(function() {
				               $("#bigCategoryIdaside").on('change', function() {

				                        var data = $("#bigCategoryIdaside");
				                        var smallCategory = $("#smallCategoryIdaside");
				                        var smli = $("#scaList>div>select");
				      
				                        smli.empty();
				                        
				                        $.post("getListBC", data, function(d) {

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
				                        
				                        var bcDelpost = $("#bctdel");
				                        var bcModpost = $("#bctmod");
				                        var scCheckpost = $("#scaAddCheck");
				                        
				                        bcDelpost.val($(this).val());
				                        bcModpost.val($(this).val());
				                        scCheckpost.val($(this).val());
				                        
				                     });
				            });
						</script>
			<br/>
				<div class="input-field" id="scaList">
					<select name="smallCa" id="smallCategoryIdaside" required>
						<option id="default" value="" disabled selected>소분류를 선택하세요</option>
					</select>
				</div>
					<script>
						$(function() {
							$("#smallCategoryIdaside").on('change', function() {

								var smList = $("#smallCategoryIdaside");

								var scDelpost = $("#scadel");
								var scModpost = $("#scamod");

								scDelpost.val($(this).val());
								scModpost.val($(this).val());

							});
						});
										
</script>
				
				<button class="btn waves-effect waves-light right" type="search">
					<i class="material-icons">search</i>
				</button>	
		</form>
	</ul>

<script type="text/javascript">
	
		$(document).ready(function() {
	    	$('select').material_select();
	  	});
	

	</script>

<script>


</script>
</aside>



