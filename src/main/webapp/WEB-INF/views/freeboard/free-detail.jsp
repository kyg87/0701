<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	span.title {
	    color: #839705;
	    font-family: Microsoft YaHei,'NSL';
	    font-size: 15px;
	}
	
	time {
	    color: #c1c1c1;
	    font-size: 13px;
	    font-family: Microsoft YaHei,'NSL';
	}

	p {
	    color: #6d6e71;
	    font-size: 13px;
	    font-family: Microsoft YaHei, "NS";
	    margin-top: 5px;
	    line-height: 1.5;
	}
</style>

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
			              <th>제목 : ${n.title}<i id="re" class="small material-icons">launch</i></th>			             
			          </tr>
			          <tr>
			          	 <th>작성시간 : ${n.regDate}<i class="small material-icons">star</i> 23</th>
			          </tr>
			          <tr>
			          	<th>ID : ${n.memberId}</th>
			          </tr>
			         
			         			        </thead>
			        <tbody>
			          <tr>
			            <td id="thum">IMAGE : ${n.contentSrc}</td>
			          </tr>	     
			          <tr>
			            <td id="content">Content: ${n.content }</td>
			          </tr>
			           <tr>
			           
			            <td>Hit : ${n.hit }</td>
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

<!------------------------------------------------------------- 댓글 영역 ------------------------------------------------------------------------>
		<div>
			현재 페이지 : ${page} </br> 
			전체 글 갯수 : ${size} </br>

		</div>


		<div id="minibox">
		   <form id="comment-add-form" action="freeBoard-comment-add" method="post">
             <div class="row">
               <security:authorize access="isAnonymous()">
                  <p>글쓰기는 로그인한 유저만 가능합니다 로그인해주세요</p>
               </security:authorize>
               
               <security:authorize access="isAuthenticated()">
               <div class="input-field">
                  <i class="material-icons prefix">mode_edit</i>
                  <input  id="icon_prefix2" type="text" class="validate" name="content" required="required">
                  <label for="icon_prefix2">Message</label>
                  <button class="btn waves-effect waves-light secondary-content" type="button" onclick="onCreate();">등록
                      <i class="material-icons right">send</i>
                    </button>
               </div>
               </security:authorize>
             </div>
            
     	     <input type="hidden" name="freeBoardId" value=${n.id }>
        	 <input type="hidden" name="memberId" value=<security:authentication property="name"/>>
         	</form>


			<ul id="commentList" class="collection">

			</ul>

		</div>


		<ul id="pagination" class="pagination center">

		</ul>


	</div>
	</div>
	
	

</main>


<!------------------------------------------------------------- 댓글 영역 ------------------------------------------------------------------------>
<security:authentication property="name" var="loginID"/>

<script>

	
page(${page});



var currentPage = ${page};
	
	function onCreate(){
		
		var count = 0;
		
		var text = $("#comment-add-form").find("input");
		
	
		var tt= text.val();
		tt = tt.trim();//공백 제거
        
        if(!tt){
            alert("내용이 없습니다.");
            text.focus();//해당입력란으로 포커싱
            return;
        }
		

		var data = $("#comment-add-form").serialize();
	
	
		
		$.post("freeBoard-comment-add", data, function(z) {

			if(z =="1"){

				page(1);
	 		/* 	count++;
				if(count <100)onCreate(); */ 
			}
			
		});
		
	}
	
	
	function onDelete(d){
		
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			$.post("freeCommentDelete", {"id":d}, function(z) {
				if(z =="1"){
					alert("삭제했습니다.");
					
					page(currentPage);
					
				
				}
				
			});
			
		}else{   //취소
		    return;
		}

	}
  function page(page){
	   currentPage = page;
		console.log(currentPage);
	   $.post("commentPage", {"page":page ,"id":${n.id }}, function(d) {
		      
		      $("#commentList").empty();
		      $("#pagination").empty();
		      var obj = JSON.parse(d);
		      
		     
		      if(obj.length != 0){
		    	  

					for (var i = 0; i < obj.length; i++) {
						
						if(obj[i].memberId=='${loginID}'){
						
							$("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
								 .append($('<img src="/WiynPrj/resource/images/test.png" alt="" class="circle"> '))
								 .append($('<span class="title">'+obj[i].memberId+'</span>'))
								 .append($('<time>'+obj[i].regDate+'</time>'))
								 .append($('<p>'+obj[i].content+'</p>'))
								 .append($('<a class="waves-effect waves-light btn" onclick="onDelete('+obj[i].id+ ');" value='+obj[i].id+'>삭제</a>')));
						}
						else{
							$("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
									 .append($('<img src="/WiynPrj/resource/images/test.png" alt="" class="circle"> '))
									 .append($('<span class="title">'+obj[i].memberId+'</span>'))
									 .append($('<time>'+obj[i].regDate+'</time>'))
									 .append($('<p>'+obj[i].content+'</p>')));
						}

					}
			    	  $("#pagination").append($('<li class="waves-effect"><a><i class="material-icons">chevron_left</i></a></li>'));
			    	
					 var lastPage = ${size/10+(1-(size/10%1))%1};
					  
			
					 
					 for (var i = 1; i <= lastPage; i++){
						 
		
						 if(page == i){
							 $("#pagination").append($(' <li class="waves-effect active"><a class="page" onclick="page('+i+');" value='+i+'>'+i+'</a></li>'));
						 }
						 else{
							 $("#pagination").append($(' <li class="waves-effect"><a class="page" onclick="page('+i+');" value='+i+'>'+i+'</a></li>'));
						 }
					 }
					 
					  $("#pagination").append($('<li class="waves-effect"><a><i class="material-icons">chevron_right</i></a></li>'));
				}
		      
		    
		   	});
  }


$(function(){

   $("#rightBtn").click(function(){

   });
});


</script>