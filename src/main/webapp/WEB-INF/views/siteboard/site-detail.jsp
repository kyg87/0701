<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<style>
.table{
	border:1px solid #e4e4e4;
	border-radius: 3px;
	/* box-shadow: 0px 1px 1px #a8a8a8; */
	width:100%;
}

td{
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
}

td i{
	margin-right:3px;
}

.input-field {
	width: 100%;
}

.button-td{
	display: flex;
	justify-content: space-between;
}

.like-td{
	display: flex;
	justify-content: space-between;
	padding-bottom: 0px;
}

.like-td form{
	margin-top:3px;
}

.hidden{
	display: none;
}

.reg-date{
	padding-right: 0px;
}

.like{
	margin-left: 3px;
	margin-right: 3px;
	text-shadow: 0px 1px #ffffff, 2px 1px 0px #dad7d7;
	text-align: right;
}
.form-end{
	text-align: right;
}

#icon-margin{
	margin-right:2.5px !important;
}

.title{
	font-weight:900;
    font-size: 23px;
	font-family: din_blackregular;
	color: #616161;
}

.detail-font{
	font-family: 'Abel', sans-serif;
	padding-top:0px;
}

.detail-title{
	font-weight: 700;
    text-transform: uppercase;
    font-family: 'Abel', sans-serif;
}

.small-category{
	font-weight: 900;
}


</style>

<main id="main">

	<table class="table">
		<thead>
			<tr>
				<td colspan="4">
					<nav>
						<div class="nav-wrapper">
							<div class="col s12">
								<a href="#!" class="breadcrumb big-category">${b }</a> 
								<a href="#!" class="breadcrumb small-category">${s }</a>
							</div>
						</div>
					</nav>
				</td>
			</tr>
			<tr>
				<td class="title" colspan="4">${n.title }</td>
				<td class="hidden">즐겨찾기</td>
			</tr>
			<tr class="reg-like">
				<td class="detail-font" colspan="4" class="reg-date"><i class="tiny material-icons">schedule</i>${n.regDate }</td>
			</tr>
			<tr>
				<td class="detail-font" colspan="4"><i class="tiny material-icons">perm_identity</i>${n.memberId }</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="4">${n.url }</td>
			</tr>
			<tr>
				<td colspan="4">thum</td>
			</tr>
			<tr>
				<td colspan="4">${n.content }</td>
			</tr>
			<tr>
				
				<td colspan="4"><div class="chip">${t.name }</div></td>
				
			</tr>
			<tr class="td-padding">
				<td colspan="2">
					<form action="like" method="post">
						<button class="waves-effect waves-light btn" type="submit"
							name="action">
							<i id="icon-margin" class="material-icons left ">thumb_up</i>${l }</button>
						<input type="hidden" name="siteBoardId" value=${n.id }> <input
							type="hidden" name="memberId" value="LSE@mb.com">
					</form>
				</td>
				<td colspan="2" >
					<form class="form-end" action="site-list" method="post">
						<button class="btn waves-effect waves-light" type="submit"
							name="action">목록</button>
					</form>		
				</td>
			</tr>
			<tr>
				<td colspan="2" >
					<form  action="site-edit?c="${n.id} method="post">
						<input type="hidden" name="id" value=${n.id }>
						<button class="btn waves-effect waves-light" type="submit"
							name="action">수정</button>
					</form>
				</td>
				<td colspan="2" >
					<form  class="form-end"  action="site-delete" method="post">
						<input type="hidden" name="id" value=${n.id }>
						<button class="btn waves-effect waves-light" type="submit"
							name="action">삭제</button>
					</form>
				</td>
			</tr>
	</tbody>
	</table>
	<br>

	<!-- <input type="hidden" name="siteBoardId" value="">  -->
	<input type="hidden"	name="memberId" value="LSE@mb.com">
	
	
	
	<!------------------------------------------------------------- 댓글 영역 ------------------------------------------------------------------------>
		<div>
			현재 페이지 : ${page} </br> 
			전체 글 갯수 : ${size} </br>

		</div>


		<div id="minibox">
		   <form id="comment-add-form" action="siteBoard-comment-add" method="post">
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
            
     	     <input type="hidden" name="siteBoardId" value=${n.id }>
        	 <input type="hidden" name="memberId" value=<security:authentication property="name"/>>
         	</form>


			<ul id="commentList" class="collection">

			</ul>

		</div>


		<ul id="pagination" class="pagination center">

		</ul>
	
	
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
	
	
		
		$.post("siteBoard-comment-add", data, function(z) {

			if(z =="1"){

				page(1);
	 		 	//count++;
				//if(count <100)onCreate(); 
			}
			
		});
		
	}
	
	
	function onDelete(d){
		
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			$.post("siteCommentDelete", {"id":d}, function(z) {
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