<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*, java.text.SimpleDateFormat"%>
<%
	java.util.Date cDate = new java.util.Date();
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(cDate);
	java.util.Date date = new java.util.Date();
	SimpleDateFormat out1 = new SimpleDateFormat("yyyy년MM월");
	String month = out1.format(date);
	SimpleDateFormat output1 = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat output2 = new SimpleDateFormat("yyyy-M-d-E");
	Vector<MovieDTO> dto = MovieDDL.selectMovie();
	
%>
    <section class="booking">
        <div class="container">
            <div class="movie_select d-flex">
                <div class="h-movie_choose h-booking_box mr-2">
                    <h3 class="p-2">영화</h3>
                    <div class="h-b-movie-booking cumtom_scrollbar">
                        <ul class="h-b-movie-list">
                        <%
                        for(MovieDTO dt : dto){ 
                        %>
                            <li class="h-b-movie-btn">
                                <label class="h-b-movie select_btn">
                                    <input class="h-movie-check" type="radio" name="movie-name" value="<%=dt.getId()%>">
                                    <span class="h-movie-age" style="background-image: url(images/ico/ico-age-<%=dt.getLimit_age()%>.png);"></span> 
                                    <span class="h-b-movietitle"><%=dt.getTitle() %></span>
                                </label>
                            </li>
                        <%
                        }
                        %>
                        </ul>
                    </div>
                </div>
                <div class="h-location h-booking_box mr-2">
                    <h3 class="p-2">극장</h3>
                    <div class="h-location-box cumtom_scrollbar">
                    <!-- 스크립트가 해결해줌 -->
                    </div>
                    <div class="h-location-blurbox"></div>
                </div>
                
                <div class="h-booking_box">
                    <h3 class="p-2">날짜</h3>
                    <div class="date-select">
                    
                        <h4 class="p-2 text-center year_month"><%=month%></h4>
                        <button class="btn_prev" onclick="dateSlidePrev()"></button>
                        <button class="btn_next" onclick="dateSlideNext()"></button>
                        <div class="date-slide d-flex" id="dateSlide">
                        <%
                        	String cDay = output2.format(cDate);
                        	String nowDate = output1.format(cDate);
                        	String[] nday = cDay.split("-");
                        	if(nday[3].equals("토")){
                        		nday[3] = "<span class='day blue'>토</span>";
                        	}else if(nday[3].equals("일")){
                        		nday[3] = "<span class='day red'>일</span>";
                        	}else{
                        		nday[3] = "<span class='day'>" + nday[3] + "</span>";
                        	}
                        %>
                        	<div class="date">
				                <p class="datenum"><%=nday[2] %></p>
				                <%=nday[3] %>
				                <input type="radio" name="dateinfo" value="<%=nowDate%>"/>
				            </div>
                        <%
                        for( int i = 0 ; i < 30 ; i ++){
                        	calendar.add(Calendar.DAY_OF_MONTH, 1);
                        	java.util.Date fDate = calendar.getTime();
                        	
                        	String nDate = output1.format(fDate);
                        	String sDate = output2.format(fDate);
                        	String[] sday = sDate.split("-");
                        	if(sday[3].equals("토")){
                        		sday[3] = "<span class='day blue'>토</span>";
                        	}else if(sday[3].equals("일")){
                        		sday[3] = "<span class='day red'>일</span>";
                        	}else{
                        		sday[3] = "<span class='day'>" + sday[3] + "</span>";
                        	}
                       	%>
                        	<div class="date">
				                <p class="datenum"><%=sday[2] %></p>
				                <%=sday[3] %>
				                <input type="radio" name="dateinfo" value="<%=nDate%>"/>
				            </div>
				        <%
                        }
				        %>    
                        </div>
                    </div>
                    <h3 class="p-2">상영시간</h3>
                    <div class="h-time-box cumtom_scrollbar">
                        <ul class="h-time-list p-3">
                            <!-- 여기도 스크립트가 뿌려줌 -->                            
                        </ul>
                    </div>
                    <div class="h-time-blurbox"></div>
                    <div class="h-booking-btn-box">
                        <a href="javascript:void(0)" class="h-booking-btn">
                            좌석선택
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="shadow-box"></div>
        <div class="seats">
	        <div class="seats-select container">
	           	<h3 class="p-2">관람인원 / 좌석선택</h3>
	           	<div class="d-flex justify-content-between mt-3">
		           	<div class="p_selectbox p-3">
		           		<h4 class="red">* 최대 8인까지 예매 가능</h4>
		           		<div class="num-box d-flex justify-content-between">
		           			<div class="text_box">일반</div>
		           			<div class="btn-box">
		           				<button type="button" class="minus"></button>
		           				<input id="peoplenum" type="number" max="8" name="peoplenum"/>
		           				<button type="button" class="plus"></button>
		           			</div>
		           		</div>
		           		<div class="num-box d-flex justify-content-between">
		           			<div class="text_box">청소년</div>
		           			<div class="btn-box">
		           				<button type="button" class="minus"></button>
		           				<input id="youthnum" type="number" max="8" name="youthnum"/>
		           				<button type="button" class="plus"></button>
		           			</div>
		           		</div>
		           		<div class="num-box d-flex justify-content-between">
		           			<div class="text_box">경로</div>
		           			<div class="btn-box">
		           				<button type="button" class="minus"></button>
		           				<input id="seniornum" type="number" max="8" name="seniornum"/>
		           				<button type="button" class="plus"></button>
		           			</div>
		           		</div>
		           		<div class="num-box d-flex justify-content-between">
		           			<div class="text_box">우대</div>
		           			<div class="btn-box">
		           				<button type="button" class="minus"></button>
		           				<input id="vipnum" type="number" max="8" name="vipnum"/>
		           				<button type="button" class="plus"></button>
		           			</div>
		           		</div>
		           		<div class="rest_seats mt-3 d-flex justify-content-between">
		           			<span class="d-block">남은 좌석</span>
		           			<span class="d-block">115 / 120석</span>
		           		</div>
		           		<span class="prev_btn"></span>
		           	</div>
		           	<div class="s_selectbox">
		           		<h6 class="screen">SCREEN</h6>
		           		<ul class="seat_container">
		           		<%
		           			String[] row = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"};
		           			for(int i = 0 ; i < 10 ; i++){
		           		%>
		           			<li class="seat_box">
		           				<span class="seat_row"><%=row[i] %></span>
		           			<%
		           				for(int j = 1 ; j <= 12 ; j++){
		           			%>
		           				<span class="seat">
		           					<%=j %>
		           					<input class="seat_hidden" type="hidden" value="<%=row[i] %><%=j %>" />
		           				</span>
		           			<%
		           				}
		           			%>
		           			</li>
		           		<%
		           			}
		           		%>
		           		</ul>
		           		<div class="seat_container mt-3">
		           			<img src="images/ico/ico-seatsInfo.png" alt="좌석정보" />
		           		</div>
		           	</div>
	           	</div>
	           	
	           	<div class="select_resultbox mt-3">
	           	
	           	</div>
	       	</div>
        </div>
   		
    </section>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/booking.js"></script>