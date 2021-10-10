<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp"%>

<form action="uploadFromAction" method="post" enctype="multipart/form-data">

	<input type='file' name='uploadFile' multiple>
	<button>Submit</button>

</form>


<%@include file="includes/footer.jsp"%>

