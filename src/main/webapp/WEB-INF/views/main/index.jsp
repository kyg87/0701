<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>



<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

* {
	margin: 0;
	padding: 0;
}

@media only screen and (max-width: 680px){
	.flex .card:second-child{
		display: none;
	}
}

@media only screen and (max-width: 1220px){
	.flex .card:first-child{
		display: none;
	}
}

@media only screen and (max-width: 1560px){
	.flex .card:last-child{
		display: none;
	}
}

/*--------------------------폰트-----------------------------------*/

.hanna{
font-family: 'Hanna', serif;
}

.jeju{
font-family: 'Jeju Gothic', serif;
}

/*--------------------------비쥬얼-----------------------------------*/

.visual{
	background-color: #fff;
	height: 400px;
	text-align: center;
	
	background-image: url("/WiynPrj/resource/images/season-1985856_1920.jpg");
	background-position:center;
	background-origin:content-box;
	background-size: 100%;
}

/* .visual p:first-child{
	/* background-color: rgba(255,255,255,0.4); 
	height: inherit;
	font-size: 30px;
	color:#b86065;

	font-family: 'Hanna', serif;
} */

.visual p{
	height: inherit;
	font-size: 20px;
	color:#b86065;
	font-family: 'Hanna', serif;
	text-align: center;
}

.visual .banner-text{
width:inherit;
height:inherit;
	position: relative;
	background-color: rgba(255,255,255,0.5);
}
 
/*------------------------- 공지사항 스크롤 부분 ----------------------------------*/
#scroll {
	height: 50px;
	font-weight: 300;
	background-color: #f3e8d7;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0
		rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
	border-radius: 1.5px;
	cursor: pointer;
	
	display: flex;
   flex-direction: column;
   justify-content: center;
}

#scroll a{
	padding-left:110px;
	color:#000;
	font-family: 'Jeju Gothic', serif;
	font-size: 21px;
}

.noticelabel{
	padding-left: 30px;
	font-family: 'Jeju Gothic', serif;
	font-size:15px;
	font-style: bold;
}

/*------------------------- 핫한사이트 ----------------------------------*/


.tm1{
	border: 1px solid red;
	
}




.background{
	background-color:#F6F4F1;
}

.write{
	justify-content:center;
}


#main .category-add{
	padding:20px;
}

.card-content span{
	overflow: hidden;
	height: 32px;
}

.card-title p{
	overflow: hidden;
	height: 10px;
	width:250px;
}





.white{
	background-color: #fff;
}


.hi{
text-align: center;
margin-bottom:15px;
}

.hit{
	font-weight: bold;
	font-size: 42px;
}


.categoryy{
	width: 450px;
}
.categoryy label{
	font-size:15px;
}

.category-p{
	font-size:25px;
}








input[type="text"]{
border-bottom:1px solid #b7b7b7;
}




.between{
	justify-content:center;
}
.main-request{
	width:450px;
}
#reqRegform {
    margin-left: 200px;
}


.background textarea.materialize-textarea{
margin: 0px;
}

.background .btn{
background-color:rgb(221, 93, 88);
}
/*------------------------- 최신순,점수순,댓글순 부분 ----------------------------------*/
.tabs {
	font-family: 'Jeju Gothic', serif;
	font-size: 12px;
	background:none;
}

.tabs .tab a {
	color: rgb(69, 95, 140);
	font-size: 12px;
}

.tabs .tab a.active {
	color: rgb(69, 95, 140);
	font-size: 12px;
	border:1px solid #e9e9e9;
	border-bottom:none;
}

.row .col.s3{
	width:initial;
}

/*------------------------- 메인 테이블 부분 ----------------------------------*/
#main .table {
	border-radius: 2px;
	width: 100%;
	background: none;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0
		rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.table *{
	text-align: center;
}

.table .table-title{
	text-align: left;
}

.table .table-title a{
	color:#505050;
}


.table-head {
	font-family: 'Jeju Gothic', serif;
	font: menu;
	border-bottom:1px solid #e9e9e9;
}

.table-body {
	text-align: center;
	font:14px;
}

.table-body {
	font-family: 'Nanum Gothic Coding', serif;
}

/*------------------------- 사이트글쓰기 부분 ----------------------------------*/
.site-button{
	display: flex;
	justify-content:flex-end;
	font-family: 'Nanum Gothic Coding', serif;
}

.sitego{
	background: rgb(221, 93, 88);
	width: 100%;
	height: 50px;
	text-align: center;
	padding-top: 15px;
	color: #fff;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
	font-size: 16px;
}

.sitego:hover{
	background:rgba(23, 56, 125, 0.79);
}

.write{
	display: flex;
	flex-direction:column;
	text-align:center;
}

.write div{
	min-height:200px;
	background-color: red;
	text-align:center;
	margin:0px;
}
/*------------------------- 랜덤페이지 부분 ----------------------------------*/
.col.line {
	padding: 0px;
	padding-top: 10px;
	background: none;
}

.card {
	/* background:rgb(250,250,250); */
	background: #fff;
}

.breadcrumb {
	font-size: 12px;
	font-weight: 500;
	display: block;
	text-transform: uppercase;
	color: #4284f3;
}

.breadcrumb:last-child {
	font-size: 12px;
	font-weight: bold;
	display: block;
	text-transform: uppercase;
	color: #4284f3;
}

.breadcrumb:before {
	font-style: normal;
	font-weight: bold;
	speak: none;
	text-align: center;
	width: 1em;
	display: inline-block;
	font-size: 15px;
	color: #bababa;
}

.card {
	padding: 15px;
	max-width: 280px;
	max-height: 280px;
}

.card .card-action {
	border-top: none;
	padding: 0px;
}

.card .card-content {
	padding: 0px;
}

.card .card-img img {
	padding-right: 20px;
}

.card.line {
	display: flex;
	justify-content: space-around;
}

.card .contents {
	display: flex;
	flex-direction: colum;
}

.contents .title {
	font-size: 24px;
	font-weight: bold;
}

.contents .content {
	font-size: 15px;
}

.card .top {
	display: flex;
	justify-content: space-between;
}

.card .category {
	display: flex;
	align-items: center;
}

.card .date {
	font-size: 12px;
	display: flex;
	align-items: center;
}

.col {
	padding: 10px;
	
}



.hanna .point{
	font-size: 25px;
}
.hot-site{
	margin-top: 40px;
}


.section-title:before {
    content: "";
    position: absolute;
    top: 50%;
    left: 0;
    width: 100%;
    border-bottom: 4px solid #dddddd;
}

.section-title {
    position: relative;
    margin-bottom: 1em;
    font-size: 22px;
    font-weight: 400;
    text-align: left;
}

.section-title:before {
    content: "";
    position: absolute;
    top: 50%;
    left: 0;
    width: 100%;
    border-bottom: 4px solid #dddddd;
}

.section-title p{
    position: relative;
    display: inline-block;
    padding-right: 1.4em;
    background: #fff;
}

.main-request{
	margin-top:30px;
	margin-bottom:50px;
}








.lst_recipe {
    overflow: hidden;
    margin-bottom: 56px;
    width: 1040px;
    position: relative;
    left: -16px;
}

ol, ul {
    list-style: none;
}
.lst_recipe li .thmb {
    display: block;
    margin: 4px;
    position: relative;
}

button, a {
    outline: none;
    text-decoration: none;
    color: #444;
    padding: 0;
    margin: 0;
    cursor: pointer;
}

.lst_recipe li .judge {
    position: absolute;
    top: 187px;
    right: 10px;
    color: #eee;
    font-size: 13px;
    text-align: center;
    line-height: 1;
    z-index: 5;
}

.lst_recipe li .author {
    text-align: center;
    width: 100%;
    z-index: 5;
    display: block;
    margin-top: -40px;
    position: relative;
}

.lst_recipe li .author strong {
    color: #808080;
    font-size: 14px;
    font-weight: normal;
}

.lst_recipe li p a {
    color: #3b3b3b;
}
.lst_recipe .option {
    width: 100%;
    position: absolute;
    bottom: 0;
    height: 27px;
    border-top: 1px solid #e1e1e1;
    text-align: right;
    display: flex;
    justify-content: space-around;
}

.lst_recipe .option>div:first-child {
    border: none;
}

.lst_recipe .option>div {
    width: 80px;
    height: 100%;
    float: left;
    border-left: 1px solid #ddd;
}

.lst_recipe .option .like {
    position: relative;
    background: url(http://d1hk7gw6lgygff.cloudfront.net/assets/_img/main/ico_like-92022602fb2947a641036b1f0be28af2.png) 9px center no-repeat;
}

.lst_recipe .option>div {
    width: 80px;
    height: 100%;
    float: left;
    border-left: 1px solid #ddd;
}
input, button, img {
    vertical-align: middle;
}
.lst_recipe li p {
    text-align: center;
    font-size: 15px;
    font-family: Microsoft YaHei,'NSB';
    line-height: 19px;
    letter-spacing: -0.025em;
    padding: 2px 20px 0;
}
.lst_recipe li .author img {
    width: 61px;
    height: 61px;
    border-radius: 50%;
    overflow: hidden;
    display: block;
    margin: 0 auto 5px;
}


.lst_recipe>li {
    width: 244px;
    height: 390px;
    margin: 0 0 16px 16px;
    position: relative;
    border: 1px solid #e1e1e1;
    box-sizing: border-box;
    float: left;
    background-color: #fff;
}
.lst_recipe .option .like button {
    display: block;
    width: 100%;
    height: 27px;
    text-align: right;
    background-color: transparent;
    border: none;
    color: #999;
    box-sizing: border-box;
    padding-right: 10px;
    line-height: 25px;
    line-height: 32px\0;
}
.lst_recipe li .thmb {
    display: block;
    margin: 4px;
    position: relative;
}
.lst_recipe li .thmb img {
    width: 234px;
    height: 234px;
    display: block;
    border:1px solid #e1e1e1;
}
.lst_recipe .option .share a {
    display: block;
    overflow: hidden;
    color: #999;
    background: url(http://d1hk7gw6lgygff.cloudfront.net/assets/_img/main/ico_share-e234119ec47de3fa22d0c1c2569f756f.png) 7px 50% no-repeat;
    width: 100%;
    padding: 7px 5px 0 0\0;
}
.lst_recipe li .thmb:after {
    position: absolute;
    display: block;
    content: '';
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
   
    background-size: 234px 234px;
    z-index: 1;
}
.lst_recipe li .thmb {
    display: block;
    margin: 4px;
    position: relative;
}

.lst_recipe .option>div:first-child {
    border: none;
    color:#999;
}
</style>
<script type="text/javascript">
function textScroll(scroll_el_id) {
    this.objElement = document.getElementById(scroll_el_id);
    this.objElement.style.position = 'relative';
    this.objElement.style.overflow = 'hidden';

    this.objLi = this.objElement.getElementsByTagName('li');
    this.height = 50;
    //this.height = this.objElement.offsetHeight; // li 엘리먼트가 움직이는 높이(외부에서 변경가능)
    this.num = this.objLi.length; // li 엘리먼트의 총 갯수
    this.totalHeight = this.height*this.num; // 총 높이
    this.scrollspeed = 2; // 스크롤되는 px
    this.objTop = new Array(); // 각 li의 top 위치를 저장
    this.timer = null;
    
    for(var i=0; i<this.num; i++){
        this.objLi[i].style.position = 'absolute';
        this.objTop[i] = this.height*i;
        this.objLi[i].style.top = this.objTop[i]+11+"px";
    }
}

textScroll.prototype.move = function(){
    for(var i=0; i<this.num; i++) {
        this.objTop[i] = this.objTop[i] - this.scrollspeed;
        this.objLi[i].style.top = this.objTop[i]+11+"px";
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
<visual>
	<div class="visual">
	<!-- <div class="banner-text">
			<p>What is your needs? <br>당신이 원하는 사이트, 당신에게 필요한 사이트<br>추천 받고, 추천할 수 있는 자유로운 공간입니다! </p>
</div> -->
	</div>

</visual>
<!-- 공지사항 스크롤부분 -->
<div>
	<ul id="scroll">
	<div class="container">
   <label class="noticelabel hanna">공지사항 > </label>
      <c:forEach var="m" items="${noticelist}">
         <li class="hite"><a href="../noticeboard/notice-detail?c=${m.id}&p=${param.p}">${m.title}</a></li>
      </c:forEach>
   </ul>
   </div>
</div>

<!-- 핫한사이트부분 -->
<div class="container">
<div class="hot-site">
		<div class="hanna">
			<p>"무엇이" 필요한 당신에게</p>
			<p class="point">~~~한 사이트</p>
		</div>
		<div class="flex space">
			<ul class="lst_recipe">
				<c:forEach var="hot" items="${hot }" begin="1" end="4">
					<li><a class="call_recipe thmb" href="/recipes/4145"> <img
							src="http://api.thumbalizr.com/?url=http://${hot.url}" />
					</a> <span class="author"> <a href="/profile/321451"> <img
								alt="푸드텔러"
								src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/user/image_file/321451/thumb_____2.jpg&amp;convert=jpgmin&amp;rt=600">
						</a> <strong><a class="jeju" " href="/profile/321451">${hot.memberId }</a></strong>
					</span>
						<p>
							<a class="call_recipe jeju" href="/recipes/4145">${hot.title }
							</a>
						</p>
						<div class="option">
							<div class="time">

								<a class="jeju" href="/recipes?cooking_time=30"><fmt:formatDate
										value="${hot.regDate}" pattern="yyyy-MM-dd" /></a>
							</div>
							<div class="like jeju">
								<form action="/bookmarks" accept-charset="UTF-8" method="post">
									<input name="utf8" type="hidden" value="✓"><input
										type="hidden" name="authenticity_token"
										value="1KsNCn9Nc+jSqMhlkd2O/z1lDEshD5VeAGksB4qrC9X00j2B38Liaig4mEJdcGZA3DINWqn/AextRSJNdckgsg==">
									<input type="hidden" name="linked_model_type" value="Recipe">
									<input type="hidden" name="linked_model_id" value="4145">
									<button type="submit" class="btn_like">2345명</button>
								</form>
							</div>

						</div></li>
				</c:forEach>
			</ul>
		</div>
	</div>
			<%-- <c:forEach var="hot" items="${hot }" begin="1" end="4">
	<div class="card">
		<div class="card-image waves-effect waves-block waves-light">
			<a href="../siteboard/site-detail?c=${hot.id}"><img class="activator"  src="http://api.thumbalizr.com/?url=http://${hot.url}&width=250" /></a>
		</div>
		<div class="card-content">
			<span class="card-title activator grey-text text-darken-4">${hot.title}<i class="material-icons right">more_vert</i></span>
			<p>
				<a href="../siteboard/site-detail?c=${hot.id}">${hot.content}</a>
			</p>
		</div>
		<div class="card-reveal">
			<span class="card-title grey-text text-darken-4">${hot.title}<i
				class="material-icons right">close</i></span>
			<p>${hot.content}</p>
		</div>
	</div>
	</c:forEach> --%>
			<%-- <div class="card second">
		<div class="card-image waves-effect waves-block waves-light">
			<img class="activator"  src="http://api.thumbalizr.com/?url=http://${hot.url}&width=250" />
		</div>
		<div class="card-content">
			<span class="card-title activator grey-text text-darken-4">${hot.title}<i class="material-icons right">more_vert</i></span>
			<p>
				<a href="#">${hot.content}</a>
			</p>
		</div>
		<div class="card-reveal">
			<span class="card-title grey-text text-darken-4">${hot.title}<i
				class="material-icons right">close</i></span>
			<p>${hot.content}</p>
		</div>
	</div> --%>
			<%-- <div class="card third">
		<div class="card-image waves-effect waves-block waves-light">
			<img class="activator"  src="http://api.thumbalizr.com/?url=http://${hot.url}&width=250" />
		</div>
		<div class="card-content">
			<span class="card-title activator grey-text text-darken-4">${hot.title}<i class="material-icons right">more_vert</i></span>
			<p>
				<a href="#">${hot.content}</a>
			</p>
		</div>
		<div class="card-reveal">
			<span class="card-title grey-text text-darken-4">${hot.title}<i
				class="material-icons right">close</i></span>
			<p>${hot.content}</p>
		</div>
	</div> --%>
			<%-- <div class="card">
		<div class="card-image waves-effect waves-block waves-light">
			<img class="activator"  src="http://api.thumbalizr.com/?url=http://${hot.url}&width=250" />
		</div>
		<div class="card-content">
			<span class="card-title activator grey-text text-darken-4">${hot.title}<i class="material-icons right">more_vert</i></span>
			<p>
				<a href="#">${hot.content}</a>
			</p>
		</div>
		<div class="card-reveal">
			<span class="card-title grey-text text-darken-4">${hot.title}<i
				class="material-icons right">close</i></span>
			<p>${hot.content}</p>
		</div>
	</div> --%>


	<div class="hot-site">
		<div class="hanna">
			<p>"무엇이" 필요한 당신에게</p>
			<p class="point">~~~한 사이트</p>
		</div>
		<!-- <h2 class="header lighten-1 section-title">
<div class="hanna">
	<p>"무엇이" 필요한 당신에게<br> ~~~한 사이트</p>
</div>
</h2> -->
		<div class="flex space">
			<ul class="lst_recipe">
				<c:forEach var="hot2" items="${hot2 }" begin="1" end="4">
					<li><a class="call_recipe thmb" href="/recipes/4145"> <img
							src="http://api.thumbalizr.com/?url=http://${hot2.url}" />
					</a> <span class="author"> <a href="/profile/321451"> <img
								alt="푸드텔러"
								src="http://cloudfront.haemukja.com/vh.php?url=http://d1hk7gw6lgygff.cloudfront.net/uploads/user/image_file/321451/thumb_____2.jpg&amp;convert=jpgmin&amp;rt=600">
						</a> <strong><a class="jeju" " href="/profile/321451">${hot2.memberId }</a></strong>
					</span>
						<p>
							<a class="call_recipe jeju" href="/recipes/4145">${hot2.title }
							</a>
						</p>
						<div class="option">
							<div class="time">

								<a class="jeju" href="/recipes?cooking_time=30"><fmt:formatDate
										value="${hot2.regDate}" pattern="yyyy-MM-dd" /></a>
							</div>
							<div class="like jeju">
								<form action="/bookmarks" accept-charset="UTF-8" method="post">
									<input name="utf8" type="hidden" value="✓"><input
										type="hidden" name="authenticity_token"
										value="1KsNCn9Nc+jSqMhlkd2O/z1lDEshD5VeAGksB4qrC9X00j2B38Liaig4mEJdcGZA3DINWqn/AextRSJNdckgsg==">
									<input type="hidden" name="linked_model_type" value="Recipe">
									<input type="hidden" name="linked_model_id" value="4145">
									<button type="submit" class="btn_like">2345명</button>
								</form>
							</div>

						</div></li>
				</c:forEach>
			</ul>








			<%-- <c:forEach var="hot2" items="${hot2 }" begin="1" end="4">
	<div class="card">
		<div class="card-image waves-effect waves-block waves-light">
			<a href="../siteboard/site-detail?c=${hot2.id}"><img class="activator"  src="http://api.thumbalizr.com/?url=http://${hot2.url}&width=250" /></a>
		</div>
		<div class="card-content">
			<span class="card-title activator grey-text text-darken-4">${hot2.title}<i class="material-icons right">more_vert</i></span>
			<p>
				<a href="../siteboard/site-detail?c=${hot2.id}">${hot2.content}</a>
			</p>
		</div>
		<div class="card-reveal">
			<span class="card-title grey-text text-darken-4">${hot2.title}<i
				class="material-icons right">close</i></span>
			<p>${hot2.content}</p>
		</div>
	</div>
	</c:forEach> --%>
			<%-- <div class="card second">
		<div class="card-image waves-effect waves-block waves-light">
			<img class="activator"  src="http://api.thumbalizr.com/?url=http://${random.url}&width=250" />
		</div>
		<div class="card-content">
			<span class="card-title activator grey-text text-darken-4">${random.title}<i class="material-icons right">more_vert</i></span>
			<p>
				<a href="#">${random.content}</a>
			</p>
		</div>
		<div class="card-reveal">
			<span class="card-title grey-text text-darken-4">${random.title}<i
				class="material-icons right">close</i></span>
			<p>${random.content}</p>
		</div>
	</div> --%>
			<%-- <div class="card third">
		<div class="card-image waves-effect waves-block waves-light">
			<img class="activator"  src="http://api.thumbalizr.com/?url=http://${random.url}&width=250" />
		</div>
		<div class="card-content">
			<span class="card-title activator grey-text text-darken-4">${random.title}<i class="material-icons right">more_vert</i></span>
			<p>
				<a href="#">${random.content}</a>
			</p>
		</div>
		<div class="card-reveal">
			<span class="card-title grey-text text-darken-4">${random.title}<i
				class="material-icons right">close</i></span>
			<p>${random.content}</p>
		</div>
	</div> --%>
			<%-- <div class="card">
		<div class="card-image waves-effect waves-block waves-light">
			<img class="activator"  src="http://api.thumbalizr.com/?url=http://${random.url}&width=250" />
		</div>
		<div class="card-content">
			<span class="card-title activator grey-text text-darken-4">${random.title}<i class="material-icons right">more_vert</i></span>
			<p>
				<a href="#">${random.content}</a>
			</p>
		</div>
		<div class="card-reveal">
			<span class="card-title grey-text text-darken-4">${random.title}<i
				class="material-icons right">close</i></span>
			<p>${random.content}</p>
		</div>
	</div> --%>
		</div>
	</div>
</div>
<div class="white">
<!-- <div class="container hi">
	<div class="jeju">
		<p >당신이 알고 있는</p> 
		<p class="hit">"유용한 사이트"</p>
		<p>를 모두에게 추천해주세요!</p>
	</div>
</div> -->
</div>
	<div class="hi">
	<p class="jeju category-p">당신이 알고 있는 "유용한 사이트"를 모두에게 추천해주세요!</p> 
	</div>
	<a class="jeju waves-effect waves-light sitego" href="#">글을 쓰러 가시겠습니까?</a>

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
				$('.sitego').prop('href', "../siteboard/site-reg");
			} 

		});
	});
</script>
<div class="background">
<div class="container jeju">
	
		<span id="location123"></span>
		<div class=" flex between category-add">
		
			<div class="categoryy main-request">
				<p class="category-p">현재 원하는 카테고리가 없다면?</p>
				<br>
				<label> 왼쪽 작성란에 제목과 그 아래에 생기길 원하는 카테고리를 자세하게 써주시면 관리자가 확인 후에 해당 카테고리를 생성해드립니다!</label>
				<br>
				<br><label> 카테고리 생성에 대한 답변을 받아보고 싶으시다면 내용란에 "이메일"을 꼭 적어주세요.</label>
				<br>
				<br><label>그 외 기타 궁금한 문의사항은 thjds8@gmail.com으로 보내주시면 감사하겠습니다.</label>
			</div>
			<form id="reqRegform" action="reg-index" method="post">
			<div class="flex column main-request">
				<div>
					<div id="title" class="input-field col s12 row">
						<input name="title" id="title1" type="text" class="validate"
							required="required"> <label for="Title">제목</label>
					</div>
				</div>
				<div id="content">
					<div class="row">
						<div class="input-field col s12">
							<textarea name="content" id="textarea1"
								class="materialize-textarea" required="required"></textarea>
							<label for="textarea1">내용</label>
						</div>
					</div>
				</div>
				<div class="right">
					<button id="target" class="btn waves-effect waves-light"
						type="submit" name="action">카테고리 요청하기</button>
				</div>
			</div>
			</form>
		</div>
			<input type="hidden" name="memberId"
				value=<security:authentication property="name"/>>
	
</div>
</div>
	<%-- <div class="col s12 line">
		<ul class="tabs">
			<li class="tab col s3"><a class="active" target="_self" href="index?p=${param.p}&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}">최신순</a></li>
			<li class="tab col s3"> <a target="_self" href="index2?p=${param.p}&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}">점수순</a></li>
			<li class="tab col s3"> <a target="_self" href="index3?p=${param.p}&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}">댓글순</a></li>
		</ul>
	</div>

	<table id="index" class="highlight table">
		<thead class="table-head">
			<tr class="head-tr">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성날짜</th>
			</tr>
		</thead>

		<tbody class="table-body">
			<c:forEach var="n" items="${sitelist}">
				<tr>
					<td>${n.id}</td>
					<td class="orange-text text-accent-3 table-title"><a
						href="../siteboard/site-detail?c=${n.id}&p=${param.p}">${n.title}</a>[${n.countcomment }]</td>
					<td>${n.memberId }</td>
					<td>${n.hit }</td>
					<td><fmt:formatDate value="${n.regDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<br>
<div class="site-button">
	<a class="waves-effect waves-light btn sitego" href="">
	<div class="write">Write<i class="tiny material-icons">mode_edit</i></div>
	</a>
</div>
<br>
<fmt:parseNumber var="sizeInt" integerOnly="true" value="${size/10 }" />
<c:set var="last" value="${(size%10)>0 ? sizeInt+1 : sizeInt }" />


<div>${empty param.p ? 1 : param.p}/${last }pages</div>
<div>${size}</div>
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
		<li class="waves-effect"><a href="?p=${i }&q=${param.q}">${i }</a></li> 
	</c:forEach>
	<li class="waves-effect"><c:if test="${cnt > ((listPerFive+1)*5 + 1) }">
			<a
				href="?p=${(listPerFive+1)*5 + 1 }&q=${param.q}&bigCa=${param.bigCa}&smallCa=${param.smallCa}"><i
				class="material-icons">chevron_right</i></a>
		</c:if></li>
</ul>



<input class="sitein" type="hidden" name="memberId"
	value=<security:authentication property="name"/>> <script>
			$(document).ready(function(){
				$('.sitego').on('click', function(){
					
					var value = $('.sitein').val();

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
			
			</script> <script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">

         </script> <script>
			$(".pagination").on('click','li',function(){
    // remove classname 'active' from all li who already has classname 'active'
    $(".pagination li.active").removeClass("active"); 
    // adding classname 'active' to current click li 
    $(this).addClass("active"); 
});
			</script> <!-- -------------------------------랜덤 페이지--------------------------------- -->
 --%>
<%-- <div class="row">
	<div class="col s12 m6">
		<div class="card">
			<div class="card-image">
				<img src="images/sample-1.jpg"> <span class="card-title">Card
					Title</span> <a
					class="btn-floating halfway-fab waves-effect waves-light red"><i
					class="material-icons">add</i></a>
			</div>
			<div class="card-content">
				<p>I am a very simple card. I am good at containing small bits
					of information. I am convenient because I require little markup to
					use effectively.</p>
			</div>
		</div>
	</div>
</div>




<div class="col s12 m7">
	<div class="card horizontal line">
		<div class="card-image">
			<a href="http://${random.url}"> <img
				src="http://api.thumbalizr.com/?url=http://${random.url}&width=250" />
			</a>
		</div>

		<div class="card-stacked contents">
			<div class="top">
				<span class="category"> <a href="#!"
					class="breadcrumb big-category">${b }</a> <a href="#!"
					class="breadcrumb small-category">${s }</a>
				</span> <span class="date"> <i class="tiny material-icons">schedule</i>
					<fmt:formatDate value="${random.regDate }"
						pattern="yyyy-MM-dd HH:mm:ss" />
				</span>
			</div>
			<div class="card-content">
				<span class="title">${random.title }</span>
				<p class="content">${random.content }</p>
			</div>
			<div class="card-action">
				<c:forEach var="tag" items="${t }">
					<div class="chip">${tag }</div>
				</c:forEach>
				<script>
					$(function() {
						$(".chip").on('click', function() {
							var query = $(this).text();

							$.post("site-list", {
								"query" : query
							}, function() {
								location.replace("site-list?query=" + query);
							});
						});
					});
				</script>
			</div>
		</div>
	</div>
</div> --%>

<%-- <table class="table">
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
			</table> --%> </main>
			
			<security:authentication property="name" var="loginID"/>
<script>
/* 
$(document).ready(function(){
	$('button').click(function(){
		alert($('.jbbox').scrollTop());
		
	});
	
}); */



$("#target").click(function(d){
	console.log('${loginID}');
	var form = $("#reqRegform");
	var title1 = $("#title1");
	var textarea1 = $("#textarea1");
	
	var str = title1.val();
	var str1 = textarea1.val();
	
	str = str.trim();
	str1 = str1.trim();
	
	if(!str){
		alert("제목을 입력하세요");
		title.focus();
		return;
	}
	if(!str1){
		alert("내용을 입력하세요");
		textarea1.focus();
		return;
	}
	
	else if('${loginID}' == 'anonymousUser') {
		alert("로그인한 유저만 사용 가능합니다.");
		
		return false;
	}
	else{
		alert("요청게시판에 글이 등록되었습니다.");
		return true;
	} 
});


</script>

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