<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원 등록</h1>
	</div>
</div>

<!-- /.row -->
<div class="container">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				회원 등록
			</div>

			<!-- /.panel-heading -->
		<div class="panel-body">
		 <form action="/member/register" method="post">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="id">아이디:</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" style="width: 30%">
				    </div>
			  	</div>					
			  
			<div class="form-group">
			    <label class="control-label col-sm-2" for="pass">비밀번호:</label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호를 입력하세요" style="width: 30%">
				</div>	
			</div>	

			<div class="form-group">
			  <label class="control-label col-sm-2" for="name">이름:</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요" style="width: 30%">
			  </div>
			</div>					
			
			<div class="form-group">
			 <label class="control-label col-sm-2" for="name">주소:</label>
			  <div class="col-sm-10">
			   <table>
			    <tr>
				<td><input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호"></td>
				<td><input type="button" class="btn btn-warning" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
			 </tr>
			</table>
			
				<input type="text" class="form-control" id="address" name="address" placeholder="주소" style="width: 70%">
			
			<table>	
			<tr>	
				<td><input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소"></td>
				<td><input type="text" class="form-control" id="extraAddress" name="extraAddress" placeholder="참고항목"></td>
				 </tr>
				 </table>
			  </div>
			</div>
			
			<div class="form-group">
			<label class="control-label col-sm-2" for="age">나이:</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" id="age" name="age" placeholder="나이를 입력하세요" style="width: 30%">
			  </div>
			</div>			

			<div class="form-group">
			<label class="control-label col-sm-2" for="email">이메일:</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" style="width: 30%">
			  </div>
			</div>				  					

			<button type="submit" class="btn btn-primary">제출</button>
            <button type="reset" class="btn btn-warning">취소</button>
			</form>
		</div>
	</div>
</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
     function execDaumPostcode() {
         new daum.Postcode({
             oncomplete: function(data) {
                 var addr = ''; // 주소 변수
                 var extraAddr = ''; // 참고항목 변수

                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                 }

                 if(data.userSelectedType === 'R'){
                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                         extraAddr += data.bname;
                     }
                     if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     if(extraAddr !== ''){
                         extraAddr = ' (' + extraAddr + ')';
                     }
                     document.getElementById("extraAddress").value = extraAddr;
                 
                 } else {
                     document.getElementById("extraAddress").value = '';
                 }

                 document.getElementById('postcode').value = data.zonecode;
                 document.getElementById("address").value = addr;
                 document.getElementById("detailAddress").focus();
             }
         }).open();
     }
  </script>


<%@include file="../includes/footer.jsp"%>