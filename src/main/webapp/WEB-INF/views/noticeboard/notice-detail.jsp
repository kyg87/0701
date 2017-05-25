<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>

<style>

#main {
	margin: 10px;
	float: left
}

#category {
	margin: 10px;
	min-height: 660px;
	width: 150px;
	box-shadow: 1px 1px 5px #383838;
	float: left
}

#context {
	min-height: 200px;
	width: 400px;
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
<div>공지사항디테일</div>
	<div id="yy">
		<div id="main">
			<div id="context">
				<nav>
					<div class="nav-wrapper">
						<div class="col s12">
							<a href="#!" class="breadcrumb">category1</a> <a href="#!"
								class="breadcrumb">category2</a>
						</div>
					</div>
				</nav>
				<table>
			        <thead>
			          <tr>
			              <th id="title"> 제목 : ${list.title } <i id="re" class="small material-icons">launch</i></th>			             
			          </tr>
			          <tr>
			          	 <th id="writedate"> 작성 날짜 :  ${list.regDate } <i class="small material-icons">star</i> 23</th>
			          </tr>
			          <tr>
			          	<th id="writer"> 작성자 : ${list.memberId } </th>
			          </tr>
			        </thead>
			        <tbody>
			          <tr>
			            <td id="thum"><img src=${file.src }${file.name } /></td>
			          </tr>
			          <tr>
			            <td id="url"> 주소 :  ${list.contentSrc }</td>
			          </tr>
			          <tr>
			            <td id="content"> 내용 : ${list.content }</td>
			          </tr>
			          <tr>
			            <td>
			            	<div class="chip">
								Tag
							</div>
							<div class="chip">
								Tag
							</div>
							<div class="chip">
								Tag
							</div>
			            </td>
			          </tr>
			          <tr>
			            <td class="udButtons">
							<a class="waves-effect waves-light btn" href="#modal2" id="noticeArticleDel">삭제</a>
							<a id="btn" class="waves-effect waves-light btn"
							href="notice-modify-load?id=${list.id}">수정</a>
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
		$("#noticeArticleDel").on('click', function(){
			
			$("#ArticleDelBtn").on('click', function(){
				
				location.href='http:\/\/localhost\/WiynPrj\/noticeboard\/notice-delete?id='+${list.id};
				
			});

			$("#ArticleDelCancel").on('click', function(){
				
				location.href='http:\/\/localhost\/WiynPrj\/noticeboard\/notice-detail?c='+${list.id};
				
			});
			
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






