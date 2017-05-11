<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>			
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
    <li><a href="">1위</a></li>
    <li><a href="">2위</a></li>
    <li><a href="">3위</a></li>
    <li><a href="">4위</a></li>
    <li><a href="">5위</a></li>
    <li><a href="">6위</a></li>
    <li><a href="">7위</a></li>
    <li><a href="">8위</a></li>
    <li><a href="">9위</a></li>
    <li><a href="">10위</a></li>
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
					<a href="../siteboard/siteboard" class="collection-item">Alvin</a> 
					<a href="../siteboard/siteboard" class="collection-item">Alvin</a> 
					<a href="../siteboard/siteboard" class="collection-item">Alvin</a> 
					<a href="../siteboard/siteboard" class="collection-item">Alvin</a> 
					<a href="../siteboard/siteboard" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 
					<a href="#!" class="collection-item">Alvin</a> 

				</div>

				<ul class="pagination center">
					<li class="disabled"><a href="#!"><i
							class="material-icons">chevron_left</i></a></li>
					<li class="active"><a href="#!">1</a></li>
					<li class="waves-effect"><a href="#!">2</a></li>
					<li class="waves-effect"><a href="#!">3</a></li>
					<li class="waves-effect"><a href="#!">4</a></li>
					<li class="waves-effect"><a href="#!">5</a></li>
					<li class="waves-effect"><a href="#!"><i
							class="material-icons">chevron_right</i></a></li>
				</ul>
			</div>
			
			</main>
			
			
<script type="text/javascript">
var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
real_search_keyword.start(); // 스크롤링 시작
</script>	