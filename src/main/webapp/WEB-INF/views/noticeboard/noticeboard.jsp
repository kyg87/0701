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
		<c:forEach var="mem" items="${list}">
			<tr>

				<td>${mem.id}</td>
				<td><a href="notice-detail?c=${mem.id}">${mem.title}</a></td>
				<td>${mem.memberId }</td>
				<td>${mem.hit }</td>
				<td>${mem.regDate}</td>

			</tr>
		</c:forEach>
	</tbody>
</table>

<a class="waves-effect waves-light btn card-panel blue lighten-2" 
	href="/WiynPrj/noticeboard/notice-reg">글쓰기</a>
	
</main>











