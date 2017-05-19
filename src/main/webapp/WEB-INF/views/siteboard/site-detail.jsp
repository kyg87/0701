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
	width:100%;
}

td{
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
}

td i{
	margin-right:3px;
}

.input-field {
	width: 100%;
}

.button-td{
	display: flex;
	justify-content: space-between;
}

.like-td{
	display: flex;
	justify-content: space-between;
	padding-bottom: 0px;
}

.like-td form{
	margin-top:3px;
}

.hidden{
	display: none;
}

.reg-date{
	padding-right: 0px;
}

.like{
	margin-left: 3px;
	margin-right: 3px;
	text-shadow: 0px 1px #ffffff, 2px 1px 0px #dad7d7;
	text-align: right;
}
.form-end{
	text-align: right;
}

#icon-margin{
	margin-right:2.5px !important;
}

.title{
	font-weight:900;
    font-size: 23px;
	font-family: din_blackregular;
	color: #616161;
}

.detail-font{
	font-family: 'Abel', sans-serif;
	padding-top:0px;
}

.detail-title{
	font-weight: 700;
    text-transform: uppercase;
    font-family: 'Abel', sans-serif;
}

.small-category{
	font-weight: 900;
}


</style>

<main id="main">

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
				<td class="title" colspan="4">${n.title }</td>
				<td class="hidden">즐겨찾기</td>
			</tr>
			<tr class="reg-like">
				<td class="detail-font" colspan="4" class="reg-date"><i class="tiny material-icons">schedule</i>${n.regDate }</td>
			</tr>
			<tr>
				<td class="detail-font" colspan="4"><i class="tiny material-icons">perm_identity</i>${n.memberId }</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="4">${n.url }</td>
			</tr>
			<tr>
				<td colspan="4">thum</td>
			</tr>
			<tr>
				<td colspan="4">${n.content }</td>
			</tr>
			<tr>
				<td colspan="4"> <div class="chip">Tag</div> <div class="chip">Tag</div> <div class="chip">Tag</div> <div class="chip">Tag</div> <div class="chip">Tag</div></td>
			</tr>
			<tr class="td-padding">
				<td colspan="2">
					<form action="like" method="post">
						<button class="waves-effect waves-light btn" type="submit"
							name="action">
							<i id="icon-margin" class="material-icons left ">thumb_up</i>${l }</button>
						<input type="hidden" name="siteBoardId" value=${n.id }> <input
							type="hidden" name="memberId" value="LSE@mb.com">
					</form>
				</td>
				<td colspan="2" >
					<form class="form-end" action="site-delete" method="post">
						<input type="hidden" name="id" value=${n.id }>
						<button class="btn waves-effect waves-light" type="submit"
							name="action">목록</button>
					</form>		
				</td>
			</tr>
			<tr>
				<td colspan="2" >
					<form  action="site-edit?c="${n.id} method="post">
						<input type="hidden" name="id" value=${n.id }>
						<button class="btn waves-effect waves-light" type="submit"
							name="action">수정</button>
					</form>
				</td>
				<td colspan="2" >
					<form  class="form-end"  action="site-delete" method="post">
						<input type="hidden" name="id" value=${n.id }>
						<button class="btn waves-effect waves-light" type="submit"
							name="action">삭제</button>
					</form>
				</td>
			</tr>
	</tbody>
	</table>
	<br>

	<input type="hidden" name="siteBoardId" value="15"> 
	<input type="hidden"	name="memberId" value="LSE@mb.com">
</main>