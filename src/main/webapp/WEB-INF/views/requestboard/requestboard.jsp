<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		
	margin-top: 50px;
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
	background: #26a69a;
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
<div class="container">
<ul id="breadcrumb">
  <li><a href="../main/index"><span class="icon icon-home"> </span></a></li>
  <li><a href="?p=1"><span class="icon icon-double-angle-right"> </span>요청게시판</a></li>  
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
		
		<c:forEach var="v"  begin="${(page*10)-10 }" end="${page*10-1 }" items="${list}">
			<div style="display: none"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> </div>
			<div style="display: none;"><fmt:formatDate value="${v.regDate}"
								pattern="yyyy-MM-dd HH:mm:ss" var="writedate" /></div>	
			<tr>
				<td>${v.id}</td>
				<td class="orange-text text-accent-3 table-title">
					<a href="request-detail?c=${v.id}">${v.title}</a>
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
	<a class="waves-effect waves-light btn sitego" href="../requestboard/request-reg">
	<div class="write">Write<i class="tiny material-icons">mode-edit</i>
	</div>
	</a>
</div>

<div align="center">
	<ul class="pagination">
		
		<c:if test="${((listPerFive-1)*5 + 5) > 1 }">
			<li class="waves-effect"><a href="requestboard?p=${(listPerFive-1)*5 + 5 }"><i class="material-icons">chevron_left</i></a></li>
		</c:if>
		
		<c:forEach var="p_cnt" begin="${(listPerFive*5) + 1 }" end="${checkLast }" >
			<c:choose>
				<c:when test="${page eq p_cnt }">
					<li class="waves-effect active" id="${p_cnt }"><a href="requestboard?p=${p_cnt }">${p_cnt }</a></li>
				</c:when>
				
				<c:otherwise>
					<li class="waves-effect" id="${p_cnt }"><a href="requestboard?p=${p_cnt }">${p_cnt }</a></li>
				</c:otherwise>
			</c:choose>
			
		</c:forEach>
		
		<c:if test="${cnt >= ((listPerFive+1)*5 + 1) }">
			<li class="waves-effect"><a href="requestboard?p=${(listPerFive+1)*5 + 1 }"><i class="material-icons">chevron_right</i></a></li>
		</c:if>
		
	</ul>
	
</div>


<%-- <fmt:parseNumber var="sizeInt" integerOnly="true" value="${size/10 }" />
<c:set var="last" value="${(size%10)>0 ? sizeInt+1 : sizeInt }" />

<c:if test="${empty param.p }">
<c:set var="param.p" value="1"  />
</c:if>



<!-- <ul style="text-align: center" class="pagination"> -->
<ul class="pagination center">
 <li class="disabled">
<!-- <li class="disabled"> -->

<a href="#!"><i class="material-icons">chevron_left</i></a></li>

<c:forEach var="i" begin="1" end="${last}">

		<c:choose>
			<c:when test="${i eq param.p or empty param.p and i eq '1'}">
				<li class="waves-effect  active"><a href="?p=${i}">${i}</a></li>
			</c:when>
			<c:otherwise>
				<li class="waves-effect "><a href="?p=${i}">${i}</a></li>
			</c:otherwise>
		</c:choose>
		
	</c:forEach>
	<li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
</ul>
	    
					    <li class="disabled"><a href="freeboard?p=${page }"><i class="material-icons">chevron_left</i></a></li>
						<li class="active"><a href="freeboard?p=${page}">1</a></li>
						<li class="waves-effect"><a href="">2</a></li>
						<li class="waves-effect"><a href="#!">3</a></li>
						<li class="waves-effect"><a href="#!">4</a></li>
						<li class="waves-effect"><a href="#!">5</a></li>
						<li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
						



 --%>
 
</div>


</main>