<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>    
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>     
             
	         <main id="main">
	         	<h4>< 사이트게시판 ></h4>
				<table border="1">
					<thead>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성시간</td>
							<td>작성자</td>
							<td>조회수</td>
						</tr>
					</thead>
					<tbody>
						<%-- <c:forEach var="v" items="${list}">
							<tr>
				
								<td>${v.id}</td>
								<td><a href="free-detail?c=${v.id}">${v.title}</a></td>
								<td>${v.regDate}</td>
								<td>${v.memberId}</td>
								<td>${v.hit}</td>
				
							</tr>
						</c:forEach> --%>
					</tbody>
				</table>


				<security:authorize access="isAnonymous()">
					<p>글쓰기는 로그인한 유저만 가능합니다 로그인해주세요</p>
				</security:authorize> 
				<security:authorize access="isAuthenticated()">
					<button class="waves-effect waves-light btn"
						onclick="location.href ='free-reg'">글쓰기</button>
				</security:authorize>
				
	
</main>