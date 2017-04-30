<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Starter Template - Materialize</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<link href="/WiynPrj/resource/css/materialize.css" type="text/css"rel="stylesheet" media="screen,projection" />
<link href="/WiynPrj/resource/css/style.css" type="text/css"rel="stylesheet" media="screen,projection" />
<link href="/WiynPrj/resource/css/main.css" type="text/css"rel="stylesheet" media="screen,projection" />
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

</head>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=1792665164384286";
  fjs.parentNode.insertBefore(js, fjs);

}(document, 'script', 'facebook-jssdk'));</script>
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"> </fb:login-button> 
<img id="pic" alt="" src="ss">
<div id="status">

</div>

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
  
</body>

</html>
