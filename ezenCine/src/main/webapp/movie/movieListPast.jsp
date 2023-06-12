<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*"%>
    
    <section class="movieList">
	    <div class="container">
	        <div class="h-movie-search-box">
	            <input type="text" name="h-movie-search" id="h-movie-search" placeholder="영화 검색하기">
	            <a href="javascript:void(0)" class="h-movie-search-btn"></a>
	        </div>
	        <ul class="h-movie-list justify-content-center font-weight-bold">
	            <li><a href="index.jsp?fname=movie/movieListPopular" >인기 영화</a></li>
	            <li><a href="index.jsp?fname=movie/movieListNow" >현재 상영작</a></li>
	            <li><a href="index.jsp?fname=movie/movieListExpected" >상영 예정작</a></li>
	            <li><a class="h-active" href="index.jsp?fname=movie/movieListPast" >지난 상영작</a></li>
	        </ul>
	        <div class="h-movie" id="movie">
	            <h5><span>지난 상영작</span></h5>
	            <ul class="h-movie-movie">
	            <%
	            	Vector<MovieDTO> dto = MovieDDL.viewMoviePastAll();
	            	for(MovieDTO dt : dto){
	            %>
	                <li class="col-3">
	                    <div class="h-movie-all">
	                        <div class="h-imgbox">
	                            <img src="<%=dt.getPoster_url() %>" alt="포스터">
	                            <div class="h-movie-content">
	                                <div class="h-movie-content-bg"></div>
	                                <a href="index.jsp?fname=movie/movieDetail&mov_id=<%=dt.getId() %>" class="h-movie-info expected"></a>
	                                
	                            </div>
	                        </div>
	                        <p class="h-movie-title"><%=dt.getTitle() %></p>
	                        <div class="h-rate-star">
	                            <span class="h-rate">예매율 <%= MovieDDL.getBookingRate(dt.getId())%>%</span>
	                            <span class="h-star"><%=dt.getLike() %></span>
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