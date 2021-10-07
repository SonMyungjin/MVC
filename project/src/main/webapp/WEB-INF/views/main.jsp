<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">메인 페이지</h1>
	</div>
</div>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				메인 페이지
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<div class="form-group">
					<a href="member/register">회원가입</a>
				</div>				
					
				<div class="form-group">
					<a href="member/login">로그인</a>
				</div>
				
				<div class="form-group">
					<a href="member/list">회원 리스트</a>
				</div>
									
				<div class="form-group">
					<a href="board/register">게시물 쓰기</a>
				</div>
									
				<div class="form-group">
					<a href="board/list">게시물 리스트</a>
				</div>					
				
			
			</div>
		</div>
	</div>
</div>


<%@include file="includes/footer.jsp"%>

