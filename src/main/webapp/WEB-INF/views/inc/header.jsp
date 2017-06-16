<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
#header {
	background-color: #555;
}

.flex {
	display: flex;
}

.flex.end {
	justify-content: space-between;
}

.flex nav {
	box-shadow: none;
}

.logo-icon {
	text-align: center;
}

.logo {
	transition: background-color .3s;
	font-size: 1rem;
	color: #fff;
	padding: 0 5px;
	cursor: pointer;
	font-weight: bold;
}

.logo .que {
	height: auto;
	vertical-align: text-bottom;
}

.logo.font {
	margin-left: 10px;
}

.login.input {
	/* background-color:mediumvioletred; */
	background-color: #892E65;
	/* border-left:1px solid #E1E1E1; */
}

.login.loge {
	/* background-color:mediumturquoise; */
	background-color: #2E8965;
}

.login.lock {
	/* background-color:#892E65; */
	background-color: #555;
	/* border-left:1px solid white; */
}

.login.pin {
	/* background:#81b344; */
	background-color: #62A8D1;
}

.login {
	font-family: "open sans", "Helvetica", "Arial", sans-serif;
	transition: background-color .3s;
	font-size: 1rem;
	color: #fff;
	display: block;
	padding: 0 15px;
	cursor: pointer;
}

.singin {
	transition: background-color .3s;
	font-size: 1rem;
	color: #fff;
	display: block;
	padding: 0 15px;
	cursor: pointer;
}

.board {
	transition: background-color .3s;
	font-size: 1rem;
	color: #616161;
	display: block;
	padding: 0 15px;
	cursor: pointer;
}

.font {
	font-size: 1rem;
	color: #fff;
	letter-spacing: 0px;
}

.personal {
	display: flex;
	align-items: center;
}

.personal .tiny {
	margin-left: 3px;
}

nav ul li.active {
	/* background-color: yellow; */
	
}
</style>

<header id="header">

	<div class="flex end">

		<a href="#" data-activates="nav-mobile"
			class="button-collapse top-nav full hide-on-large-only"> <i
			class="material-icons">menu</i>
		</a> <span class="logo-icon"> <a href="${root }/main/index"
			class="logo font"> 로고로고 </a>
		</span>
		<security:authentication property="authorities" var="auths" />
		<security:authentication property="name" var="name" />

		<div class="flex">
			<div>
				<nav>
					<div class="nav-wrapper">
						<ul class="center menubar">
							<c:choose>
								<c:when test="${not empty noticeboard  }">
									<li class="active"><a class="board "
										href="../noticeboard/noticeboard">Notice</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="board " href="../noticeboard/noticeboard">Notice</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${not empty siteboard  }">
									<li class="active"><a class="board "
										href="../siteboard/siteboard">Site</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="board " href="../siteboard/siteboard">Site</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${not empty freeboard  }">
									<li class="active"><a class="board "
										href="../freeboard/freeboard">Free</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="board " href="../freeboard/freeboard">Free</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${not empty requestboard  }">
									<li class="active"><a class="board "
										href="../requestboard/requestboard">Request</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="board " href="../requestboard/requestboard">Request</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</nav>
			</div>
			<security:authorize access="isAnonymous()">
				<a class="login font personal loge" href="${root}/joinus/login">Login
					<i class="tiny material-icons">lock</i>
				</a>
				<%-- <a class="login font personal input" href="${root}/joinus/singin">Join 
					<i class="tiny material-icons">input</i>
				</a> --%>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<a class="login font personal pin" href="${root}/user/mypage"> <security:authentication
						property="name" /><i class="tiny material-icons">person_pin</i>
				</a>
				<a class="login font personal lock"
					href="${root}/j_spring_security_logout"> Logout <i
					class="tiny material-icons">lock_outline</i>
				</a>
			</security:authorize>
		</div>
		<%-- <div class="navbar-fixed">
			<nav>
				<div class="nav-wrapper">
					<ul class="center menubar">				
						<c:choose>
							<c:when test="${not empty requestboard  }">
								<li class="active"><a class="board " href="../requestboard/requestboard">Request</a></li>
							</c:when>										
						<c:otherwise>
								<li><a class="board " href="../requestboard/requestboard">Request</a></li>
						</c:otherwise>
						</c:choose>	
						<c:choose>
							<c:when test="${not empty freeboard  }">
								<li class="active"><a class="board " href="../freeboard/freeboard">Free</a></li>
							</c:when>
						<c:otherwise>
								<li><a class="board " href="../freeboard/freeboard">Free</a></li>
						</c:otherwise>
						</c:choose>									
						<c:choose>
							<c:when test="${not empty noticeboard  }">
								<li class="active"><a class="board " href="../noticeboard/noticeboard">Notice</a></li>
							</c:when>											
						<c:otherwise>							
	<li><a class="board " href="../noticeboard/noticeboard">Notice</a></li>
							</c:otherwise>
						</c:choose>	
					</ul>
				</div>
			</nav>
		</div> --%>
	</div>
</header>

