<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


 <main id="main">
<div>자유디테일</div>
	<div id="yy">

		<div id="main">
			<div id="context">
				<nav>
				
				</nav>
				<table>
			        <thead>
			        
			          <tr>
			              <th>${n.title}<i id="re" class="small material-icons">launch</i></th>			             
			          </tr>
			          <tr>
			          	 <th>${n.regDate}<i class="small material-icons">star</i> 23</th>
			          </tr>
			          <tr>
			          	<th>${n.memberId}</th>
			          </tr>
			         
			         			        </thead>
			        <tbody>
			          <tr>
			            <td id="thum">${n.contentSrc}</td>
			          </tr>	     
			          <tr>
			            <td id="content">${n.content }</td>
			          </tr>
			          
			          <tr>
			            <td>
			            	<div class="chip">
								Tag
							</div>
							<div class="chip">
								Tag
							</div>
							<div class="chip">
								Tag
							</div>
			            </td>
			          </tr>
			           
			          <tr>
			          
			            <td>
			           
			            	<input type="hidden" name="id" value =${n.id }>
			            	<form action="free-edit?c=${n.id}" method="post"> 
								
								<button class="btn waves-effect waves-light" type="submit" name="action">수정하기</button>
							</form> 
			            </td>
			            
			            <td>
			            <form action="free-del" method="post">
							<input type="hidden" name="id" value =${n.id }>
							 <button class="btn waves-effect waves-light" type="submit" name="action">삭제</button>
				
  						
  						</form>
  							
			            </td>
			            <td>
			              <form action="freeboard" method="post">
							 <button class="btn waves-effect waves-light" type="submit" name="action">목록</button>
						</form>
			            </td>
			            
			          </tr>
			          
			        </tbody>
		      	</table>

			</div>
			<form action="freeBoard-comment-add" method="post">
			<div id="minibox">			
				<table>
			        <thead>
			          <tr>
			           	  <td>
							<security:authorize access="isAnonymous()">
								<p>글쓰기는 로그인한 유저만 가능합니다 로그인해주세요</p>
							</security:authorize>
							<security:authorize access="isAuthenticated()">
				              	<input name="content" type="text" value="댓글을입력하세요." />	
				              	<input name="action" type="submit" value="등록" />
			              	</security:authorize>		
			              </td>
			                      
			          </tr>
			        </thead>
			        <tbody>
			        <c:forEach var="v" items="${n.freeComment}">
			          <tr>
			            <td>
			          		댓글번호 :  ${v.id }
			          	</td>
			          	<td>
			          		등록날짜 : ${v.regDate }
			          	</td>
			          	<td>
			          		내용 : ${v.content }
			          	</td>
			          	<td>
			          		해당 글번호 : ${v.freeBoardId }
			          	</td>
			          	<td>
			          		<i id="mini" class="small material-icons">star</i>
			          	</td>
			          
			          </tr>
			        </c:forEach>
			        </tbody>
		      	</table>
			</div>
		
				<input type="hidden" name="freeBoardId" value=${n.id }>
				
				<input type="hidden" name="memberId" value=<security:authentication property="name"/>>
			</form>
		</div>
	</div>

</main>