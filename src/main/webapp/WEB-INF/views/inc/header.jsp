<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<header id="header">
  <div class="navbar-fixed">
 
         <nav class="navbar-color">
		<nav class="nav-extended">
		<a href="${root }/index" class="brand-logo">Wiyn</a> 
		
		<security:authentication property="authorities" var="auths"/>
		<security:authentication property="name" var="name" />


			<div class="nav-wrapper">
				
				<ul class="right hide-on-med-and-down">
					<c:forEach var="role" items="${auths}">
						<li>role : ${role}</li>
					</c:forEach>
					<security:authorize access="isAnonymous()">
						<li><a class="waves-effect waves-light btn" href="#modal10">Login</a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<li><a href="${root}/j_spring_security_logout"> <security:authentication
						property="name" />님 로그아웃
						</a></li>
						
					</security:authorize>
	
				</ul>
			</div>
			<div class="nav-content right">
				<ul class="tabs tabs-transparent">
					<li class="tab"><a href="">공지사항</a></li>
					<li class="tab"><a class="active" href="">자유게시판</a></li>
					<li class="tab"><a href="">요청게시판</a></li>
					<div class="indicator" style="right: 988px; left: 104px;"></div>
				</ul>
			</div>
			</div>
			</nav>
		</nav>
</div>

<!-- 로그인 창 -->
	<!-- Modal Structure -->
	<div id="modal10" class="modal">
		<div class="modal-content">
			<h4>Modal Header</h4>
			<h1>로그인${validate}</h1>
			<form action="${root}/j_spring_security_check" method="post">
				<div class="row">
					<div class="input-field col s12">
						<input name="j_username"  id="email" type="email" class="validate"> <label
							for="email">Email</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="j_password" id="password" type="password" class="validate"> <label
							for="password">Password</label>
					</div>
				</div>

				<div>
					<input class="waves-effect waves-light btn" type="submit" value="로그인" />
				</div>

			
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
			$('.modal').modal();
		});
		$(".button-collapse").sideNav();
	</script>

	<script type="text/javascript">
	  $(document).ready(function(){
		  
		  $("#btn1").click(function(){
			  
			  	var email = $("#email1");
		        /* var user = document.querySelector("#userInput"); */
		        
		        var pass = $("#pass");
		        var pass1 = $("#pass1");
		    
		        var myForm = $("#myForm");
		        
		        var str = email.val();//이메일 데이터값
		         
		        str = str.trim();//공백 제거
		        
		        if(!str){
		            alert("이메일을 입력하세요");
		            email.focus();//해당입력란으로 포커싱
		            return;
		        }
		   
		        if(!emailcheck(str)){
		            alert("정상적인 이메일을 입력하세요");
		            email.focus();
		            return;
		        }
		/*         if(user.value.length ==0){
		            alert("유저네임을 입력하세요");
		            user.focus();
		            return;
		        } */
		        if(pass.val().length ==0){
		            alert("비밀번호를 입력하세요");
		            pass.focus();
		            return;
		        }
		        
		        console.log(pass.val());
		        console.log(pass1.val());
		        //패스워드 일치 체크
		        if(pass.val() != pass1.val()){
		            alert("패스워드가 같지 않습니다 확인해주세요");
		            pass.focus();
		            return;
		        }
		        myForm.submit();
			  
		  });
		  
		  /*이메일 정규식 검사*/
		    function emailcheck(strValue)
		    {
		        var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
		        //입력을 안했으면
		        if(strValue.lenght == 0)
		        {return false;}
		        //이메일 형식에 맞지않으면
		        if (!strValue.match(regExp))
		        {return false;}
		        return true;
		    }

		});
	</script>

</header>

	