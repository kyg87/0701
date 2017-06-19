<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<style>
/* 
#main {
	margin: 10px;
} */

#category {
	margin: 10px;
	min-height: 660px;
	width: 150px;
	box-shadow: 1px 1px 5px #383838;
}

#context {
	min-height: 200px;
	/* width: 400px; */
	box-shadow: 1px 1px 5px #383838;
}

#minibox {
	min-height: 100px;
	width: 400px;
	box-shadow: 1px 1px 5px #383838;
	margin-top: 10px;
}

#re {
	float: right;
}

#reg {
	float: right;
}

#mini{
	float: right;
}

#btn{
	float:right;
}

.udButtons a{
	margin-left: 5px;
}

</style>

 <main id="main">
	<div id="yy">
		<div id="main">
			<div id="context">
				<nav>
					제목 : ${list.title }
				</nav>
				<table>
			        <thead>
			          <%-- <tr>
			              <th id="title"> 제목 : ${list.title } <i id="re" class="small material-icons">launch</i></th>			             
			          </tr> --%>
			          <tr>
			          	 <th id="writedate"><i class="tiny material-icons">schedule</i>
							<fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd HH:mm:ss" />
						 </th>
			          </tr>
			          <tr>
			          	<th id="writer"><i class="tiny material-icons">perm_identity</i> ${list.memberId } </th>
			          </tr>
			        </thead>
			        <tbody>
			          <tr>
			            <c:if test="${file.src != null }">
			            	<td id="thum"><img src=${file.src }${file.name } /></td>
			            </c:if>
			          </tr>
			          <tr>
			            <td id="url"> 주소 :  ${list.contentSrc }</td>
			          </tr>
			          <tr>
			            <td id="content"> 내용 : ${list.content }</td>
			          </tr>
			         
			          <tr>
			            <td class="udButtons">			            	
							<a id="btn" class="waves-effect waves-light btn"
							href="#modal2" id="noticeArticleDel">삭제</a>							
							<a id="btn" class="waves-effect waves-light btn"
							href="notice-modify-load?id=${list.id}&p=${page}">수정</a>
							<a class="waves-effect waves-light btn"
							href="noticeboard?p=${page }">목록으로</a>
			            </td>
			          </tr>
			        </tbody>
		      	</table>
			</div>
		</div>
	</div>
	
	<div id="modal2" class="modal">
		<form id="Category-Delete" action="admin-category-del" method="post">
			<div class="modal-content">
				<h4>게시물 삭제</h4>
				<p>정말 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button class="btn waves-effect waves-light" type="button" id="ArticleDelCancel">Cancel</button>

				<button class="btn waves-effect waves-light" type="button" id="ArticleDelBtn">Submit</button>

			</div>
		</form>
	</div>
	
	<script>
	$(function(){
			
		$("#ArticleDelBtn").on('click', function(){
			
			var id = ${list.id};
			
			$.post("notice-delete", {"id":id});
			location.href='noticeboard';
			
		});

		$("#ArticleDelCancel").on('click', function(){
			
			location.href='http:\/\/localhost\/WiynPrj\/noticeboard\/notice-detail?c='+${list.id}+'&p='+${page};
			
		});
			
	});
	</script>
	
</main>

<script type="text/javascript">

	$(document).ready(function() {
		// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
		$('.modal').modal();
	});
	
</script>






