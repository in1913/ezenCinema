<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*, java.text.SimpleDateFormat, java.text.DecimalFormat"%>
<%
	String userid = "";
	if(session.getAttribute("userid") == null){	
	}else{
		userid = (String) session.getAttribute("userid");	
	}
%> 
<%@include file = "include/patchnotes.jsp" %>
<!-- 메인 팝업 -->
<div class="main_warning">
	<img src="images/back/main_warning.png" alt="개인정보 주의 팝업" />
	<div class="warning_close"><img src="images/back/close.png" alt="주의팝업 닫기" /></div>
</div>
<!-- 팝업 닫기 -->

<!-- 팀페이지 팝업 -->
<div class="main_teampage">
	<div class="content text-center" ><h3>팀 EZEN Cinema의 프로필 페이지입니다.</h3></div>
	<a href="index.jsp?fname=team/team"><img src="images/h-button/profileSite.png" alt="팀페이지 이동 버튼"></a>
	<div class="teampage_close"><img src="images/back/close.png" alt="주의팝업 닫기" /></div>
</div>
<!-- 팝업 닫기 -->


<div class="k-fade">
    <div class="k-close"><img src="images/moviedetail/popupclose.png" alt="popupclose"/></div>
</div>
<!-- 팝업 닫기 -->

<!-- 팝업 영상 -->
<div class="k-popup">
    <iframe
        width="1000" height="562" 
        src="" 
        title="YouTube video player" 
        frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
        allowfullscreen>
    </iframe>
</div>
<!-- 팝업 영상 -->
<!-- 메인 슬라이드 -->
<div class="k-mainslider">
    <img src="images/advanceorder/ma-slise_prev.png" class="ma-slideprev" alt="1"></i>
    <img src="images/advanceorder/ma-slide_next.png" class="ma-slidenext" alt="2"></i>
    <div class="controls">
        <button class="play"><img src="images/advanceorder/mainplay.png" alt="play"></button>
        <button class="pause"><img src="images/advanceorder/mainstop.png" alt="stop"></button>
      </div>
    <div class="mainslide">
    <%
    	Vector<MovieDTO> mto = MovieDDL.showSlide();
    	for(MovieDTO mt : mto){
    %>
        <div class="mainslide_box">
            <img src="<%=mt.getSlide_url()%>" alt="<%=mt.getTitle()%>슬라이드">
            <a href="index.jsp?fname=movie/movieDetail&mov_id=<%=mt.getId() %>">상세보기</a>
        </div>
    <%
    	}
    %>
    </div>
</div>

<!-- 메인 슬라이드 -->
<!-- 메인 예매율 순위 -->
<div class="advanceorder">
    <div class="ao-container">
        <h3>현재 인기 순위</h3>
    
        <div class="ao-content">
	    <%
		    Vector<MovieDTO> pto = MovieDDL.viewMoviePopular();
	    	int i = 1;
		    for(MovieDTO pt : pto){
	    %>
            <div class="ao-list col-3">
                <img src="<%=pt.getPoster_url() %>" alt="<%=pt.getTitle()%>포스터">
                <div class="ao-contact">
                    <div class="ct-title" >
                        <span class="ct-mainst"><%=i %></span>
                        <h4><%=pt.getTitle() %></h4>
                    </div>
                    <div class="ct-list">
                        <span class="ao-rt"><%=pt.getRuntime()%>분</span>
                        <span class="ao-rr">예매율</span>
                        <span class="ao-rrr"><%=MovieDDL.getBookingRate(pt.getId()) %>%</span>
                        <span class="ao-al">♡</span>
                        <span class="ao-all"><%=pt.getLike() %></span>
                    </div>
                </div>
                <div class="ao-contacthv">
                    <div class="ct-titlehv" >
                        <h4><%=pt.getTitle() %></h4>
                    </div>
                    <div class="ct-listhv">
                        <span class="ao-release"><%=pt.getOpen_date() %> 개봉</span>
                        <div class="ao-rrhv">
                            <span class="ao-rrhv1">예매율</span>
                            <span class="ao-rrhv2"><%=MovieDDL.getBookingRate(pt.getId()) %>%</span>
                        </div>
                        <div class="ao-grade">
                            <span class="ao-grade1">관람객 평점</span>
                            <span class="ao-grade2"><%=pt.getAvg_rating() %></span>
                        </div>
                    </div>
                    <a href="index.jsp?fname=movie/movieDetail&mov_id=<%=pt.getId() %>" id="Viewdetailshv">상세보기</a>
                    <%
               			if(userid == null || userid == ""){
                	%>
                		<a href="javascript:void(0)" onclick="pleaseLogin()" id="Ticketinghv">예매하기</a>
                	<%
                		}else{
                	%>
                    	<a href="index.jsp?fname=movie/booking" id="Ticketinghv">예매하기</a>
                    <%
                		}
                    %>
                </div>
            </div>
	    <%
	    	i++;
		    }
	    %>
        </div>
    
    </div>
</div>
<!-- 메인 예매율 순위 -->
<!-- 메인 트레일러 -->
<div class="nowtrailer">
    <div class="nt-title">
	    <div class="container">
	    	<h3>현재 상영중인 트레일러</h3>
	    </div>
    </div>
<!--page slider -->
	<div class="nt-trailer">
		<div class="nt-slide">
		<%
			Vector<TrailerDTO> tto = TrailerDDL.showTrailerAll();
			for(TrailerDTO tt : tto){
		%>
			<div class="nt-post">
			    <img src="<%=tt.getThumbnail() %>" data-vodsrc="<%=tt.getVodsrc() %>" alt="1">
				<div class="nt-postbg">
				    <span class="nt-posttitle"><%=tt.getTitle() %></span>
					<span class="nt-postdetail"><%=tt.getVodtitle() %></span>
			    </div>
			</div>
		
		<%
			}
		%>
		</div>
		<div class="container">
			<div class="dotsbox">
				<img src="images/advanceorder/nt-dotsprev.png" class="nt-slideprev" alt="1"/>
				<img src="images/advanceorder/nt-dotsnext.png" class="nt-slidenext ml-2" alt="2"/>
			</div>
		</div>
	</div>
        <!--post slider-->
</div>

<%
Vector<StoreDTO> cdt = StoreCartDDL.selectItemnum(userid);
DecimalFormat df = new DecimalFormat("###,###");
%>
<div class="main-store">
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
			<a href="index.jsp?fname=store/store" class="direct_store"></a>
            <ul class="product combo">
            <%
            Vector<StoreDTO> dto = StoreDDL.selectStoreMain("콤보");
            i = 0;
        	for(StoreDTO dt : dto){
	            int num = dt.getNum();
        		i++;
            %>
                <li class="item <%=dt.getNum()%>">
                	<div class="hover-box"></div>
                    <div class="btn-box">
                        <a href="index.jsp?fname=store/storeDetail&num=<%=dt.getNum() %>" class="cart-detail"></a>
                    </div>
                    <a href="javascript:void(0)">
                        <img src="<%=dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4 class="stitle"><%= dt.getTitle() %></h4>
                            <p class="sdetail"><%= dt.getDetail() %></p>
                            <h3><span class="scost"><%= df.format(dt.getCost()) %></span>원</h3>
                            <input type="hidden" name="scost" class="cost" value="<%=dt.getCost() %>">
                            <input type="hidden" name="count" class="hcount" value="1">
                            <input type="hidden" name="num" class="num" value="<%=dt.getNum() %>">
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>

            <ul class="product popcorn">
             <%
            dto = StoreDDL.selectStoreMain("팝콘");
        	for(StoreDTO dt : dto){
	            int num = dt.getNum();
        		i++;
            %>
                <li class="item <%=dt.getNum()%>">
                	<div class="hover-box"></div>
                    <div class="btn-box">
                        <a href="index.jsp?fname=store/storeDetail&num=<%=dt.getNum() %>" class="cart-detail"></a>
                    </div>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4 class="stitle"><%= dt.getTitle()%></h4>
                            <p class="sdetail"><%= dt.getDetail()%></p>
                            <h3><span class="scost"><%= df.format(dt.getCost())%></span>원</h3>
                            <input type="hidden" name="scost" class="cost" value="<%=dt.getCost() %>">
                            <input type="hidden" name="count" class="hcount" value="1">
                            <input type="hidden" name="num" class="num" value="<%=dt.getNum() %>">
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>
            
            <ul class="product snack">
            <%
            dto = StoreDDL.selectStoreMain("스낵");
        	for(StoreDTO dt : dto){
	            int num = dt.getNum();
        		i++;
            %>
                <li class="item <%=dt.getNum()%>">
                	<div class="hover-box"></div>
                    <div class="btn-box">
                        <a href="index.jsp?fname=store/storeDetail&num=<%=dt.getNum() %>" class="cart-detail"></a>
                    </div>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4 class="stitle"><%= dt.getTitle()%></h4>
                            <p class="sdetail"><%= dt.getDetail()%></p>
                            <h3><span class="scost"><%= df.format(dt.getCost())%></span>원</h3>
                            <input type="hidden" name="scost" class="cost" value="<%=dt.getCost() %>">
                            <input type="hidden" name="count" class="hcount" value="1">
                            <input type="hidden" name="num" class="num" value="<%=dt.getNum() %>">
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>
            <ul class="product hotdog">
            <%
            dto = StoreDDL.selectStoreMain("핫도그");
        	for(StoreDTO dt : dto){
	            int num = dt.getNum();
        		i++;
            %>
                <li class="item <%=dt.getNum()%>">
                	<div class="hover-box"></div>
                    <div class="btn-box">
                        <a href="index.jsp?fname=store/storeDetail&num=<%=dt.getNum() %>" class="cart-detail"></a>
                    </div>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4 class="stitle"><%= dt.getTitle()%></h4>
                            <p class="sdetail"><%= dt.getDetail()%></p>
                            <h3><span class="scost"><%= df.format(dt.getCost())%></span>원</h3>
                            <input type="hidden" name="scost" class="cost" value="<%=dt.getCost() %>">
                            <input type="hidden" name="count" class="hcount" value="1">
                            <input type="hidden" name="num" class="num" value="<%=dt.getNum() %>">
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>
            <ul class="product drink">
                 <%
            dto = StoreDDL.selectStoreMain("음료");
        	for(StoreDTO dt : dto){
	            int num = dt.getNum();
        		i++;
            %>
                <li class="item <%=dt.getNum()%>">
                	<div class="hover-box"></div>
                    <div class="btn-box">
                        
                        <a href="index.jsp?fname=store/storeDetail&num=<%=dt.getNum() %>" class="cart-detail"></a>
                    </div>
                    <a href="javascript:void(0)">
                        <img src="<%= dt.getPhoto_url() %>" alt="<%= dt.getTitle()%>">
                        <div class="txt">
                            <h4 class="stitle"><%= dt.getTitle()%></h4>
                            <p class="sdetail"><%= dt.getDetail()%></p>
                            <h3><span class="scost"><%= df.format(dt.getCost())%></span>원</h3>
                            <input type="hidden" name="scost" class="cost" value="<%=dt.getCost() %>">
                            <input type="hidden" name="count" class="hcount" value="1">
                            <input type="hidden" name="num" class="num" value="<%=dt.getNum() %>">
                        </div>
                    </a>
                </li>
			<%
        	}
			%>
            </ul>

        </div>
    </section>
</div>
<%@include file = "include/advertise.jsp" %>
