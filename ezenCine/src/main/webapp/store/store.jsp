<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*, java.text.SimpleDateFormat, java.text.DecimalFormat"%>
<%
	String userid = "";
	if(session.getAttribute("userid") == null){	
	}else{
		userid = (String) session.getAttribute("userid");	
	}
    Vector<StoreDTO> cdt = StoreCartDDL.selectItemnum(userid);
	DecimalFormat df = new DecimalFormat("###,###");
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
            int i = 0;
        	for(StoreDTO dt : dto){
	            int num = dt.getNum();
        		i++;
            %>
                <li id="item">
                	<div class="hover-box"></div>
                    <div class="btn-box">
                    	<%
							if(userid == null || userid == ""){
						%>
                        <span onclick="pleaseLogin()" class="cart"></span>
						<%
							}else if(!cdt.isEmpty()){
				        		for(StoreDTO cdto : cdt){
				            		StoreCartDTO ct = StoreCartDDL.selectCartAll(userid, num);
				            		if(ct.getItemnum() == dt.getNum()){
            			%>
            			<span class=cart onclick="cartAlready()"></span>
            			<%
				            		}else{
	            		%>
                        <span class=cart id="cart"></span>
	            		
	            		<%
				            		}
				        		}
							}else{
						%>
                        <span class=cart id="cart"></span>
						<%
							}
						%>
                        <a href="index.jsp?fname=store/storeDetail&num=<%=dt.getNum() %>" class="cart-detail"></a>
                    </div>
                    <a href="javascript:void(0)">
                        <img src="<%=dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4 class="stitle"><%= dt.getTitle() %></h4>
                            <p class="sdetail"><%= dt.getDetail() %></p>
                            <h3><span class="scost"><%= df.format(dt.getCost()) %></span>원</h3>
                            <input type="hidden" name="scost" id="scost" value="<%=dt.getCost() %>">
                            <input type="hidden" name="count" id="count" value="1">
                            <input type="hidden" name="num" id="num" value="<%=dt.getNum() %>">
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
	            int num = dt.getNum();
        		i++;
            %>
                <li id="item">
                	<div class="hover-box"></div>
                    <div class="btn-box">
                    	<%
							if(userid == null || userid == ""){
						%>
                        <span onclick="pleaseLogin()" class="cart"></span>
						<%
							}else if(!cdt.isEmpty()){
				        		for(StoreDTO cdto : cdt){
				            		StoreCartDTO ct = StoreCartDDL.selectCartAll(userid, num);
				            		if(ct.getItemnum() == dt.getNum()){
            			%>
            			<span class=cart onclick="cartAlready()"></span>
            			<%
				            		}else{
	            		%>
                        <span class=cart id="cart"></span>
	            		
	            		<%
				            		}
				        		}
							}else{
						%>
                        <span class=cart id="cart"></span>
						<%
							}
						%>
                        <a href="index.jsp?fname=store/storeDetail&num=<%=dt.getNum() %>" class="cart-detail"></a>
                    </div>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4 class="stitle"><%= dt.getTitle()%></h4>
                            <p class="sdetail"><%= dt.getDetail()%></p>
                            <h3><span class="scost"><%= df.format(dt.getCost())%></span>원</h3>
                            <input type="hidden" name="count" id="count" value="1">
                            <input type="hidden" name="num" id="num" value="<%=dt.getNum() %>">
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
	            int num = dt.getNum();
        		i++;
            %>
                <li id="item">
                	<div class="hover-box"></div>
                    <div class="btn-box">
                        <%
							if(userid == null || userid == ""){
						%>
                        <span onclick="pleaseLogin()" class="cart"></span>
						<%
							}else if(!cdt.isEmpty()){
				        		for(StoreDTO cdto : cdt){
				            		StoreCartDTO ct = StoreCartDDL.selectCartAll(userid, num);
				            		if(ct.getItemnum() == dt.getNum()){
            			%>
            			<span class=cart onclick="cartAlready()"></span>
            			<%
				            		}else{
	            		%>
                        <span class=cart id="cart"></span>
	            		
	            		<%
				            		}
				        		}
							}else{
						%>
                        <span class=cart id="cart"></span>
						<%
							}
						%>
                        <a href="index.jsp?fname=store/storeDetail&num=<%=dt.getNum() %>" class="cart-detail"></a>
                    </div>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4 class="stitle"><%= dt.getTitle()%></h4>
                            <p class="sdetail"><%= dt.getDetail()%></p>
                            <h3><span class="scost"><%= df.format(dt.getCost())%></span>원</h3>
                            <input type="hidden" name="count" id="count" value="1">
                            <input type="hidden" name="num" id="num" value="<%=dt.getNum() %>">
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
	            int num = dt.getNum();
        		i++;
            %>
                <li id="item">
                	<div class="hover-box"></div>
                    <div class="btn-box">
                        <%
							if(userid == null || userid == ""){
						%>
                        <span onclick="pleaseLogin()" class="cart"></span>
						<%
							}else if(!cdt.isEmpty()){
				        		for(StoreDTO cdto : cdt){
				            		StoreCartDTO ct = StoreCartDDL.selectCartAll(userid, num);
				            		if(ct.getItemnum() == dt.getNum()){
            			%>
            			<span class=cart onclick="cartAlready()"></span>
            			<%
				            		}else{
	            		%>
                        <span class=cart id="cart"></span>
	            		
	            		<%
				            		}
				        		}
							}else{
						%>
                        <span class=cart id="cart"></span>
						<%
							}
						%>
                        <a href="index.jsp?fname=store/storeDetail&num=<%=dt.getNum() %>" class="cart-detail"></a>
                    </div>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4 class="stitle"><%= dt.getTitle()%></h4>
                            <p class="sdetail"><%= dt.getDetail()%></p>
                            <h3><span class="scost"><%= df.format(dt.getCost())%></span>원</h3>
                            <input type="hidden" name="count" id="count" value="1">
                            <input type="hidden" name="num" id="num" value="<%=dt.getNum() %>">
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
	            int num = dt.getNum();
        		i++;
            %>
                <li id="item">
                	<div class="hover-box"></div>
                    <div class="btn-box">
                        <%
							if(userid == null || userid == ""){
						%>
                        <span onclick="pleaseLogin()" class="cart"></span>
						<%
							}else if(!cdt.isEmpty()){
				        		for(StoreDTO cdto : cdt){
				            		StoreCartDTO ct = StoreCartDDL.selectCartAll(userid, num);
				            		if(ct.getItemnum() == dt.getNum()){
            			%>
            			<span class=cart onclick="cartAlready()"></span>
            			<%
				            		}else{
	            		%>
                        <span class=cart id="cart"></span>
	            		
	            		<%
				            		}
				        		}
							}else{
						%>
                        <span class=cart id="cart"></span>
						<%
							}
						%>
                        <a href="index.jsp?fname=store/storeDetail&num=<%=dt.getNum() %>" class="cart-detail"></a>
                    </div>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4 class="stitle"><%= dt.getTitle()%></h4>
                            <p class="sdetail"><%= dt.getDetail()%></p>
                            <h3><span class="scost"><%= df.format(dt.getCost())%></span>원</h3>
                            <input type="hidden" name="count" id="count" value="1">
                            <input type="hidden" name="num" id="num" value="<%=dt.getNum() %>">
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>
            <%
            int total = 0;
            if(!cdt.isEmpty()){
            %>
	        <form class="store_cart">
	            <h4 class="cart_title">담은 품목</h4>
	            <%
	            if((int)cdt.size() > 3){
	            %>
	            <div class="cart_listbox cumtom_scrollbar">
	            <%
	            }else{
	            %>
	            <div class="cart_listbox">
                <%
	            }
                    for(StoreDTO dt : cdt){
                        int num = dt.getNum();
                        StoreDTO cdto = StoreCartDDL.selectCart(userid, num);
                        StoreCartDTO ct = StoreCartDDL.selectCartAll(userid, dt.getNum());
                        total += cdto.getCost()*ct.getCount();
                %>
                        <div class="cart_list">
                            <p><span id="ctitle"><%=cdto.getTitle() %></span><span class="total_cost"><span id="total_cost"><%=df.format(cdto.getCost() * ct.getCount()) %></span>원</span></p>
                            <input type="hidden" class="dCost" name="dCost" value="<%=cdto.getCost() %>">
                            <div class="count_box">
                                <input type="number" class="count" name="count" min="1" max="9" value="<%= ct.getCount()%>" readonly>
                                <input type="hidden" class="itemnum" name="itemnum" value="<%=ct.getItemnum() %>">
                                <a class="count_btn countUp"></a>
                                <a class="count_btn countDown"></a>
                                <a href="javascript:void(0)" class="cart_list_close" id="delete"></a>
                            </div>
                        </div>
                        <%
                    }
                    
                    %>
                </div>
                <div class="cart_total">
                    <p>총 상품 금액<span class="list_total_cost"><span id="list_total_cost"><%=df.format(total) %></span>원</span></p>
                    <input type="hidden" id="list_total" name="list_total" value="<%=total %>">
                </div>
                <a href="index.jsp?fname=store/storePay" class="pay_btn" id="topay"></a>
	        </form>
	        <%
	        }
	        %>
        </div>
    </section>
    <%@include file = "../include/advertise.jsp" %>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/store.js"></script>