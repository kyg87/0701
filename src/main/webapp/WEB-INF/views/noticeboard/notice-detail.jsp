<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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

hr {
    border-bottom: 0;
    border-right: 0;
    border-top:1px solid rgba(144, 135, 135, 0.59);
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

.btn:hover {
	/* background: rgb(210, 178, 149); */
	background-color: rgb(195, 143, 95) !important;
}
 /* ----------------------검색창 수정------------ */
 .broker-expanding-search,
.broker-expanding-search *,
.broker-expanding-search *:after,
.broker-expanding-search *:before {
  box-sizing: border-box;
}

.broker-expanding-search {
  display: table;
  table-layout: fixed;
  width: 50px;
  margin: 0;
  border-radius: 40px;
  overflow: hidden;
background: #dd5d58;
/* box-shadow: 0px 0px 0px 2px rgba(255,255,255,0.90); */
  transition: width 0.5s cubic-bezier(0.65, -0.5, 0.4, 1.5);
}

.broker-expanding-search--open {
  width: 250px;
}

.broker-expanding-search__column {
  display: table-cell;
  vertical-align: top;
}

.broker-expanding-search__column--left {
  width: 100%;
  padding-left: 15px;
}

.broker-expanding-search__column--right {
  width: 50px;
}

.broker-expanding-search__input {
  display: block;
  margin: 0;
  padding: 0;
  display: block;
  border: none;
  outline: none;
  color: white;
  border-radius: 0;
  background: none;
  font-size: 16px;
}

.broker-expanding-search__input--text {
  width: 100%;
  height: 50px;
  line-height: 50px;
}

.broker-expanding-search__input--submit {
  font-size: 0;
  width: 50px;
  height: 50px;
  cursor: pointer;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: 50px 50px;
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAABUCAMAAAArteDzAAAB7FBMVEX////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////zN5IfAAAAo3RSTlMAAQIDBAUGBwgJCgsNDg8QERITFhcaGxweICIjJCUoKSorLC0uLzIzNjc4OTo7PD5AREVGSEpLTE5PUFFSU1RVVldYWl1eX2BjZGZoaWtsbW5vcHZ5fH6AgYKDhYqNjo+Vl5ucoaKjpqerrq+wsbW3ubzCw8TGx8jJysvMzc7P0NHT1NXW19na3ODi4+Xm6Onq6+zt7vDx8vP09vf4+fr7/P3+BP089AAAAiVJREFUGBntwflbTFEABuAvyVQixGTLlCVRdg0RDVKWlJAsSQoJKRXRoFJiVMzQYumSvn9U95yZVHP1POd0f/G47wuHw+FwOP5ZsZtKbz14/OTRvSqvG/ZwX/KPM2KoIS8W87bsWpAztedhnrx9jHZ7CeajbJxWXmyAvuv8i/4c6KrglPFBf1vPCKd88ECPlxGdFzYmA3Gr9taNMOzlYuhY0U8pWBKPiLS7DKuCjpuUujyYrsSgMLYZ6tZ+pdCxEjMdNyjUQ90NCu/dmO0chR8ZUJUUoFCAaE0UrkDVDgqtMYi2m4I/BoouUyiGBVcvTUMpUFRP0/c1sFJD08QWKGqlKZAIKycpeKGom6ZXC2BlJ4VCKOqjqQOWtlE4A0WdNPUshJV9FE5AUTNNoeWwcpHCLiiqpWkiC1YaaTLWQ9FpCtWwkDpC02ASFKX9pCmYgmjlFB5CVUwLhVpEcX+kUARlRZSKMYurmcJAMpQlvKUwlo8ZXHcoVUBDPqVflYvwR0YLpeeJ0NHAsPZDcZBWXx1mWAW0pLxjRHd18cHcI+fvf+aUUR+0ZIY4B6MAWrIHOYex/dCS1sY5fDkKLfGVo5ztWdkwJcMHPZ6aT5yuuyQBe4YpGT5oSj3bNEDhW2/dARcm5YQoGQXQtnTr4cJTx3LXxSEsO0TJ8ME+WQFKhhf2SQ9Q8sNG6QEKA7BTRpCmN7DV9iAnlcNemY2vn5bC4XA4HI7/3m/UtMhMrbR7mQAAAABJRU5ErkJggg==);
}
 
 
.searchbar1 input[type=text]{
  font-family: Verdana, Geneva, sans-serif;
  color:white;
  margin: 0 0 0 0;

}
.searchbar1{
	position: fixed;
	bottom: 50px;
	right: 50px;
}
/* ---------------------------------------------- */
</style>

 <main id="main">
	<div class="container">
		<div class="section">
			<div class="row">
				
				<div class="col s12 l6">
					<h2>Notice Board</h2>
					
					<div>
						<c:if test="${file.src != null }">
			            	<img src=${file.src }${file.name } style="width:500px; height:500px; margin-top:42px;" />
			            </c:if>
					</div>
					
				</div>
				
				<div class="col s12 l6">
					
					<div class="card-panel">
						
						<h4>${list.title }</h4>
						<hr /><br />
						
						<%-- <div>
							<span class="detail-title"><i class="tiny material-icons">mode_edit</i>Title</span>
							<span>${list.title }</span>
							<hr /><br />
						</div> --%>
						
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
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<a id="btn" class="waves-effect waves-light btn"
								href="#modal2" id="noticeArticleDel">삭제</a>							
							<a id="btn" class="waves-effect waves-light btn"
								href="notice-modify-load?id=${list.id}&p=${page}">수정</a>
						</security:authorize>
						<a class="waves-effect waves-light btn" id="back"
							href="noticeboard?p=${page }">목록</a>
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
	<form class="searchbar1" action="${root }/siteboard/siteboard" method="GET">
  <div class="broker-expanding-search" data-expanding-search>
    <div class="broker-expanding-search__column broker-expanding-search__column--left">
       <input type="hidden" name="p" value="1" />
       <input name="q" type="text" class="broker-expanding-search__input broker-expanding-search__input--text" value="${param.q}" placeholder="Siteboard Search" data-expanding-search-text>
    </div>
    <div class="broker-expanding-search__column broker-expanding-search__column--right">
      <input type="submit" class="broker-expanding-search__input broker-expanding-search__input--submit" value="Search" data-expanding-search-button>
    </div>
  </div>
</form>
				
	<script>
 $(document).ready(function() {
	 
	  // toggle search bar and disable request if blank...
	  $('[data-expanding-search-button]').on('click', function() {
	    var parent = $(this).closest('[data-expanding-search]');
	    if (parent.find('[data-expanding-search-text]').val() === '${param.q}') {
	      parent.toggleClass('broker-expanding-search--open');
	      return false;
	    }
	  });
	 
	});
</script>
</main>

	
	<script>
	$(function(){
			
		$("#ArticleDelBtn").on('click', function(){
			
			var id = ${list.id};
			
			$.post("notice-delete", {"id":id});
			location.href='noticeboard';
			
		});

		$("#ArticleDelCancel").on('click', function(){
			
			//location.href='http:\/\/localhost\/WiynPrj\/noticeboard\/notice-detail?c='+${list.id}+'&p='+${page};
			location.href='${root}/noticeboard/notice-detail?c='+${list.id}+'&p='+${page};
			
		});
			
	});
	</script>
	

<script type="text/javascript">

	$(document).ready(function() {
		// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
		$('.modal').modal();
	});
	
</script>






