<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.util.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime, java.text.SimpleDateFormat"%>
<%
	String userid = (String) session.getAttribute("userid");
	Vector <MyPageDTO> getMemInfo = JoinDDL.selectByIdOnMyPage(userid);
	
	SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
	Date currentTime = new Date();
	String today = format.format(currentTime);
	Long todayLong = Long.parseLong(today);
	Date toDate = format.parse(today);
%>    
<style>
    body{
        background: url("images/h-button/background-black.png") no-repeat;
        background-size: cover;
    }
</style>
<%
	for(MyPageDTO gmi: getMemInfo){
%>
    <div class="container position-relative" style="margin-top: 180px;">
        <div class="h-mypage-info" id="h-mypage-info">
            <div class="h-member_info">
                <div class="h-welcom">
<%
		if(gmi.getPhoto() == null){
%>                
                	<img src="images/icon/user/user-fill.png" alt="user" />
<%
		}else{
%>            
                	<img src="/ezenCine/ShowMemPhoto" alt="user" />
<%
		}
%>    	
                </div>
                <div class="h-member_name"><p><%=gmi.getId() %><span>님</span></p></div>
                <div class="h-member_edit">
                    <p>
                        <a href="javascript:void(0)">내정보수정</a>
                        <a href="javascript:void(0)">지난등급조회</a>
                    </p>
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
		if(gmi.getLevel() == 1){
%>
                        <span class="h-select">Welcome</span>
                        <span>Silver</span>
                        <span>Gold</span>
                        <span>VIP</span>
						

<%			
		}else if(gmi.getLevel() == 2){
%>
                        <span>Welcome</span>
                        <span class="h-select">Silver</span>
                        <span>Gold</span>
                        <span>VIP</span>

<%			
		}else if(gmi.getLevel() == 3){
%>
                        <span>Welcome</span>
                        <span>Silver</span>
                        <span class="h-select">Gold</span>
                        <span>VIP</span>

<%		
		}else if(gmi.getLevel() == 4){			
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
            
            <div class="h-my_review">
                <div class="h-reviewbox">
                    <ul class="h-review-gnb">
                        <li class="active">
                            <a href="javascript:void(0)">예매내역</a>
                            <div class="h-mybooking h-lnb">
                            
                    예매내역이 없습니다.
                
<%
		
		if(gmi.getTicket_date() == null){
		}else{
			String ticket_dt = ExtraFunc.getDateWithoutDash(gmi.getTicket_date());
			Date ticket_date = format.parse(ticket_dt);
			if(toDate.compareTo(ticket_date) <= 0){
				// ticket_date은 결제 일시인가.... 관람일시인가....
				// tickerting 테이블에 영화 관람 일시든 결제일시든 둘다 들어가야 할듯.
				// seat_num에 g관 6열도 들어가는가? 
				// 관람인원은?
%>                            
<!-- row 랑 col은 왜 같이 있는 걸까?  -->
                            	<div class="h-mybookingbox row col-6">
                                    <div class="h-mybooking-post">
                                        <img src="images/poster/Guardians of the Galaxy Volume 3.jpg" alt="취소내역">
                                    </div>
                                    <div class="h-mybooking-info">
                                        <h3><%=gmi.getMovie_title() %></h3>
                                        <div class="h-mybooking-dinfo">
                                            <p>예매번호 <span><%=gmi.getTicketing_num() %></span></p>
                                            <p>상영관/관람과석 <span><%=gmi.getRoom_num() %>관/G열 <%=gmi.getSeat_num() %></span></p>
                                            <p>관람인원 <span>성인 1명</span></p>                             
                                            <p>결제일시 <span>2023.05.02(화) 18:38</span></p>
                                            <p>관람일시 <span>2023.05.03(수) 12:00(3회차)</span></p>
                                        </div>
                                    </div>
	                            </div>
<%
	
			}
		}
	
%>                            	                            
                                <div class="h-morebtn">
                                    <a class="h-more" href="javascript:void(0)"></a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="javascript:void(0)">내가 쓴 리뷰</a>
                            <div class="h-myreview h-lnb">
                            
<!-- col안에 왜 row 가 있는 걸까? -->
								<div class="row">
<%
		if(gmi.getComments() == null){
%>
		
                    내가 쓴 리뷰가 없습니다.
        
<%			
		}else{
			String dayDiffer = ExtraFunc.getdayDiffer(gmi.getDate());			
%>
								                            
                                	<div class="col-6">
                                    
                                        <div class="h-myreview-poster">
                                            <img src="images/poster/Guardians of the Galaxy Volume 3.jpg" alt="리뷰포스터">
                                        </div>
                                        <div class="h-myreview-content">
                                            <h3><%=gmi.getMovie_id()%></h3>
                                            <p class="h-review-rate">평점 <span><%=gmi.getRating() %></span></p>
                                            <p class="h-review-comment"><%=gmi.getComments() %></p>
                                            <p><span class="h-like"></span><span class="h-like-date"><%=dayDiffer %>일 전</span></p>
                                        </div>
                                    </div>
                                    <div class="h-review-edit">
                                        <a href="javascript:void(0)" class="h-review-update">수정</a>
                                        <a href="javascript:void(0)" class="h-review-delete">삭제</a>
                                    </div>
                                </div>
<%
		}
%>                                
                                <div class="h-morebtn">
                                    <a class="h-more" href="javascript:void(0)"></a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="javascript:void(0)">보고싶어요</a>
                            <div class="h-movie-hope h-lnb">
                                <div class="h-hope-poster">
                                    <img src="images/poster/Fast X.jpg" alt="분노의 질주">
                                    <h3>분노의 질주: 라이드 오어 다이</h3>
                                    <p>Fast X</p>
                                </div>
                                <div class="h-morebtn">
                                    <a class="h-more" href="javascript:void(0)"></a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- <div class="h-my_reviewbox-none">
                    내가 쓴 리뷰가 없습니다.
                </div> -->
            </div>
        </div>
        <div class="h-right-nav">
            <div class="h-nav">
                <div class="h-nav-booking">
                    <a href="javascript:void(0)">
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
<%
	}
%>    