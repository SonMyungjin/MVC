<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원 수정/삭제</h1>
	</div>
</div>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				회원 수정/삭제
			</div>

			<!-- /.panel-heading -->
		<div class="panel-body">
			<form>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="id">아이디:</label>
				    <div class="col-sm-10">
				    	<input type="text" class="form-control" id="id" name="id" value="<c:out value='${member.id}'/>" style="width: 30%">
				    </div>
			  	</div>					
			  
			<div class="form-group">
			  <label class="control-label col-sm-2" for="name">이름:</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="name" name="name" value="<c:out value='${member.name}'/>" style="width: 30%">
			  </div>
			</div>					
			
			<div class="form-group">
			 <label class="control-label col-sm-2" for="name">주소:</label>
			  <div class="col-sm-10">
		   <table>
			 <tr>
				<td><input type="text" class="form-control" id="postcode" name="postcode" value="<c:out value='${member.postcode}'/>"></td>
				<td><input type="button" class="btn btn-warning" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
			 </tr>
			</table>
			
				<input type="text" class="form-control" id="address" name="address" value="<c:out value='${member.address}'/>" style="width: 70%">
			
			<table>	
				<tr>	
					<td><input type="text" class="form-control" id="detailAddress" name="detailAddress" value="<c:out value='${member.detailAddress}'/>"></td>
					<td><input type="text" class="form-control" id="extraAddress" name="extraAddress" value="<c:out value='${member.extraAddress}'/>"></td>
				</tr>
				</table>
				</div>
			</div>
			
			<div class="form-group">
			<label class="control-label col-sm-2" for="age">나이:</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" id="age" name="age" value="<c:out value='${member.age}'/>" style="width: 30%">
			  </div>
			</div>			

			<div class="form-group">
			<label class="control-label col-sm-2" for="email">이메일:</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" id="email" name="email" value="<c:out value='${member.email}'/>" style="width: 30%">
			  </div>
			</div>						
				
				<button class="btn btn-primary" data-oper='modify'>수정</button>
                <button class="btn btn-danger" data-oper='remove'>삭제</button>
                <button class="btn btn-info" data-oper='list'>리스트</button>
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

<script>

$(document).ready(function() {
	
	var formObj = $("form");
	
	$('.btn').click(function(e) {
		
		e.preventDefault();
		var operation = $(this).data("oper");
		console.log(operation);
		
		if(operation === 'list'){
			self.location = "/member/list";
			
		}else if(operation === 'remove'){
			formObj.attr("action","/member/remove")
			.attr("method","post");
			formObj.submit();
			
		}else if(operation === 'modify'){
			formObj.attr("action","/member/modify")
			.attr("method","post");
			formObj.submit();
			
		}
	
	})
});

</script>

<%@include file="../includes/footer.jsp"%>
