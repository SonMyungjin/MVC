<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판 수정/삭제</h1>
	</div>
</div>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				게시판 수정/삭제
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
			<form>
				<div class="form-group">
					<label>번호</label>
					<input class="form-control" name="bno" style="width: 50%" readonly="readonly" value="<c:out value='${board.bno}'/>">
				</div>					
				
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" name="title" style="width: 50%" value="<c:out value='${board.title}'/>">
				</div>					

				<div class="form-group">
					<label>내용</label>
					<textarea rows="5" cols="50" name="content" class="form-control" style="width: 75%" ><c:out value="${board.content}"/></textarea>
				</div>					

				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="writer" style="width: 15%" value="<c:out value='${board.writer}'/>">
				</div>					
				
				<button class="btn btn-primary" data-oper='modify'>수정</button>
                <button class="btn btn-danger" data-oper='remove'>삭제</button>
                <button class="btn btn-info" data-oper='list'>리스트</button>
            </form>    
			</div>
		</div>
	</div>
</div>

<script>

$(document).ready(function() {
	
	var formObj = $("form");
	
	$('.btn').click(function(e) {
		
		e.preventDefault();
		var operation = $(this).data("oper");
		console.log(operation);
		
		if(operation === 'list'){
			self.location = "/board/list";
			
		}else if(operation === 'remove'){
			formObj.attr("action","/board/remove")
			.attr("method","post");
			formObj.submit();
			
		}else if(operation === 'modify'){
			formObj.attr("action","/board/modify")
			.attr("method","post");
			formObj.submit();
			
		}
	
	})
});

</script>

<%@include file="../includes/footer.jsp"%>
