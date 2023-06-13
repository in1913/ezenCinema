$(function(){
    // header 내비게이션 작동
    $(".gnb>li").mouseover(function(){
        $(this).find(".lnb").stop().fadeIn(300);
        $("header.fixed>.subdp").stop().fadeIn(300);
        $("header.fixed").css({"border-bottom":"1.8px solid #ddd"});
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
    
	
    // mainpage
    // 주의사항 닫기
    $('.warning_close').click(function(){
    	$('.main_warning').fadeOut(300);
    })
    
    $('.mainslide').slick({
        infinite: true,
        autoplay: true,
        autoplaySpeed: 2500,
        slidesToShow: 1,
        adaptiveHeight: true,
        speed: 500,
        nextArrow:$('.ma-slidenext'),
        prevArrow:$('.ma-slideprev'),
        dots:true,
        dotsClass:'main_dots'
      });
      $('.play').hide(); // 일시 정지 버튼 숨김

      $('.play').click(function() {
          $('.mainslide').slick('slickPlay');
          $(this).hide(); // 플레이 버튼 숨김
          $('.pause').show(); // 일시 정지 버튼 표시
      });
      
      $('.pause').click(function() {
          $('.mainslide').slick('slickPause');
          $(this).hide(); // 일시 정지 버튼 숨김
          $('.play').show(); // 플레이 버튼 표시
      });
    //현재 예매 hover
    $('.ao-list').each(function(){
        var $this = $(this);
        // var $contact = $this.find('.ao-contact');
        var $contacthv = $this.find('.ao-contacthv');
        
        $this.hover(
            function(){
                // $contact.css("display", "none");
                $contacthv.css("display", "block");
            },
            function(){
                // $contact.css("display", "block");
                $contacthv.css("display", "none");
            }
        );
    });
    //현재 상영중인 트레일러
    $('.nt-slide').slick({
        slidesToShow: 6,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 4000,
        nextArrow:$('.nt-slidenext'),
        prevArrow:$('.nt-slideprev')
    });
    
    //영상 켜기
    $(".nt-post").click(function(){
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
    $(".nt-post").click(function() {
        const vodsrcs = $(this).find('img').data("vodsrc");
        $(".k-popup>iframe").attr("src", vodsrcs);
    });
    // mainpage 끝
    
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
    	$(this).find("i").toggleClass("fa-angle-down");
    	$(this).find("i").toggleClass("fa-angle-up");
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
        slidesToShow: 6,
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
    
    // 광고배너
    $(".banner_close").click(function(){
    	$(".banner_box").fadeOut();
    })
}) // jquery



// 영화 상세
// 공유버튼 클릭
function linkshare(){
    const linkshares = document.getElementById("linkshares");
    linkshares.style.display = "block";
    setTimeout(function(){
        linkshares.style.display = "none";
    }, 2000)
}  

// 스크롤 올라가라
function scrollToTop() {
  window.scrollTo({
    top: 0,
    behavior: 'smooth' 
  });
}
// 스크롤버튼 나와라
$(function() {
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        if (scroll >= 300) {
            $('#pageup').fadeIn();
        } else {
            $('#pageup').fadeOut();
        }
    });

});

function noScreen(){
	alert("상영중인 영화가 아닙니다.");
}
// 스토어
$(function () {
    $('.snack').hide();
    $('.drink').hide();

    $('.tab li').click(function () {
        $('.tab li').removeClass('on')
        $(this).addClass('on')

        let num = $(this).index()
        console.log(num)


        if (num == 0) {
            $('.snack').hide();
            $('.drink').hide();
            $('.combo').show();
        } else if (num == 1) {
            $('.combo').hide();
            $('.drink').hide();
            $('.snack').show();
        } else if (num == 2) {
            $('.combo').hide();
            $('.snack').hide();
            $('.drink').show();
        }
    });


});



var movielist = [];
var movielistData = [];
var movielistHref = [];
var movietitle = []
$(document).ready(function(){
  fetch("/ezenCine/GetMovieList", {
    headers : {"Content-Type" : "application/json"},
    method : "get"
  }).then((res) => res.json())
  .then((result) => {
    let titles = "";
    let titlesData = "";
    let title = "";
    for(i = 0; i < result.length; i++){
      title = result[i].title;
      titles = result[i].title + " (" + result[i].title_eng + ")";
      titlesData = result[i].title + " (" + result[i].title_eng.toLowerCase() + ")";
      movielist.push(titles);
      movielistData.push(titlesData);
      movielistHref.push(result[i].id);
      movietitle.push(title);
    }
  });
});
// 헤더 검색창 자동완성

const $search = document.querySelector("#header-search");
const $autoComplete = document.querySelector(".autocomplete");
const $searchbox = document.getElementById("header-search-box");
let nowIndex = 0;
$search.addEventListener("focusout", function(){
	$autoComplete.style.display="none";
})
$search.onkeyup = (event) => {
  // 검색어
  const value = $search.value.trim();
	$autoComplete.style.display = "block";
	if($search.value == null || $search.value == ""){$autoComplete.style.display = "none";}
  // 자동완성 필터링
  const matchDataList = value
    ? movielist.filter((label) => label.includes(value))
    : [];

  switch (event.keyCode) {
    // UP KEY
    case 38:
      nowIndex = Math.max(nowIndex - 1, 0);
      break;

    // DOWN KEY
    case 40:
      nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
      break;

    // ENTER KEY
    case 13:{
      document.querySelector("#header-search").value = matchDataList[nowIndex] || "";
      $autoComplete.style.display = "none";
	}
      // 초기화
      nowIndex = 0;
      matchDataList.length = 0;
      break;
      
    // 그외 다시 초기화
    default:
      nowIndex = 0;
      break;
  }

  // 리스트 보여주기
  showList(matchDataList, value, nowIndex, movietitle);
};

const showList = (data, value, nowIndex, movietitle) => {
  // 정규식으로 변환
  const regex = new RegExp(`(${value})`, "g");
  
  $autoComplete.innerHTML = data
    .map(
      (label, index) => `
      <div class='${nowIndex === index ? "active" : ""}'>
        ${label.replace(regex, "<mark>$1</mark>")}
        <input type='hidden' value='${movietitle[index]}'>
      </div>
    `
    )
    .join("");
};

$(function(){
	$(document).on("click","#header-submit", function(){
    let title = $("#header-search").val();
    let modtitle = title.substring(0, 2);
    $.ajax({
      url:"/ezenCine/SearchMovie",
      type : "post",
      data : {title : modtitle},
      success : function(result){
        if(result == null){
          alert("검색결과가 없습니다.");
        }else{
          $.ajax({
            url: "movie/searchResult.jsp",
            type: "get",
            data : {id : result},
            success: function() {
                window.location.href = `index.jsp?fname=movie/searchResult&id=${result}`;
            }
        });
        }
      }
    })
  })
})
 