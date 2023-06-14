<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*"%>
<%
	String userid = "";
	if(session.getAttribute("userid") == null){	
	}else{
		userid = (String) session.getAttribute("userid");	
	}
%> 
<!-- 메인 팝업 -->
<div class="main_warning">
	<img src="images/back/main_warning.png" alt="개인정보 주의 팝업" />
	<div class="warning_close">닫기<img src="images/ico/ico-close.png" alt="주의팝업 닫기" /></div>
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
        <h3>현재 상영중인 트레일러</h3>
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
          <div class="dotsbox">
            <img src="images/advanceorder/nt-dotsprev.png" class="nt-slideprev" alt="1"/>
            <img src="images/advanceorder/nt-dotsnext.png" class="nt-slidenext ml-2" alt="2"/>
          </div>
        </div>
        <!--post slider-->
</div>
<div class="main-store">
	<section class="store_contents">
        <div class="inner">
            <h3>스토어</h3>

            <ul class="tab">
                <li class="on">콤보</li>
                <li>팝콘/스낵</li>
                <li>음료</li>
                
            </ul>
			<a href="index.jsp?fname=store/store" class="direct_store"></a>
            <ul class="product combo">
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/solocombo.png" alt="솔로콤보">
                        <div class="txt">
                            <h4>솔로 콤보</h4>
                            <p>팝콘 (M) 1 + 탄산음료 (R) 1</p>
                            <h3>7,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/couplecombo.png" alt="커플콤보">
                        <div class="txt">
                            <h4>커플 콤보</h4>
                            <p>팝콘 (L) 1 + 탄산음료 (R) 2</p>
                            <h3>11,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/dubcombo.png" alt="더블콤보">
                        <div class="txt">
                            <h4>더블 콤보</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
            </ul>

            <ul class="product snack">
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_01.png" alt="솔로콤보">
                        <div class="txt">
                            <h4>팝콘</h4>
                            <p>팝콘 (M) 1 + 탄산음료 (R) 1</p>
                            <h3>7,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_02.png" alt="커플콤보">
                        <div class="txt">
                            <h4>팝콘</h4>
                            <p>팝콘 (L) 1 + 탄산음료 (R) 2</p>
                            <h3>11,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_03.png" alt="더블콤보">
                        <div class="txt">
                            <h4>팝콘</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
            </ul>
            <ul class="product drink">
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/coke.png" alt="콜라">
                        <div class="txt">
                            <h4>탄산음료</h4>
                            <p>콜라(R)</p>
                            <h3>2,600원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/coke.png" alt="콜라">
                        <div class="txt">
                            <h4>탄산음료</h4>
                            <p>콜라(R)</p>
                            <h3>2,600원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/coke.png" alt="콜라">
                        <div class="txt">
                            <h4>탄산음료</h4>
                            <p>콜라(R)</p>
                            <h3>2,600원</h3>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </section>
</div>
<%@include file = "include/advertise.jsp" %>