<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

@import
	url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

* {
	margin: 0;
	padding: 0;
}
/*------------------------- 메인 테이블 부분 ----------------------------------*/
#main .table {
	border-radius: 2px;
	width: 100%;
	background: none;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0
		rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.table * {
	text-align: center;
}

.table .table-title {
	text-align: left;
}

.table .table-title a {
	color: #505050;
}

.table-head {
	font-family: 'Jeju Gothic', serif;
	font: menu;
	border-bottom: 1px solid #e9e9e9;
}

.table-body {
	text-align: center;
	font: 14px;
}

.table-body {
	font-family: 'Nanum Gothic Coding', serif;
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
	margin-top: 20px;
	display: flex;
	justify-content: flex-end;
	font-family: 'Nanum Gothic Coding', serif;
}

.board-title {
	
}

.head-tr {
	background: rgba(84, 135, 164, 0.3);
}

.pagination{
	margin-bottom: 10px;
}

 /* ----------------------검색창 수정------------ */
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
background: #dd5d58;
/* box-shadow: 0px 0px 0px 2px rgba(255,255,255,0.90); */
  transition: width 0.5s cubic-bezier(0.65, -0.5, 0.4, 1.5);
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
</style>

<div>
	<label class="board-title">Notice Board</label>
</div>

<main id="main">
<div class="container">
	<table border="1" class="highlight table">
		<thead class="table-head">
			<tr class="head-tr">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회 수</th>
				<th>작성 날짜</th>
			</tr>
		</thead>
		<tbody class="table-body">

			<c:forEach var="mem" begin="${(page*10)-10 }" end="${page*10-1 }"
				items="${list}">

				<tr>

					<td>${mem.id}</td>
					<td class="orange-text text-accent-3 table-title"><a
						href="notice-detail?c=${mem.id}&p=${page}">${mem.title}</a></td>
					<td>${mem.memberId }</td>
					<td>${mem.hit }</td>
					<td><fmt:formatDate value="${mem.regDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="site-button">
		<a class="waves-effect waves-light btn sitego"
			href="/WiynPrj/noticeboard/notice-reg?p=${page }">
			<div class="write">
				Write <i class="tiny material-icons">mode_edit</i>
			</div>
		</a>
	</div>

	<div align="center">
		<ul class="pagination">

			<c:if test="${((listPerFive-1)*5 + 5) > 1 }">
				<li class="waves-effect"><a
					href="noticeboard?p=${(listPerFive-1)*5 + 5 }"><i
						class="material-icons">chevron_left</i></a></li>
			</c:if>

			<c:forEach var="p_cnt" begin="${(listPerFive*5) + 1 }"
				end="${checkLast }">
				<c:choose>
					<c:when test="${page eq p_cnt }">
						<li class="waves-effect active" id="${p_cnt }"><a
							href="noticeboard?p=${p_cnt }">${p_cnt }</a></li>
					</c:when>

					<c:otherwise>
						<li class="waves-effect" id="${p_cnt }"><a
							href="noticeboard?p=${p_cnt }">${p_cnt }</a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>

			<c:if test="${cnt > ((listPerFive+1)*5 ) }">
				<li class="waves-effect"><a
					href="noticeboard?p=${(listPerFive+1)*5 + 1 }"><i
						class="material-icons">chevron_right</i></a></li>
			</c:if>

		</ul>

	</div>
</div>

<form class="searchbar1" action="http://localhost/WiynPrj/siteboard/siteboard" method="GET">
  <div class="broker-expanding-search" data-expanding-search>
    <div class="broker-expanding-search__column broker-expanding-search__column--left">
       <input type="hidden" name="p" value="1" />
       <input name="q" type="text" class="broker-expanding-search__input broker-expanding-search__input--text" value="${param.q}" placeholder="Siteboard Search" data-expanding-search-text>
    </div>
    <div class="broker-expanding-search__column broker-expanding-search__column--right">
      <input type="submit" class="broker-expanding-search__input broker-expanding-search__input--submit" value="Search" data-expanding-search-button>
    </div>
  </div>
</form>
				
	<script>
 $(document).ready(function() {
	 
	  // toggle search bar and disable request if blank...
	  $('[data-expanding-search-button]').on('click', function() {
	    var parent = $(this).closest('[data-expanding-search]');
	    if (parent.find('[data-expanding-search-text]').val() === '${param.q}') {
	      parent.toggleClass('broker-expanding-search--open');
	      return false;
	    }
	  });
	 
	});
</script>
</main>











