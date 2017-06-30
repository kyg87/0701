<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<security:authentication property="name" var="loginID"/>
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
	
	
	

hr {
    border-bottom: 0;
    border-right: 0;
    border-top:1px solid rgba(144, 135, 135, 0.59);
}
body {
	background-color: rgb(238, 238, 238);
}

body, html {
	font-family: 'Abel', sans-serif;
	color: #846C63;
}

#main {
	width: 100%;
	min-height: 500px;
	font-size: 14px;
	line-height: 1.5em;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 3px;
	box-shadow: 1px 1px 5px #383838;
	background: #F6F4F1 !important;
}

.card-panel {
    transition: box-shadow .25s;
    padding: 20px;
    margin: 0.5rem 0 1rem 0;
    border-radius: 2px;
    background-color: #F0E5D7 !important;
    min-height: 640px;
}

#category {
	margin: 10px;
	min-height: 660px;
	width: 150px;
	box-shadow: 1px 1px 5px #383838;
}

#context {
	min-height: 200px;
	/* width: 400px; */
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
	background: rgb(210, 178, 149);
}

#back{
	background: rgb(210, 178, 149);
}

.udButtons a{
	margin-left: 5px;
}

.detail-title {
    font-weight: 700;
    display: block;
    /* text-transform: uppercase; */
} 

 /* ----------------------검색창 수정------------ */
 .broker-expanding-search,
.broker-expanding-search *,
.broker-expanding-search *:after,
.broker-expanding-search *:before {
  box-sizing: border-box;
}

.broker-expanding-search {
  display: table;
  table-layout: fixed;
  width: 50px;
  margin: 0;
  border-radius: 40px;
  overflow: hidden;
background: #dd5d58;
/* box-shadow: 0px 0px 0px 2px rgba(255,255,255,0.90); */
  transition: width 0.5s cubic-bezier(0.65, -0.5, 0.4, 1.5);
}

.broker-expanding-search--open {
  width: 250px;
}

.broker-expanding-search__column {
  display: table-cell;
  vertical-align: top;
}

.broker-expanding-search__column--left {
  width: 100%;
  padding-left: 15px;
}

.broker-expanding-search__column--right {
  width: 50px;
}

.broker-expanding-search__input {
  display: block;
  margin: 0;
  padding: 0;
  display: block;
  border: none;
  outline: none;
  color: white;
  border-radius: 0;
  background: none;
  font-size: 16px;
}

.broker-expanding-search__input--text {
  width: 100%;
  height: 50px;
  line-height: 50px;
}

.broker-expanding-search__input--submit {
  font-size: 0;
  width: 50px;
  height: 50px;
  cursor: pointer;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: 50px 50px;
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAABUCAMAAAArteDzAAAB7FBMVEX////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////zN5IfAAAAo3RSTlMAAQIDBAUGBwgJCgsNDg8QERITFhcaGxweICIjJCUoKSorLC0uLzIzNjc4OTo7PD5AREVGSEpLTE5PUFFSU1RVVldYWl1eX2BjZGZoaWtsbW5vcHZ5fH6AgYKDhYqNjo+Vl5ucoaKjpqerrq+wsbW3ubzCw8TGx8jJysvMzc7P0NHT1NXW19na3ODi4+Xm6Onq6+zt7vDx8vP09vf4+fr7/P3+BP089AAAAiVJREFUGBntwflbTFEABuAvyVQixGTLlCVRdg0RDVKWlJAsSQoJKRXRoFJiVMzQYumSvn9U95yZVHP1POd0f/G47wuHw+FwOP5ZsZtKbz14/OTRvSqvG/ZwX/KPM2KoIS8W87bsWpAztedhnrx9jHZ7CeajbJxWXmyAvuv8i/4c6KrglPFBf1vPCKd88ECPlxGdFzYmA3Gr9taNMOzlYuhY0U8pWBKPiLS7DKuCjpuUujyYrsSgMLYZ6tZ+pdCxEjMdNyjUQ90NCu/dmO0chR8ZUJUUoFCAaE0UrkDVDgqtMYi2m4I/BoouUyiGBVcvTUMpUFRP0/c1sFJD08QWKGqlKZAIKycpeKGom6ZXC2BlJ4VCKOqjqQOWtlE4A0WdNPUshJV9FE5AUTNNoeWwcpHCLiiqpWkiC1YaaTLWQ9FpCtWwkDpC02ASFKX9pCmYgmjlFB5CVUwLhVpEcX+kUARlRZSKMYurmcJAMpQlvKUwlo8ZXHcoVUBDPqVflYvwR0YLpeeJ0NHAsPZDcZBWXx1mWAW0pLxjRHd18cHcI+fvf+aUUR+0ZIY4B6MAWrIHOYex/dCS1sY5fDkKLfGVo5ztWdkwJcMHPZ6aT5yuuyQBe4YpGT5oSj3bNEDhW2/dARcm5YQoGQXQtnTr4cJTx3LXxSEsO0TJ8ME+WQFKhhf2SQ9Q8sNG6QEKA7BTRpCmN7DV9iAnlcNemY2vn5bC4XA4HI7/3m/UtMhMrbR7mQAAAABJRU5ErkJggg==);
}
 
 
.searchbar1 input[type=text]{
  font-family: Verdana, Geneva, sans-serif;
  color:white;
  margin: 0 0 0 0;

}
.searchbar1{
	position: fixed;
	bottom: 50px;
	right: 50px;
}
 a.waves-effect.waves-light {
 
}
.box_write{
	background-color: #f7f7f7;
    height: 98px;
    box-sizing: border-box;
    padding: 13px 18px;
    border: 1px solid #e6e6e6;
        display: flex;
}
    
.box_write textarea {
  /*   width: 535px; */
    height: 71px;
    box-sizing: border-box;
    border: 1px solid #e6e6e6;
    resize: none;
    float: left;
    color: #c7c7c7;
    font-size: 16px;
    font-family: Microsoft YaHei,'NSL';
    text-align: center;
    padding-top: 20px;
    color: #313131;
    overflow: auto;

}

.box_write button {
    /* display: block; */
    width: 123px; 
    height: 71px;
    background-color: #d2b295; 
    border: none;
    color: #fff;
    font-size: 17px;
    font-family: Microsoft YaHei,'NSL';
    float: right;
    line-height: 80px\0;
    margin-left: 10px;
} 

.box_write{
	margin-top: 10px;
}
/* ---------------------------------------------- */

 

</style>




<main id="main">
<div class="container">
		<div class="section">
			<div class="row">
				
				<div class="col s12 l6">
					<h2>요청 게시판</h2>
					
					<!-- <div class="content">
						<h5>notice</h5>
					</div> -->
					
				</div>
				
				<div class="col s12 l6">
					
					<div class="card-panel">
						
						<h4>${n.title }</h4>
						<hr /><br />
						
						<%-- <div>
							<span class="detail-title"><i class="tiny material-icons">mode_edit</i>Title</span>
							<span>${n.title }</span>
							<hr /><br />
						</div> --%>
						
						<div>
							<span class="detail-title"><i class="tiny material-icons">person_pin</i>Writer</span>
							<span> ${n.memberId } </span>
							<hr /><br />
						</div>
						
						<div>
							<span class="detail-title"><i class="tiny material-icons">av_timer</i>Write Time</span>
							<span><fmt:formatDate value="${n.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
							<hr /><br />
						</div>

						<div>
							<span class="detail-title"><i class="tiny material-icons">textsms</i> Content </span>
							<c:set var="newLine" value="\r" />
							<span>${n.content }</span>
							<hr /><br />
						</div>
					<c:if test="${n.memberId eq  loginID}">
						<div>
							<a id="btn" class="waves-effect waves-light btn" href="#modal2"
								id="noticeArticleDel">삭제</a> <a id="btn"
								class="waves-effect waves-light btn"
								a href="request-edit?c=${n.id}">수정</a> 
						</div>
					</c:if>
					<a class="waves-effect waves-light btn" id="back"
								href="requestboard?p=${page}">목록으로</a>
		   <!--Start 댓글 영역  -->
		   <form class="box_write" id="comment-add-form"
								action="requestBoard-comment-add" method="post">
         

               
              
           <textarea placeholder="한 줄 댓글을 남겨주세요." name="content"
						required="required"></textarea>
           
           
           <button name="button" type="button" onclick="onCreate();">등록</button>
         
            
             
             
            
     	     <input type="hidden" name="requestBoardId" value=${n.id }>
        	 <input type="hidden" name="memberId"
									value=<security:authentication property="name"/>>
         	</form>


			<ul id="commentList" class="collection">

			</ul>
			<ul id="pagination" class="pagination center">

			</ul>
			<!--End 댓글 영역  -->


				
					</div>
					
					<div id="modal2" class="modal">
					<div class="modal-content">
						<h4>게시물 삭제</h4>
						<p>정말 삭제하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button class="btn waves-effect waves-light" type="button"
							id="ArticleDelCancel">Cancel</button>

						
						<button class="btn waves-effect waves-light" type="button"
							id="ArticleDelBtn">Submit</button>
							

					</div>
				</div>
					
					 <!-- <form id="comment-add-form" action="freeBoard-comment-add" method="post"> -->
             <%-- <div class="row">
               
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
             </div> --%>
            
     	     <input type="hidden" name="requestBoardId" value=${n.id }>
        	 <input type="hidden" name="memberId" value=<security:authentication property="name"/>>
					
					
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
<%-- <div class="container">
	<div class="section">
		<div class="row">
			
			<div class="col l5 s12">
					<h2 class="jeju">요청 게시판</h2> 
			</div>
			
			<div class="col l7 s12">
				<div class="card-panel alcaramel" style="min-height: 640px;">
					
					<ul class="opening-hours">
						<li class="flex">
							<div class="flex detail-title">
								<i class="material-icons tiny">mode_edit</i>
								<div class="margin">Title :</div>
							</div>
							<div class="margin"> ${n.title}</div> 
						</li>
						<hr>
						<li class="flex">
							<div class="flex detail-title">
								<i class="material-icons tiny">person_pin</i>
								<div class="margin">Writer :</div>
							</div>
							<div class="margin">${n.memberId}</div>
						</li>
						<hr>
						<li class="flex">
							<div class="flex detail-title">
								<i class="material-icons tiny">schedule</i>
								<div class="margin">Date :</div>
							</div>
							<div class="margin">
								<fmt:formatDate value="${n.regDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
						</li>
						
						<li class="flex column content-box">
							<div class="flex detail-title">
								<i class="material-icons tiny">textsms</i>
								<div class="margin">Content</div>
							</div>
							<div>${n.content}</div>
						</li>

					</ul>
					
		
         	<!-- </form> -->


			<!-- <ul id="commentList" class="collection">

			</ul> -->

				</div>

			</div>
		</div>
	</div>
</div> --%>




<script>
	$(function(){
			
		$("#ArticleDelBtn").on('click', function(){
			
			var id = ${n.id};		
			
			$.post("request-del", {"id":id});
			location.href='requestboard';
			
		});

		  $("#ArticleDelCancel").on('click', function(){
			
			location.href='${root}/requestboard/request-detail?c='+${n.id};
			
		});  
			
	});
	</script>
	

<script type="text/javascript">

	$(document).ready(function() {
		// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
		$('.modal').modal();
	});
	
</script>
















	
	<%-- <div id="yy">
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
			          	 <th id="writedate"><fmt:formatDate value="${n.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/><i class="small material-icons">star</i> 23</th>
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
            
     	     <input type="hidden" name="requestBoardId" value=${n.id }>
        	 <input type="hidden" name="memberId" value=<security:authentication property="name"/>>
         	</form>


			<ul id="commentList" class="collection">

			</ul>

		</div>


		<ul id="pagination" class="pagination center">

		</ul>
            
		</div>
	</div>

 --%>
 
 <form class="searchbar1" action="${root }/siteboard/siteboard" method="GET">
  <div class="broker-expanding-search" data-expanding-search>
    <div class="broker-expanding-search__column broker-expanding-search__column--left">
       <input type="hidden" name="p" value="1" />
       <input name="q" type="text" class="broker-expanding-search__input broker-expanding-search__input--text" value="${param.q}" placeholder="Siteboard Search" data-expanding-search-text>
    </div>
    <div class="broker-expanding-search__column broker-expanding-search__column--right">
      <input type="submit" class="broker-expanding-search__input broker-expanding-search__input--submit" value="Search" data-expanding-search-button>
    </div>
  </div>
</form>
				
	<script>
 $(document).ready(function() {
	 
	  // toggle search bar and disable request if blank...
	  $('[data-expanding-search-button]').on('click', function() {
	    var parent = $(this).closest('[data-expanding-search]');
	    if (parent.find('[data-expanding-search-text]').val() === '${param.q}') {
	      parent.toggleClass('broker-expanding-search--open');
	      return false;
	    }
	  });
	 
	});
</script>
</main>

<!------------------------------------------------------------- 댓글 영역 ------------------------------------------------------------------------>

<script>

	
page(${page});



var currentPage = ${page};
	
	function onCreate(){
		
		console.log('${loginID}');
 		if('${loginID}' == 'anonymousUser') {
			alert("로그인한 유저만 사용 가능합니다.");
			return ;
		} 

		var count = 0;
		
		var text = $("#comment-add-form").find("textarea");
		
	
		var tt= text.val();
		tt = tt.trim();//공백 제거
        
        if(!tt){
            alert("내용이 없습니다.");
            text.focus();//해당입력란으로 포커싱
            return;
        }
		

		var data = $("#comment-add-form").serialize();
	
	
		
		$.post("requestBoard-comment-add", data, function(z) {

			if(z =="1"){

				page(1);
				text.val('');
			}
			
		});
		
	}
	
	
	function onDelete(d){
		
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			$.post("requestCommentDelete", {"id":d}, function(z) {
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
		      var src ="";
		     
		      if(obj.length != 0){
	
					for (var i = 0; i < obj.length; i++) {
						
						src = "${root}/resource/profile/" +obj[i].profile;
						
		 				if(obj[i].memberId=='${loginID}'){
						
							$("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
									 .append($('<img src='+ src   +' class="circle"> '))
								 .append($('<span class="title">'+obj[i].memberId+'</span>'))
								 .append($('<time>'+js_yyyy_mm_dd_hh_mm_ss(obj[i].regDate)+'</time>'))
								 .append($('<p>'+obj[i].content+'</p>'))
								 .append($('<a class="waves-effect waves-light" onclick="onDelete('+obj[i].id+ ');" value='+obj[i].id+'><i class="material-icons">clear</i></a>')));
						}
						else{
							$("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
									 .append($('<img src='+ src   +' class="circle"> '))
									 .append($('<span class="title">'+obj[i].memberId+'</span>'))
									 .append($('<time>'+js_yyyy_mm_dd_hh_mm_ss(obj[i].regDate)+'</time>'))
									 .append($('<p>'+obj[i].content+'</p>')));
						} 
					}
			 	/*    $("#commentList img").error(function() {
			 
				         this.src ="${root}/resource/images/avatar.png";
				      });  */
			 	 
			    	
			    	
					 var lastPage = ${size/10+(1-(size/10%1))%1};
					  
					 var last_block = Math.ceil(lastPage / 5);
	
					
			        //현재 블럭 구하기 
			        var n_block = Math.ceil(currentPage / 5);
			        //페이징의 시작페이지와 끝페이지 구하기
			        var s_page = (n_block - 1) * 5 + 1; // 현재블럭의 시작 페이지
			        var e_page = n_block * 5; // 현재블럭의 끝 페이지
				
				
					 if(n_block != 1){
						  	$("#pagination").append($('<li class="waves-effect"><a onclick="prevButton();"><i class="material-icons">chevron_left</i></a></li>'));
						 }
					 
					 for (var i = s_page; i <= e_page; i++){
						 if (i > lastPage)    break;
						 
		
						 if(page == i){
							 $("#pagination").append($(' <li class="waves-effect active"><a class="page" onclick="page('+i+');" value='+i+'>'+i+'</a></li>'));
						 }
						 else{
							 $("#pagination").append($(' <li class="waves-effect"><a class="page" onclick="page('+i+');" value='+i+'>'+i+'</a></li>'));
						 }
					 }
			        
		
					 if(n_block != last_block){
						$("#pagination").append($('<li class="waves-effect"><a onclick="nextButton();"><i class="material-icons">chevron_right</i></a></li>')); 
					 }
					  
				}
		   
		    
		   	});
 	}
		   
		      
		     
		

 
 
 function js_yyyy_mm_dd_hh_mm_ss (date) {
	  
	  now = new Date(date);
	  year = "" + now.getFullYear();
	  month = "" + (now.getMonth() + 1); if (month.length == 1) { month = "0" + month; }
	  day = "" + now.getDate(); if (day.length == 1) { day = "0" + day; }
	  hour = "" + now.getHours(); if (hour.length == 1) { hour = "0" + hour; }
	  minute = "" + now.getMinutes(); if (minute.length == 1) { minute = "0" + minute; }
	  second = "" + now.getSeconds(); if (second.length == 1) { second = "0" + second; }
	  return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
	}
 
 function prevButton(){
	  var n_block = Math.ceil(currentPage / 5);

     //페이징의 시작페이지와 끝페이지 구하기
     var s_page = (n_block-1) * 5 -4 ; // 현재블럭의 시작 페이지
     page(s_page);
 }
 
 function nextButton(){
	  var n_block = Math.ceil(currentPage / 5);

     //페이징의 시작페이지와 끝페이지 구하기
     var s_page = (n_block) * 5 + 1; // 현재블럭의 시작 페이지
     page(s_page);
 }

</script>