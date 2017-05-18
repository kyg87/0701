<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>

<style>
.table{
	border:1px solid #e4e4e4;
	border-radius: 3px;
	/* box-shadow: 0px 1px 1px #a8a8a8; */
	
}

td{
	padding:5px;
}

.input-field {
	width: 100%;
}

</style>
<script>

</script>

<main id="main">

	<table class="table">
		<thead>
			<tr>
				<td colspan="3">
					<nav>
						<div class="nav-wrapper">
							<div class="col s12">
								<a href="#!" class="breadcrumb">${b }</a> 
								<a href="#!" class="breadcrumb">${s }</a>
							</div>
						</div>
					</nav>
				</td>
			</tr>
			<tr>
				<td colspan="2">${n.title }</td>
				<td>즐겨찾기</td>
			</tr>
			<tr>
				<td>${n.regDate }</td>
				<td>
					<form action="like" method="post">
					<button class="btn waves-effect waves-light" type="submit"
						name="action">	Submit <i class="small material-icons">thumb_up</i>
					</button>
						<input type="hidden" name="siteBoardId" value=${n.id }> 
						<input type="hidden"	name="memberId" value="LSE@mb.com">
					</form>
				</td>
				<td>
					${l }
				</td>
			</tr>
			<tr>
				<td>${n.memberId }</td>
				<td>hit</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${n.url }</td>
			</tr>
			<tr>
				<td>thum</td>
			</tr>
			<tr>
				<td>${n.content }</td>
			</tr>
			<tr>
				<td>tag</td>
			</tr>
			<tr>
					<td>
						<input type="hidden" name="id" value=${n.id }>
						<form action="site-edit?c=${n.id}" method="post">
							<button class="btn waves-effect waves-light" type="submit"
								name="action">수정</button>
						</form>
					</td>
					<td>
						<form action="site-delete" method="post">
							<input type="hidden" name="id" value=${n.id }>
							<button class="btn waves-effect waves-light" type="submit"
								name="action">삭제</button>	
						</form>		
					</td>
		</tr>
		</tbody>
	</table>
	<br>	
	
	<div class="row">
		<form class="col s12">
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">mode_edit</i>
					<textarea id="icon_prefix2" class="materialize-textarea"></textarea>
					<label for="icon_prefix2">욕설과 비방은 무통보 삭제될 수 있습니다.</label>
				</div>
			</div>
		</form>
	</div>
					<a class="waves-effect waves-light btn">button</a>
	 <table class="table">
        <tbody>
           <tr>
				<td colspan="3">
					
				</td>
				<td colspan="1">
					
				</td>
			</tr>
	        <tr>
	          <td>Alvin</td>
	          <td>Eclair</td>
	          <td>$0.87</td>
	          <td>0000</td>
	        </tr>      
        </tbody>
      </table>
	
	<input type="hidden" name="siteBoardId" value="15"> 
	<input type="hidden"	name="memberId" value="LSE@mb.com">
</main>