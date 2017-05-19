<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

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

	<div>요청디테일</div>
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
			              <th id="title">${n.title}<i id="re" class="small material-icons">launch</i></th>			             
			          </tr>
			          <tr>
			          	 <th id="writedate">${n.regDate}<i class="small material-icons">star</i> 23</th>
			          </tr>
			          <tr>
			          	<th id="writer">${n.memberId}</th>
			          </tr>
			        </thead>
			        <tbody>
			        <!--   <tr>
			            <td id="thum">thum</td>
			          </tr> -->
			          <!-- <tr>
			            <td id="url">url</td>
			          </tr> -->
			          <tr>
			            <td id="content">${n.content}</td>
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
			        
			          
			          	
			          	
			          	<form action="request-del" method="post">
			          	<input type="hidden" name="id" value =${n.id }>
						<button  id="btn" class="waves-effect waves-light btn" type="submit" name="action">삭제</button>
						</form>
			            
			          
			            <td>
							<a  id="btn" class="waves-effect waves-light btn" a href="request-edit?c=${n.id}">수정</a>
			            </td>
			            <td>
							<a id="btn" class="waves-effect waves-light btn" a href="requestboard">목록</a>
			            </td>
			          </tr>
			        </tbody>
		      	</table>

			</div>
			
			
		<div id="minibox">
			 <form action="requestboard-comment-add" method="post">
            <div class="row">
               <security:authorize access="isAnonymous()">
                  <p>글쓰기는 로그인한 유저만 가능합니다 로그인해주세요</p>
               </security:authorize>
               
               <security:authorize access="isAuthenticated()">
               <div class="input-field">
                  <i class="material-icons prefix">mode_edit</i>
                  <input  id="icon_prefix2" type="text" class="validate" name="content" required="required">
                  <label for="icon_prefix2">Message</label>
                  <button class="btn waves-effect waves-light secondary-content" type="submit" name="action">등록
                      <i class="material-icons right">send</i>
                    </button>
               </div>
               </security:authorize>
            </div>
			<input type="hidden" name="requestBoardId" value=${n.id }>
			<input type="hidden" name="memberId" value=<security:authentication property="name"/>>
		</form>	
		
			<ul id ="commentList" class="collection">
	
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
console.log(${page});
 page(${page}); 
  function page(page){
	
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
								 .append($('<form data-confirm ="댓글을 삭제하시겠습니까"><input type="submit" value="삭제"></form>')));
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
   $(".page").on("click",function(){
	
	   
   var page = $(this).attr('value');

   $.post("commentPage", {"page":page ,"id":${n.id }}, function(d) {
      
      $("#commentList").empty();
      $("#pagination").empty();
      var obj = JSON.parse(d);
      
     
      if(obj.length != 0){
    	  

			for (var i = 0; i < obj.length; i++) {
					
				 $("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
						 .append($('<img src="/WiynPrj/resource/images/test.png" alt="" class="circle"> '))
						 .append($('<span class="title">'+obj[i].memberId+'</span>'))
						 .append($('<time>'+obj[i].regDate+'</time>'))
						 .append($('<p>'+obj[i].content+'</p>')));

			}
	    	  $("#pagination").append($('<li class="waves-effect"><a><i class="material-icons">chevron_left</i></a></li>'));
	    	
			 var lastPage = ${size/10+(1-(size/10%1))%1};
			  
		
			 
			 for (var i = 1; i <= lastPage; i++){
				 
			
				 if(${page eq i }){
					 $("#pagination").append($(' <li class="waves-effect active"><a class="page" onclick="page('+i+');" value='+i+'>'+i+'</a></li>'));
				 }
				 else{
					 $("#pagination").append($(' <li class="waves-effect"><a class="page" onclick="page('+i+');" value='+i+'>'+i+'</a></li>'));
				 }
			 }
			 
			  $("#pagination").append($('<li class="waves-effect"><a><i class="material-icons">chevron_right</i></a></li>'));
		}
      
    
   	});
   
   });


$(function(){

   $("#rightBtn").click(function(){

   });
});
</script>