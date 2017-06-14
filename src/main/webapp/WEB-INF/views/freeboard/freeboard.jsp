<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	
%>

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

</style>


<main id="main">

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

				<td>${v.id}</td>
				<td class="orange-text text-accent-3 table-title">
					<a href="free-detail?c=${v.id}">${v.title} 
						</a></td>
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
</security:authorize> </main>