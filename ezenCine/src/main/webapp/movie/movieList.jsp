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
	            <li><a href="javascript:void(0)" id="nav-movie">현재 상영작</a></li>
	            <li><a href="javascript:void(0)" id="nav-upcoming">상영 예정작</a></li>
	            <li><a href="javascript:void(0)" id="nav-top">인기 영화</a></li>
	            <li><a href="javascript:void(0)" id="nav-animation">애니메이션</a></li>
	        </ul>
    	</div>
	    <div class="container">
	        <div class="h-movie" id="movie">
	            <h5><span>현재 상영작</span><a href="index.jsp?fname=movie/movieListNow" class="h-plus"></a></h5>
	            <ul class="h-movie-movie">
	            <%
	            	Vector<MovieDTO> dto = MovieDDL.viewMovieNow();
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
	        <div class="h-movie" id="upcoming">
	            <h5><span>상영 예정작</span><a href="index.jsp?fname=movie/movieListExpected" class="h-plus"></a></h5>
	            <ul class="h-movie-movie">
	            <%
	            	dto = MovieDDL.viewMovieExpected();
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
	                            <span class="h-star"><%=dt.getAvg_rating()  %></span>
	                        </div>
	                    </div>
	                </li>
	            <%
	            	}
	            %>
	            </ul>
	        </div>
	        <div class="h-movie" id="top">
	            <h5><span>인기 영화</span><a href="index.jsp?fname=movie/movieListPopular" class="h-plus"></a></h5>
	            <ul class="h-movie-movie">
	            <%
	            	dto = MovieDDL.viewMoviePopular();
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
	        <div class="h-movie" id="animation">
	            <h5><span>애니메이션</span><a href="index.jsp?fname=movie/movieListAnimation" class="h-plus"></a></h5>
	            <ul class="h-movie-movie">
	            <%
	            	dto = MovieDDL.viewMovieAnimation();
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
	                            <span class="h-star"><%=dt.getAvg_rating()  %></span>
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
    <script src="js/jquery-1.12.4.min.js"></script>
