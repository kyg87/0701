<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.google.gson.*"%>
<%@page import="com.wiyn.web.entity.SmallCategory"%>
<style>
.input-field{
display: block;
}

.material-icons{
	height: 100%;
}

.main-nav-div{
	background: #fff;
}

.main-nav{
	border:none;
}

nav .input-field label i{
	color:rgba(183, 182, 182, 0.7);
}

</style>



<aside id="left-sidebar-nav">
	<ul id="nav-mobile" class="side-nav fixed"
		style="overflow: auto; transform: translateX(0%);">
		<label style="display: none">Search</label>
		<form action="${root}/main/index" method="GET">
			<nav class="main-nav">
				<div class="nav-wrapper main-nav-div">
					<div class="input-field">
						<input type="hidden" name="p" value="1" /> <input name="q"
							id="search" type="search" value="${param.q}" required> <label
							class="label-icon" for="search"><i class="material-icons search-icon">search</i></label>
						<i class="material-icons">close</i>
						
					</div>

				</div>
			</nav>
		</form>
		<label style="display: none">Speed Search</label>
		<c:forEach var="bcb" items="${bcbList }">
		<c:choose>
			<c:when test="${param.bigCa eq bcb.id }">
          <ul class="collapsible collapsible-accordion">
           	<li class="bold" ><a class="collapsible-header  active waves-effect waves-teal">
            <input type="hidden"  value="${bcb.id }" name="bigCa" />${bcb.name }</a>
              <div class="collapsible-body">
                <ul>
                
                
                <c:forEach var="small" items="${bcb.smallCategory}">
                <c:choose>
                	<c:when test="${param.smallCa eq small.id }">
                  <li class="active"><a href="${root}/main/index?p=1&q=&bigCa=${bcb.id}&smallCa=${small.id}"><input type="hidden"  value="${small.id }" name="SmallCa" />${small.name }</a></li>
                	</c:when>
                	<c:otherwise>
                	<li><a href="${root}/main/index?p=1&q=&bigCa=${bcb.id}&smallCa=${small.id}"><input type="hidden"  value="${small.id }" name="SmallCa" />${small.name }</a></li>
                	</c:otherwise>
                </c:choose>
                </c:forEach>
                </ul>
              </div>
            </li>
            </ul>
         </c:when>
         
         <c:otherwise>
       <ul class="collapsible collapsible-accordion">
           	<li class="bold" ><a class="collapsible-header  waves-effect waves-teal">
            <input type="hidden"  value="${bcb.id }" name="bigCa" />${bcb.name }</a>
              <div class="collapsible-body">
                <ul>
                <c:forEach var="small" items="${bcb.smallCategory}">
                  <li><a href="${root}/main/index?p=1&q=&bigCa=${bcb.id}&smallCa=${small.id}"><input type="hidden"  value="${small.id }" name="SmallCa" />${small.name }</a></li>
                </c:forEach>
                </ul>
              </div>
            </li>
         </ul> 
         </c:otherwise>
         
		</c:choose>
		</c:forEach> 
	</ul>	

<script type="text/javascript">
	
		$(document).ready(function() {
	    	$('select').material_select();
	  	});
	

	</script>

<script>

</script>
</aside>