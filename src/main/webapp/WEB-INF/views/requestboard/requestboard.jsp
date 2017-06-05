<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main id="main">
<table border="1">
	<thead>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성시간</td>
			<td>멤버아이디</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="v" items="${list}">
			<tr>

				<td>${v.id}</td>
				<td><a href="request-detail?c=${v.id}">${v.title}</a></td>
				<td>${v.content}</td>
				<td>${v.regDate}</td>
				<td>22323@bb.v</td>

			</tr>
		</c:forEach>
	</tbody>
</table>

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

<button>
	<a href="../requestboard/request-reg">(기윤)요청 글쓰기로 가는 것</a>
</button>

</main>