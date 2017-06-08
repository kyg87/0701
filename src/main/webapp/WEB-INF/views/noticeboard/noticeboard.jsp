<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<main id="main">
<table border="1">
	<thead>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회 수</td>
			<td>작성 날짜</td>
		</tr>
	</thead>
	<tbody>
		
		<c:forEach var="mem" begin="${(page*10)-10 }" end="${page*10-1 }" items="${list}">
		
			<tr>

				<td>${mem.id}</td>
				<td><a href="notice-detail?c=${mem.id}&p=${page}">${mem.title}</a></td>
				<td>${mem.memberId }</td>
				<td>${mem.hit }</td>
				<td>${mem.regDate}</td>

			</tr>
		</c:forEach>
	</tbody>
</table>

<a class="waves-effect waves-light btn card-panel blue lighten-2 right" 
	href="/WiynPrj/noticeboard/notice-reg?p=${page }">글쓰기</a>

<div align="center">
	<ul class="pagination">
		
		<c:if test="${((listPerFive-1)*5 + 5) > 1 }">
			<li class="waves-effect"><a href="noticeboard?p=${(listPerFive-1)*5 + 5 }"><i class="material-icons">chevron_left</i></a></li>
		</c:if>
		
		<c:forEach var="p_cnt" begin="${(listPerFive*5) + 1 }" end="${checkLast }" >
			<c:choose>
				<c:when test="${page eq p_cnt }">
					<li class="waves-effect active" id="${p_cnt }"><a href="noticeboard?p=${p_cnt }">${p_cnt }</a></li>
				</c:when>
				
				<c:otherwise>
					<li class="waves-effect" id="${p_cnt }"><a href="noticeboard?p=${p_cnt }">${p_cnt }</a></li>
				</c:otherwise>
			</c:choose>
			
		</c:forEach>
		
		<c:if test="${cnt > ((listPerFive+1)*5 ) }">
			<li class="waves-effect"><a href="noticeboard?p=${(listPerFive+1)*5 + 1 }"><i class="material-icons">chevron_right</i></a></li>
		</c:if>
		
	</ul>
	
</div>

</main>











