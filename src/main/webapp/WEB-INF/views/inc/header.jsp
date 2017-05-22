<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<style>
body{
	background : rgba(250,250,250,0.95);
	/* background: #fff3e0; */
}

nav{
	/* background : rgba(220,75,63,0.95); */
	/* background : rgba(255,147,7,0.95); */
	/* background : rgba(197,19,99,0.95); */
	/* background : rgba(192,19,97,0.95); */
	/* background: #2b90d9; */
	/* background: #d32f2f ; */
	background: rgba(250,250,250,0.95);
	color: #616161 !important; 
	border:1px solid #f2f2f2;
}

.header{
	 background: #d32f2f ;
}

.logo{
	transition: background-color .3s;
    font-size: 1rem;
    color: #fff;
    padding: 0 15px;
    cursor: pointer;
}

.login{
	transition: background-color .3s;
    font-size: 1rem;
    color: #fff;
    display: block;
    padding: 0 15px;
    cursor: pointer;
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
    letter-spacing: 2px;
}

</style>


<header id="header">
  <div class="header">
  
  	<a href="#" data-activates="nav-mobile"
		class="button-collapse top-nav full hide-on-large-only"><i
		class="material-icons">menu</i></a>
		
		<a href="${root }/main/index" class="logo">WIYN</a> 
		
		<security:authentication property="authorities" var="auths"/>
		<security:authentication property="name" var="name" />
		
		<security:authorize access="isAnonymous()">
			<a class="login" href="${root}/joinus/login">LOGIN</a>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
		<a class="login" href="${root}/j_spring_security_logout">LogOut</a>
		<a class="login" href="${root}/user/mypage"> <security:authentication
					property="name" /> MyPage</a>
	
		</security:authorize>
		
		<a class="singin" href="${root}/joinus/singin">JOIN</a>




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

	