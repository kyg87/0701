<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

		if ($(":checkbox[name='check_del']:checked").length == 0) {
			alert("삭제할 항목을 하나이상 체크해주세요.");
			return;
		}

		$("#array").val(send_array);
		$("#boardName").val(boardname);

		$('input:checkbox[name="check_del"]').each(function() {

			if (this.checked) {//checked 처리된 항목의 값
				send_array[send_cnt] = this.value;
				boardname[board_cnt] = boardname.value;
				//alert(send_array[send_cnt]); 
				send_cnt++;
				board_cnt++;
			}

		});

		document.del.array.value = send_array;
		document.del.boardName.value = boardname;

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
<main> M y P a g e

<div class="row" style="margin-top: 150px;">
	<form action="del" name="del" method="post">
		<div>

			<ul class="tabs">
				<li class="tab col s3"><a href="#test1"> 등록한 글 </a></li>
				<li class="tab col s3"><a href="#test2">등록한 댓글</a></li>
				<li class="tab col s3"><a href="#test3">좋아요한 게시물</a></li>

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
			<div>
				<ul class="tabs" style="width: 70%; position: relative">
					<li class="tab col s3"><a href="#sub-test1"> 자유게시판 </a></li>
					<li class="tab col s3"><a href="#sub-test2" class="inactive">
							요청게시판</a></li>
					<li class="tab col s3"><a href="#sub-test3" class="inactive">
							사이트게시판</a></li>

				</ul>
			</div>
			<thead>
				<tr>

					<th><input type="checkbox" id="ListCheck" /><label
						for="ListCheck"></label></th>
					<th style="text-align: center">게시글</th>
					<th style="text-align: center">작성시간</th>
					<th style="text-align: center">게시판종류</th>
				</tr>
			</thead>


			<tbody id="sub-test1">
				<c:forEach var="v" items="${free}">

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
			<thead>
				<tr>
					<th><input type="checkbox" id="CommentCheck" /><label
						for="CommentCheck"></label></th>
					<th style="text-align: center">댓글</th>
					<th style="text-align: center">작성시간</th>

				</tr>
			</thead>
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
			<thead>
				<tr>
					<th><input type="checkbox" id="LikeCheck" /><label
						for="LikeCheck"></label></th>
					<th style="text-align: center">게시글</th>
					<th style="text-align: center">작성시간</th>

				</tr>
			</thead>

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



			<input type="hidden" name="id" value="${n.id }"> <input
				type="hidden" name="array" value="" />




			<button class="btn waves-effect waves-light" type="submit"
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
</div>

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
				<c:when test="${page eq p_cnt }">
					<li class="waves-effect active" id="${p_cnt }"><a
						href="mypage?p=${p_cnt }">${p_cnt }</a></li>
				</c:when>

				<c:otherwise>
					<li class="waves-effect" id="${p_cnt }"><a
						href="mypage?p=${p_cnt }">${p_cnt }</a></li>
				</c:otherwise>
			</c:choose>

		</c:forEach>

		<c:if test="${cnt >= ((listPerFive+1)*5 + 1) }">
			<li class="waves-effect"><a
				href="mypage?p=${(listPerFive+1)*5 + 1 }"><i
					class="material-icons">chevron_right</i></a></li>
		</c:if>

	</ul>
</div>

</main>





