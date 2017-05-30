<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>	
<style type="text/css">
* {margin:0;padding:0;}
#scroll {height:30px;}
</style>
<script type="text/javascript">
function textScroll(scroll_el_id) {
    this.objElement = document.getElementById(scroll_el_id);
    this.objElement.style.position = 'relative';
    this.objElement.style.overflow = 'hidden';

    this.objLi = this.objElement.getElementsByTagName('li');
    this.height = this.objElement.offsetHeight; // li 엘리먼트가 움직이는 높이(외부에서 변경가능)
    this.num = this.objLi.length; // li 엘리먼트의 총 갯수
    this.totalHeight = this.height*this.num; // 총 높이
    this.scrollspeed = 2; // 스크롤되는 px
    this.objTop = new Array(); // 각 li의 top 위치를 저장
    this.timer = null;
    
    for(var i=0; i<this.num; i++){
        this.objLi[i].style.position = 'absolute';
        this.objTop[i] = this.height*i;
        this.objLi[i].style.top = this.objTop[i]+"px";
    }
}

textScroll.prototype.move = function(){
    for(var i=0; i<this.num; i++) {
        this.objTop[i] = this.objTop[i] - this.scrollspeed;
        this.objLi[i].style.top = this.objTop[i]+"px";
    }
    if(this.objTop[0]%this.height == 0){
        this.jump();
    }else{
        clearTimeout(this.timer);
        this.timer = setTimeout(this.name+".move()",50);
    }
}

textScroll.prototype.jump = function(){
    for(var i=0; i<this.num; i++){
        if(this.objTop[i] == this.height*(-2)){
            this.objTop[i] = this.objTop[i] + this.totalHeight;
            this.objLi[i].style.top = this.objTop[i]+"px";
        }
    }
    clearTimeout(this.timer);
    this.timer = setTimeout(this.name+".move()",3000);
}

textScroll.prototype.start = function() {
    this.timer = setTimeout(this.name+".move()",3000);
}
</script>



<!-- li 엘리먼트들이 position:absolute 되므로 ul 엘리먼트에는 height 값이 있어야 합니다 --> 

					
			<main id="main">
			
<ul id="scroll">
<c:forEach var="m" items="${noticelist}">
    <li><a href="../noticeboard/notice-detail?c=${m.id}">${m.title}</a></li>
</c:forEach>    
</ul>

			
			<div class="col-xs-12 col-md-8">

				<div class="col s12">
					<ul class="tabs">
						<li class="tab col s3"><a target="_self" href="index">최신순</a></li>
						<li class="tab col s3"> <a target="_self"" href="index2">점수순</a></li>
						<li class="tab col s3"> <a target="_self"" href="index3">댓글순</a></li>
					</ul>
				</div>
 	
<%--     <div id="test1" class="col s12 collection">
                    <c:forEach var="n" items="${sitelist}">
                    <a href="../siteboard/site-detail?c=${n.id}" class="collection-item">${n.title} [${n.countcomment }]</a>
                    </c:forEach>
    </div> --%>
    
    

      <table class="highlight">
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
         	 <tr>    
		            <td>${n.id}</td>
		            <td class="orange-text text-accent-3"><a href="../siteboard/site-detail?c=${n.id}">${n.title}</a>[${n.countcomment }]</td>
		            <td>${n.memberId }</td>
		            <td>${n.hit }</td>
		            <td><fmt:formatDate value="${n.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					
          		</tr>
          	</c:forEach>	
          </tbody>
          </table>
  </div>
                
                
                
            <fmt:parseNumber var="sizeInt" integerOnly="true" value="${size/10 }" />
            <c:set var="last" value="${(size%10)>0 ? sizeInt+1 : sizeInt }" />
            <div>${empty param.p ? 1 : param.p}/${last }pages  </div>
            <div>${size}</div>
                <ul class="pagination center">
                    <li class="disabled">
                            <c:if test="${param.p-1>0 }">
                            <a href="?p=${param.p-1 }&q=${parma.q}"><i
                            class="material-icons">chevron_left</i></a></c:if></li>        
                    <%-- <li class="active"><a href="?p=1&q=${param.q}">1</a></li> --%>
                <c:forEach var="i" begin="1" end="${last }"> 
                  <li class="waves-effect"><a href="?p=${i }&q=${param.q}">${i }</a></li> 
                 </c:forEach> 
                    <li class="waves-effect">
                            <c:if test="${param.p+1<=last }">
                            <a href="?p=${param.p+1 }&q=${param.q}"><i
                            class="material-icons">chevron_right</i></a>
                            </c:if></li>
                </ul>
                			
			</div>
			
			<a class="sitego" href="">(세은)사이트 글쓰기로 가는 것</a>
			<input class="sitein" type="hidden" name="memberId" value=<security:authentication property="name"/>>
			<script>
			$(document).ready(function(){
				$('.sitego').on('click', function(){
					
					var value = $('.sitein').val();

					alert(value);
					alert(typeof value);
					
					if(value=='anonymousUser')
					{
						alert("로그인을 한 회원만 이용이 가능합니다.");
						$('.sitego').prop('href', "../joinus/login");
					}
				 	else{
				 		$('.sitego').prop('href', "../siteboard/site-reg");
					}    
 
				});
			});
			
			</script>
 
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">

         </script>
			<script>
			$(".pagination").on('click','li',function(){
    // remove classname 'active' from all li who already has classname 'active'
    $(".pagination li.active").removeClass("active"); 
    // adding classname 'active' to current click li 
    $(this).addClass("active"); 
});
			</script>			
			
	<!-- -------------------------------랜덤 페이지--------------------------------- -->
	<table class="table">
		<thead>
			<tr>
				<td colspan="4">
					<nav>
						<div class="nav-wrapper">
							<div class="col s12">
								<a href="#!" class="breadcrumb big-category">${b }</a> 
								<a href="#!" class="breadcrumb small-category">${s }</a>
							</div>
						</div>
					</nav>
				</td>
			</tr>
			<tr>
				<td class="title" colspan="4">${random.title }</td>
				<td class="hidden">즐겨찾기</td>
			</tr>
			<tr class="reg-like">
				<td class="detail-font" colspan="4" class="reg-date"><i class="tiny material-icons">schedule</i>${random.regDate }</td>
			</tr>
			<tr>
				<td class="detail-font" colspan="4"><i class="tiny material-icons">perm_identity</i>${random.memberId }</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="4">${random.url }</td>
			</tr>
			<tr>
				<td colspan="4">
				<a href="http://${random.url}">	
					<img src="http://api.thumbalizr.com/?url=http://${random.url}&width=250" />
				</a>
				<div><a href="http://${random.url}">http://${random.url}</a></div>
				</td>
			</tr>
			<tr>
				<td colspan="4">${random.content }</td>
			</tr>
			<tr>
				<td colspan="4">
				<c:forEach var="tag" items="${t }">
				<div class="chip">${tag }</div>
				</c:forEach>
				</td>			
			</tr>
			</tbody>
			</table>
			
			</main>
			
			
<script type="text/javascript">
var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
real_search_keyword.start(); // 스크롤링 시작
</script>
<script>
$(document).ready(function(){
    $('ul.tabs').tabs('select_tab', '#test1');
  });
 </script>