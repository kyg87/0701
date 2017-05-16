<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>

<style>
#table{
	border:1px solid #e4e4e4;
	border-radius: 3px;
	/* box-shadow: 0px 1px 1px #a8a8a8; */
	
}



</style>
<script>

</script>

<main id="main">

	<table id="table">
		<thead>
			<tr>
				<td colspan="3">
					<nav>
						<div class="nav-wrapper">
							<div class="col s12">
								<a href="#!" class="breadcrumb">First</a> <a href="#!"
									class="breadcrumb">Second</a>
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
				<td>like</td>
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
	<input type="hidden" name="siteBoardId" value="1"> 
	<input type="hidden"	name="memberId" value="LSE@mb">
</main>