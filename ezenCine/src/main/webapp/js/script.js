$(function(){
    // header 내비게이션 작동
    $(".gnb>li").hover(function(){
        $(this).find(".lnb").stop().fadeToggle(300);
        $("header.fixed>.subdp").stop().fadeToggle(300);
    });

    $(document).ready(function(){
        // header-search 나와라
        $("#search-on").click(function(event){
            event.stopPropagation();
            $(".header-search-box").fadeToggle(200);
        });
        // header-search 다른데 눌러도 없어져라
        $(document).click(function(event){
            if ($(".header-search-box").is(":visible") && !$(event.target).closest(".header-search-box").length) { // 서치폼이 보이는 상태인 경우에만 처리
                $(".header-search-box").fadeOut(200);
            }
        })
    })
    
    // 스크롤하면 header 변신
    $(window).scroll(function(){
        const header = $('#header').offset().top;
        if(header > 0){
            $('#header').addClass('fixed');
        }else{
            $('#header').removeClass('fixed');
        }
    })
    
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
    })
})

let day = dayjs();
let ddd = "";
const dateSlide = document.getElementById('dateSlide');
for(let i = -3 ; i < 30 ; i++){
    ddd = (day.add(i,"day").$d).toString();
    let dt = parseInt(ddd.slice(8,10))
    
    dateSlide.innerHTML 
        += `<div class="date">
                <p class="datenum">${dt}</p>
                <span class="day">${ddd.slice(0,3)}</span>
            </div>`;
}

const dateSlidePrev = () => {
    console.log(dateSlide.style.left -= 10);
    // if(dateSlide.style.left > 0){
    //     dateSlide.style.left
    // }
}