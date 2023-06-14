<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<%
Random random = new Random();
int randomNumber = random.nextInt(6);
%>
<div class="banner_box">
	<img src="images/banner/banner0<%=randomNumber %>.png" alt="광고배너<%=randomNumber %>" />
	<div class="banner_close"></div>
</div>
