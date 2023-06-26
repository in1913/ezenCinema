<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*, java.text.SimpleDateFormat, java.text.DecimalFormat"%>

<%
	String userid = "";
	if(session.getAttribute("userid") != null){
		userid = (String) session.getAttribute("userid");
	} 
	
	int num = Integer.parseInt(request.getParameter("num"));
	Vector<StoreDTO> dto = StoreDDL.storeDetail(num);
    Vector<StoreDTO> cdt = StoreCartDDL.selectItemnum(userid);
	StoreCartDTO ct = StoreCartDDL.selectCartAll(userid, num);
%>
    <section class="store_detail">
		<div class="inner">
			<%
	    		for(StoreDTO dt : dto){ 
	    			int cost = dt.getCost();
	    			DecimalFormat df = new DecimalFormat("###,###");
	    	%>
			<h1 class="sd_title"><%= dt.getCategory() %></h1>
			<div class="sd_detail">
				<div class="row">
					<div class="col-4">
						<img src="<%=dt.getPhoto_url() %>" alt="<%=dt.getTitle() %>">
					</div>
					<div class="col-8">
						<div class="detail_box">
							<h2><%=dt.getTitle() %></h2>
							<p><span>상품구성 </span><%=dt.getDetail() %></p>
							<p><span>유효기간 </span>구매일로부터 12개월 이내 사용가능</p>
							<p><span>구매 후 취소 </span>구매 후 7일 이내 취소 가능</p>
							<p><span>구매 수량 </span>1회 당 최대 9개까지 구매 가능</p>
						</div>
						<div class="sd_count" id="item">
							<label for="count">수량 / 금액</label>
							<div class="count_box">
								<input type="number" class="count" id="count" name="count" min="1" max="9" value="<%=ct.getCount() %>" readonly>
								<input type="hidden" name="num" id="num" value="<%= dt.getNum()%>">
								<a class="countbtn up"></a>
								<a class="countbtn down"></a>
							</div>
							<h1><span class="cost" id="cost"><%=df.format(cost * ct.getCount()) %></span>원</h1>
							<input type="hidden" id="dCost" name="dCost" value="<%=dt.getCost() %>">
							<div class="btn_box">
							<%
								if(userid == null || userid == ""){
							%>
								<a href="javascript:void(0)" onclick="pleaseLogin()" class="cart"></a>
								<a href="javascript:void(0)" onclick="pleaseLogin()" class="buy"></a>
							<%
								}else if(!cdt.isEmpty()){
									if(ct.getItemnum() == dt.getNum()){
								
							%>
								<a href="javascript:void(0)" class="cart" onclick="cartAlready()"></a>
								<a href="index.jsp?fname=store/storePay" class="buy"></a>
							<%
									}else{
							%>
								<a href="javascript:void(0)" class="cart" id="cart"></a>
								<a href="javascript:void(0)" class="buy" id="topay"></a>
							<%
									}
								}else{
									
							%>
								<a href="javascript:void(0)" class="cart" id="cart"></a>
								<a href="javascript:void(0)" class="buy" id="topay"></a>
							<%
								}
							%>
							</div>
						</div>
					</div>
				</div>
			</div>
				<%
			}
			%>
			<div class="sd_cancelbox">
				<h1 class="sd_cancel">구매 후 취소 <a href="javascript:void(0)" class="show-arrow cancel"></a></h1>
				<div class="sd_c_detail">
					<p class="head">■ 연장/취소/환불 안내</p>
					
					<p>본 상품은 구매일로부터 10일 이내에 취소 가능합니다. </p>
					<p>- 유효기간은 본 상품의 유효기간 내에서 연장 신청이 가능하며, 1회 연장 시 3개월(92일) 단위로 연장됩니다. </p>
					<p>- 구매일로부터 5년까지 유효기간 연장이 가능합니다. </p>
					<p>- 최초 유효기간 만료 후에는 결제금액의 90%에 대해 환불 요청 가능하며, 환불 처리에 7일 이상의 시간이 소요될 수 있습니다.(접수처: 1544-0070) </p>
					<p>- 구매 취소 및 환불 요청은 미사용 상품에 한해 가능하며, 사용한 상품에 대해서는 불가합니다. </p>
					<p>- 본 상품은 현금으로 환불이 불가합니다. </p>
					<p>- 환불 요청한 포인트 중 소멸 포인트가 포함되어있다면 환불 요청한 월의 말일까지 사용 가능한 포인트로 돌아갑니다. </p>
					<p>※ 2020년 2월 4일 이후 구매 상품에 한하여 유효기간 연장 신청이 가능합니다.</p>
				</div>
			</div>
			<div class="sd_infobox">
				<h1 class="sd_info">상품이용안내 <a href="javascript:void(0)" class="show-arrow info"></a></h1>
				<div class="sd_i_detail">
					<p class="head">■ 사용가능 지점</p>
					
					<p>구매 전 사용가능 지점을 반드시 확인해주세요! </p>
					<p>- 경기 : 김포 장기점</p>

					<p class="head">■ 유효기간</p>
					<p>본 상품은 구매일로부터 12개월까지 사용 가능합니다.</p>
				</div>
			</div>
			<div class="sd_originbox">
				<h1 class="sd_origin">원산지 정보<a href="javascript:void(0)" class="show-arrow origin"></a></h1>
				<div class="sd_o_detail">
					<!-- <p class="head">■ 원산지</p> -->
					<p class="head">■ 팝콘</p>
					<p>- 옥수수 : 미국산</p>

					<p class="head">■ 나쵸</p>
					<p>- 나쵸 : 미국산</p>

					<p class="head">■ 핫도그</p>
					<p>- 돼지고기 : 미국산</p>
					<p>- 밀 : 미국산</p>

					<p class="head">■ 츄러스, 프레첼</p>
					<p>- 밀 : 미국산</p>
					
				</div>
			</div>
		</div>
    </section>
    <%@include file = "../include/advertise.jsp" %>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/store.js"></script>