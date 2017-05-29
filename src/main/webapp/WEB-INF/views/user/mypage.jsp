<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<link href="/WiynPrj/resource/css/main.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<link href="/WiynPrj/resource/css/mypage.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
	
	$(function() {
		//전체선택 체크박스 클릭
		$("#allCheck").click(function() {
			//만약 전체 선택 체크박스가 체크된상태일경우
			if ($("#allCheck").prop("checked")) {
				//해당화면에 전체 checkbox들을 체크해준다
				$("input[type=checkbox]").prop("checked", true);
				// 전체선택 체크박스가 해제된 경우
			} else {
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})


</script>
<main>
	
		 M y P a g e
	
	<div class="row">
		<div class="col s12">
			<ul class="tabs">
				<li class="tab col s3"><a href="#test1">등록한 게시물</a></li>
				<li class="tab col s3"><a href="#test2">등록한 댓글</a></li>
				<li class="tab col s3"><a href="#test3">좋아요한 게시물</a></li>
				
			</ul>
		</div>
		
		<table class="bordered" id="test1">
        <thead>
          <tr>
				<th><input type="checkbox" id="allCheck"/><label for="allCheck"></label></th>
				<th style="text-align: center">게시글</th>
				<th style="text-align: center">작성시간</th>
				
				<th style="text-align: center">게시판종류</th>
				
		</tr>
        </thead>
     	
        <tbody>
        <c:forEach var="v" items="${list}">
          <tr>
            <td><input type="checkbox" id="test${i}"/><label for="test${i}"></label></td>
            <td style="text-align: center"><a href="../${v.boardName}board/${v.boardName}-detail?c=${v.id}">${v.title}</a></td>
            <td style="text-align: center"><fmt:formatDate value="${v.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
          
            <td style="text-align: center">${v.boardName}</td>
          </tr>
        </c:forEach>
        
         </tbody>      
      </table>   
        
      	<table class="bordered" id="test2">
        <thead>
          <tr>
          		<th><input type="checkbox" id="allCheck"/><label for="allCheck"></label></th>
              <th style="text-align: center">댓글</th>
              <th style="text-align: center">작성시간</th>
             
          </tr>
        </thead>
          

      
          <tbody>
        <c:forEach var="v" items="${list2}">
          <tr>
            <td><input type="checkbox" id="test${i}"/><label for="test${i}"></label></td>
            <td style="text-align: center"><a href="../${v.boardName}board/${v.boardName}-detail?c=${v.id}">${v.content }</a></td>
            <td style="text-align: center"><fmt:formatDate value="${v.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
           
          </tr>
        </c:forEach>
        
         </tbody>      
      </table>
     
       	<table class="bordered" id="test3">
        <thead>
          <tr>
          		<th><input type="checkbox" id="allCheck"/><label for="allCheck"></label></th>
              <th style="text-align: center">게시글</th>
              <th style="text-align: center">작성시간</th>
             
          </tr>
        </thead>
          

      
          <tbody>
        <c:forEach var="v" items="${list3}">
          <tr>
            <td><input type="checkbox" id="test${i}"/><label for="test${i}"></label></td>
            <td style="text-align: center"><a href="../${v.boardName}board/${v.boardName}-detail?c=${v.id}">${v.content }</a></td>
            <td style="text-align: center"><fmt:formatDate value="${v.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
           
          </tr>
        </c:forEach>
        
         </tbody>      
      </table>
        <div id="btn1" style="float: right; margin-top:10px;">
        
      	<a class="waves-effect waves-light btn " href="#modal2">삭제</a>
      	<div id="modal2" class="modal">
							<div class="modal-content">
								
								<h4>정말 삭제하시겠습니까?</h4>
							</div>
							<div class="modal-footer">
								
								<a href="#!"
									class="modal-action modal-close waves-effect waves-green btn-flat blue-text text-darken-2">취소</a>
									
								<a href="#!"
									class="modal-action modal-close waves-effect waves-green btn-flat blue-text text-darken-2">삭제</a>
								
							</div>
						</div>
      	
      
      </div><br>
     </div>
      
    <ul class="pagination">
    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
    <li class="active"><a href="#!">1</a></li>
    <li class="waves-effect"><a href="#!">2</a></li>
    <li class="waves-effect"><a href="#!">3</a></li>
    <li class="waves-effect"><a href="#!">4</a></li>
    <li class="waves-effect"><a href="#!">5</a></li>
    <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
  </ul>
		
</main>
		
	
	

	
