<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Starter Template - Materialize</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="/WiynPrj/resource/css/materialize.css" type="text/css"
	rel="stylesheet" media="screen,projection" />

<link href="/WiynPrj/resource/css/main222.css" type="text/css"
	rel="stylesheet" media="screen,projection" />


</head>
<body>


	<header>
		<nav class="nav-extended">
			<div class="nav-wrapper">
				<a href="#" class="brand-logo">Logo</a> <a href="#"
					data-activates="mobile-demo" class="button-collapse"><i
					class="material-icons">menu</i></a>
				<ul id="nav-mobile" class="right hide-on-med-and-down">
					<li><a href="">Sass</a></li>
					<li><a href="">Components</a></li>
					<li><a class="waves-effect waves-light btn" href="#modal1">Login</a></li>
				</ul>
				<ul class="side-nav" id="mobile-demo">
					<li><a href="">Sass</a></li>
					<li><a href="">Components</a></li>
					<li><a href="">JavaScript</a></li>
				</ul>
			</div>
			<div class="nav-content">
				<ul class="tabs tabs-transparent">
					<li class="tab"><a href="">공지사항</a></li>
					<li class="tab"><a class="active" href="">자유게시판</a></li>
					<li class="tab"><a href="">요청게시판</a></li>
					<div class="indicator" style="right: 988px; left: 104px;"></div>
				</ul>
			</div>
		</nav>
	</header>
	
	<security:authentication property="authorities" var="auths"/>
	<security:authentication property="name" var="name" />
	<div>
		id : ${name} <br />
		<c:forEach var="role" items="${auths}">
					role : ${role}<br />
		</c:forEach>
	</div>
	<ul>
		<li><a href="${root}/index">HOME</a></li>
		<security:authorize access="isAnonymous()">
			<li><a href="${root}/login">로그인</a></li>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
			<li><a href="${root}/j_spring_security_logout"> <security:authentication
						property="name" />님 로그아웃
			</a></li>
		</security:authorize>
	</ul>
	<h1>로그인${validate}</h1>
	<form action="${root}/j_spring_security_check" method="post">
		<fieldset>
			<table>
				<c:if test="${not empty validate && not validate}">
				<tr>
					<td colspan="2" style="color:red;">아이디 도는 비번이 유효하지 않습니다.</td>
				</tr>
				</c:if>
				<tr>
					<th>아이디 :</th>
					<td><input name="j_username" type="text" /></td>
				</tr>
				<tr>
					<th>비밀번호 :</th>
					<td><input name="j_password" type="password" /></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="로그인" />
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
	
	<!-- 	<div id="test1" class="col s12">Test 1</div>
	<div id="test2" class="col s12">Test 2</div>
	<div id="test3" class="col s12">Test 3</div>
	<div id="test4" class="col s12">Test 4</div> -->

	<div class="container">
		<div class="row">
			
			<div class="col-xs-12 col-md-8">

				<div class="col s12">
					<ul class="tabs">
						<li class="tab col s3"><a href="#test1">최신순</a></li>
						<li class="tab col s3"><a class="active" href="#test2">점수순</a></li>

						<li class="tab col s3"><a href="#test4">댓글순</a></li>
					</ul>
				</div>


				<table class="striped">
					<thead>
						<tr>
							<th>Option Name</th>
							<th>설명</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>inDuration</td>
							<td>The duration of the transition enter in milliseconds.
								Default: 300 [1]</td>
							<td><img alt="" src="/WiynPrj/resource/images/1.jpg">
							</td>

						</tr>
						<tr>
							<td>outDuration</td>
							<td>The duration of the transition out in milliseconds.
								Default: 225 [2]</td>
							<td><img alt="" src="/WiynPrj/resource/images/1.jpg">
							</td>
						</tr>
						<tr>
							<td>constrainWidth</td>
							<td>If true, constrainWidth to the size of the dropdown
								activator. Default: true [1]</td>
							<td><img alt="" src="/WiynPrj/resource/images/1.jpg">
							</td>
						</tr>

					</tbody>
				</table>

				<ul class="pagination center">
					<li class="disabled"><a href="#!"><i
							class="material-icons">chevron_left</i></a></li>
					<li class="active"><a href="#!">1</a></li>
					<li class="waves-effect"><a href="#!">2</a></li>
					<li class="waves-effect"><a href="#!">3</a></li>
					<li class="waves-effect"><a href="#!">4</a></li>
					<li class="waves-effect"><a href="#!">5</a></li>
					<li class="waves-effect"><a href="#!"><i
							class="material-icons">chevron_right</i></a></li>
				</ul>
			</div>



		</div>
	</div>




	<!-- 로그인 창 -->
	<!-- Modal Structure -->
	<div id="modal1" class="modal">
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
					<input type="submit" value="로그인" />
				</div>

				<div>

					<a class="waves-effect waves-light btn" href="#modal2">회원가입</a>
				</div>
			</form>
		</div>
	</div>


	<!-- 회원가입 모달 창 -->
	<!-- Modal Structure -->
	<div id="modal2" class="modal">
		<div class="modal-content">
			<form id="myForm" action="joinus/singIn" method="post">
				<h4>Modal Header</h4>
				<div class="row">
					<div class="input-field col s12">
						<input name="email1" id="email1" type="email" class="validate" required="required" > <label
							for="email" >Email</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="pass" id="pass" type="password" class="validate" required="required"> <label
							for="password">Password</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<input id="pass1" type="password" class="validate" required="required"> <label
							for="password">Password</label>
					</div>
				</div>

				<div>

					<input id="btn1" type="button" class="waves-effect waves-light btn"
						value="가입하기" >

				</div>
			</form>
		</div>
	</div>
	<!-- end 회원가입 모달 창 -->



	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="/WiynPrj/resource/js/materialize.js"></script>
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
</body>
</html>
