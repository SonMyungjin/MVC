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
					<input class="form-control" name="title" style="width: 50%" readonly value="<c:out value='${board.bno}'/>">
				</div>					
				
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" name="title" style="width: 50%" readonly value="<c:out value='${board.title}'/>">
				</div>					

				<div class="form-group">
					<label>내용</label>
					<textarea rows="5" cols="50" name="content" class="form-control" style="width: 75%" readonly ><c:out value="${board.content}"/></textarea>
				</div>					

				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="writer" style="width: 15%" readonly value="<c:out value='${board.writer}'/>">
				</div>					
				
				<div class="form-group">
					<label>첨부파일</label><br>
					<c:forEach var="file" items="${file}">
					<a href="#" onclick="fn_fileDown('${file.FNO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}KB)<br>
					</c:forEach>
				</div>
				
				<button data-oper='list' class="btn btn-primary">확인</button>
                <button data-oper='modify' class="btn btn-warning">수정하기</button>
                
                <form name='operForm' id='operForm' method="get">
                	<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
                	<input type="hidden" id="FNO" name="FNO" value=''/>
                </form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
  });  
});

function fn_fileDown(fileNo){
	var operForm = $("#operForm"); 
	$("#FNO").attr("value", fileNo);
	operForm.attr("action", "/board/fileDown");
	operForm.submit();
}


</script>


<%@include file="../includes/footer.jsp"%>
