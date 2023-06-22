<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.util.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime, java.text.SimpleDateFormat"%>
<%
	String userid = (String) session.getAttribute("userid");
	
	Vector <MemberDTO> mbd = MemberDDL.select(userid);
	Vector <BookingDTO> bkd = BookingDDL.selectInit(userid);
	Vector <ReviewsDTO> rvd = ReviewsDDL.selectInit(userid);
	Vector <MyPageLikeDTO> mpld = MyPageLikeDDL.selectLikeInit(userid);
	int bookingAllNum = BookingDDL.BookingCnt(userid);
	int reviewAllNum = ReviewsDDL.ReviewsCnt(userid);
	int likeAllNum = MyPageLikeDDL.LikeCnt(userid);
	
	SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
	Date currentTime = new Date();
	String today = format.format(currentTime);
	Long todayLong = Long.parseLong(today);
	Date toDate = format.parse(today);

	for(MemberDTO m: mbd){
%>
<div class="c-mypage-background">
    <div class="container position-relative">
        <div class="h-mypage-info" id="h-mypage-info">
            <div class="h-member_info d-flex">
                <div class="h-welcom">
<%
		if(m.getPhoto() == null || m.getPhoto() == ""|| m.getPhoto().isEmpty()){
%>                
                	<img src="images/icon/user/user.png" alt="user" id="userimg"/>
<%
		}else{
%>            
                	<img src="upload/users/<%=m.getPhoto() %>" alt="user" id="userimg"/>
<%
		}
%>    	
                </div>
                <div class="c-member">
                	<div class="c-member-top">
		                <div class="h-member_name"><p><%=m.getId() %><span>님</span></p></div>
		                <div class="h-member_edit">
		                    <p>
		                        <a href="index.jsp?fname=mem/profile">내정보수정</a>
		                        <a href="javascript:void(0)">지난등급조회</a>
		                    </p>
		                </div>
	                </div>
	                <div class="h-mypage-home">
	                    <div class="h-home"></div>
	                    <div class="h-home-right"></div>
	                    <p>예매내역</p>
	                    <div class="h-home-right"></div>
	                    <p>마이페이지</p>
	                </div>
	                <div class="h-member_rate">
	                    <p>현재 고객님의 등급은</p>
	                    <p>
<%
		if(m.getLevel() == 1){
%>
	                        <span class="h-select">Welcome</span>
	                        <span>Silver</span>
	                        <span>Gold</span>
	                        <span>VIP</span>
						

<%			
		}else if(m.getLevel() == 2){
%>
	                        <span>Welcome</span>
	                        <span class="h-select">Silver</span>
	                        <span>Gold</span>
	                        <span>VIP</span>

<%			
		}else if(m.getLevel() == 3){
%>
	                        <span>Welcome</span>
	                        <span>Silver</span>
	                        <span class="h-select">Gold</span>
	                        <span>VIP</span>

<%		
		}else if(m.getLevel() == 4){			
%>
	                        <span>Welcome</span>
	                        <span>Silver</span>
	                        <span>Gold</span>
	                        <span class="h-select">VIP</span>

<%
		}
%>                                                            
	                    </p>
	                </div>
	                <div class="h-myoption">
	                    <div class="row">
	                        <div class="h-mypoint">
	                            <p>포인트 이용내역</p>
	                            <ul>
	                                <li><a href="javascript:void(0)">적립예정</a></li>
	                                <li><a href="javascript:void(0)">당월소멸예정</a></li>
	                            </ul>
	                        </div>
	                        <div class="h-my-favorit">
	                            <p>선호하는 극장</p>
	                            <ul>
	                                <li><a href="javascript:void(0)">김포이젠시네마</a></li>
	                            </ul>
	                        </div>
	                        <div class="h-my-special">
	                            <p>스페셜 멤버십</p>
	                            <ul>
	                                <li><a href="javascript:void(0)">가입된 스페셜 멤버십이 없습니다.</a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </div>
            
            <div class="c-mypage-bottom">
                <ul class="gnb">
                    <li><a href="javascript:cMyPageBottom(0);" class="c-mypage-tab c-mypage-li-active">예매내역</a></li>
                    <li><a href="javascript:cMyPageBottom(1);" class="c-mypage-tab">내가 쓴 리뷰</a></li>
                    <li><a href="javascript:cMyPageBottom(2)" class="c-mypage-tab">보고싶어요</a></li>
                </ul>
                <!-- booking -->
                <div class="c-mypage-booking c-mypage-content c-mypage-content-active">
                    <div class="row" id="c-mypage-booking-insert">
<%
	if(bkd.size() == 0){
%>
					<div class="c-mypage-noInfo">
						예매 내역이 없습니다.						
					</div>                    
<%		
	}else{
		for(BookingDTO bd : bkd){	
			
				// ticket_date은 결제 일시인가.... 관람일시인가....
				// tickerting 테이블에 영화 관람 일시든 결제일시든 둘다 들어가야 할듯.
				// seat_num에 g관 6열도 들어가는가? 
				// 						
				// 관람인원은?
			String seats_num = bd.getSeat_num();
			String[] seats_arr = seats_num.split(",");
			
			String[] ticket_dateArr = bd.getTicket_date().split("-");
			String ticket_year = ticket_dateArr[0];
			String ticket_month = ticket_dateArr[1];
			String[] ticket_dateBack = ticket_dateArr[2].split(" ");
			String ticket_day = ticket_dateBack[0];
			String[] ticket_hourArr = ticket_dateBack[1].split(":");
			String ticket_hour = ticket_hourArr[0];
			String ticket_min = ticket_hourArr[1];
			
			String[] screen_dateArr = bd.getScreen_date().split("-");
			String screen_year = screen_dateArr[0];
			String screen_month = screen_dateArr[1];
			String screen_day = screen_dateArr[2];
%>
                        <div class="col-6 c-mypage-booking-num">
                        	<a href="index.jsp?fname=movie/movieDetail&mov_id=<%=bd.getMovie_id()%>">
	                            <img src="<%=bd.getPoster_url() %>" alt="<%=bd.getTitle()%>">
	                        </a>
                            <div class="c-content">
                                <p class="c-title"><%=bd.getTitle() %></p>
                                <p>예매번호 <span><%=bd.getTicket_num() %></span></p>
                                <p>상영관/관람좌석 <span><%=bd.getRoom_num() %>관/
<%
			if(seats_arr.length == 1){
%>
									<%=seats_arr[0].charAt(0) %>열 <%=seats_arr[0].charAt(1) %>
<%				
			}else{
				for(int i = 0; i < seats_arr.length-1; i++){
%>
									<%=seats_arr[i].charAt(0) %>열 <%=seats_arr[i].charAt(1) %>, 
<%				
				}
%>
									<%=seats_arr[seats_arr.length - 1].charAt(0) %>열 <%=seats_arr[seats_arr.length - 1].charAt(1) %>								
<%				
			}
%>	                                
                                </span></p>
                                <p>관람인원 <span>성인 <%=seats_arr.length %>명</span></p>
                                <p>결제일시 <span><%=ticket_year %>.<%=ticket_month %>.<%=ticket_day %>(<%=ExtraFunc.dayToKor(bd.getTicket_day()) %>) <%=ticket_hour %>:<%=ticket_min %></span></p>
                                <p>관람일시 <span><%=screen_year %>.<%=screen_month %>.<%=screen_day %>(<%=ExtraFunc.dayToKor(bd.getScreen_day()) %>) <%=bd.getScreen_time() %></span></p>
                            	<p class="cancel_booking" onclick="bookingCancelation(<%=bd.getTicket_num() %>)">예매취소</p>
                            </div>
                            
                        </div>
<%
			
		}
	}
	
%>  
                    </div>
<%
		if(bookingAllNum <= 2){
		}else{
%>                    
                    <a class="c-mypage-plus" id="c-mypage-plus-booking-btn" href="javascript:cMyPageMore(0);">더보기 +</a>
<%
		}
%>                    
                </div>
                <!-- review -->
                <div class="c-mypage-review c-mypage-content">
                    <div class="row" id="c-mypage-review-insert">
<%
	if(rvd.size() == 0){
%>
						<div class="c-mypage-noInfo">
							작성한 리뷰가 없습니다.
						</div>
<%		
		
	}else{
		int i = 0;
		for(ReviewsDTO rd: rvd){			
%>
                        <div class="col-6 c-mypage-review-num">
                        <input type="hidden" value="<%=rd.getNum() %>" class="c-mypage-review-modi-num" />
                        <input type="hidden" value="<%=rd.getMovie_id() %>" class="c-mypage-review-modi-mov-id" />
                            <img src="<%=rd.getPoster_url() %>" alt="<%=rd.getTitle()%>">
                            <div class="c-content">
                                <p class="c-title"><%=rd.getTitle()%></p>
                                <p>평점<span class="c-score"><%= (int) rd.getRating() %></span></p>
                                <p class="c-comment"><%=rd.getComments() %></p>
                                <p class="c-bottom">
                                    <span class="first">
                                        <img class="c-like-img" class="" src="images/h-button/like.png" alt="like">
<%
			int diff = ReviewsDDL.getDateDiff(userid, rd.getMovie_id(), rd.getNum());
			if(diff == 0){
%>
                                    <span>오늘</span>
<%		
			}else{
%>
                                    <span><%=diff%>일 전</span>
<%	
			}
%>                                       
                                    </span>
                                    <span class="second">
                                        <a href="javascript:cReviewPopupOpen(<%=i%>);">수정</a>
                                        <a href="javascript:cMyPageReviewDel(<%=i%>);">삭제</a>
                                    </span></p>
                            </div>
                        </div>
                        
                  <div class="c-mypage-modi-popup-shadow">
					<div class="c-mypage-modi-popup">
						<div class="c-mypage-modi-title">리뷰 수정하기 
							<a href="javascript:cReviewPopupClose(<%=i%>);"><img src="images/icon/inyoung/close.png" alt="close" /></a>
						</div>
						<div class="c-mypage-popup-content">
							<p><%=rd.getTitle() %></p>
							<div class="c-mypage-popup-real-content">
								
									<img src="<%=rd.getPoster_url() %>" alt="poster" />
								
								<div class="c-mypage-popup-right-content">
									<div class="c-mypage-modi-content-top">
										<div class="c-mypage-popup-userimg">
										<%
		if(m.getPhoto() == null || m.getPhoto() == ""|| m.getPhoto().isEmpty()){
%>                
                	<img src="images/icon/user/user.png" alt="user"/>
<%
		}else{
%>            
                	<img src="upload/users/<%=m.getPhoto() %>" alt="user"/>
<%
		}
%>    	
										</div>
								    	<div class="c-modi-mvrate">
											<div class="c-modi-rate">
							    				<input type="radio" id="c-rating10<%=i %>" name="c-rating<%=i %>" class="c-rating<%=i %>" value="10" ><label for="c-rating10<%=i %>" title="10점"  ></label>
					                            <input type="radio" id="c-rating9<%=i %>" name="c-rating<%=i %>" class="c-rating<%=i %>" value="9"  ><label class="c-half" for="c-rating9<%=i %>" title="9점" ></label>
					                            <input type="radio" id="c-rating8<%=i %>" name="c-rating<%=i %>" class="c-rating<%=i %>" value="8" ><label for="c-rating8<%=i %>" title="8점" ></label>
					                            <input type="radio" id="c-rating7<%=i %>" name="c-rating<%=i %>" class="c-rating<%=i %>" value="7" ><label class="c-half" for="c-rating7<%=i %>" title="7점"  ></label>
					                            <input type="radio" id="c-rating6<%=i %>" name="c-rating<%=i %>" class="c-rating<%=i %>" value="6" ><label for="c-rating6<%=i %>" title="6점"  ></label>
					                            <input type="radio" id="c-rating5<%=i %>" name="c-rating<%=i %>" class="c-rating<%=i %>" value="5" ><label class="c-half" for="c-rating5<%=i %>" title="5점"  ></label>
					                            <input type="radio" id="c-rating4<%=i %>" name="c-rating<%=i %>" class="c-rating<%=i %>" value="4" ><label for="c-rating4<%=i %>" title="4점"  ></label>
					                            <input type="radio" id="c-rating3<%=i %>" name="c-rating<%=i %>" class="c-rating<%=i %>" value="3" ><label class="c-half" for="c-rating3<%=i %>" title="3점"></label>
					                            <input type="radio" id="c-rating2<%=i %>" name="c-rating<%=i %>" class="c-rating<%=i %>" value="2" ><label for="c-rating2<%=i %>" title="2점" ></label>
					                            <input type="radio" id="c-rating1<%=i %>" name="c-rating<%=i %>" class="c-rating<%=i %>" value="1" ><label class="c-half" for="c-rating1<%=i %>" title="1점" ></label>
						
										    </div>
										</div>
										<div class="c-mypage-popup-rating"><span class="c-mypage-popup-rate"><%= (int) rd.getRating() %></span> 점</div>
									</div>
									<textarea spellcheck="false" maxlength="220" class="c-mypage-textarea" id="" cols="30" rows="10"><%=rd.getComments() %></textarea>
								</div>
							</div>
							<div class="c-mypage-popup-btn">
								<a href="javascript:cReviewPopupClose(<%=i%>);">취소</a>
								<a href="javascript:cReviewPopupModiSend(<%=i%>);">수정</a>
							</div>
						</div>
					</div>	
				</div>          
                        
                        
<%
			i++;
System.out.println(i);
		}
	}
%>  
                    </div>
<%
		if(reviewAllNum <= 2){
		}else{
%>                    
                    <a class="c-mypage-plus" id="c-mypage-plus-review-btn" href="javascript:cMyPageMore(1);">더보기 +</a>
<%
		}
%>                    
                </div>
                <!-- like -->
                <div class="c-mypage-see c-mypage-content">
                    <div class="row" id="c-mypage-like-insert">
<%
	if(mpld.size() == 0){
%>
						<div class="c-mypage-noInfo">
							보고싶은 영화가 없습니다.
						</div>
<%		
	}else{
		for(MyPageLikeDTO md : mpld){
%>                    
                        <div class="col-2 c-mypage-like-num">
                        	<a href="index.jsp?fname=movie/movieDetail&mov_id=<%=md.getMovie_id()%>">
	                            <img src="<%=md.getPoster_url() %>" alt="<%=md.getTitle()%>">
	                            <span class="c-title"><%=md.getTitle() %></span>
	                            <span class="c-engtitle"><%=md.getTitle_eng() %></span>
                            </a>
                        </div>
<%
		}
	}
%>                        
                    </div>
<%
		if(likeAllNum <= 6){
		}else{
%>                    
					<a class="c-mypage-plus" id="c-mypage-plus-like-btn" href="javascript:cMyPageMore(2);">더보기 +</a>
<%
		}
%>                    
                                        
                                        
                </div>              
            </div>            
        </div>
        
        <div class="h-right-nav">
            <div class="h-nav">
                <div class="h-nav-booking">
                    <a href="index.jsp?fname=movie/booking">
                        <div class="h-img"></div>
                        <p>예매하기</p>
                    </a>
                </div>
                <div class="h-nav-buy">
                    <a href="javascript:void(0)">
                        <div class="h-img"></div>
                        <p>구매내역</p>
                    </a>
                </div>
                <div class="h-nav-timetable">
                    <a href="javascript:void(0)">
                        <div class="h-img"></div>
                        <p>상영시간표</p>
                    </a>
                </div>
                <div class="h-nav-mypoint">
                    <a href="javascript:void(0)">
                        <div class="h-img"></div>
                        <p>멤버십 포인트</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<%
	}
%>  
<input type="hidden" name="booking-all-num" id="booking-all-num" value="<%=bookingAllNum %>" />
<input type="hidden" name="review-all-num" id="review-all-num" value="<%=reviewAllNum %>" />
<input type="hidden" name="like-all-num" id="like-all-num" value="<%=likeAllNum %>" />
  