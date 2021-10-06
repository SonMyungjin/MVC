<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title" align="center">로그인이 필요한 서비스입니다.</h3>
					</div>
						<div class="panel-body">
							<form name='homeForm' method="post" action="/member/login">
								<c:if test="${member == null}">
									<div>
										<label for="userId"></label>
										<input type="text" id="id" name="id">
									</div>
									<div>
										<label for="userPass"></label>
										<input type="password" id="pass" name="pass">
									</div>
									<div>
										<button type="submit" class="btn btn-primary">로그인</button>
					                	<button id="regBtn" type="button" class="btn btn-warning">회원 가입</button>
										
									</div>
								</c:if>
								<c:if test="${member != null }">
									<div>
										<p>${member.id}님 환영 합니다.</p>
										<button id="logoutBtn" type="button">로그아웃</button>
									</div>
								</c:if>
								<c:if test="${msg == false}">
									<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
								</c:if>
							</form>

					</div>
				</div>
			</div>
		</div>
	</div>
<script>
$("#regBtn").click(function() {
	self.location = "/member/register";
});
</script>
  
<%@include file="../includes/footer.jsp"%>
