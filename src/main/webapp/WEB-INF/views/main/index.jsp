<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>			
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
<c:forEach var="n" items="${noticelist}">
    <li><a href="notice-detail?c=${n.id}">${n.title}</a></li>
</c:forEach>    
</ul>

			
			<div class="col-xs-12 col-md-8">

				<div class="col s12">
					<ul class="tabs">
						<li class="tab col s3"><a href="#test1">최신순</a></li>
						<li class="tab col s3"><a class="active" href="#test2">점수순</a></li>
						<li class="tab col s3"><a href="#test4">댓글순</a></li>
					</ul>
				</div>

                <div class="collection">
                <!-- <a href="../siteboard/siteboard" class="collection-item">Alvin</a>  -->
                    <c:forEach var="s" items="${sitelist}">
                    <a href="site-detail?c=${s.id}" class="collection-item">${s.title}</a>
                    </c:forEach>
                </div>
            <fmt:parseNumber var="sizeInt" integerOnly="true" value="${size/10 }" />
            <c:set var="last" value="${(size%10)>0 ? sizeInt+1 : sizeInt }" />
            <%-- <c:set var="last" value="${(size % 10) >= 0 ? size / 10 + 1 : size / 10}"/>     --%>
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
<!--                     <li class="waves-effect"><a href="#!">2</a></li>
                    <li class="waves-effect"><a href="#!">3</a></li>
                    <li class="waves-effect"><a href="#!">4</a></li>
                    <li class="waves-effect"><a href="#!">5</a></li> -->
                    <li class="waves-effect">
                            <c:if test="${param.p+1<=last }">
                            <a href="?p=${param.p+1 }&q=${param.q}"><i
                            class="material-icons">chevron_right</i></a>
                            </c:if></li>
                </ul>
				

				
			</div>
			</main>
			
			
<script type="text/javascript">
var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
real_search_keyword.start(); // 스크롤링 시작
</script>