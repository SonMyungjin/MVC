<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판 조회</h1>
	</div>
</div>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				게시판 조회
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
					
				<div class="form-group">
					<label>번호</label>
					<input class="form-control" name="title" style="width: 50%" readonly="readonly" value="<c:out value='${board.bno}'/>">
				</div>					
				
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" name="title" style="width: 50%" readonly="readonly" value="<c:out value='${board.title}'/>">
				</div>					

				<div class="form-group">
					<label>내용</label>
					<textarea rows="5" cols="50" name="content" class="form-control" style="width: 75%" ><c:out value="${board.content}"/></textarea>
				</div>					

				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="writer" style="width: 15%" value="<c:out value='${board.writer}'/>">
				</div>					
				
				<button type="submit" class="btn btn-primary"><a href='/board/list'>확인</a></button>
                <button type="reset" class="btn btn-warning"><a href='/board/modify?bno=<c:out value="${board.bno}"/>'>수정하기</a></button>
			</div>
		</div>
	</div>
</div>


<%@include file="../includes/footer.jsp"%>
