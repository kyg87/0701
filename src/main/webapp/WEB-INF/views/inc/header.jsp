<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

body{
	/* background-color:#F6F4F1; */
	background: #fff;
}

#header nav{
	background:#fff;
	color: #616161 !important; 
	border:1px solid #f2f2f2;
}

.header{
	 background: #455f8c;
}

.logo-icon{
	text-align: center;
}

.logo{
	transition: background-color .3s;
    font-size: 1rem;
    color: #fff;
    padding: 0 5px;
    cursor: pointer;
    font-weight: bold;
}

.logo .que{
	height: auto;
	vertical-align: text-bottom;
}

.logo.font{
	margin-left:10px;
}

.login.input{
	background-color:mediumvioletred;
	border-left:1px solid white;
}

.login.loge{
	background-color:mediumturquoise;
}

.login.lock{
	background-color:#892E65;
	border-left:1px solid white;
}

.login.pin{
	background:#81b344;
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
	margin-left:3px;
}
</style>

<header id="header">
	<div class="header">
	
		<a href="#" data-activates="nav-mobile"
			class="button-collapse top-nav full hide-on-large-only"> <i
			class="material-icons">menu</i>
		</a> <span class="logo-icon"> <a href="${root }/main/index"
			class="logo font"> What is your needs <i
				class="small material-icons que">live_help</i>
		</a>
		</span>

		<security:authentication property="authorities" var="auths" />
		<security:authentication property="name" var="name" />

		<security:authorize access="isAnonymous()">
			<a class="login font personal input" href="${root}/joinus/singin">
				Join <i class="tiny material-icons">input</i>
			</a>
			<a class="login font personal loge" href="${root}/joinus/login">
				Login <i class="tiny material-icons">lock</i>
			</a>
		</security:authorize>

		<security:authorize access="isAuthenticated()">
			<a class="login font personal lock"
				href="${root}/j_spring_security_logout"> Logout <i
				class="tiny material-icons">lock_outline</i>
			</a>
			<a class="login font personal pin" href="${root}/user/mypage"> <security:authentication
					property="name" /> <i class="tiny material-icons">person_pin</i>
			</a>
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

	