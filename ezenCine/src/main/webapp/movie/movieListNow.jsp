<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*"%>
<%
	String userid = "";
	if(session.getAttribute("userid") == null){	
	}else{
		userid = (String) session.getAttribute("userid");	
	}
%> 
    <section class="movieList">
	    <div class="movieList_top">
    	<%@include file = "../include/listbanner.jsp" %>
	    	<div class="h-movie-search-box">
	            <div class="c-searchbox">
		            <input spellcheck="false" type="text" name="h-movie-search" id="h-movie-search" placeholder="영화 검색하기" oninput="cSearchMovie();">
					<ul class="c-search-complete">
					</ul>
		            <a href="javascript:cGoMovie();" class="h-movie-search-btn"></a>
	            </div>
	        </div>
	        <ul class="h-movie-list justify-content-center font-weight-bold container">
	        
	            <li><a href="index.jsp?fname=movie/movieListPopular" >인기 영화</a></li>
	            <li class="h-active"><a href="index.jsp?fname=movie/movieListNow" >현재 상영작</a></li>
	            <li><a href="index.jsp?fname=movie/movieListExpected" >상영 예정작</a></li>
	            <li><a href="index.jsp?fname=movie/movieListPast" >지난 상영작</a></li>
	        </ul>
	    </div>
	    <div class="container">
	        <div class="h-movie" id="movie">
	            <h5><span>현재 상영작</span></h5>
	            <ul class="h-movie-movie">
	            <%
	            	Vector<MovieDTO> dto = MovieDDL.viewMovieNowAll();
	            	for(MovieDTO dt : dto){
	            %>
	                <li class="col-3">
	                    <div class="h-movie-all">
	                        <div class="h-imgbox">
	                            <img src="<%=dt.getPoster_url() %>" alt="포스터">
	                            <div class="h-movie-content">
	                                <div class="h-movie-content-bg"></div>
	                                <a href="index.jsp?fname=movie/movieDetail&mov_id=<%=dt.getId() %>" class="h-movie-info"></a>
	                            <%
									if(userid == null || userid == ""){
								%>
									<a href="javascript:void(0)" onclick="pleaseLogin()" class="h-movie-booking"></a>
								<%
									}else{
								%>
									<a href="index.jsp?fname=movie/booking" class="h-movie-booking"></a>
								<%
									}
								%>
	                            </div>
	                        </div>
	                        <p class="h-movie-title"><%=dt.getTitle() %></p>
	                        <div class="h-rate-star">
	                            <span class="h-rate">예매율 <%= MovieDDL.getBookingRate(dt.getId())%>%</span>
	                            <span class="h-star"><%=dt.getAvg_rating() %></span>
	                        </div>
	                    </div>
	                </li>
	            <%
	            	}
	            %>
	            </ul>
	        </div>
	        
	    </div>
    </section>
    <%@include file = "../include/advertise.jsp" %>