<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

#main {
	margin: 10px;
	float: left
}

#category {
	margin: 10px;
	min-height: 660px;
	width: 150px;
	box-shadow: 1px 1px 5px #383838;
	float: left
}

#context {
	min-height: 200px;
	width: 400px;
	box-shadow: 1px 1px 5px #383838;
}

#minibox {
	min-height: 100px;
	width: 400px;
	box-shadow: 1px 1px 5px #383838;
	margin-top: 10px;
}

#re {
	float: right;
}

#reg {
	float: right;
}

#mini{
	float: right;
}

#btn{
	float:right;
}
</style>

 <main id="main">
<div>자유디테일</div>
	<div id="yy">

		<div id="main">
			<div id="context">
				<nav>
					<div class="nav-wrapper">
						<div class="col s12">
							<a href="#!" class="breadcrumb">category1</a> <a href="#!"
								class="breadcrumb">category2</a>
						</div>
					</div>
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
			            <td id="thum">${n.content}</td>
			          </tr>
			          <tr>
			            <td id="address">${n.address}</td>
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
			              	<input name="content" type="text" value="댓글을입력하세요." />	<input id="reg"  name="action" type="submit" value="등록" />	
			              </td>	             
			          </tr>
			        </thead>
			        <tbody>
			        <c:forEach var="v" items="${n.freeComment}">
			          <tr>
			          	
			          	<td>
			          	
			          		${v.content }<i id="mini" class="small material-icons">star</i>
			          	</td>
			          
			          </tr>
			          	</c:forEach>
			        </tbody>
		      	</table>
			</div>
						<input type="hidden" name="freeBoardId" value="1">
			<input type="hidden" name="memberId" value="large@a.a">
			</form>
		</div>
	</div>

</main>