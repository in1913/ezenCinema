<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*, java.text.SimpleDateFormat"%>
<%
	String userid = "";
	if(session.getAttribute("userid") == null){	
	}else{
		userid = (String) session.getAttribute("userid");	
	}
%> 
    <section class="visual">
        <img src="./images/banner/storebanner_1.png" alt="스토어 배너1: 현장에서 티켓 실물을 보여주면 모든 상품 10% 할인해드립니다!">
    </section>
    <section class="store_contents">
        <div class="inner">
            <h3>스토어</h3>

            <ul class="tab">
                <li class="on">콤보</li>
                <li>팝콘</li>
                <li>스낵</li>
                <li>핫도그</li>
                <li>음료</li>
            </ul>

            <ul class="product combo">
            <%
            Vector<StoreDTO> dto = StoreDDL.selectStore("콤보");
        	for(StoreDTO dt : dto){
            %>
                <li>
                    <a href="javascript:void(0)">
                        <img src="<%=dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4><%= dt.getTitle() %></h4>
                            <p><%= dt.getDetail() %></p>
                            <h3><%= dt.getCost() %>원</h3>
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>

            <ul class="product popcorn">
             <%
            dto = StoreDDL.selectStore("팝콘");
        	for(StoreDTO dt : dto){
            %>
                <li>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4><%= dt.getTitle()%></h4>
                            <p><%= dt.getDetail()%></p>
                            <h3><%= dt.getCost()%>원</h3>
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>
            
            <ul class="product snack">
            <%
            dto = StoreDDL.selectStore("스낵");
        	for(StoreDTO dt : dto){
            %>
                <li>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4><%= dt.getTitle()%></h4>
                            <p><%= dt.getDetail()%></p>
                            <h3><%= dt.getCost()%>원</h3>
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>
            <ul class="product hotdog">
            <%
            dto = StoreDDL.selectStore("핫도그");
        	for(StoreDTO dt : dto){
            %>
                <li>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4><%= dt.getTitle()%></h4>
                            <p><%= dt.getDetail()%></p>
                            <h3><%= dt.getCost()%>원</h3>
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>
            <ul class="product drink">
                 <%
            dto = StoreDDL.selectStore("음료");
        	for(StoreDTO dt : dto){
            %>
                <li>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4><%= dt.getTitle()%></h4>
                            <p><%= dt.getDetail()%></p>
                            <h3><%= dt.getCost()%>원</h3>
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>
        </div>
    </section>
    <%@include file = "../include/advertise.jsp" %>