<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	  $(document).ready(function(){
		  var myForm1 = $("#myForm1");
		  
	
		  $("#btn2").click(function(){
			  
			
		        myForm1.submit();
			
		  });
		  


		});
	</script>
	
	<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1792665164384286',
      xfbml      : true,
      version    : 'v2.9'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  
  function statusChangeCallback(response){
	  console.log('statusChangeCallback');
	  console.log(response);
	  
	  if(response.status == 'connected'){
		  //FB.logout();
		  testAPI();
	  }else if(response.status =='not_authorized'){
		  
		 document.getElementById('status').innerHTML = 'Please log' + 'into this app';
	  }
	  else{
		 document.getElementById('status').innerHTML = 'Please log' + 'into Facebook';
	  }
	
	  
  }
  
  function testAPI(){
	  console.log('Welcome!');
	  FB.api('/me',function(response){
		  console.log('Successful login for: ' + response.name);
	  	  console.log(JSON.stringify(response));
		  document.getElementById('status').innerHTML =
			  'Thanks for loggin in ' + response.name + '!';
		  
		  
		  document.getElementById("pic").src = "http://graph.facebook.com/"+response.id +"/picture?type=large";
	  	
	  });
	  
  }
  
  function checkLoginState(){
	  FB.getLoginStatus(function(response){
		 statusChangeCallback(response); 
	  });
  }
</script>
 <main>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=1792665164384286";
  fjs.parentNode.insertBefore(js, fjs);

}(document, 'script', 'facebook-jssdk'));</script>
	<h4>Modal Header</h4>
			<h1>로그인${validate}</h1>
			<form id="myForm1" action="${root}/j_spring_security_check" method="post">
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

				<div>
					<input id="btn2" class="waves-effect waves-light btn" type="button" value="로그인" />
				</div>
				
				<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"> </fb:login-button> 
			
				<img id="pic" alt="" src="ss">
				<div id="status">
			</form>
		
	
</main>





