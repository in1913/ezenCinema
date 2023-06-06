$(function(){
	// booking
    $(".h-b-movie-btn").click(function(){
        $(".h-b-movie-btn").removeClass("b-on");
        $(this).addClass("b-on");
        $(".h-location-blurbox").css({"display" : "none"});
    });

    $(".h-location-box label").click(function(){
        $(".h-location-box label").removeClass("b-on");
        $(this).addClass("b-on");
        $(".h-time-blurbox").css({"display" : "none"});
    });

    $(".h-b-time-btn button").click(function(){
        $(".h-b-time-btn button").removeClass("b-on");
        $(this).addClass("b-on");
        $(".h-booking-btn-box").css({"display" : "block"});
    });

    // 날짜클릭 액티브
    $(".date-slide>.date").click(function(){
        $(".date").removeClass("b-on");
        $(this).addClass("b-on");
        $(this).find("input").prop("checked", true);
    })
    
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

 