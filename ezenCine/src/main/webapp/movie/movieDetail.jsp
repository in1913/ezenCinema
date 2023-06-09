<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*"%>
<%
    String movieId = request.getParameter("mov_id");
    Vector<MovieDTO> dto = MovieDDL.viewMovieDetail(movieId);
    Vector<TrailerDTO> to = TrailerDDL.showTrailer(movieId);
    int count = TrailerDDL.showTrailerCount(movieId);
    Vector<CastingDTO> cto = CastingDDL.showCasing(movieId);
%>

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
            <div class="k-mv_left col-5">
                <div class="k-img">
                    <div class="k-age">
                        <img src="images/ico/ico-age-<%=dt.getLimit_age() %>.png" alt="<%=dt.getLimit_age() %>세"/>
                    </div>
                    <div class="k-poster">
                        <img src="<%=dt.getPoster_url() %>" alt="<%=dt.getTitle()%>포스터">
                    </div>
                </div> 
            </div>
            <div class="k-mv_rigth col-7">
                <h4 class="k-mv_title1">#돌비시네마</h4>
                <h1 class="k-mv_title2"><%=dt.getTitle() %></h1>
                <h4 class="k-mv_title3"><%=dt.getTitle_eng() %></h4>
                <div class="k-mv_data">
                    <div id="likeimage">
                        <span><%=dt.getLike() %></span>
                    </div>
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
                            <span>여긴 나중에</span>
                        </div>
                        <div>
                            예매율
                            <span>0</span>
                            위
                            <span>0.0%</span>
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
                    <button type="button" class="k-ticketing">예매하기</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="k-mvdetail">
        <div class="k-mvdetail_bottom">
            <div class="container">
                <ul class="k-tab">
                    <li><a href="javascript:void(0)" class="active" id="information">정보</a></li>
                    <li><a href="javascript:void(0)" id="review">평점/리뷰(0)</a></li>
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
                                 <button type="button" class="k-summary_btn">더보기</button>
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
                                  <div>
                                      <img src="<%=ro.getThumbnail() %>" data-vodsrc="<%=ro.getVodsrc() %>" alt="Thumbnail" />
                                      <button class="k-trailer_btn"><img src="images/moviedetail/start.png" alt="start"></button>
                                      <div class="trailerbg"></div>
                                  </div >
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
                                    <i class="fa-solid fa-circle-arrow-left prev"></i>
                                    <i class="fa-solid fa-circle-arrow-right next"></i>
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
                    <h3 class="text-center">평점·관람평 작성</h3>
                    <div class="k-mvrate">
                        <fieldset class="rate">
                            <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                            <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
                            <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                            <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
                            <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                            <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
                            <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                            <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
                            <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
                            <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>

                        </fieldset>
                        <span class="rating-number">0</span>
                    </div>
                    <div class="k-reviewbox">
                        <div class="k-text_box">
                            <textarea  id="k-textbox" placeholder="평점 및 영화 관람평을 작성해주세요." maxlength="220"></textarea>
                            <div class="count"><span>0</span>/220</div>
                        </div>
                        <button type="button" id="k-textbtn">관람평 작성</button>
                    </div>
                    
                </div>
                <div class="k-reviewtitle">
                    <h3><i class="fa-solid fa-star"></i>전체<span>(0)</span></h3>
                    <div class="k-reviewtitle_ul">
                        <span><a href="javascript:void(0)" class="active" id="k-score_1">최신순</a></span>
                        <span><a href="javascript:void(0)" id="k-score_2">추천순</a></span>
                        <span><a href="javascript:void(0)" id="k-score_3">평점 높은순</a></span>
                        <span><a href="javascript:void(0)" id="k-score_4">평점 낮은순</a></span>
                    </div>
                </div>
                <div class="k-reviewlist_all">
                    <div class="k-reviewlist">
                        <div class="k-listleft col-1">
                            <img src="images/moviedetail/1.png" alt="프로필"/>
                        </div>
                        <div class="k-listright col-11">
                            <ul id="k-listbox">
                                <li id="k-listtext">
                                    <div class="k-listtext_box">
                                        <span class="k-review-name">aa123</span>
                                        <span class="k-review-stars">★★★★★</span>
                                        <span class="k-review-starsnum">10</span>
                                        <span class="k-review-date">2023-05-24</span>
                                    </div>
                                    <p class="k-review-info">재밌어요!</p>
                                    <div class="k-utilbox">
                                        <span class="k-like2"></span>
                                        <span class="k-declaration"></span>
                                    </div> 
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div>
                        <button type="button" class="k-list_btn">더보기</button>
                    </div>
                </div>
            </div>
            <!-- 리뷰끝 -->
        </div>
    </div>
    <!-- /영화상세 -->
