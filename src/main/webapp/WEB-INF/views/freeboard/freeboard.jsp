<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%
	
%>
<jsp:useBean id="now" class="java.util.Date" />

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

@import
	url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

* {
	margin: 0;
	padding: 0;
}
/*------------------------- 메인 테이블 부분 ----------------------------------*/
#main .table {
	border-radius: 2px;
	width: 100%;
	background: none;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0
		rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.table *{
	text-align: center;
}

.table .table-title{
	text-align: left;
}

.table .table-title a{
	color:#505050;
}


.table-head {
	font-family: 'Jeju Gothic', serif;
	font: menu;
	border-bottom:1px solid #e9e9e9;
}

.table-body {
	text-align: center;
	font:14px;
}

.table-body {
	font-family: 'Nanum Gothic Coding', serif;
}



.sitego{
	background:rgba(27, 80, 162, 0.69);
}

.sitego:hover{
	background:rgba(23, 56, 125, 0.79);
}

.write{
	display: flex;
}

.site-button{
	display: flex;
	justify-content:flex-end;
	font-family: 'Nanum Gothic Coding', serif;
}

.free-title {
    color: #3c5a5a;
    position: absolute;
    top: 52%;
    -webkit-transition: color 1s;  
    transition: color 1s;
    text-align:center;
    left:37%;
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
/* -------------------------상단목록이동----------------------------- */

#breadcrumb {
  list-style: none;
  display: flex;
}
#breadcrumb .icon {
  font-size: 14px;
}
#breadcrumb li {
}
#breadcrumb li a {
  color: #FFF;
  display: block;
  background: #3498db;
  text-decoration: none;
  position: relative;
  height: 40px;
  line-height: 40px;
  padding: 0 10px 0 5px;
  text-align: center;
  margin-right: 23px;
}
#breadcrumb li:nth-child(even) a {
  background-color: #2980b9;
}
#breadcrumb li:nth-child(even) a:before {
  border-color: #2980b9;
  border-left-color: transparent;
}
#breadcrumb li:nth-child(even) a:after {
  border-left-color: #2980b9;
  }
#breadcrumb li:first-child a {
  padding-left: 15px;
  -moz-border-radius: 4px 0 0 4px;
  -webkit-border-radius: 4px;
  border-radius: 4px 0 0 4px;
}
#breadcrumb li:first-child a:before {
  border: none;
}
#breadcrumb li:last-child a {
  padding-right: 15px;
  -moz-border-radius: 0 4px 4px 0;
  -webkit-border-radius: 0;
  border-radius: 0 4px 4px 0;
}
#breadcrumb li:last-child a:after {
  border: none;
}
#breadcrumb li a:before, #breadcrumb li a:after {
  content: "";
  position: absolute;
  top: 0;
  border: 0 solid #3498db;
  border-width: 20px 10px;
  width: 0;
  height: 0;
}
#breadcrumb li a:before {
  left: -20px;
  border-left-color: transparent;
}
#breadcrumb li a:after {
  left: 100%;
  border-color: transparent;
  border-left-color: #3498db;
}
#breadcrumb li a:hover {
  background-color: #1abc9c;
}
#breadcrumb li a:hover:before {
  border-color: #1abc9c;
  border-left-color: transparent;
}
#breadcrumb li a:hover:after {
  border-left-color: #1abc9c;
}
#breadcrumb li a:active {
  background-color: #16a085;
}
#breadcrumb li a:active:before {
  border-color: #16a085;
  border-left-color: transparent;
}
#breadcrumb li a:active:after {
  border-left-color: #16a085;
}
/* --------------------------------------------------------- */

</style>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">

<main id="main">
<div class="banner">

	<img src="${root}/resource/images/typewriter-801921_1920.jpg" style="width: 100%;height:800px;opacity:0.774" /> 
	<div class="free-title">
		<h1>당신의 생각을<br>자유롭게 표현하세요</h1>
	</div>
</div>
<div class="container">

<ul id="breadcrumb">
  <li><a href="../main/index"><span class="icon icon-home"> </span></a></li>
  <li><a href="?p=1"><span class="icon icon-double-angle-right"> </span>자유게시판</a></li>  
</ul>
<table border="1" class="highlight table">
	<thead class="table-head">
		<tr class="head-tr">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회 수</td>
			<td>작성 날짜</td>
		</tr>
	</thead>
	
	<tbody class="table-body">
		<c:forEach var="v"   items="${pageList}">
			<tr>
			<div style="display: none"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> </div>
			<div style="display: none;"><fmt:formatDate value="${v.regDate}"
								pattern="yyyy-MM-dd HH:mm:ss" var="writedate" /></div>	

				<td>${v.id}</td>
				<td class="orange-text text-accent-3 table-title">
					<a href="free-detail?c=${v.id}">${v.title} 
						</a>
						<c:if test="${writedate>=today }"><img src="/WiynPrj/resource/images/new.jpg"/></c:if>
						</td>
				<td>${v.memberId}</td>
				<td>${v.hit}</td>
				<td><fmt:formatDate value="${v.regDate}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>

			</tr>
		</c:forEach>
	</tbody>
</table>

 <div class="site-button">
	<a class="waves-effect waves-light btn sitego" href="free-reg">
	<div class="write">Write<i class="tiny material-icons">mode-edit</i>
	</div>
	</a>
</div>

<fmt:parseNumber var="pageInt" integerOnly="true" value="${paging/10 }" />
<c:set var="last" value="${(paging%10)>0 ? pageInt+1 : pageInt }" /> 
<c:if test="${empty param.p }">
	<c:set var="param.p" value="1" />
</c:if>

<ul style="text-align: center" class="pagination">

	<c:forEach var="i" begin="1" end="${last }">



		<c:choose>
			<c:when test="${i eq param.p or empty param.p and i eq '1'}">
				<li class="waves-effect  active"><a href="?p=${i}">${i}</a></li>
			</c:when>

			<c:otherwise>
				<li class="waves-effect "><a href="?p=${i}">${i}</a></li>
			</c:otherwise>

		</c:choose>

	</c:forEach>

	<%-- <li class="disabled"><a href="freeboard?p=${page }"><i class="material-icons">chevron_left</i></a></li>
						<li class="active"><a href="freeboard?p=${page}">1</a></li>
						<li class="waves-effect"><a href="#!">2</a></li>
						<li class="waves-effect"><a href="#!">3</a></li>
						<li class="waves-effect"><a href="#!">4</a></li>
						<li class="waves-effect"><a href="#!">5</a></li>
					<li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li> --%>

</ul>

<security:authorize access="isAnonymous()">
	<p>글쓰기는 로그인한 유저만 가능합니다 로그인해주세요</p>
</security:authorize> <security:authorize access="isAuthenticated()">
	<!-- <button style="float: right;" class="waves-effect waves-light btn"
		onclick="location.href ='free-reg'">글쓰기</button> -->
</security:authorize> <
	</div>

<form class="searchbar1" action="http://localhost/WiynPrj/siteboard/siteboard" method="GET">
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