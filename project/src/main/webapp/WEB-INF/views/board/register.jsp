<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판 등록</h1>
	</div>
</div>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				게시판 등록
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
					<form action="/board/register" method="post" enctype="multipart/form-data">
					
						<div class="form-group">
							<label>제목</label>
							<input class="form-control" name="title" style="width: 50%" placeholder="제목을 입력하세요">
						</div>					

						<div class="form-group">
							<label>내용</label>
							<textarea rows="5" cols="50" name="content" class="form-control" style="width: 75%" placeholder="내용을 입력하세요"></textarea>
						</div>					

						<div class="form-group">
							<label>작성자</label>
							<input class="form-control" name="writer" style="width: 15%" placeholder="이름 입력">
						</div>	
										
						<div class="form-group">
							<label>파일 업로드</label>
							<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
						</div>					
						
						
						<button type="submit" class="btn btn-primary">제출</button>
                        <button type="reset" class="btn btn-warning">취소</button>
					</form>
			</div>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>
