<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*"%>
    
    <section class="movieList">
	    <div class="container">
	        <div class="h-movie-search-box">
	            <input type="text" name="h-movie-search" id="h-movie-search" placeholder="영화 검색하기">
	            <a href="javascript:void(0)" class="h-movie-search-btn"></a>
	        </div>
	        <ul class="h-movie-list justify-content-center font-weight-bold">
	            <li><a href="index.jsp?fname=movie/movieList" >기존 목록</a></li>
	            <li><a href="index.jsp?fname=movie/movieListNow" >현재 상영작</a></li>
	            <li><a href="index.jsp?fname=movie/movieListExpected" >상영 예정작</a></li>
	            <li><a href="index.jsp?fname=movie/movieListPopular" >인기 영화</a></li>
	        </ul>
	        <div class="h-movie" id="movie">
	            <h5><span>인기 영화</span></h5>
	            <ul class="h-movie-movie">
	            <%
	            	Vector<MovieDTO> dto = MovieDDL.viewMoviePopularAll();
	            	for(MovieDTO dt : dto){
	            %>
	                <li class="col-3">
	                    <div class="h-movie-all">
	                        <div class="h-imgbox">
	                            <img src="<%=dt.getPoster_url() %>" alt="포스터">
	                            <div class="h-movie-content">
	                                <div class="h-movie-content-bg"></div>
	                                <a href="index.jsp?fname=movie/movieDetail&mov_id=<%=dt.getId() %>" class="h-movie-info"></a>
	                                <a href="javascript:void(0)" class="h-movie-booking"></a>
	                            </div>
	                        </div>
	                        <p class="h-movie-title"><%=dt.getTitle() %></p>
	                        <div class="h-rate-star">
	                            <span class="h-rate">예매율 31.4%</span>
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