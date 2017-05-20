<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>         
                  
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
				
				<a href="../requestboard/request-reg">(기윤)요청 글쓰기로 가는 것</a>
	
</main>