<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>

<style>
body {
	background-color: rgb(238, 238, 238);
}

body, html {
	font-family: 'Abel', sans-serif;
	color: #846C63;
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

.card-panel {
    transition: box-shadow .25s;
    padding: 20px;
    margin: 0.5rem 0 1rem 0;
    border-radius: 2px;
    background-color: #F0E5D7 !important;
    min-height: 640px;
}

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
	background: rgb(210, 178, 149);
}

#back{
	background: rgb(210, 178, 149);
}

.udButtons a{
	margin-left: 5px;
}

.detail-title {
    font-weight: 700;
    display: block;
    /* text-transform: uppercase; */
}

</style>

 <main id="main">
	<div class="container">
		<div class="section">
			<div class="row">
				
				<div class="col s12 l6">
					<h2>Notice Board</h2>
					
					<div class="content">
						<h5>notice</h5>
					</div>
					
					<div>
						<c:if test="${file.src != null }">
			            	<img src=${file.src }${file.name } style="width:500px; height:500px; " />
			            </c:if>
					</div>
					
				</div>
				
				<div class="col s12 l6">
					
					<div class="card-panel">
						
						<h4>NOTICE DETAIL</h4>
						<hr /><br />
						
						<div>
							<span class="detail-title"><i class="tiny material-icons">mode_edit</i>Title</span>
							<span>${list.title }</span>
							<hr /><br />
						</div>
						
						<div>
							<span class="detail-title"><i class="tiny material-icons">person_pin</i>Writer</span>
							<span> ${list.memberId } </span>
							<hr /><br />
						</div>
						
						<div>
							<span class="detail-title"><i class="tiny material-icons">av_timer</i>Write Time</span>
							<span><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
							<hr /><br />
						</div>
						
						<div>
							<span class="detail-title"><i class="tiny material-icons">language</i> Adress </span> 
							<span> ${list.contentSrc }</span>
							<hr /><br />
						</div>
					
						<div>
							<span class="detail-title"><i class="tiny material-icons">textsms</i> Comment </span>
							<c:set var="newLine" value="\r" />
							<span>${list.content }</span>
							<hr /><br />
						</div>
						
						<div>
						<a id="btn" class="waves-effect waves-light btn"
							href="#modal2" id="noticeArticleDel">삭제</a>							
						<a id="btn" class="waves-effect waves-light btn"
							href="notice-modify-load?id=${list.id}&p=${page}">수정</a>
						<a class="waves-effect waves-light btn" id="back"
							href="noticeboard?p=${page }">목록으로</a>
					</div>
					
					</div>
					
					<div id="modal2" class="modal">
						<div class="modal-content">
							<h4>게시물 삭제</h4>
							<p>정말 삭제하시겠습니까?</p>
						</div>
						<div class="modal-footer">
							<button class="btn waves-effect waves-light" type="button" id="ArticleDelCancel">Cancel</button>

							<button class="btn waves-effect waves-light" type="button" id="ArticleDelBtn">Submit</button>
	
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</main>

	
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
	

<script type="text/javascript">

	$(document).ready(function() {
		// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
		$('.modal').modal();
	});
	
</script>






