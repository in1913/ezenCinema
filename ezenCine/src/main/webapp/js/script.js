$(function(){
    // header 내비게이션 작동
    $(".gnb>li").mouseover(function(){
        $(this).find(".lnb").stop().fadeIn(300);
        $("header.fixed>.subdp").stop().fadeIn(300);
        $("header.fixed").css({"border":"none"});
    });
    $(".gnb>li").mouseleave(function(){
        $(this).find(".lnb").stop().fadeOut(300);
        $("header.fixed>.subdp").stop().fadeOut(300);
        $("header.fixed").css({"border-bottom":"1.8px solid #000"});
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
    
    // movieList 시작
      $(".h-movie-all").hover(function(){
	      $(this).find(".h-imgbox").find(".h-movie-content").stop().fadeToggle(300);
	  });
	  
	  $("#nav-movie").click(function(){
	      let offset = $('#movie').offset();
	      const scroll = $(document).scrollTop();
	      
	      if(scroll == 0){
	        $('html').animate({scrollTop : offset.top-80}, 400);
	      }else{
	        $('html').animate({scrollTop : offset.top-40}, 400);
	      }
	  });
	
	
	  $("#nav-upcoming").click(function(){
	    let offset = $('#upcoming').offset();
	    const scroll = $(document).scrollTop();
	
	    if(scroll == 0){
	      $('html').animate({scrollTop : offset.top-80}, 400);
	    }else{
	      $('html').animate({scrollTop : offset.top-40}, 400);
	    }
	  });
	
	  $("#nav-top").click(function(){
	    let offset = $('#top').offset();
	    const scroll = $(document).scrollTop();
	    
	    if(scroll == 0){
	      $('html').animate({scrollTop : offset.top-80}, 400);
	    }else{
	      $('html').animate({scrollTop : offset.top-40}, 400);
	    }
	  });
	
	  $("#nav-animation").click(function(){
	    let offset = $('#animation').offset(); 
	    const scroll = $(document).scrollTop();
	    
	    if(scroll == 0){
	      $('html').animate({scrollTop : offset.top-60}, 400);
	    }else{
	      $('html').animate({scrollTop : offset.top-40}, 400);
	    }
	  });
    
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
    
    /*** 영화상세 ***/
    //좋아요 버튼
    $('#likeimage').click(function(){
        $(this).toggleClass("on")
    });
    //정보 리뷰 active
    $('.k-tab>li').click(function(){
        $('.k-tab>li>a').toggleClass('active');
        if($('#information').hasClass("active")){
            $('#k-information').addClass("active");
        }else{
            $('#k-information').removeClass("active");
        }
        if($('#review').hasClass("active")){
            $('#k-review').addClass("active");
        }else{
            $('#k-review').removeClass("active");
        }
    });
    
    // 줄거리버튼
    $('.k-summary_btn').click(function(){
    	$('.k-summary').toggleClass("wide");
    });

    //스틸컷 슬라이드
    $('.pt-in').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        centerMode:true,
        centerPadding: '60px',
        nextArrow: $('#btn-right'),
        prevArrow: $('#btn-left'),
    });
    $('.pt-in').on('afterChange', function(event, slick, currentSlide) {
        $('#cnum').text(currentSlide + 1);
    });
    $('.pt-in').on('afterChange', function(event, slick, currentSlide) {
        $('.page .bar').removeClass('active onn');
        $('.page .bar').eq(currentSlide).addClass('active onn');
    });
    
    //예고편 슬라이드
    $('.k-slide').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        nextArrow:$('.slidenext'),
        prevArrow:$('.slideprev'),
        dots:true,
        dotsClass:'slide_dots',
      });


    //영상 켜기
      $(".k-trailer_btn").click(function(){
        const Popup = document.getElementsByClassName("k-popup")[0];
        const fade = document.getElementsByClassName("k-fade")[0];
        Popup.style.display = "block";
        fade.style.display = "block";
    });

    //영상 끄기
    $(".k-fade").click(function(){
        const PopupSlide = document.getElementsByClassName("k-popup")[0];
        const fadeOut = document.getElementsByClassName("k-fade")[0];
        PopupSlide.style.display = "none";
        fadeOut.style.display = "none";
    });

    //슬라이드 링크 변경
    $(".k-trailer_btn").click(function() {
        const vodsrcs = $(this).prev("img").data("vodsrc");
        $(".k-popup iframe").attr("src", vodsrcs);
      });

    //감독 출연진 슬라이드
    $('.k-post-wrapper').slick({
        slidesToShow: 5,
        slidesToScroll: 2,
        // autoplay: true,
        // autoplaySpeed: 2000,
        nextArrow:$('.next'),
        prevArrow:$('.prev'),
      });

    
      // 리뷰상세


    //textarea 글자입력 설정
    $('fieldset.rate input').on('click', function() {
        var ratingValue = $(this).val();
        $('.rating-number').text(ratingValue);
    });


    //textarea 글자입력 설정
    $('.k-text_box textarea').keyup(function(){
        var content = $(this).val();
        $('.k-text_box .count span').html(content.length);
        if (content.length > 220){
          alert("최대 220자까지 입력 가능합니다.");
          $(this).val(content.substring(0, 220));
          $('.k-text_box .count span').html(220);
        }
    });

    //리뷰 좋아요버튼
    $('.k-like2').click(function(){
        $('.k-like2').toggleClass("on")
    });

    //리뷰 순위 active
    $('.k-reviewtitle_ul>span>a').click(function(){
        $('.k-reviewtitle_ul>span>a').removeClass("active");
        $(this).addClass("active");
    });

    /*** 영화상세 끝 ***/
}) // jquery




const SearchBox = document.querySelector(".h-movie-search-box");
const movieList = document.querySelector(".h-movie-list");
const SearchBoxHeight = SearchBox.offsetTop;
const movieListHight = movieList.offsetTop;
console.log(movieListHight);

const movie = document.querySelector('#nav-movie');
const movieHeight = window.pageYOffset + document.querySelector("#movie").getBoundingClientRect().top-81;
const upcoming = document.querySelector("#nav-upcoming");
const upcomingHeight = window.pageYOffset + document.querySelector("#upcoming").getBoundingClientRect().top-81;
const navTop = document.querySelector("#nav-top");
const navTopHeight = window.pageYOffset + document.querySelector("#top").getBoundingClientRect().top-81;
const animation = document.querySelector("#nav-animation");
const animationHeight = window.pageYOffset + document.querySelector("#animation").getBoundingClientRect().top-81;

window.onscroll = function () {
  const windowTop = window.scrollY;
  	// 스크롤 세로값이 h-movie-list높이보다 크거나 같으면 
	// h-movie-list에 클래스 'drop'을 추가한다
	console.log(windowTop);
	console.log(SearchBoxHeight);
  if (windowTop >= SearchBoxHeight) {
    movieList.classList.add("drop");
  } 
  // 아니면 클래스 'drop'을 제거
  else {
    movieList.classList.remove("drop");
  }
};

$(window).scroll(function () { 
	const scroll = $(document).scrollTop(); 
	console.log(scroll);
	console.log(movieHeight);
	console.log(upcomingHeight);
	console.log(navTopHeight);
	console.log(animationHeight);
	
	if(scroll < movieHeight){
	    movie.classList.remove("h-active");
	}else if(scroll >= movieHeight && scroll < upcomingHeight){
	    movie.classList.add("h-active");
	    upcoming.classList.remove("h-active");
	}else if(scroll >= upcomingHeight && scroll < navTopHeight){
	    movie.classList.remove("h-active");
	    upcoming.classList.add("h-active");
	    navTop.classList.remove("h-active");
	}else if(scroll >= navTopHeight && scroll < animationHeight){
	    upcoming.classList.remove("h-active");
	    navTop.classList.add("h-active");
	    animation.classList.remove("h-active");
	}else if(scroll >= animationHeight){
	    navTop.classList.remove("h-active");
	    animation.classList.add("h-active");
	}
    
});

// 영화 상세
// 공유버튼 클릭
function linkshare(){
    const linkshares = document.getElementById("linkshares");
    linkshares.style.display = "block";
    setTimeout(function(){
        linkshares.style.display = "none";
    }, 2000)
}  

