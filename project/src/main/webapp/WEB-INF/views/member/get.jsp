<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원 조회</h1>
	</div>
</div>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				회원 조회
			</div>

			<!-- /.panel-heading -->
		<div class="panel-body">
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
			  <tr>
				<td><input type="text" class="form-control" id="postcode" name="postcode" value="<c:out value='${member.postcode}'/>" style="width: 20%"></td>
				<td><input type="text" class="form-control" id="address" name="address" value="<c:out value='${member.address}'/>" style="width: 70%"></td>
			  </tr>
			
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
				<button type="submit" class="btn btn-primary"><a href='/member/list'>확인</a></button>
                <button type="reset" class="btn btn-warning"><a href='/member/modify?mno=<c:out value="${member.mno}"/>'>수정하기</a></button>
			</div>
		</div>
	</div>
</div>


<%@include file="../includes/footer.jsp"%>
