<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<jsp:useBean id="now" class="java.util.Date" />
<style>
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
</style>

<main id="main">
<div style="display: hidden"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> </div>
    <div class="col-xs-12 col-md-8 container">

	<h4><input type="hidden" value="${param.bigCa}" />${bn.name}</h4>
    <h5><input type="hidden"  value="${param.smallCa }" />${sn.name}</h5>

	<div class="flex">
		<div class="collection mvaside">
	    <a href="siteboard?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenew.news }</span>최신순</a>
	    <a href="?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenewL.news }</span>베스트 사이트</a>
	    <a href="siteboardhit?p=1&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}" class="collection-item"><span class="new badge">${sitenewH.news }</span>많이 본 사이트</a>
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
				<div style="display: hidden;"><fmt:formatDate value="${n.regDate}"
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