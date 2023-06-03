<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <section class="booking">
        <div class="container">
            <div class="movie_select d-flex">
                <div class="h-movie_choose h-booking_box mr-2">
                    <h3 class="p-2">영화</h3>
                    <div class="h-b-movie-booking cumtom_scrollbar">
                        <ul class="h-b-movie-list">
                            <li class="h-b-movie-btn">
                                <label class="h-b-movie select_btn">
                                    <input class="h-movie-check" type="radio" name="movie-name" value="movie1">
                                    <span class="h-movie-age" style="background-image: url(images/ico/ico-age-15.png);"></span> 
                                    <span class="h-b-movietitle">분노의질주-라이드 오어 다이</span>
                                </label>
                            </li>
                            <li class="h-b-movie-btn">
                                <label class="h-b-movie select_btn">
                                    <input class="h-movie-check" type="radio" name="movie-name" value="movie2">
                                    <span class="h-movie-age" style="background-image: url(images/ico/ico-age-0.png);"></span> 
                                    <span class="h-b-movietitle">슈퍼마리오 브라더스</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="h-location h-booking_box mr-2">
                    <h3 class="p-2">극장</h3>
                    <div class="h-location-box cumtom_scrollbar">
                        <label class="select_btn">
                            <input type="radio" name="cinema-location" value="cinema1">
                            김포장기점
                        </label>
                    </div>
                    <div class="h-location-blurbox"></div>
                </div>
                
                <div class="h-time h-booking_box">
                    <h3 class="p-2">날짜</h3>
                    <div class="date-select">
                        <h4 class="p-2 text-center year_month">2023년 5월</h4>
                        <button class="btn_prev" onclick="dateSlidePrev()"></button>
                        <button class="btn_next" onclick="dateSlideNext()"></button>
                        <div class="date-slide d-flex" id="dateSlide">
                            <!-- 여기는 스크립트가 뿌려줌 -->
                        </div>
                    </div>
                    <h3 class="p-2">상영시간</h3>
                    <div class="h-time-box cumtom_scrollbar">
                        <ul class="h-time-list">
                            <li class="h-b-time-btn"><button type="button" class="h-b-time"><span class="h-time">09:00 ~ 10:30</span><span class="h-sit">좌석 0/30</span></button></li>
                            <li class="h-b-time-btn"><button type="button" class="h-b-time"><span class="h-time">11:00 ~ 12:30</span><span class="h-sit">좌석 0/30</span></button></li>
                        </ul>
                    </div>
                    <div class="h-time-blurbox"></div>
                    <div class="h-booking-btn-box">
                        <a href="javascript:void(0)" class="h-booking-btn">
                            예매하기
                        </a>
                    </div>
                </div>
            </div>
        </div>
    
    </section>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/dayjs.min.js"></script>
    <script src="js/booking.js"></script>