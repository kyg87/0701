<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.page-footer{
	background: rgb(66,66,66);
	z-index:999;
	padding:0px;
}

.page-footer .footer-copyright{
	background:#31343c;
}

.height-sma{
	height:100%; 
}

footer .category{
	display: flex;
}

footer .first{
	padding: 10px; 
	min-height: 270px;
	color:#fff;
}

.category.column{
	flex-direction:column;
}

.flex{
	display: flex;
}

.space{
	justify-content:space-around;
}
</style>

<footer class="page-footer">
	<div class="first space">
		<div class="category space">
			<div class="col s12 m3 hide-on-small-only">
				<h5 class="white-text">Board</h5>
				<ul>
					<li><a class="grey-text text-lighten-3"
						href="../noticeboard/noticeboard">Notice</a></li>
					<li><a class="grey-text text-lighten-3"
						href="../siteboard/siteboard">Site</a></li>
					<li><a class="grey-text text-lighten-3"
						href="../freeboard/freeboard">Free</a></li>
					<li><a class="grey-text text-lighten-3"
						href="../requestboard/requestboard">Request</a></li>
				</ul>
			</div>
			<c:forEach var="bcb" items="${bcbList }">
				<div class="col category column s12 m3 hide-on-small-only">
					<h5 class="white-text">
						<input type="hidden" value="${bcb.id }" name="bigCa" />${bcb.name }</h5>
					<ul>
						<c:forEach var="small" items="${bcb.smallCategory}">
							<li><a class="grey-text text-lighten-3"
								href="http://localhost:8080/WiynPrj/main/index?p=1&q=&bigCa=${bcb.id}&smallCa=${small.id}"> <input type="hidden"  value="${small.id }" name="SmallCa" />${small.name }</a></li>
	         			</c:forEach>
	            	</ul>
	            </div>
			</c:forEach>	
	</div>
	<div class="footer-copyright">
		<div class="container">
			Copyright © 2015 <a class="grey-text text-lighten-4"
				href="http://themeforest.net/user/geekslabs/portfolio?ref=geekslabs"
				target="_blank">GeeksLabs</a> All rights reserved. <span
				class="right"><a class="grey-text text-lighten-4"
				href="http://geekslabs.com/"></a></span>
		</div>
	</div>
</footer>