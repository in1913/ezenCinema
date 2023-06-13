<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*"%>
<%
    Random rnum = new Random();
	int rinum = rnum.nextInt(3);
%>
<div class="list_banner">
	<img src="images/banner/list_banner0<%=rinum %>.png" alt="리스트배너<%=rinum %>" />
</div>