<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원 목록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            회원 목록
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>아이디</th>
                                        <th>이름</th>
                                        <th>나이</th>
                                        <th>이메일</th>
                                        <th>주소</th>
                                    </tr>
                                </thead>
                                
                                <c:forEach items="${list}" var="member">
                                    <tr class="odd gradeX">
                                        <td><c:out value="${member.mno}"/></td>
                                        <td><a href='/member/get?mno=<c:out value="${member.mno}"/>'><c:out value="${member.id}"/></a></td>
                                        <td><c:out value="${member.name}"/></td>
                                        <td><c:out value="${member.age}"/></td>
                                        <td><c:out value="${member.email}"/></td>
                                        <td><c:out value="${member.address}"/></td>
                                    </tr>
 								</c:forEach>
                            </table>
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
 		    <!-- /.row -->
 		    
 <!-- 모달 -->    
 <div id="myModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">회원 등록 확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	//현재 브라우저에서 보관하고 있던 데이터 지우기!
	history.replaceState({}, null, null);
	
	function checkModal(result) {
		
		if(result === '' || history.state) {
			return;
		}
		
		if(result === 'success'){
			$(".modal-body").html(
		      "정상적으로 처리되었습니다.");
		}else if(parseInt(result) > 0){
			$(".modal-body").html(
		      "회원" + parseInt(result) + "번이 등록되었습니다.");
		}
		
		
		$("#myModal").modal("show");
	}
	

	
});


</script>
 			
       
<%@include file="../includes/footer.jsp"%>
