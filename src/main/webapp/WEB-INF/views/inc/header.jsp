<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<style>
body{
	background-color:#F6F4F1;
	/* background : rgba(236,236,236,0.95); */
}

#header nav{
	/* background : rgba(236,236,236,0.95); */
	/* background: rgba(250,250,250,0.95);  */
	/* background-color:#F6F4F1; */
	background:#fff;
	color: #616161 !important; 
	border:1px solid #f2f2f2;
}

.header{
	 background: #455f8c;
	 /* background:#4a5d80; */
	 padding-right:60px;
}

.logo{
	transition: background-color .3s;
    font-size: 1rem;
    color: #fff;
    padding: 0 15px;
    cursor: pointer;
}

.login{
	font-family: "open sans","Helvetica","Arial",sans-serif;
	transition: background-color .3s;
    font-size: 1rem;
    color: #fff;
    display: block;
    padding: 0 15px;
    cursor: pointer;
}

.login.font{
	margin-left:30px;
}

.singin{
	transition: background-color .3s;
    font-size: 1rem;
    color: #fff;
    display: block;
    padding: 0 15px;
    cursor: pointer;
   
}

.board{
	transition: background-color .3s;
    font-size: 1rem;
    color:#616161 ;
    display: block;
    padding: 0 15px;
    cursor: pointer;
} 

.font{
	font-size: 1rem;
	color: #fff;
	letter-spacing: 0px; 
}

.personal{
	display:flex;
	align-items:center;
}

.personal .tiny{
	margin-right:3px;
}

</style>


<header id="header">
  <div class="header">
  
  	<a href="#" data-activates="nav-mobile"
		class="button-collapse top-nav full hide-on-large-only"><i
		class="material-icons">menu</i></a>
		
		<a href="${root }/main/index" class="logo font">WIYN</a> 
		
		<security:authentication property="authorities" var="auths"/>
		<security:authentication property="name" var="name" />
		
		<security:authorize access="isAnonymous()">
			<a class="login font" href="${root}/joinus/login">Login</a>
			<a class="login font" href="${root}/joinus/singin">Join</a>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
		<a class="login font" href="${root}/j_spring_security_logout">Logout</a>
		<a class="login font personal" href="${root}/user/mypage"><i class="tiny material-icons">person_pin</i> <security:authentication
					property="name" /> </a>
		</security:authorize>



  <div class="navbar-fixed">
    <nav>
      <div class="nav-wrapper">
        <ul class="center menubar">
        	<li><a class="board" href="../requestboard/requestboard">Request</a></li>
        	<li><a class="board" href="../freeboard/freeboard">Free</a></li>
          	<li><a class="board" href="../noticeboard/noticeboard">Notice</a></li> 
        </ul>
      </div>
    </nav>
  </div>
</div>

	

</header>

	