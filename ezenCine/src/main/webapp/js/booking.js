$(function(){
	// booking
	// 영화선택
    $(".h-b-movie-btn").change(function(){
        $(".h-b-movie-btn").removeClass("b-on");
        $(".h-location-box .select_btn").removeClass("b-on");
        $(".date").removeClass("b-on");
        $(".h-booking-btn-box").css({"display" : "none"});
        $(".h-time-list").html(" ");
        $(this).addClass("b-on");
        $(".h-location-blurbox").css({"display" : "none"});
        let mvVal = $(this).find("input[type='radio']:checked").val();
        
        $.ajax({
			url : "/ezenCine/MovieCheck",
			type : "post",
			data : {movie_id : mvVal},
			dataType: "json",
			success: function(result){
				if(result == 0){
					alert("상영중인 영화관이 없습니다.");
					$(".h-location-box").html("");
					$(".h-location-blurbox").css({"display" : "block"});
					$(".h-time-blurbox").css({"display" : "block"});
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
        $(".h-time-blurbox").css({"display" : "none"});
	})
    

    

    // 날짜클릭
    $(document).on("click", ".date-slide>.date", function(){
        let cineVal = $(".h-location-box").find("input[type='radio']:checked").val();
        let mvVal = $(".h-b-movie").find("input[type='radio']:checked").val();
        let dateVal;
        console.log(cineVal);
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
    })
    
    // 좌석선택 들어가라
    $(".prev_btn").click(function(){
    	$(".shadow-box").fadeOut(300);
    	$(".seats").fadeOut(300);
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
	    if (value > 0) {
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
})


let ps = 0;
const dateSlidePrev = () => {
    ps = dateSlide.offsetLeft;
    if(ps < 0){
        ps += 100;
        dateSlide.style.left = ps + "px";
    }
    console.log(ps);
}
const dateSlideNext = () => {
    ps = dateSlide.offsetLeft;
    if(ps > -1500){
        ps -= 100;
        dateSlide.style.left = ps + "px";
    }
    
    console.log(ps);
}

 