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

nav form{
	height: auto;
}
</style>

<header id="header">
	<nav>
	    <div class="nav-wrapper">
	      <a href="${root }/main/index" class="brand-logo logo font">로고로고</a>
	      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
	      <security:authentication property="authorities" var="auths" />
		  <security:authentication property="name" var="name" />
	      <ul class="right hide-on-med-and-down">
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
			<security:authorize access="isAnonymous()">
				<a class="login font personal loge" href="#modal10">Login
					<i class="tiny material-icons">lock</i>
				</a>
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
	      </ul>
	      <ul class="side-nav" id="mobile-demo">
	      			<security:authorize access="isAnonymous()">
				<a class="login font personal loge" href="${root}/joinus/login">Login
					<i class="tiny material-icons">lock</i>
				</a>
				<a class="login font personal input" href="${root}/joinus/singin">Join 
					<i class="tiny material-icons">input</i>
				</a>
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
			<form action="http://localhost:8080/WiynPrj/main/index" method="GET">
				<nav class="main-nav">
						<div class="input-field">
							<input type="hidden" name="p" value="1" /> <input name="q"
								id="search" type="search" value="${param.q}" required> <label
								class="label-icon" for="search"><i class="material-icons search-icon">search</i></label>
							<i class="material-icons">close</i>
						</div>
				</nav>
			</form>
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

    </div>\\  <!-- Modal Structure -->
  <div id="modal10" class="modal">
    <form id="myForm20" action="${root}/j_spring_security_check" method="post">
            <div class="modal-content">
                <div class="row margin">
                    <div class="input-field col s12 center">
                        <img src="${root}/resource/images/login-logo.png" alt=""
                            class="circle responsive-img valign profile-image-login">
                        <p class="center login-form-text">Material Design Admin
                            Template</p>
                    </div>
                </div>

                <c:if test="${param.error !=null }">
                    <p>Login Error
                    <p />
                    <p>message:${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }</p>
                ${error}
    
            </c:if>
                <div class="row margin">
                    <div class="input-field col s12">
                         <i class="material-icons prefix">email</i>
                         <input name="j_username" id="j_username" type="email" class="validate">
                        <label for="email" class="center-align">Email</label>
                    </div>
                <!--     <div class="input-field col s12">
                        <i class="mdi-social-person-outline prefix"></i>
                        <input id="username" type="text">
                        <label for="username" class="center-align">Username</label>
                      </div> -->
                </div>
                <div class="row margin">
                
                    <div class="input-field col s12">
                    <i class="material-icons prefix">lock_outline</i>
                        <input name="j_password" id="j_password" type="password"
                            class="validate"> <label for="password">Password</label>
                    </div>
                </div>

                <div  id="btn2" class="row">

                    <input class="btn waves-effect waves-light col s12"
                        type="button" value="LOGIN" />

                </div>
            </div>
    </form>
    
    </div>
<script type="text/javascript">
      $(document).ready(function(){
          var myForm1 = $("#myForm20");
          var j_name = $("#j_username");
          var j_pwd = $("#j_password");

        var data = myForm1.serialize();
          $("#btn2").click(function(){
    
                  console.log(j_name.val());
                  console.log(j_pwd.val());
                $.post("${root}/joinus/login", {"j_username":j_name.val(),"j_password":j_pwd.val()}, function(d) {
                 
                    if(d =='1'){
                        alert("로그인 성공했습니다.");
                        myForm1.submit();
                    }
                    else {
                        alert("아이디 또는 비빌번호가 틀렸습니다.");
                        return;
                    }
                    
        
                });
                //myForm1.submit();
            
          });

        });
    </script>
	
</header>

