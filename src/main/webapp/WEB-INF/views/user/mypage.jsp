<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<link href="/WiynPrj/resource/css/main.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<link href="/WiynPrj/resource/css/mypage.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//전체선택 체크박스 클릭
		$("#ListCheck").click(function() {
			//만약 전체 선택 체크박스가 체크된상태일경우

			if ($("#ListCheck").prop("checked")) {
				//해당화면에 전체 checkbox들을 체크해준다
				alert("전체선택");
				$("input[type=checkbox]").prop("checked", true);
				// 전체선택 체크박스가 해제된 경우
			} else {
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})

	/*  $(function(){
		$(".aa").click(function(){
	  		$('input:checkbox[name="check_del"]').each(function() {

	      		this.checked = true; //checked 처리

	      		

	 })
	})
	})  */

	/* $("#tes[]").on("click", function() {
	var chk = $("checkbox[name='check']:checked").map(function() {
		return $(this).val();
	}).get().join(" | ");
	$("#result").text(chk);
	});  */
	/*
		for(i=0;i<chkbox.length;i++) {
		    if (chkbox[i].checked == true){
		        send_array[send_cnt] = chkbox[i].value;
		        send_cnt++;
		    }
		}
	 */
	var send_array = [];
	var boardname = [];
	function go_delete() {

		var send_cnt = 0;
		var board_cnt = 0;

		var testform = $("#testform");
		
		
		if ($(":checkbox[name='check_del']:checked").length == 0) {
			alert("삭제할 항목을 하나이상 체크해주세요.");
			return;
		}

		$("#array").val(send_array);
		
		console.log($("#boardName"));
		$('input:checkbox[name="check_del"]').each(function() {
			
			//console.log(this.checked);
			if (this.checked) {//checked 처리된 항목의 값
				var items = document.querySelectorAll('[data-type="text"]');
			    console.log(items); 
				//console.log(testform.serialize());
				send_array[send_cnt] = this.value;
				boardname[board_cnt] = this.value;
				//alert(send_array[send_cnt]); 
				send_cnt++;
				board_cnt++;
			}

		});
		//console.log(boardname);
		
		document.del.array.value = send_array;
		document.del.boardName.value = boardname;
		
		console.log($("input[name=array]"));
		alert("인풋>" + $("input[name=array]").val());

	}
	

	
	/* function goSelect(frm) {
		$.ajax({
			url : '<c:url value="mypage" />',
			data : 'select=' + $(this).val(),
			dataType : 'text',
			success : function(data) {
				if (!data.data || data.data == '' || data.data.length < 1)
					return false;
				$('#test1').html(data);
			},
		}); // $.ajax 

	} */
</script>
<style>
#border{
	border:1px solid white;
}
#border td, th{
	text-align: center;
}
.info_top1{
	height: 400px;
	box-shadow:0px 0px 10px 5px #f7f95a;
    display: flex;
    flex-direction: column;
    background: url("http://demo.geekslabs.com/materialize-v1.0/images/user-profile-bg.jpg") no-repeat left center; 

}
.info_top1>img{
	cursor: pointer;
}
.info_profile{

	display: inherit;
	flex-direction: column;
	align-items: center;

}
.btn_area {
    display: flex;
    justify-content: flex-end;
}
.tabs li a{
	padding: 0px !important;
}

</style>
<main id="main">
<div class="container">
	<div class="section">
		<div class="row">
			<h2>My Page</h2>
			
				  <!-- 개인프로필 Modal Structure -->
		
		<div class="info_top1">
		<div class ="info_profile">
			<input id="profileImgbtn" type="file" style="display: none">
			 <!-- <img id="profileImg" alt="" src="http://d1hk7gw6lgygff.cloudfront.net/assets/_img/mypage/img_edit_profile-3c5f60b7a1ddf555f665e50d2987f7a3.png"> -->
			 <img id="profileImg" alt="" src="${root}/resource/images/large.jpg">
		<p><security:authentication property="name" /></p>
		</div>
		<table style="border:2px solid white;width: 80%;margin: auto;text-align: center;">
		
			<tr id="border">
				<th>내가 쓴 글</th>
				<th>내가 쓴 댓글 </th>
				<th>좋아요 글</th>
			</tr>
			<tr id="border">
				<th>${list}</th>
				<th>${sum}</th>
				<th>${like }</th>
				
		</table>
		<div class="btn_area">
				<button type="submit" class="btn waves-effect waves-light">수정</button>
				
		</div>
 
    <security:authentication property="name" var="loginID"/>
	</div>
	
	
			
				<div class="row" style="margin-top: 50px;">
					<form id="testform" action="del" name="del" method="post">
						<div>

							<ul class="tabs">
								<!-- <li class="tab col s3"><a href="#test1"> 등록한 글 </a></li> -->
								<li class="tab col s2"><a href="#sub-test1">자유게시판</a></li> 
								<li class="tab col s2"><a href="#sub-test2">요청게시판</a></li>
								<li class="tab col s2"><a href="#sub-test3">사이트 게시판</a></li> 
								<li class="tab col s2"><a href="#test3">좋아요한 게시물</a></li>
								<li class="tab col s2"><a href="#test2">등록한 댓글</a></li>

							</ul>
						</div>

						<!-- <select class="tab col s3" id="select" name="select" onChange="goSelect(this.form)" style="display: block;" >
				<option value="0" selected>게시글종류</option>
			 	<option value="1" >Free</option>
	    		<option value="2" >Site</option>
	    		<option value="3">Request</option>	
	    		
	  </select>
	   -->
						<!-- 	<script>
	  
	  	$(function(){
	  		$("#select").on('change', function(){
	  			
	  			var data = $("#select").val();
	  			var selList = $("#select"); 
	  			
	  			$.post("mypage", {"selData":data}, function(d) {
	  				
	  				
	  				
	  			});
	  			
	  		});
	  	});
	  	
	  </script> -->

						<!--  <input type="text" name="optionValue" value=""/> -->




						<table class="bordered" id="test1">
						<!-- 	<div>
								<ul class="tabs" style="position: relative; width: 85%">
									<li class="tab col s3"><a href="#sub-test1"> 자유게시판 </a></li>
									<li class="tab col s3"><a href="#sub-test2"
										class="inactive"> 요청게시판</a></li>
									<li class="tab col s3"><a href="#sub-test3"
										class="inactive"> 사이트게시판</a></li>

								</ul>
							</div> -->
							<thead>
								<tr>

									<th style="text-align:center"></th>
									<th style="text-align: center">게시글</th>
									<th style="text-align: center">작성시간</th>
									<th style="text-align: center">게시판종류</th>
								</tr>
							</thead>


							<tbody id="sub-test1">
							
								<c:forEach var="v" items="${free}">

									<tr>
										<td><input data-item="${v.boardName }" data-type="text" type="checkbox" id="${v.id}" name="check_del"
											value="${v.id }" /><label for="${v.id}"></label></td>
										<td style="text-align: center"><a
											href="../${v.boardName}board/${v.boardName}-detail?c=${v.id}">${v.title}</a></td>
										<td style="text-align: center"><fmt:formatDate
												value="${v.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

										<td style="text-align: center"><input type="hidden" id="boardName"
											name="boardName" value="${v.boardName}" />${v.boardName}</td>
									</tr>
								</c:forEach>

							</tbody>
							<tbody id="sub-test2">
								<c:forEach var="v" items="${request}">

									<tr>
										<td><input type="checkbox" id="${v.id}" name="check_del"
											value="${v.id }" /><label for="${v.id}"></label></td>
										<td style="text-align: center"><a
											href="../${v.boardName}board/${v.boardName}-detail?c=${v.id}">${v.title}</a></td>
										<td style="text-align: center"><fmt:formatDate
												value="${v.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

										<td style="text-align: center"><input type="hidden"
											name="boardName" value="${v.boardName}" />${v.boardName}</td>
									</tr>
								</c:forEach>
							</tbody>

							<tbody id="sub-test3">
								<c:forEach var="v" items="${site}">

									<tr>
										<td><input  type="checkbox" id="${v.id}" name="check_del"
											value="${v.id }" /><label for="${v.id}"></label></td>
										<td style="text-align: center"><a
											href="../${v.boardName}board/${v.boardName}-detail?c=${v.id}">${v.title}</a></td>
										<td style="text-align: center"><fmt:formatDate
												value="${v.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

										<td style="text-align: center"><input type="hidden"
											name="boardName" value="${v.boardName}" />${v.boardName}</td>
									</tr>
								</c:forEach>

							</tbody>

							<%-- 	<c:forEach var="list" items="${list}">
					<tr>
						<td><input type="checkbox" id="${list.id}" name="check_del"
							value="${list.id }" /><label for="${list.id}"></label></td>
						<td style="text-align: center"><a
							href="../${list.boardName}board/${list.boardName}-detail?c=${list.id}">${list.title}</a></td>
						<td style="text-align: center"><fmt:formatDate
								value="${list.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

						<td style="text-align: center"><input type="hidden"
							name="boardName" value="${list.boardName}" />${list.boardName}</td>
					</tr>
				</c:forEach>
				--%>
						</table>


						<table class="bordered" id="test2">
						
							<tbody>
								<c:forEach var="v" items="${list2}">
									<tr>
										<td><input type="checkbox" id="test${v}" /><label
											for="test${v}"></label></td>
										<td style="text-align: center"><a
											href="../${v.boardName}board/${v.boardName}-detail?c=${v.id}">${v.content }</a></td>
										<td style="text-align: center"><fmt:formatDate
												value="${v.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

									</tr>
								</c:forEach>

							</tbody>
						</table>

						<table class="bordered" id="test3">
						

							<tbody>
								<c:forEach var="v" items="${list3}">
									<tr>
										
										<td><input type="checkbox" id="test${v}" /><label
											for="test${v}"></label></td>
										<td style="text-align: center"><a
											href="../siteboard/site-detail?c=${v.siteBoardId}">${v.title }</a></td>
										<td style="text-align: center"><fmt:formatDate
												value="${v.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

									</tr>
								</c:forEach>

							</tbody>
						</table>


						<div id="btn1" style="float: right; margin-top: 10px;">



							<input type="hidden" name="id" value="${n.id }"> 
							<input type="hidden" name="array" value="" />




							<button class="btn waves-effect waves-light" type="button"
								name="action" onclick="go_delete();">삭제</button>
							<!-- 	<a class="waves-effect waves-light btn " href="#modal2">삭제</a> -->
					</form>
					<div id="modal2" class="modal">
						<div class="modal-content">

							<h4>정말 삭제하시겠습니까?</h4>
						</div>
						<div class="modal-footer">

							<a href="#!"
								class="modal-action modal-close waves-effect waves-green btn-flat blue-text text-darken-2">취소</a>

							<a href=""
								class="modal-action modal-close waves-effect waves-green btn-flat blue-text text-darken-2">삭제</a>


						</div>
					</div>


				</div>
				<br>

				<fmt:parseNumber var="sizeInt" integerOnly="true"
					value="${size/10 }" />
				<c:set var="last" value="${(size%10)>0 ? sizeInt+1 : sizeInt }" />
				<div align="center">

					<ul class="pagination">
						<c:if test="${((listPerFive-1)*5 + 5) > 1 }">
							<li class="waves-effect"><a
								href="mypage?p=${(listPerFive-1)*5 + 5 }"><i
									class="material-icons">chevron_left</i></a></li>
						</c:if>

						<c:forEach var="p_cnt" begin="${(listPerFive*5) + 1 }"
							end="${checkLast }">
							<c:choose>
								<c:when
									test="${page eq p_cnt  or empty param.p and p_cnt eq '1'}">
									<li class="waves-effect active" id="${p_cnt }"><a
										href="mypage?p=${p_cnt }">${p_cnt }</a></li>
								</c:when>

								<c:otherwise>
									<li class="waves-effect" id="${p_cnt }"><a
										href="mypage?p=${p_cnt }">${p_cnt }</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>


						<li class="waves-effect"><c:if
								test="${cnt >= ((listPerFive+1)*5 + 1) }">
								<a href="mypage?p=${(listPerFive+1)*5 + 1 }"><i
									class="material-icons">chevron_right</i></a>
							</c:if></li>

					</ul>
				</div>

				<script>
			$(".pagination").on('click','li',function(){
    // remove classname 'active' from all li who already has classname 'active'
    $(".pagination li.active").removeClass("active"); 
    // adding classname 'active' to current click li 
    $(this).addClass("active"); 
});
			</script>
			
		</div>
	</div>
</div>
</div>
</main>





</main>





