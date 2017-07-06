<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<!-- 구글 애드센스 신청 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-2651262364281330",
    enable_page_level_ads: true
  });
</script>
<!-- 구글 애드센스 신청 end -->

<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href="${root }/resource/css/materialize.css" 

media="screen,projection" />
<link type="text/css" rel="stylesheet"
	href="${root }/resource/css/style.css" 

media="screen,projection" />
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script
	

src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.j

s"></script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-101936918-1', 'auto');
  ga('send', 'pageview');

</script>


</head>
<style>

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@font-face{
   font-family: 'aritta';
   src: url('${root }/resource/fonts/아리따-돋움(TTF)-Light.ttf') format('truetype');
}

body{ 
background-color: #FAFAFA !important;
font-family: 'Nanum Gothic Coding', serif;
font-size:16px;
}

.aritta{
	font-family:'aritta';
}

#main{
	background-image: url(${root }/resource/images/back.png);
}
@media screen and (max-width: 640px){
	.ad-side{
		display: none;
	}
	
	.ad-side-right{
	  	display: none;
	}
	
	.banner-tab-mobil-bottom{
	
	    display: block;
	}
}

.ad-side{
position: absolute;
    top: 930px;
    width: 160px;
    height: 600px;
    left: 40%;
    margin: 0px 0 0 -770px;
    z-index: 2;
}

.ad-side-right{
    position: absolute;
    top: 930px;
    width: 160px;
    height: 600px;
    left: 50%;
    margin: 0px 0 0 647px;
    z-index: 2;
}

.banner-tab-mobil-bottom{
    margin-top: 8px;
    display: none;
}

</style>
<body>

	<!-- <div class="wrapper">	 -->
	<div>
		<tiles:insertAttribute name="header" />
	</div>
	<div>
		<tiles:insertAttribute name="main" />
	</div>
	<div class="banner-tab-mobil-bottom">
		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<!-- ad-mb -->
		<ins class="adsbygoogle"
		     style="display:inline-block;width:320px;height:100px"
		     data-ad-client="ca-pub-2651262364281330"
		     data-ad-slot="8634278207"></ins>
		<script>
		(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</div>
	<div>
		<tiles:insertAttribute name="footer" />
	</div>
	
	<div class ="ad-side">
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<!-- ad -->
	<ins class="adsbygoogle"
	     style="display:inline-block;width:300px;height:600px"
	     data-ad-client="ca-pub-2651262364281330"
	     data-ad-slot="4461430600"></ins>
	<script>
	(adsbygoogle = window.adsbygoogle || []).push({});
	</script>
	</div>
	<div class ="ad-side-right">
		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<!-- ad right -->
		<ins class="adsbygoogle"
		     style="display:inline-block;width:300px;height:600px"
		     data-ad-client="ca-pub-2651262364281330"
		     data-ad-slot="1250612200"></ins>
		<script>
		(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</div>	
	<!-- 풋터 -->
	<!-- Modal Structure -->
	<div id="modal1" class="modal">
		<div class="modal-content">
			<h4>Modal Header</h4>
			<p>A bunch of text</p>
		</div>
		<div class="modal-footer">
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
		</div>
	</div>
	<!--Import jQuery before materialize.js-->

	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${root }/resource/js/materialize.min.js"></script>
	<script type="text/javascript">
      $(".button-collapse").sideNav();
      $('.modal').modal();
      </script>
</body>
</html>
