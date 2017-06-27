<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<c:set var="root" value="${pageContext.request.contextPath}" />
<security:authentication property="name" var="loginID"/>
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
    border-top:1px solid rgba(144, 135, 135, 0.59);
}

a {
    text-decoration: none;
}
h6 {
    font-size: 1rem;
    line-height: 110%;
    margin: 0.5rem 0 0.4rem 0;
}

h2{margin-top: 10px; }


i{
font-family: "Material-Design-Icons";
}


i.tiny {
    padding-top: 3px;
}


div#chip:hover {
    background: #8f786f;
    color: #fff;
    cursor: pointer;
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
    background-color: #d2b295; 
    border: none;
    color: #fff;
    font-size: 17px;
    font-family: Microsoft YaHei,'NSL';
    float: right;
    line-height: 80px\0;
    margin-left: 10px;
} 


.margin{
	margin-left:3px;
}

.content-box{
	padding-top:5px;
	padding-bottom:10px;
	border:1px solid rgba(144, 135, 135, 0.59);
	margin-top:10px;
	margin-bottom:10px;
}


.chip{

    /* box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2); */
    background-color: rgba(255, 255, 255, 0);
    margin-bottom: 10px;
    border: 1px solid #846C63;
	color:#846C63;
	font-size:12px;
	height: auto;
}

.material-icons.like{
	margin-top:10px;
	color: black;
}




i.left{
	margin-right:6px;
}
#likebtn{
padding:2px;
font-size:13px;
height: auto;
line-height: 22px;

}

#likebtn i.tiny{
padding-top:0px;  
}

a.del.waves-effect.waves-light {
    position: absolute;
    top: 9px;
    right: 7px;
}
</style>

<main id="main">
<div class="container">
	<div class="section">
		<div class="row">
			<div class="col l5 s12">
			<div class="flex">
				<h2 class="jeju">${n.title }</h2>
	
			</div>
				<a href="http://${n.url}"> <img
						sizes="(max-width: 800px) 100vw, 800px" width="800" height="400"
						class="single-photo responsive-img z-depth-3 wp-post-image" 
						src="http://api.thumbalizr.com/?url=http://${n.url}&width=250" />
					</a>
                    <div class="section">

                            
                          </div>

                      </div>
	<div class="col l7 s12">
		<div class="card-panel alcaramel" style="min-height: 640px;">
					<div class="jeju">
						<span >${b }</span> <span>> ${s }</span> 
					</div> 
					<hr>

					<div>
						<span class="detail-title"><i class="tiny material-icons">person_pin</i>Writer</span>
						<span> ${n.memberId } </span>
						<hr />
						<br />
					</div>

					<div>
						<span class="detail-title"><i class="tiny material-icons">query_builder</i>Write
							Time</span> <span><fmt:formatDate value="${n.regDate }"
								pattern="yyyy-MM-dd HH:mm:ss" /></span>
						<hr />
						<br />
					</div>

					<div>
						<span class="detail-title"><i class="tiny material-icons">language</i>
							Url </span> <span> ${n.url }</span>
						<hr />
						<br />
					</div>

					<div>
						<span class="detail-title"><i class="tiny material-icons">textsms</i>
							Comment </span>
						<c:set var="newLine" value="\r" />
						<span>${n.content }</span>
						<hr />
						<br />
					</div>
					
					<form action="like" method="post">
						<button id="likebtn" class="waves-effect waves-light btn" type="submit" name="action">
							<i id="icon-margin" class="material-icons left tiny">thumb_up</i>
							좋아요 ${l }개
						</button>
						<input type="hidden" name="siteBoardId" value=${n.id }>
						<security:authorize access="isAuthenticated()">
							<input type="hidden" name="memberId" value=<security:authentication property="name"/>>
						</security:authorize>
					</form>
					
					<hr>

					<div class="jeju">
						<c:forEach var="tag" items="${t }">
							<div id="chip" class="chip">${tag }</div>
						</c:forEach>
					</div>
		   <!--Start 댓글 영역  -->
		   <form class="box_write" id="comment-add-form"
								action="siteBoard-comment-add" method="post">
         

               
              
           <textarea placeholder="한 줄 댓글을 남겨주세요." name="content"
						required="required"></textarea>
           
           
           <button name="button" type="button" onclick="onCreate();">등록</button>
         
            
             
             
            
     	     <input type="hidden" name="siteBoardId" value=${n.id }>
        	 <input type="hidden" name="memberId"
									value=<security:authentication property="name"/>>
         	</form>


			<ul id="commentList" class="collection">

			</ul>
			<ul id="pagination" class="pagination center">

			</ul>
			<!--End 댓글 영역  -->

					<div>
				<c:if test="${n.memberId eq  loginID}">
							<form class="form-end" action="site-delete" method="post">
								<input type="hidden" name="id" value=${n.id }>
								<button class="btn waves-effect waves-light" type="submit"
									name="action">삭제</button>
							</form>

							<form action="site-edit?c=${n.id}" method="post">
								<input type="hidden" name="id" value=${n.id }>
								<button class="btn waves-effect waves-light" type="submit" name="action">수정</button>
							</form>
						 <a class="back" href="">
				</c:if>
              <button class="btn waves-effect waves-light list-btn" type="submit" name="action">목록</button>
               </a> 
               <script>
                  $(document).ready(function(){                           
                     $(".list-btn").on("click",function(){
                        $('.back').prop('href', history.back());
                     });
                  });
               </script>

					</div>
	
		</div>

			</div>
			</div>
			</div>
</div>

	
	
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
<!-----------------------------------------목록버튼--------------------------------------------->
$(document).ready(function(){									
	$(".list-btn").on("click",function(){
		$('.back').prop('href', history.back());
	});
});
<!-----------------------------------------좋아요--------------------------------------------->
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
	
	
		
		$.post("siteBoard-comment-add", data, function(z) {

			if(z =="1"){

				page(1);
				text.val('');
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
								 .append($('<a class="del waves-effect waves-light" onclick="onDelete('+obj[i].id+ ');" value='+obj[i].id+'><i class="material-icons">clear</i></a>')));
						}
						else{
							$("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
									 .append($('<img src='+ src   +' class="circle"> '))
									 .append($('<span class="title">'+obj[i].memberId+'</span>'))
									 .append($('<time>'+js_yyyy_mm_dd_hh_mm_ss(obj[i].regDate)+'</time>'))
									 .append($('<p>'+obj[i].content+'</p>')));
						} 
					}
			 	   $("#commentList img").error(function() {
			 
				         this.src ="${root}/resource/images/avatar.png";
				      }); 
			 	 
			    	
			    	
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