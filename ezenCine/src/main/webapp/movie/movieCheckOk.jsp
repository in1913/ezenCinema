<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="ezenCine.*, java.sql.*, java.util.*"%>

<%
    Vector<ScreenDTO> dto = ScreenDDL.selectDinsinctCinema(request.getParameter("movie_id"));
    for(ScreenDTO dt : dto) {
%>
    <label class="select_btn">
        <input type="radio" name="cinema-location" value="<%=dt.getCinema_name()%>">
        <%=dt.getCinema_name() %>
    </label>
<%
    }
%>
