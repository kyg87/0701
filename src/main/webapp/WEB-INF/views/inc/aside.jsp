<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside id="left-sidebar-nav">

<ul id="nav-mobile" class="side-nav fixed" style="overflow: auto; transform: translateX(0%);">
        <li class="search">
          <div class="search-wrapper card">
            <input id="search"><i class="material-icons">search</i>
            <div class="search-results"></div>
          </div>
        </li>
		<li class="no-padding">
			<ul class="collapsible collapsible-accordion">
				<c:forEach var="bc" items="${bcList}">
					<li class="bold"><a
						class="collapsible-header  waves-effect waves-teal">${bc.name}</a>
						<div class="collapsible-body">
							<ul>
								<c:forEach var="sc" items="${bc.smallCategory}">
									<li><a href="color.html">${sc.name}</a></li>

								</c:forEach>
							</ul>
						</div></li>
				</c:forEach>
			</ul>
		</li>
	</ul>

 
 <!--  -->
</aside>