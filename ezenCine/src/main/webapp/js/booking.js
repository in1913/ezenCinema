$(function(){
	// booking
	// 영화선택
    $(".h-b-movie-btn").change(function(){
        $(".h-b-movie-btn").removeClass("b-on");
        $(".h-location-box .select_btn").removeClass("b-on");
        $(".date").removeClass("b-on");
        $(".h-booking-btn-box").css({"display" : "none"});
        $(".h-time-list").html('<img src="images/back/time_select_frame.png" alt="시간선택하세요" />');
        $(this).addClass("b-on");
        let mvVal = $(this).find("input[type='radio']:checked").val();
        
        $.ajax({
			url : "/ezenCine/MovieCheck",
			type : "post",
			data : {movie_id : mvVal},
			dataType: "json",
			success: function(result){
				if(result == 0){
					alert("상영중인 영화관이 없습니다.");
					$(".h-location-box").html('<img src="images/back/movie_select_frame.png" alt="영화선택하세요" />');
				}else{
					$.ajax({
	                    url: "movie/movieCheckOk.jsp",
	                    type: "get",
	                    data: {movie_id: mvVal},
	                    success: function(html) {
	                        $(".h-location-box").html(html);
	                    }
	                });
				}
			}
		})
    });
	
	// 극장 선택
	$(document).on("click", ".h-location-box .select_btn", function(){
		$(".h-location-box .select_btn").removeClass("b-on");
        $(this).addClass("b-on");
	})
    

    

    // 날짜클릭
    $(document).on("click", ".date-slide>.date", function(){
        let cineVal = $(".h-location-box").find("input[type='radio']:checked").val();
        let mvVal = $(".h-b-movie").find("input[type='radio']:checked").val();
        let dateVal;
        if(cineVal != null){
	        $(".date").removeClass("b-on");
	        $(this).addClass("b-on");
	        $(this).find("input").prop("checked", true);
	        dateVal = $(".date-slide").find("input[type='radio']:checked").val();
	        $.ajax({
				url : "/ezenCine/TimeCheck",
				type : "post",
				data : {
					movie_id : mvVal,
					cinema_name : cineVal,
					date : dateVal
				},
				dataType: "json",
				success: function(result){
					if(result == 0){
						alert("해당 날짜에 상영일정이 없습니다.");
						$(".h-time-list").html("");
					}else{
						$.ajax({
		                    url: "movie/timeCheckOk.jsp",
		                    type: "get",
		                    data : {
								movie_id : mvVal,
								cinema_name : cineVal,
								date : dateVal
							},
		                    success: function(html) {
		                        $(".h-time-list").html(html);
		                    }
		                });
					}
				}
			})
        }else{
        	alert("영화관을 선택하세요.");
        }
    })
    
    // 시간 클릭
    $(document).on("click", ".h-b-time-btn", function(){
        $(".h-b-time-btn").removeClass("b-on");
        $(this).addClass("b-on");
        $(this).find("input").prop("checked", true);
        $(".h-booking-btn-box").css({"display" : "block"});
    });
    
    // 좌석선택 나와라
    $(".h-booking-btn").click(function(){
    	$(".shadow-box").fadeIn(300);
    	$(".seats").fadeIn(300);
    	let cineVal = $(".h-location-box").find("input[type='radio']:checked").val();
        let mvVal = $(".h-b-movie").find("input[type='radio']:checked").val();
    	let dateVal = $(".date-slide").find("input[type='radio']:checked").val();
    	let timeVal = $(".h-b-time-btn").find("input[type='radio']:checked").val();
		let runVal = $(".h-b-time-btn.b-on").find("input[type='hidden'].running_time").val();
		let roomVal = $(".h-b-time-btn.b-on").find("input[type='hidden'].room_number").val();
		$.ajax({
            url: "movie/remainingSeatOk.jsp",
            type: "get",
            data : {
				movie_id : mvVal,
				cinema_name : cineVal,
				date : dateVal,
				time : timeVal
			},
            success: function(html) {
                $(".count_seat").html(html);
            }
        });
		
		$.ajax({
            url: "movie/seatsCheckOk.jsp",
            type: "get",
            data : {
				movie_id : mvVal,
				cinema_name : cineVal,
				date : dateVal,
				time : timeVal
			},
            success: function(html) {
                $("ul.seat_container").html(html);
            }
        });
        
        $.ajax({
            url: "movie/selectResultOk.jsp",
            type: "get",
            data : {
				movie_id : mvVal,
				cinema_name : cineVal,
				date : dateVal,
				time : timeVal,
				run : runVal,
				room : roomVal
			},
            success: function(html) {
                $(".select_resultbox").html(html);
            }
        });
				
    })
    
    // 좌석선택 들어가라
    $(".prev_btn").click(function(){
    	$(".shadow-box").fadeOut(300);
    	$(".seats").fadeOut(300);
    	$("ul.seat_container").html('<img src="images/back/wait_seat_frame.png" alt="좌석정보 불러오는중..." />');
    })
    
	// 인원수 증감
	$(document).ready(function() {
	    $("#peoplenum").val(0);
	    $("#youthnum").val(0);
	    $("#seniornum").val(0);
	    $("#vipnum").val(0);
	});
	
	$(".minus").click(function() {
	    let input = $(this).next();
	    let value = parseInt(input.val());
	    let selected_seats = $(".seat.selected");
	    if(value <= selected_seats.length){
	    	alert("선택 좌석을 해제해주세요.");
	    }else if (value > 0) {
	        input.val(value - 1);
	        calculateTotal();
	    }
	});
	
	$(".plus").click(function() {
	    let input = $(this).prev();
	    let value = parseInt(input.val());
	    if (value < 8) {
	        input.val(value + 1);
	        calculateTotal();
	    }else{
	    	alert("최대 8명까지 선택 가능합니다.");
	    }
	});
	
	function calculateTotal() {
	    let peoplenum = parseInt($("#peoplenum").val());
	    let youthnum = parseInt($("#youthnum").val());
	    let seniornum = parseInt($("#seniornum").val());
	    let vipnum = parseInt($("#vipnum").val());
	    let totalbook = peoplenum + youthnum + seniornum + vipnum;
	
	    if (totalbook > 8) {
	        alert("최대 8명까지 선택 가능합니다.");
	        adjustInputValues();
	        totalbook = 8;
	    }
	
	    $("#totalbook").text(totalbook);
	    $("#selected_people_num").text(totalbook + "명");
	    let total_cost = 9000 * totalbook;
	    let format_cost = total_cost.toLocaleString();
	    $(".result_cost").text(format_cost +"원");
	}
	
	function adjustInputValues() {
	    let peoplenum = parseInt($("#peoplenum").val());
	    let youthnum = parseInt($("#youthnum").val());
	    let seniornum = parseInt($("#seniornum").val());
	    let vipnum = parseInt($("#vipnum").val());
	    let totalbook = peoplenum + youthnum + seniornum + vipnum;
	
	    while (totalbook > 8) {
	        if (vipnum > 0) {
	            $("#vipnum").val(vipnum - 1);
	            vipnum = parseInt($("#vipnum").val());
	        } else if (seniornum > 0) {
	            $("#seniornum").val(seniornum - 1);
	            seniornum = parseInt($("#seniornum").val());
	        } else if (youthnum > 0) {
	            $("#youthnum").val(youthnum - 1);
	            youthnum = parseInt($("#youthnum").val());
	        } else if (peoplenum > 0) {
	            $("#peoplenum").val(peoplenum - 1);
	            peoplenum = parseInt($("#peoplenum").val());
	        }
	        totalbook = peoplenum + youthnum + seniornum + vipnum;
	    }
	}
	
	// 좌석선택하기
	$(document).on("click", ".seat.unselected", function(){
		let selected_seat = $(".seat.selected");
		let totalbook = $("#totalbook").html();
		if(totalbook == 0){
			alert("인원수를 선택해주세요.");
		}else if(selected_seat.length < totalbook){
			$(this).removeClass('unselected');
			$(this).addClass('selected');
			selectSeats();
		}else if(selected_seat.length >= totalbook){
			alert("선택 인원수를 초과했습니다.");
		}
	});
	$(document).on("click", '.seat.selected', function(){
		$(this).addClass('unselected');
		$(this).removeClass('selected');
		selectSeats()
	});
	
	function selectSeats() {
		let selected_seats = $(".seat.selected");
		let seat_info = "";
		for (let i = 0; i < selected_seats.length; i++) {
			if(i < selected_seats.length - 1){
				seat_info += `${$(selected_seats[i]).find(".seat_hidden").val()},`;
			}else{
				seat_info += `${$(selected_seats[i]).find(".seat_hidden").val()}`;
			}
		}
		$("#selected_seat_info").html(seat_info);
	}
	// 초기화버튼
	$(document).on("click", "#select_reset_btn", function(){
		$("#peoplenum").val(0);
	    $("#youthnum").val(0);
	    $("#seniornum").val(0);
	    $("#vipnum").val(0);
	    $("#totalbook").text(0);
	    $(".result_cost").text("");
	    $("#selected_seat_info").text("");
	    $("#selected_people_num").text("");
	    
	    let selected_seat = $('.seat.selected');
	    for(let i = 0 ; i < selected_seat.length ; i++){
	    	$(selected_seat[i]).addClass("unselected");
	    	$(selected_seat[i]).removeClass('selected');
	    }
	});
	
	// 결제버튼 hover
	$(document).on("mouseover", "#payment_btn", function(){
		$(this).addClass("on");
	});
	$(document).on("mouseleave", "#payment_btn", function(){
		$(this).removeClass("on");
	});
	
	// 결제
	$(document).on("click", "#payment_btn", function(){
		let seat_info = $("#selected_seat_info").text();
		let cineVal = $(".h-location-box").find("input[type='radio']:checked").val();
        let mvVal = $(".h-b-movie").find("input[type='radio']:checked").val();
    	let dateVal = $(".date-slide").find("input[type='radio']:checked").val();
    	let timeVal = $(".h-b-time-btn").find("input[type='radio']:checked").val();
		let roomVal = $(".h-b-time-btn.b-on").find("input[type='hidden'].room_number").val();
		let cost = $(".result_cost").text();
		if(seat_info == null || seat_info == ""){
			alert("좌석을 선택해주세요");
		}else{
			$.ajax({
	            url: "/ezenCine/Ticketing",
	            type: "post",
	            data : {
					movie_id : mvVal,
					cinema_name : cineVal,
					date : dateVal,
					time : timeVal,
					seat : seat_info,
					room : roomVal,
					cost : cost
				},
	            success: function(result) {
	               	if(result == 0){
	               		alert("예매에 실패했습니다");
	               	}else{
	               		alert("예매가 완료되었습니다.");
	               		window.location.href = `index.jsp?fname=mem/mypage`;
	               	}
	            }
	        });
		}
	});
	
})//  jquery


let ps = 0;
const dateSlidePrev = () => {
    ps = dateSlide.offsetLeft;
    if(ps < 0){
        ps += 150;
        dateSlide.style.left = ps + "px";
    }
}
const dateSlideNext = () => {
    ps = dateSlide.offsetLeft;
    if(ps > -1500){
        ps -= 150;
        dateSlide.style.left = ps + "px";
    }
}

