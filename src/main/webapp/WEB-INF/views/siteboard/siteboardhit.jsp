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
.mvaside{
	left: 0px;
	
	width:20%;
}

.collection{
	border:none;
	margin:0px;
	margin-right: 30px;
}

.main-div{
	width:80%;
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
#breadcrumb {
  list-style: none;
  display: inline-block;
}
#breadcrumb .icon {
  font-size: 14px;
}
#breadcrumb li {
  float: left;
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



</style>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<main id="main">
<div style="display: none"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> </div>
    <div class="col-xs-12 col-md-8 container">
 <c:choose>
 	<c:when test="${empty param.bigCa  }">
 <ul id="breadcrumb" style="display: none;">
  <li><a href="#"><span class="icon icon-home"> </span></a></li>
  <li><a href="#"><span class="icon icon-double-angle-right"> </span> <input type="hidden" value="${param.bigCa}" />${bn.name}</a></li>
  <li><a href="#"><span class="icon icon-double-angle-right"></span> <input type="hidden"  value="${param.smallCa }" />${sn.name}</a></li>
</ul>
 	</c:when>
 
 	<c:otherwise>
 	<ul id="breadcrumb">
  <li><a href="siteboard?p=1"><span class="icon icon-home"> </span></a></li>
  <li><a href="?p=1&q=${param.q}&bigCa=${param.bigCa}"><span class="icon icon-double-angle-right"> </span> <input type="hidden" value="${param.bigCa}" />${bn.name}</a></li>
  <c:choose>
  <c:when test="${empty param.smallCa}">
  </c:when>
  <c:otherwise>
  <li><a href="?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}"><span class="icon icon-double-angle-right"></span> <input type="hidden"  value="${param.smallCa }" />${sn.name}</a></li>
  </c:otherwise>
  </c:choose>
	</ul>
 	
	</c:otherwise>
</c:choose>
	<div class="flex">
		<div class="collection mvaside">
	    <a href="siteboard?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenew.news }</span>최신순</a>
	    <a href="siteboardlike?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenewL.news }</span>베스트 사이트</a>
	    <a href="?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenewH.news }</span>많이 본 사이트</a>
	  	</div>
		
		<div class="main-div">
	<table class="highlight table">
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
				</tr>
			</c:forEach>
		</tbody>
	</table>

<br>
<div class="site-button">
	<a class="waves-effect waves-light btn sitego" href="#">
	<div class="write">Write<i class="tiny material-icons">mode_edit</i></div>
	</a>
</div>
<br>
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
		<%-- <li class="waves-effect"><a href="?p=${i }&q=${param.q}">${i }</a></li>  --%>
	</c:forEach>
	<li class="waves-effect"><c:if test="${cnt > ((listPerFive+1)*5 + 1) }">
			<a
				href="?p=${(listPerFive+1)*5 + 1 }&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}"><i
				class="material-icons">chevron_right</i></a>
		</c:if></li>
</ul>



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
			$(".pagination").on('click','li',function(){
    // remove classname 'active' from all li who already has classname 'active'
    $(".pagination li.active").removeClass("active"); 
    // adding classname 'active' to current click li 
    $(this).addClass("active"); 
});
			</script>
			</div>
    </main>