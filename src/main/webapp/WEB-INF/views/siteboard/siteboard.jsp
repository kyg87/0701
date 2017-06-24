<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<jsp:useBean id="now" class="java.util.Date" />

<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

@import
	url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);


#breadcrumb {
  list-style: none;
  display: inline-block;
}
#breadcrumb .icon {
  font-size: 14px;
}
#breadcrumb li {
}
#breadcrumb li a {
  color: #FFF;
  display: block;
  background: #3498db;
  text-decoration: none;
  position: relative;
  height: 40px;
  line-height: 40px;
  padding: 0 10px 0 5px;
  text-align: center;
  margin-right: 23px;
}
#breadcrumb li:nth-child(even) a {
  background-color: #2980b9;
}
#breadcrumb li:nth-child(even) a:before {
  border-color: #2980b9;
  border-left-color: transparent;
}
#breadcrumb li:nth-child(even) a:after {
  border-left-color: #2980b9;
  }
#breadcrumb li:first-child a {
  padding-left: 15px;
  -moz-border-radius: 4px 0 0 4px;
  -webkit-border-radius: 4px;
  border-radius: 4px 0 0 4px;
}
#breadcrumb li:first-child a:before {
  border: none;
}
#breadcrumb li:last-child a {
  padding-right: 15px;
  -moz-border-radius: 0 4px 4px 0;
  -webkit-border-radius: 0;
  border-radius: 0 4px 4px 0;
}
#breadcrumb li:last-child a:after {
  border: none;
}
#breadcrumb li a:before, #breadcrumb li a:after {
  content: "";
  position: absolute;
  top: 0;
  border: 0 solid #3498db;
  border-width: 20px 10px;
  width: 0;
  height: 0;
}
#breadcrumb li a:before {
  left: -20px;
  border-left-color: transparent;
}
#breadcrumb li a:after {
  left: 100%;
  border-color: transparent;
  border-left-color: #3498db;
}
#breadcrumb li a:hover {
  background-color: #1abc9c;
}
#breadcrumb li a:hover:before {
  border-color: #1abc9c;
  border-left-color: transparent;
}
#breadcrumb li a:hover:after {
  border-left-color: #1abc9c;
}
#breadcrumb li a:active {
  background-color: #16a085;
}
#breadcrumb li a:active:before {
  border-color: #16a085;
  border-left-color: transparent;
}
#breadcrumb li a:active:after {
  border-left-color: #16a085;
}

.collection .collection-item:not(.active):hover {
    background-color: #ddd;
}

.site-list{
box-shadow: 0 2px 2px 0 rgba(0,0,0,0.12);
}


.mvaside{
	display: flex;
	width: 100%;
}

.collection{
	border:none;
	margin:0px;
	margin-right: 30px;
}

.main-div{
	width:100%;
}

.table{
	background-color:#fff;  
}


.sitego {
	background: rgba(27, 80, 162, 0.69);
}

.sitego:hover {
	background: rgba(23, 56, 125, 0.79);
}

.write {
	display: flex;
}

.site-button {
	margin-top: 10px;
	display: flex;
	justify-content: flex-end;
	font-family: 'Nanum Gothic Coding', serif;
}

#breadcrumb{
	display:flex;
}



.broker-expanding-search,
.broker-expanding-search *,
.broker-expanding-search *:after,
.broker-expanding-search *:before {
  box-sizing: border-box;
}

.broker-expanding-search {
  display: table;
  table-layout: fixed;
  width: 50px;
  margin: 0;
  border-radius: 40px;
  overflow: hidden;
/* background: #dd5d58;
/* box-shadow: 0px 0px 0px 2px rgba(255,255,255,0.90); */ */
  transition: width 0.5s cubic-bezier(0.65, -0.5, 0.4, 1.5);
  
  background: #337ab7;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.broker-expanding-search--open {
  width: 250px;
}

.broker-expanding-search__column {
  display: table-cell;
  vertical-align: top;
}

.broker-expanding-search__column--left {
  width: 100%;
  padding-left: 15px;
}

.broker-expanding-search__column--right {
  width: 50px;
}

.broker-expanding-search__input {
  display: block;
  margin: 0;
  padding: 0;
  display: block;
  border: none;
  outline: none;
  color: white;
  border-radius: 0;
  background: none;
  font-size: 16px;
}

.broker-expanding-search__input--text {
  width: 100%;
  height: 50px;
  line-height: 50px;
}

.broker-expanding-search__input--submit {
  font-size: 0;
  width: 50px;
  height: 50px;
  cursor: pointer;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: 50px 50px;
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAABUCAMAAAArteDzAAAB7FBMVEX////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////zN5IfAAAAo3RSTlMAAQIDBAUGBwgJCgsNDg8QERITFhcaGxweICIjJCUoKSorLC0uLzIzNjc4OTo7PD5AREVGSEpLTE5PUFFSU1RVVldYWl1eX2BjZGZoaWtsbW5vcHZ5fH6AgYKDhYqNjo+Vl5ucoaKjpqerrq+wsbW3ubzCw8TGx8jJysvMzc7P0NHT1NXW19na3ODi4+Xm6Onq6+zt7vDx8vP09vf4+fr7/P3+BP089AAAAiVJREFUGBntwflbTFEABuAvyVQixGTLlCVRdg0RDVKWlJAsSQoJKRXRoFJiVMzQYumSvn9U95yZVHP1POd0f/G47wuHw+FwOP5ZsZtKbz14/OTRvSqvG/ZwX/KPM2KoIS8W87bsWpAztedhnrx9jHZ7CeajbJxWXmyAvuv8i/4c6KrglPFBf1vPCKd88ECPlxGdFzYmA3Gr9taNMOzlYuhY0U8pWBKPiLS7DKuCjpuUujyYrsSgMLYZ6tZ+pdCxEjMdNyjUQ90NCu/dmO0chR8ZUJUUoFCAaE0UrkDVDgqtMYi2m4I/BoouUyiGBVcvTUMpUFRP0/c1sFJD08QWKGqlKZAIKycpeKGom6ZXC2BlJ4VCKOqjqQOWtlE4A0WdNPUshJV9FE5AUTNNoeWwcpHCLiiqpWkiC1YaaTLWQ9FpCtWwkDpC02ASFKX9pCmYgmjlFB5CVUwLhVpEcX+kUARlRZSKMYurmcJAMpQlvKUwlo8ZXHcoVUBDPqVflYvwR0YLpeeJ0NHAsPZDcZBWXx1mWAW0pLxjRHd18cHcI+fvf+aUUR+0ZIY4B6MAWrIHOYex/dCS1sY5fDkKLfGVo5ztWdkwJcMHPZ6aT5yuuyQBe4YpGT5oSj3bNEDhW2/dARcm5YQoGQXQtnTr4cJTx3LXxSEsO0TJ8ME+WQFKhhf2SQ9Q8sNG6QEKA7BTRpCmN7DV9iAnlcNemY2vn5bC4XA4HI7/3m/UtMhMrbR7mQAAAABJRU5ErkJggg==);
}
/* ----------------------검색창 수정------------ */
.searchbar1 input[type=text]{
  font-family: Verdana, Geneva, sans-serif;
  color:white;
  margin: 0 0 0 0;

}
.searchbar1{
	position: fixed;
	bottom: 50px;
	right: 50px;
}
/* ---------------------------------------------- */


.caption{
	position:absolute;
	
	left:0;
	padding:10px 20px 20px 20px;
	background:7f7f7f;
	background: rgba(0,0,0,0.5);
	width:100%;
	max-height:32%;
	

}


.slider .slides li .caption {
    
    width: 100%;
    left: 0px;
    top: auto;
    bottom:0;
    }
    
    
    
    
    
 .collection {
    margin: 0px;
    /* margin-right: 30px; */
    background-color: #fff;
}

.collection.with-header .collection-item {
	height:270px;
    width: 100%;
}

.best{
	box-shadow: 0 2px 2px 0 rgba(0,0,0,0.12);
	margin-bottom:40px;
}

.collection .collection-item {
   border-bottom: none;
}
</style>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<main id="main">
<form class="searchbar1" action="http://localhost/WiynPrj/siteboard/siteboard" method="GET">
  <div class="broker-expanding-search" data-expanding-search>
    <div class="broker-expanding-search__column broker-expanding-search__column--left">
       <input type="hidden" name="p" value="1" />
       <input name="q" type="text" class="broker-expanding-search__input broker-expanding-search__input--text" value="${param.q}" placeholder="Search" data-expanding-search-text>
    </div>
    <div class="broker-expanding-search__column broker-expanding-search__column--right">
      <input type="submit" class="broker-expanding-search__input broker-expanding-search__input--submit" value="Search" data-expanding-search-button>
    </div>
  </div>
</form>

<div style="display: none"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> </div>
    
    <div class="col-xs-12 col-md-8 container">
	<div class="flex">		
		<div class="main-div">
		 <c:choose>
 	<c:when test="${empty param.bigCa  }">
 <ul id="breadcrumb">
  <li><a href="siteboard?p=1"><span class="icon icon-home"> </span></a></li>
</ul>
 	</c:when>
 
 	<c:otherwise>
 	<ul id="breadcrumb">
  <li><a href="siteboard?p=1"><span class="icon icon-home"> </span></a></li>
  <li><a href="?p=1&q=&bigCa=${param.bigCa}"><span class="icon icon-double-angle-right"> </span> <input type="hidden" value="${param.bigCa}" />${bn.name}</a></li>
  <c:choose>
  <c:when test="${empty param.smallCa}">
  </c:when>
  <c:otherwise>
  <li><a href="?p=1&q=&bigCa=${param.bigCa}&smallCa=${param.smallCa}"><span class="icon icon-double-angle-right"></span> <input type="hidden"  value="${param.smallCa }" />${sn.name}</a></li>
  </c:otherwise>
  </c:choose>
	</ul>
 	
	</c:otherwise>
</c:choose>
<%-- 		<div class="collection mvaside">
	    <a href="?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenew.news }</span>최신순</a>
	    <a href="siteboardlike?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenewL.news }</span>베스트 사이트</a>
	    <a href="siteboardhit?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenewH.news }</span>많이 본 사이트</a>
	  	</div> --%>
<%-- <label for="${bn.name} 베스트">${bn.name} 베스트</label> --%>
<%--    <div> 
<c:forEach var="hotlist" items="${likelist }" begin="0" varStatus="status" end="3">
  ${status.count }<a  href="site-detail?c=${hotlist.id}&p=${param.p}"><img class="activator"  src="http://api.thumbalizr.com/?url=http://${hotlist.url}&width=100%&height=100%" /></a>
</c:forEach>
</div> --%>
<%--   <div class="slider">
    <ul class="slides">
    <c:forEach var="hotlist" items="${likelist }" begin="0" varStatus="status" end="3">
      <li>
        <a  href="site-detail?c=${hotlist.id}&p=${param.p}"><img class="activator"  src="http://api.thumbalizr.com/?url=http://${hotlist.url}" /></a>
        <div class="caption center-align">
          <h3>${status.count }</h3>
          <h5 class="light grey-text text-lighten-3">${hotlist.title}</h5>
        </div>
      </li>
      </c:forEach>
    </ul>
  </div> --%>



			<div class="collection with-header best">
				<div class="collection-header">
					<h4>First Names</h4>
				</div>
				<div class="flex">
					<div class="collection-item">Alvin</div>
					<div class="collection-item">Alvin</div>
					<div class="collection-item">Alvin</div>
				</div>
			</div>



			<div class="site-list">
			<div class="collection mvaside">
	    <a href="?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenew.news }</span>최신순</a>
	    <a href="siteboardlike?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenewL.news }</span>베스트 사이트</a>
	    <a href="siteboardhit?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenewH.news }</span>많이 본 사이트</a>
	  	</div>
	     	<c:forEach var="n" items="${sitelist}">
	     	<ul class="collection">
			    <li class="collection-item avatar">
			      <img src="http://api.thumbalizr.com/?url=http://${n.url}" class="circle"/>
			      <span class="title"><a href="site-detail?c=${n.id}&p=${param.p}">${n.title}</a></span>
			      <p>${n.memberId } <br>
			      <fmt:formatDate value="${n.regDate}" pattern="yyyy.MM.dd HH:mm" />
			      </p>
			       <a href="#!" class="secondary-content center"><i class="material-icons">grade</i><div><label class="like-s">2개</label></div></a>
			    </li>
			  </ul>
			</c:forEach>
		</div>



	  	
		<%-- <table class="highlight table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="n" items="${sitelist}">
				<div style="display: none;"><fmt:formatDate value="${n.regDate}"
								pattern="yyyy-MM-dd HH:mm:ss" var="writedate" /></div>
					<tr>
						<td>${n.id}</td>
						<td class="orange-text text-accent-3 table-title"><a
							href="site-detail?c=${n.id}&p=${param.p}">${n.title}</a>[${n.countcomment }]
							<c:if test="${writedate>=today }"><img src="/WiynPrj/resource/images/new.jpg"/></c:if></td>
						<td>${n.memberId }</td>
						<td>${n.hit }</td>
						<td><fmt:formatDate value="${n.regDate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</c:forEach>
				
			</tbody>
		</table> --%>
		
<br>
<div class="site-button">
	<a class="waves-effect waves-light btn sitego" href="#">
	<div class="write">Write<i class="tiny material-icons">mode_edit</i></div>
	</a>
</div>
<fmt:parseNumber var="sizeInt" integerOnly="true" value="${size/10 }" />
<c:set var="last" value="${(size%10)>0 ? sizeInt+1 : sizeInt }" />
<%-- <div>${empty param.p ? 1 : param.p}/${last }pages</div>
<div>${size}</div> --%>
<ul class="pagination center">
	<li class="disabled"><c:if test="${((listPerFive-1)*5 + 5) > 1 }">
			<a
				href="?p=${(listPerFive-1)*5 + 5 }&q=${parma.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}"><i
				class="material-icons">chevron_left</i></a>
		</c:if></li>
	<c:forEach var="i" begin="${(listPerFive*5) + 1 }" end="${checkLast }">
		<c:choose>
			<c:when test="${i eq param.p or empty param.p and i eq '1'}">
				<li class="waves-effect  active"><a
					href="?p=${i }&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}">${i}</a></li>
			</c:when>
			<c:otherwise>
				<li class="waves-effect "><a
					href="?p=${i }&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<li class="waves-effect"><c:if test="${cnt > ((listPerFive+1)*5 + 1) }">
			<a
				href="?p=${(listPerFive+1)*5 + 1 }&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}"><i
				class="material-icons">chevron_right</i></a>
		</c:if></li>
</ul>
</div>
	</div>




<input class="sitein" type="hidden" name="memberId"
	value=<security:authentication property="name"/>>
<script>
	$(document).ready(function() {
		$('.sitego').on('click', function() {

	
 			var value = $('.sitein').val();

 			//console.log(value);
			if (value == 'anonymousUser') {
				alert("로그인을 한 회원만 이용이 가능합니다.");
				//$('.sitego').prop('href', "../joinus/login"); 
				 $('#modal10').modal('open');
			} else {
				$('.sitego').prop('href', "site-reg");
			} 

		});
	});
</script>
 <script>
 $(document).ready(function() {
	 $('.slider').slider();
	  // toggle search bar and disable request if blank...
	  $('[data-expanding-search-button]').on('click', function() {
	    var parent = $(this).closest('[data-expanding-search]');
	    if (parent.find('[data-expanding-search-text]').val() === '${param.q}') {
	      parent.toggleClass('broker-expanding-search--open');
	      return false;
	    }
	  });

	});
			$(".pagination").on('click','li',function(){
    // remove classname 'active' from all li who already has classname 'active'
    $(".pagination li.active").removeClass("active"); 
    // adding classname 'active' to current click li 
    $(this).addClass("active"); 
});
			</script>
			</div>
    </main>