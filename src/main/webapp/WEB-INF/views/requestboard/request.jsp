<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>         
                  
         <main id="main">
         					<tbody>
						<c:forEach var="v" items="${list}">
						<tr>
							<td>${v.id}</td>
							<td><a href="request-detail?c=${v.id}">${v.title}</a></td>
							<td>${v.regDate}</td>
							<td>${v.memberId}</td>
						</tr>
						</c:forEach>
					</tbody>
         
         </main>