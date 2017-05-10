<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<header id="header">
  <div class="header">
 
		<a href="${root }/index" class="logo">Wiyn</a> 
		
		<security:authentication property="authorities" var="auths"/>
		<security:authentication property="name" var="name" />

	<%-- 	<c:forEach var="role" items="${auths}">
			<li>role : ${role}</li>
		</c:forEach> --%>
		<a class="singin" href="${root}/joinus/singin">Singin</a>
		<security:authorize access="isAnonymous()">
			<a class="login" href="${root}/joinus/login">Login</a>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
			<a class="login" href="${root}/j_spring_security_logout"> <security:authentication
					property="name" />�떂 濡쒓렇�븘�썐
			</a>

		</security:authorize>



  <div class="navbar-fixed">
    <nav>
      <div class="nav-wrapper">
        <ul class="center menubar">
          <li><a href="#">공지사항</a></li>
          <li><a href="#">요청게시판</a></li>
          <li><a href="#">자유게시판</a></li>
        </ul>
      </div>
    </nav>
  </div>
</div>
<!-- 濡쒓렇�씤 李� -->
	<!-- Modal Structure -->
	<div id="modal10" class="modal">
		<div class="modal-content">
			<h4>Modal Header</h4>
			<h1>濡쒓렇�씤${validate}</h1>
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
					<input class="waves-effect waves-light btn" type="submit" value="濡쒓렇�씤" />
				</div>

			
			</form>
		</div>
	</div>
	


	<script type="text/javascript">
	  $(document).ready(function(){
		  
		  $("#btn1").click(function(){
			  
			  	var email = $("#email1");
		        /* var user = document.querySelector("#userInput"); */
		        
		        var pass = $("#pass");
		        var pass1 = $("#pass1");
		    
		        var myForm = $("#myForm");
		        
		        var str = email.val();//�씠硫붿씪 �뜲�씠�꽣媛�
		         
		        str = str.trim();//怨듬갚 �젣嫄�
		        
		        if(!str){
		            alert("�씠硫붿씪�쓣 �엯�젰�븯�꽭�슂");
		            email.focus();//�빐�떦�엯�젰���쑝濡� �룷而ㅼ떛
		            return;
		        }
		   
		        if(!emailcheck(str)){
		            alert("�젙�긽�쟻�씤 �씠硫붿씪�쓣 �엯�젰�븯�꽭�슂");
		            email.focus();
		            return;
		        }
		/*         if(user.value.length ==0){
		            alert("�쑀���꽕�엫�쓣 �엯�젰�븯�꽭�슂");
		            user.focus();
		            return;
		        } */
		        if(pass.val().length ==0){
		            alert("鍮꾨�踰덊샇瑜� �엯�젰�븯�꽭�슂");
		            pass.focus();
		            return;
		        }
		        
		        console.log(pass.val());
		        console.log(pass1.val());
		        //�뙣�뒪�썙�뱶 �씪移� 泥댄겕
		        if(pass.val() != pass1.val()){
		            alert("�뙣�뒪�썙�뱶媛� 媛숈� �븡�뒿�땲�떎 �솗�씤�빐二쇱꽭�슂");
		            pass.focus();
		            return;
		        }
		        myForm.submit();
			  
		  });
		  
		  /*�씠硫붿씪 �젙洹쒖떇 寃��궗*/
		    function emailcheck(strValue)
		    {
		        var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
		        //�엯�젰�쓣 �븞�뻽�쑝硫�
		        if(strValue.lenght == 0)
		        {return false;}
		        //�씠硫붿씪 �삎�떇�뿉 留욎��븡�쑝硫�
		        if (!strValue.match(regExp))
		        {return false;}
		        return true;
		    }

		});
	</script>

</header>

	