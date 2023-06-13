<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime"%>
<%
	String userid = "";
	if(session.getAttribute("userid") != null){
		userid = (String) session.getAttribute("userid");
	} 
	String movieId = request.getParameter("mov_id");
	Vector<MovieDTO> dto = MovieDDL.viewMovieDetail(movieId);
	Vector<TrailerDTO> to = TrailerDDL.showTrailer(movieId);
	Vector <ShowReviewDTO> srd = ShowReviewDDL.selectInit(movieId);
	Vector <ShowReviewDTO> sld = ShowReviewDDL.selectInitLike(movieId);
	Vector <LikeDTO> isMemLike = LikeDDL.isReviewLike(movieId);
	int count = TrailerDDL.showTrailerCount(movieId);
	int reviewCnt = ShowReviewDDL.selectAllNum(movieId);
	Vector<CastingDTO> cto = CastingDDL.showCasing(movieId);
	boolean isMovieLike = LikeDDL.checkMovieLike(movieId, userid);
	
	DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	LocalDateTime now = LocalDateTime.now();
	String today = now.format(df).substring(0, 10);
%>
	<img src="./images/moviedetail/cloud3.png" alt="필터" class="cloud">
	<div class="k-fade">
	    <div class="k-close"><img src="images/moviedetail/popupclose.png" alt="popupclose"/></div>
	</div>
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
	<!-- 영화상세 -->
<%
	for(MovieDTO dt : dto){
%>
	<div class="k-bg">
	    <div class="backbox" style="background-image: url('<%=dt.getPoster_url()%>');"></div>
	    <div class="grabox">
	    	<div class="relbox">
	    		<div class="absbox"></div>
	    	</div>
	    </div>
	</div>
	<div class="container">
		<div class="k-mvdetail_top row mdvt" >
	        <div class="k-mv_left col-4">
	            <div class="k-img">
	                <div class="k-age">
	                    <img src="images/ico/ico-age-<%=dt.getLimit_age() %>.png" alt="<%=dt.getLimit_age() %>세"/>
	                </div>
	                <div class="k-poster">
	                    <img src="<%=dt.getPoster_url() %>" alt="<%=dt.getTitle()%>포스터">
	                </div>
	            </div> 
	        </div>
	        <div class="k-mv_right col-7">
	        <input type="hidden" name="movie-id" id="movie-id" value="<%=movieId %>" />
	        <input type="hidden" name="userid" id="userid" value="<%=userid %>" />
	            <h4 class="k-mv_title1">#돌비시네마</h4>
	            <h1 class="k-mv_title2"><%=dt.getTitle() %></h1>
	            <h4 class="k-mv_title3"><%=dt.getTitle_eng() %></h4>
	            <div class="k-mv_data">
<%
	if(isMovieLike == true){
%>
<!-- 영화 좋아요. -->
                	<div id="likeimage" class="on">
                        <span id="c-movieLike"><%=dt.getLike() %></span>
                    </div>
<%		
	}else{
%>
					<div id="likeimage">
                        <span id="c-movieLike"><%=dt.getLike() %></span>
                    </div>
<%
	}
%>	            

                    <div id="linkshare" onclick="linkshare()">
                    <div id="linkshares"></div>
                        <span></span>                    
                    </div>
                </div>
                <ul class="k-mv_datan">
                    <li>
                        <div>
                            관람객 평점
                             <i class="fa-solid fa-star"></i>
                            <span><%=dt.getAvg_rating() %></span>
                        </div>
                        <div>
                            예매율
                            
                            <span><%= MovieDDL.getBookingRate(dt.getId())%>%</span>
                        </div>
                        <div>
                            누적 관객수
                            <span><%=dt.getAudience() %>명</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            장르
                        </div>
                        <span><%=dt.getGenre() %>/<%=dt.getNation() %></span>
                        <div>
                            개봉
                        </div>
                        <span><%=dt.getOpen_date() %></span>
                        <span><%=dt.getRuntime() %>분</span>
                    </li>
                    <li>
                        <div>
                            감독
                        </div>
                        <span><%=dt.getDirector() %></span>
                    </li>
                    <li>
                        <div>
                            출연
                        </div>
                        <span><%=dt.getCasting() %></span>
                    </li>
                </ul>
                <div class="k-mv_butset">
                    <!-- <img src="images/moviedetail/button.png" alt="예매버튼"  onclick=""> -->
                <%
                    String id = dt.getId();
                    ScreenDDL ddl = new ScreenDDL();
                    boolean result = ddl.checkMovie(id); 
                    if(result){
                %>
                    <a href="index.jsp?fname=movie/booking" class="k-ticketing">예매하기</a>
                <%
                    }else{
                %>
                	<a href="javascript:void(0)" onclick="noScreen()" class="k-ticketing">예매하기</a>

                <%
                    }
                %>
                </div>
	        </div>
	    </div>
	</div>
	
	<div class="k-mvdetail">
        <div class="k-mvdetail_bottom">
            <div class="container">
                <ul class="k-tab">
                    <li><a href="javascript:void(0)" class="active" id="information">영화 정보</a></li>
                    <li><a href="javascript:void(0)" id="review">평점 / 리뷰(<span id="reviewTab"><%=reviewCnt %></span>)</a></li>
                </ul>
            </div>
            <!-- 정보시작 -->
            <div class="information-review">
                <div id="k-information" class="k-content active">
                    <!-- 시놉시스 -->
                    <div class="summary">
                        <div class="container">
                            <div class="k-summary">
                                <h3>시놉시스</h3>
                                <p><%=dt.getSummary() %></p>
                            </div>
                            <div>
                                 <button type="button" class="k-summary_btn">더 보기 <i class="fa-solid fa-angle-down"></i></button>
                            </div>
                        </div>
                    </div>

                    <!-- 시놉시스 -->
                    <!-- 스틸컷 -->
                    <div class="k-stillcut">
                        <div class="stillcut"></div>
                              <div class="container">
                                    <h3>스틸컷<span>(6)</span></h3>
                              <div class="stillcut-slider">
                                    <div class="stimg">
                                          <img src="<%=dt.getPoster_url() %>" alt="1">
                                    </div>

                                    <div class="rv-pt">
                                          <div class="pt-in" id="ptIn">
                                          <%
                                          		for(int i = 1 ; i <= 6 ; i++){
                                          %>
                                          		<img src="images/stillcut/<%=dt.getTitle_eng() %>/steal0<%=i %>.jpg" alt="stealcut<%=i%>"/>
                                          <%
                                          		}
                                          %>
                                          </div>   
                                    </div>
<%
	}
%>
                                    <div class="slider-control">
                                          <div class="util">
                                                <button type="button" id="btn-left" ><i class="btn-left fa-solid fa-angle-left "></i></button>
                                                <div class="page-count" id="page-count">
                                                      <span id="cnum">1</span> | 6
                                                </div>
                                                <button type="button" id="btn-right"><i class="fa-solid fa-angle-right btn-right"></i></button>
                                          </div>
                                          <div class="page">
                                          <span class="bar onn"></span>
                                          <span class="bar"></span>
                                          <span class="bar"></span>
                                          <span class="bar"></span>
                                          <span class="bar"></span>
                                          <span class="bar"></span>
                                          </div>
            
                                    </div>
                              </div>
                        </div>
                  </div>
                   <!-- 스틸컷 -->
                   <!-- 트레일러 -->
                    <div class="k-trailer">
                        <h3>트레일러(<span><%=count %></span>)</h3>
                        <div class="k-slider">
                              <img src="images/moviedetail/prev.png" class="slideprev" alt="1"></i>
                              <img src="images/moviedetail/next.png" class="slidenext" alt="2"></i>
                              
                              <div class="k-slide">
                              <%
                              		for(TrailerDTO ro : to){
                              %>
                                  <div class="trailer_box">
                                      <img src="<%=ro.getThumbnail() %>" data-vodsrc="<%=ro.getVodsrc() %>" alt="Thumbnail" />
                                      <button class="k-trailer_btn"><img src="images/moviedetail/youtube.png" alt="start"></button>
                                      <div class="trailerbg"></div>
                                      <p class="trailer_title"><%=ro.getVodtitle() %></p>
                                  </div>
                              <%
                              		}
                              %>
                              </div>
                        </div>
                    </div>
                    <!-- 트레일러 -->
                    <!-- 감독/출연진 -->
                    <div class="k-pdcasting">
                        <div class="container">
                            <h3>감독 및 배우</h3>
                            <div class="k-page-wrapper" style="position:relative;">
                                <!--page slider -->
                                <div class="k-post-slider">
                                    <img src="images/moviedetail/prev.png" class="prev"/>
                                    <img src="images/moviedetail/next.png" class="next"/>
                                  <div class="k-post-wrapper">
                                  <%
                                  for(CastingDTO ct : cto){
                                  %>
                                    <div class="k-post">
                                        <div class="k-slider-image">
                                            <img src="images/casting/<%=ct.getMovie_id()%>/<%=ct.getName()%>.jpg" alt="<%=ct.getName()%>">
                                        </div>
                                        <div class="k-post-info">
                                            <h4><a href="#" class="post-subject"><%=ct.getName() %></a></h4>
                                            <span><%=ct.getRole() %></span>
                                        </div>
                                    </div>
                                  <%
                                  }  
                                  %>
                                  </div>
                                </div>
                                <!--post slider-->
                              </div>
                        </div>
                    </div>
                    <!-- 감독/출연진 -->
                </div>
			</div>

			<!-- / 상세 -->
            <!-- 리뷰 -->
            <div id="k-review" class="k-content container">
                <div class="k-reviewform">
                    <h3 class="text-center">평점·리뷰 작성</h3>
                    <div class="k-mvrate">
                    
                        <fieldset class="rate">
                            <input type="radio" id="rating10" name="rating" value="10" ><label for="rating10" title="10점" ></label>
                            <input type="radio" id="rating9" name="rating" value="9"  ><label class="half" for="rating9" title="9점" ></label>
                            <input type="radio" id="rating8" name="rating" value="8" ><label for="rating8" title="8점"></label>
                            <input type="radio" id="rating7" name="rating" value="7" ><label class="half" for="rating7" title="7점" ></label>
                            <input type="radio" id="rating6" name="rating" value="6" ><label for="rating6" title="6점" ></label>
                            <input type="radio" id="rating5" name="rating" value="5" ><label class="half" for="rating5" ></label>
                            <input type="radio" id="rating4" name="rating" value="4" ><label for="rating4" title="4점" ></label>
                            <input type="radio" id="rating3" name="rating" value="3" ><label class="half" for="rating3" title="3점"  ></label>
                            <input type="radio" id="rating2" name="rating" value="2" ><label for="rating2" title="2점" ></label>
                            <input type="radio" id="rating1" name="rating" value="1" ><label class="half" for="rating1" title="1점" ></label>

                        </fieldset>
                        <span class="rating-number">0</span>
                    </div>
                    <p class="c-point">영화 관람 후 리뷰 작성시 1,OOOp 적립</p>
                    <div class="k-reviewbox">
                        <div class="k-text_box">
                            <textarea spellcheck="false" id="k-textbox" placeholder="평점 및 영화 관람평을 작성해주세요." maxlength="220"></textarea>
                            <div class="count"><span>0</span>/220</div>
                        </div>
                        <button type="button" id="k-textbtn" onclick="cReviewsSubmit();">리뷰 등록</button>
                    </div>
                    
                </div>
                <div class="k-reviewtitle">
                    <p><i class="fa-solid fa-star"></i>전체 <span id="c-reviewlist-cnt"><%=reviewCnt %></span></p>
                    <div class="k-reviewtitle_ul">
                        <span class="c-review-tab" onclick="cChangeOrderReview(0);"><a href="javascript:void(0)" class="active" id="k-score_1">최신순</a></span>
                        <span class="c-review-tab" onclick="cChangeOrderReview(1);"><a href="javascript:void(0)" id="k-score_2">추천순</a></span>
                    </div>
                </div>
                <!-- 최신순 -->
                <div class="c-current-review c-review-content">
	                <div class="k-reviewlist_all">
	<%
		int i = 0;
		for(ShowReviewDTO ss: srd){
	%>                
	                    <div class="k-reviewlist c-currentlist">
	                        <div class="k-listleft col-1">
		                        <div class="c-list-img">
		                        	<!-- <img src="upload/users/running.gif" alt="프로필"/>-->  
<%
			if(ss.getPhoto() == null){
				if(i % 2 == 0){
%>
	                            <img src="images/icon/user/profile_dark.png" alt="프로필"/>
<%					
				}else{
%>
	                            <img src="images/icon/user/profile.png" alt="프로필"/>
<%					
				}
			}else{
%>
		                            <img src="upload/users/<%=ss.getPhoto() %>" alt="프로필"/>
<%				
			}
%>		                        	 
		                        </div>
	                        </div>
	                        <div class="k-listright col-11">
	                            <ul id="k-listbox">
	                                <li id="k-listtext">
	                                    <div class="k-listtext_box">
	                                    <input type="hidden" value="<%=ss.getNum() %>"  class="c-current-num c-review-num"/>
	                                        <span class="k-review-name"><%=ss.getNickname() %></span>
	                                        <span class="k-review-stars">
<%
			int fill = 0;
			int half = 0;
			int empty = 0;
			if(ss.getRating() % 2 != 0){
				fill = (int) (ss.getRating() - 1) / 2;
				half = 1;
				empty = 5 - half - fill;
				
			}else{
				fill = (int) ss.getRating() / 2;
				empty = 5 - fill;
			}
			if(fill == 0){
				// 0.5 or 0
				if(half == 0){
					// empty = 5;
					for(int k = 0; k < empty; k++){
%>
	<img src="images/icon/inyoung/empty.png" alt="stars" />
<%
					}
				}else{
					//empty = 4;
%>
	<img src="images/icon/inyoung/half.png" alt="stars" />
<%					
					for(int k = 0; k < empty; k++){
%>
	<img src="images/icon/inyoung/empty.png" alt="stars" />
<%
					}				
				}
			}else{
				if(half == 0){
					for(int k = 0; k < fill; k++){
%>
	<img src="images/icon/inyoung/fill.png" alt="stars" />
<%					
					}
					for(int k = 0; k < empty; k++){
%>
	<img src="images/icon/inyoung/empty.png" alt="stars" />
<%						
					}
							
				}else{
					for(int k = 0; k < fill; k++){
%>
	<img src="images/icon/inyoung/fill.png" alt="stars" />
<%					
					}
%>
	<img src="images/icon/inyoung/half.png" alt="stars" />
<%					
					
					for(int k = 0; k < empty; k++){
%>
	<img src="images/icon/inyoung/empty.png" alt="stars" />
<%						
					}
					
				}
			}
%>
			
			

	                                        </span>
	                                        <span class="k-review-starsnum"><%=ss.getRating() %></span>
<%
			String dbDate = ss.getDate().substring(0, 10);
			if(dbDate.equals(today)){
%>
	                                        <span class="k-review-date"><%=ss.getDate().substring(10, 16) %></span>										
<%				
			}else{
%>
	                                        <span class="k-review-date"><%=ss.getDate().substring(0, 10).replace("-", ".") %></span>
<%				
			}
%>	                                       
	
	                                    </div>
	                                    <div class="c-review-bottom-content">
		                                    <p class="k-review-info"><%=ss.getComments() %></p>
		                                    <div class="c-modi-reviewbox">
		                                    <div class="c-mvrate">
						                        <div class="c-rate">
						                            <input type="radio" id="c-rating10<%=i %>" name="c-rating<%=i %>" value="10" ><label for="c-rating10<%=i %>" title="10점"  ></label>
						                            <input type="radio" id="c-rating9<%=i %>" name="c-rating<%=i %>" value="9"  ><label class="c-half" for="c-rating9<%=i %>" title="9점" ></label>
						                            <input type="radio" id="c-rating8<%=i %>" name="c-rating<%=i %>" value="8" ><label for="c-rating8<%=i %>" title="8점" ></label>
						                            <input type="radio" id="c-rating7<%=i %>" name="c-rating<%=i %>" value="7" ><label class="c-half" for="c-rating7<%=i %>" title="7점"  ></label>
						                            <input type="radio" id="c-rating6<%=i %>" name="c-rating<%=i %>" value="6" ><label for="c-rating6<%=i %>" title="6점"  ></label>
						                            <input type="radio" id="c-rating5<%=i %>" name="c-rating<%=i %>" value="5" ><label class="c-half" for="c-rating5<%=i %>" title="5점"  ></label>
						                            <input type="radio" id="c-rating4<%=i %>" name="c-rating<%=i %>" value="4" ><label for="c-rating4<%=i %>" title="4점"  ></label>
						                            <input type="radio" id="c-rating3<%=i %>" name="c-rating<%=i %>" value="3" ><label class="c-half" for="c-rating3<%=i %>" title="3점"></label>
						                            <input type="radio" id="c-rating2<%=i %>" name="c-rating<%=i %>" value="2" ><label for="c-rating2<%=i %>" title="2점" ></label>
						                            <input type="radio" id="c-rating1<%=i %>" name="c-rating<%=i %>" value="1" ><label class="c-half" for="c-rating1<%=i %>" title="1점" ></label>
						
						                        </div>
						                        <span class="c-rating-number">0</span>
						                    </div>
		                                    	<textarea spellcheck="false" name="c-modi-review" class="c-modi-review" cols="30" rows="10"><%=ss.getComments()%></textarea>
		                                    	<div class="c-modi-btn">
		                                    		<a href="javascript:cReviewBoxClose(<%=i %>);" class="c-modi-reset">취소</a>
		                                    		<a href="javascript:cReviewModiSend(<%=i %>);" class="c-modi-complete">수정완료</a>
		                                    	</div>
		                                    </div>
		                                    <div class="k-utilbox">	                
<%
		int likeCnt = 0;
		for(LikeDTO isLike: isMemLike){
			if(isLike.getNum() == ss.getNum()){
				if(userid.equals(isLike.getUserid())){
					likeCnt = 1;
				}else{
				}
			}
		}
		if(likeCnt == 0){
%>
												<a class="k-like2 c-current-like" href="javascript:cCurrentReviewLike(<%=i%>);"></a>
<%			
		}else{
%>
												<a class="k-like2 c-current-like on"  href="javascript:cCurrentReviewLike(<%=i%>);"></a>			
<%
		}
%>	                                                        
												<span class="c-current-like-num"><%=ss.getLikes() %></span>
<%
		if(!userid.equals(ss.getUserid())){
			
%>
												<span class="k-declaration" onclick="cShowReviewUtil(<%=i%>)">
		                                        	<ul class="c-review-cur-tooltip not-user">
		                                        		<li><a href="javascript:void(0)">신고</a></li>
		                                        	</ul>
	                                        	</span>
<%			
		}else{
%>
												<span class="k-declaration" onclick="cShowReviewUtil(<%=i%>)">
		                                        	<ul class="c-review-cur-tooltip">
		                                        		<li><a href="javascript:cReviewModi(<%=i%>)">수정</a></li>
		                                        		<li><a href="javascript:cReviewDel(<%=i%>)">삭제</a></li>
		                                        	</ul>
	                                        	</span>
<%
		}
%>												
	                                        	
	                                    	</div> 
	                                    </div>
	                                </li>
	                            </ul>
	                        </div>
	                    </div>
	<%
			i++;
		}
	%>                    
	                </div>
	<%
		if(reviewCnt == 0){
			
		}else{
	%>
					<div class="c-list-btn">
	                    <a href="javascript:cReviewMore(0);" class="k-list_btn c-review-active">더보기</a>
	                    <a href="javascript:cReviewMore(1);" class="k-list_btn">더보기</a>
	                </div>
	<%		
		}
	%>
				</div>
            
            <!-- 추천순 
            <div class="c-like-review c-review-content">
                <div class="k-reviewlist_all">
<%
	int j = 0;
	for(ShowReviewDTO sl: sld){
%>                
                    <div class="k-reviewlist c-likelist">
                        <div class="k-listleft col-1">
	                        <div class="c-list-img">
	                        	
	                            <img src="upload/users/<%=sl.getPhoto() %>" alt="프로필"/> 
	                        </div>
                        </div>
                        <div class="k-listright col-11">
                            <ul id="k-listbox">
                                <li id="k-listtext">
                                    <div class="k-listtext_box">
                                    <input type="hidden" value="<%=sl.getNum() %>"  class="c-like-num"/>
                                        <span class="k-review-name"><%=sl.getNickname() %></span>
                                        <span class="k-review-stars">★★★★★</span>
                                        <span class="k-review-starsnum"><%=sl.getRating() %></span>
                                        <span class="k-review-date"><%=sl.getDate().substring(0, 10) %></span>
                                    </div>
                                    <p class="k-review-info"><%=sl.getComments() %></p>
                                    <div class="k-utilbox">
                                        <a class="k-like2 c-like-like" href="javascript:cLikeReviewLike(<%=j%>);"></a>
                                        <span class="c-like-like-num"><%=sl.getLikes() %></span>
                                        <span class="k-declaration">
                                        	<span class="c-review-like-tooltip"></span>
                                        </span>
                                    </div> 
                                </li>
                            </ul>
                        </div>
                    </div>
<%
		j++;
	}
%>                    
                </div>
<%
	if(reviewCnt == 0){
		
	}else{
%>
				<div class="c-list-btn">
                    <a href="javascript:cReviewMore(1);" class="k-list_btn">더보기</a>
                </div>
<%		
		}
	%>
			</div>
			-->
            </div>
            <!-- 리뷰끝 -->
        </div>
    </div>
	<!-- /영화상세 -->
	<input type="hidden" id="userid" value="<%=userid %>" />
	<input type="hidden" id="reviewAllNum" value=<%=reviewCnt %> />
