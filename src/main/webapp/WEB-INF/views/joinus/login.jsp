<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<style>
.card-content {
    position: relative;
    margin: .5rem 0 1rem 0;
    background-color: #FFD;
    transition: box-shadow .25s;
    border-radius: 2px;
        box-shadow: 0 2px 2px 0 rgba(0,0,0,0.14), 0 1px 5px 0 rgba(0,0,0,0.12), 0 3px 1px -2px rgba(0,0,0,0.2);
        
}
</style>

<script type="text/javascript">
	  $(document).ready(function(){
		  var myForm1 = $("#myForm1");
		  
	
		  $("#btn2").click(function(){
			  
			
		        myForm1.submit();
			
		  });

		});
	</script>
	
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 <main>
 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login"></div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("CpY0lAbqsJbBGpv9R49D", "http://127.0.0.1:8080/WiynPrj/joinus/callback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://127.0.0.1:8080/Wiyn");
  	naver_id_login.setState(state);
  	/* naver_id_login.setPopup(); */
  	naver_id_login.init_naver_id_login();
  </script>
  <div class="col s12 m8 offset-m2 offset-l3">
	<form id="myForm1" action="${root}/j_spring_security_check" method="post">
		<div class="card-content">
			<div class="row">
				<h4>로그인${validate}</h4>
			</div>
		
			<c:if test="${param.error !=null }">
			<p>Login Error<p/>
			<p>message: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }</p>
				${error}
	
			</c:if>
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
	
			<div class="row">
				<input id="btn2" class="waves-effect waves-light blue btn right" type="button" value="로그인" />
			</div>
		</div>
	</form>
		
 </div>
</main>




