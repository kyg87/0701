<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	

<!DOCTYPE html>

<style>

/*--------------------font--------------------------*/

@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

.hanna{
	font-family: 'Hanna', serif;
}
.jeju{
	font-family: 'Jeju Gothic', serif;
}
.nanum{
	font-family: 'Nanum Myeongjo', serif;
}

/*--------------------common--------------------------*/

body{
	color: #846C63;
}

/*--------------------detail--------------------------*/

.alcaramel {
    background-color: #F0E5D7 !important;
}

.card-panel {
    transition: box-shadow .25s;
    padding: 20px;
    margin: 0.5rem 0 1rem 0;
    border-radius: 2px;
    background-color: #fff;
}
.card-panel {
    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
}

.detail-title {
    font-weight: 700;
    display: block;
    /* text-transform: uppercase; */
}

i {
    line-height: inherit;
}

.opening-hours {
    margin: 0;
}
ul {
    padding: 0;
    list-style-type: none;
}

hr {
    border-bottom: 0;
    border-right: 0;
    border-top: 1px solid #846C63;
}

a {
    text-decoration: none;
}
h6 {
    font-size: 1rem;
    line-height: 110%;
    margin: 0.5rem 0 0.4rem 0;
}

h2{margin-top: 10px;}


i{
font-family: "Material-Design-Icons";
}



/* .table{
	border-radius: 3px;
	width:100%;
	background:#fff;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.table .head{
	border-bottom:none;
}

.table .nav{
	background:none;
	box-shadow:none;
}

.table .breadcrumb{
	color: #666666;
    font-size: 13px;
}

.breadcrumb:before {
    font-style: normal;
    font-weight:bold;
    speak: none;
    text-align: center;
    width: 1em;
    display: inline-block;
    font-size: 15px;
    color: #bababa;
} 

.table .category{

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

*/
.head td:first-child{
	height: 15px;
}

span.title {
    color: #839705;
    font-family: Microsoft;
}
time {
    margin-left: 17px;
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
    background-color: #ff6d00;
    border: none;
    color: #fff;
    font-size: 17px;
    font-family: Microsoft YaHei,'NSL';
    float: right;
    line-height: 80px\0;
    margin-left: 10px;
} 

</style>

<main id="main">
<div class="container">
	<div class="section">
		<div class="row">
			<div class="col l5 s12">
				<h2 class="jeju">${n.title }</h2>
				<a href="http://${n.url}"> <img
						sizes="(max-width: 800px) 100vw, 800px" width="800" height="400"
						class="single-photo responsive-img z-depth-3 wp-post-image" 
						src="http://api.thumbalizr.com/?url=http://${n.url}&width=250" />
					</a>
                    <div class="section">
                            <!-- AREA -->
                            <c:forEach var="tag" items="${t }">
					<div id="chip" class="chip">${tag }</div>
					</c:forEach>
                                                      <!--   <a title="City" class="btn white-text" href="https://adbeus.com/coffee/montreal/westmount/">Westmount</a> -->
                            
                            <!-- ROASTERS -->
                            
                          </div>

                      </div>
	<div class="col l7 s12">
		<div class="card-panel alcaramel" style="min-height: 640px;">
					<div class="jeju">
						<span >${b }</span> <span>> ${s }</span> 
					</div> 
					<hr>

			<span class="detail-title"><i class="material-icons">person_pin</i></span> 
			<span class="">${n.memberId }</span>
			<hr>
			
			<span class="detail-title"><i class="material-icons">av_timer</i></span>
			<ul class="opening-hours">
				<li>${n.regDate }</li>
			</ul>
			<hr>
			<span class=""><a href="http://${n.url}">http://${n.url}</a></span>
			<hr>
			<span class="detail-title"><i class="material-icons">textsms </i>comment<div
							id="minibox">
			<span class="">${n.content }</span>
			<hr>
			
		   <form class="box_write" id="comment-add-form"
								action="siteBoard-comment-add" method="post">
         
          
               
 
               <textarea placeholder="한 줄 댓글을 남겨주세요." name="content"
										required="required"></textarea>
               
               
               <button name="button" type="button" onclick="onCreate();">댓글남기기</button>
               <!-- 
               <div class="input-field">
                  <i class="material-icons prefix">mode_edit</i>
                  <input  id="icon_prefix2" type="text" class="validate" name="content" required="required">
                  <label for="icon_prefix2">Message</label>
                  <button class="btn waves-effect waves-light secondary-content" type="button" onclick="onCreate();">등록
                      <i class="material-icons right">send</i>
                    </button>
               </div>
 -->               
   
             
             
            
     	     <input type="hidden" name="siteBoardId" value=${n.id }>
        	 <input type="hidden" name="memberId"
									value=<security:authentication property="name"/>>
         	</form>


			<ul id="commentList" class="collection">

			</ul>

		</div>
			</span>

			<span class="detail-title"><i class="mdi-image-photo-camera"></i>
				Header photo by <a target="_blank" href="http://mtlbeanstalk.com/">Linh
					Le-Kim</a></span>
			<hr>

			<!-- Modal Trigger -->
			<a class="waves-effect waves-light btn modal-trigger"
						href="#edit-modal">Submit a change</a>

			<!-- Modal Structure -->
			<div id="edit-modal" class="modal bottom-sheet modal-fixed-footer">

				<form action="" method="POST">

					<div class="modal-content">

						<div class="row">

							<div class="col s12">

								<h4>Submit a change</h4>


								<div class="collection edit-options">
									<a href="#" class="collection-item">Coffee Shop closed
										permanently</a> <a href="#" class="collection-item">Opening
										Hours have changed</a> <a href="#" class="collection-item">This
										coffee shop is using a new roaster</a> <a href="#" data-text=""
												class="collection-item">Other</a>
								</div>

							</div>

							<div class="input-field col s12">
								<textarea id="edit_text" name="edit_text" rows="20"
											class="materialize-textarea"></textarea>
								<label for="edit_text">Some details about the change</label>
							</div>

							<div class="input-field col s12">
								<input id="edit_email" name="edit_email" type="email"
											class="validate" value=""> <label for="edit_email">Your
									email address</label>
							</div>

						</div>

					</div>

					<div class="modal-footer">
						<input type="hidden" id="nonce" name="nonce" value="512a793c20"><input
									type="hidden" name="_wp_http_referer"
									value="/montreal/westmount/standard-coffee-bar/">
						<button type="submit" name="action" value="edit_shop"
									class="btn teal">Submit</button>
					</div>

				</form>

			</div>
			</div>
			</div>
</div>
</div>
</div>



	<%-- <table class="table">
		<thead class="head">
			<tr>
				<td class="category" colspan="4">
					<nav class="nav">
						<div class="nav-wrapper">
							<div class="col s12">
								<a href="#!" class="breadcrumb big-category">${b }</a> <a
									href="#!" class="breadcrumb small-category">${s }</a>
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
				<td class="detail-font" colspan="4" class="reg-date"><i
					class="tiny material-icons">schedule</i>
				<fmt:formatDate value="${n.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<td class="detail-font" colspan="4"><i
					class="tiny material-icons">perm_identity</i>${n.memberId }</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="http://${n.url}"> 
					<img src="http://api.thumbalizr.com/?url=http://${n.url}&width=250" />
					</a>
					<div>
						<a href="http://${n.url}">http://${n.url}</a>
					</div>
				</td>
				<script>
					$(document).ready(function(){
						$("a[href^='http://']").attr("target","_blank");
					});
				</script>
			</tr>
			<tr>
				<td colspan="4">${n.content }</td>
			</tr>
			<tr>
				<td colspan="4">
					<c:forEach var="tag" items="${t }">
					<div id="chip" class="chip">${tag }</div>
					</c:forEach>
					<script>
						$(function(){
							$(".chip").on('click', function(){
								var query = $(this).text();
								$.post("site-list", {"query":query}, function(){
									location.replace("site-list?query="+query);
								}); 
							});
						});
					</script>
				</td>
			</tr>
			<tr class="td-padding">
				<td colspan="2">
					<form action="like" method="post">
						<button id="likebtn" class="waves-effect waves-light btn" type="submit" name="action">
							<i id="icon-margin" class="material-icons left ">thumb_up</i>
							${l }
						</button>
						<input type="hidden" name="siteBoardId" value=${n.id }>
						<security:authorize access="isAuthenticated()">
							<input type="hidden" name="memberId" value=<security:authentication property="name"/>>
						</security:authorize>
					</form>
				</td>
				<td class="form-end"colspan="2">
					<a class="back" href="">
					<button class="btn waves-effect waves-light list-btn" type="submit" name="action">목록</button>
					</a> 
					<script>
						$(document).ready(function(){									
							$(".list-btn").on("click",function(){
								$('.back').prop('href', history.back());
							});
						});
					</script>
				</td>
			</tr>
			
			<security:authentication property="name" var="loginID"/>
			<security:authorize access="isAuthenticated()">
			<tr>
				<c:if test="${loginID eq n.memberId }">
				<td colspan="2">
					<form action="site-edit?c=${n.id}" method="post">
						<input type="hidden" name="id" value=${n.id }>
						<button class="btn waves-effect waves-light" type="submit"
							name="action">수정</button>
					</form>
				</td>
				<td colspan="2">
					<form class="form-end" action="site-delete" method="post">
						<input type="hidden" name="id" value=${n.id }>
						<button class="btn waves-effect waves-light" type="submit"
							name="action">삭제</button>
					</form>
				</td>
				</c:if>
			</tr>
			</security:authorize>
			
		</tbody>
</table>
	<br>
	
			
	<!-- <input type="hidden" name="siteBoardId" value="">  -->
	<input type="hidden"	name="memberId" value="${n.memberId }"/>
	
	
	
	<!------------------------------------------------------------- 댓글 영역 ------------------------------------------------------------------------>
		<div>
			현재 페이지 : ${page} </br> 
			전체 글 갯수 : ${size} </br>
		</div>


		<div id="minibox">
		   <form class = "box_write" id="comment-add-form" action="siteBoard-comment-add" method="post">
         
               <security:authorize access="isAnonymous()">
                  <p>글쓰기는 로그인한 유저만 가능합니다 로그인해주세요</p>
               </security:authorize>
               
               <security:authorize access="isAuthenticated()">
               <textarea placeholder="한 줄 댓글을 남겨주세요." name="content" required="required"></textarea>
               
               
               <button name="button" type="button" onclick="onCreate();">댓글남기기</button>
               <!-- 
               <div class="input-field">
                  <i class="material-icons prefix">mode_edit</i>
                  <input  id="icon_prefix2" type="text" class="validate" name="content" required="required">
                  <label for="icon_prefix2">Message</label>
                  <button class="btn waves-effect waves-light secondary-content" type="button" onclick="onCreate();">등록
                      <i class="material-icons right">send</i>
                    </button>
               </div>
 -->               
               </security:authorize>
             
             
            
     	     <input type="hidden" name="siteBoardId" value=${n.id }>
        	 <input type="hidden" name="memberId" value=<security:authentication property="name"/>>
         	</form>


			<ul id="commentList" class="collection">

			</ul>

		</div>


		<ul id="pagination" class="pagination center">

		</ul> --%>
	
	
</main>
<security:authentication property="name" var="loginID"/>

<script>
<!-----------------------------------------태그--------------------------------------------->
$(function(){
	$(".chip").on('click', function(){
		var query = $(this).text();
		$.post("site-list", {"query":query}, function(){
			location.replace("site-list?query="+query);
		}); 
	});
});


$(document).ready(function(){
	$("#likebtn").click(function(){
		console.log('${loginID}');
		
		
		if('${loginID}' == 'anonymousUser') {
			alert("로그인한 유저만 사용 가능합니다.");
			return false;
		}
		else{
			return true;
		}

		
	});
});
	
page(${page});



var currentPage = ${page};
	
	function onCreate(){
		
		var count = 0;
		
		if('${loginID}' == 'anonymousUser') {
			alert("로그인한 유저만 사용 가능합니다.");
			return;
		}

		
		var text = $("#comment-add-form").find("textarea");
		
	
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
	 	/* 	 	count++;
				if(count <100)onCreate();  */
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
								 .append($('<time>'+js_yyyy_mm_dd_hh_mm_ss(obj[i].regDate)+'</time>'))
								 .append($('<p>'+obj[i].content+'</p>'))
								 .append($('<a class="waves-effect waves-light btn" onclick="onDelete('+obj[i].id+ ');" value='+obj[i].id+'>삭제</a>')));
						}
						else{
							$("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
									 .append($('<img src="/WiynPrj/resource/images/test.png" alt="" class="circle"> '))
									 .append($('<span class="title">'+obj[i].memberId+'</span>'))
									 .append($('<time>'+js_yyyy_mm_dd_hh_mm_ss(obj[i].regDate)+'</time>'))
									 .append($('<p>'+obj[i].content+'</p>')));
						}

					}
			    	
			    	
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