<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*, java.text.SimpleDateFormat, java.text.DecimalFormat"%>

<%
	String userid = "";
	if(session.getAttribute("userid") != null){
		userid = (String) session.getAttribute("userid");
	}
	
    Vector<StoreDTO> cdt = StoreCartDDL.selectItemnum(userid);
	DecimalFormat df = new DecimalFormat("###,###");
%>
    <section class="visual">
        <img src="./images/banner/storebanner_1.png" alt="스토어 배너1: 현장에서 티켓 실물을 보여주면 모든 상품 10% 할인해드립니다!">
    </section>
    <section class="store_pay">
        <div class="inner">
            <h3 class="pay">결제</h3>
            <div class="table">
                <div class="thead">
                    <div class="row tr">
                        <div class="th col-2">
                            <input type="checkbox" class="checkAll">
                            전체선택
                        </div>
                        <div class="th col-5">주문상폼</div>
                        <div class="th col-2">구매수량</div>
                        <div class="th col-3">가격</div>
                    </div>
                </div>
                <div class="tbody">
                    <%
                    int total = 0; 
                    int i = 0;
                   	for(StoreDTO dt : cdt){
                    int num = dt.getNum();
                    StoreDTO cdto = StoreCartDDL.selectCart(userid, num);
                    StoreCartDTO ct = StoreCartDDL.selectCartAll(userid, dt.getNum());
                    total += cdto.getCost()*ct.getCount();
                    %>
                    <div class="row tr <%=i %>">
                        <div class="td col-2">
                            <input type="checkbox" class="check">
                        </div>
                        <div class="td col-5">
                            <div class="listbox row">
                                <img src="<%=dt.getPhoto_url() %>" alt="<%=dt.getPhoto_url() %>">
                                <div class="list_contnet">
                                    <h3><%=dt.getTitle() %></h3>
                                    <p><%=dt.getDetail() %></p>
                                </div>
                            </div>
                        </div>
                        <div class="td col-2 text-center">
                            <div class="count_box">
                                <input type="number" class="ct" name="count" min="1" max="9" value="<%=ct.getCount() %>" readonly>
                                <input type="hidden" class="itemnum" name="itemnum" value="<%=ct.getItemnum() %>">
                                <a class="count up"></a>
                                <a class="count down"></a>
                            </div>
                        </div>
                        <div class="td col-3 costbox">
                            <div class="cost text-center">
                                <span class="costs"><%=df.format(cdto.getCost() * ct.getCount()) %></span>원
                                <input type="hidden" class="dCost" name="dCost" value="<%=cdto.getCost() * ct.getCount() %>">
                            </div>
                            <a href="javascript:void(0)" class="list_delete"></a>
                        </div>
                    </div>
                    <%
                    i++;
                	}
                    %>
                </div>
            </div>
            <div class="cart_reply">
                <a href="javascript:void(0)" class="cdel">선택상품 삭제(<span>0</span>)</a>
                <div class="total_cost row">
                    <span>총 상품 금액</span>
                    <span class="total"><span class="total_cost">0</span>원</span>
                    <input type="hidden" name="total_cost" id="total_cost" value="0">
                </div>
                <a href="javascript:void(0)" class="buy_btn" id="buy_btn"></a>
                <input type="hidden" name="items" id="items" value="">
            </div>
        </div>

    </section>
    <%@include file = "../include/advertise.jsp" %>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/store.js"></script>