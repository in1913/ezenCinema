<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	String userid = "";
	if(session.getAttribute("userid") == null){	
	}else{
		userid = (String) session.getAttribute("userid");	
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZEN Cinema</title>
<link rel="icon" href="images/logo/logo.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>

    <header id="header">
        <div class="subdp"></div>
        <div class="subdp2"></div>
        <div class="container d-flex justify-content-between">
            <div class="logoarea">
                <a href="index.jsp"><img src="images/logo/logo.png" alt="logo"></a>
            </div>
            <div class="header-nav mt-3">
                <ul class="gnb d-flex">
                    <li>
                        <a href="index.jsp?fname=movie/movieList">영화</a>
                        <ul class="lnb">
                            <li><a href="index.jsp?fname=movie/movieListNow">현재상영작</a></li>
                            <li><a href="index.jsp?fname=movie/movieListExpected">상영예정작</a></li>
                            <li><a href="index.jsp?fname=movie/movieListPast">지난상영작</a></li>
                        </ul>
                    </li>
                    <li>
                    	<%
                    		if(userid == null || userid == ""){
                    	%>
                    	<a href="javascript:void(0)" onclick="pleaseLogin()">예매</a>
                    	<%
                    		}else{
                    	%>
                        <a href="index.jsp?fname=movie/booking">예매</a>
                        <%
                    		}
                        %>
                        <ul class="lnb">
                            <li>
                            <%
                    			if(userid == null || userid == ""){
	                    	%>
	                    	<a href="javascript:void(0)" onclick="pleaseLogin()">예매하기</a>
	                    	<%
	                    		}else{
	                    	%>
	                        <a href="index.jsp?fname=movie/booking">예매하기</a>
	                        <%
	                    		}
	                        %>
                            	
                            </li>
                            <li><a href="javascript:void(0)">상영시간표</a></li>
                            <li><a href="javascript:void(0)">할인안내</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)">극장</a>
                        <ul class="lnb">
                            <li><a href="javascript:void(0)">전체극장</a></li>
                            <li><a href="javascript:void(0)">특별관</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)">이벤트</a>
                        <ul class="lnb">
                            <li><a href="javascript:void(0)">지난 이벤트</a></li>
                            <li><a href="javascript:void(0)">진행중인 이벤트</a></li>
                            <li><a href="javascript:void(0)">당첨자 발표</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="index.jsp?fname=store/store">스토어</a>
                        
                    </li>
                    <li>
                        <a href="javascript:void(0)">혜택</a>
                        <ul class="lnb">
                            <li><a href="javascript:void(0)">멤버십</a></li>
                            <li><a href="javascript:void(0)">제휴/할인</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="gong"></div>
            <div class="header-util d-flex mt-3">
<%
	if(userid == ""){
%>            
                <span class="r-bar"><a href="javascript:showLoginPopup();">로그인</a></span>
                <span><a href="/ezenCine/signup.jsp">회원가입</a></span>
<%
	}else{
%>  
              	<span class="r-bar"><a href="javascript:cLogout();">로그아웃</a></span>
              	<span><a href="index.jsp?fname=mem/mypage">MY</a></span>
<%
	}
%>              		              
                
                <span><a href="javascript:void(0)"><img src="images/ico/ico-search.png" alt="search" id="search-on"></a></span>
                <div class="header-search-box" id="header-search-box">
                    <div class="d-flex">
                        <input spellcheck="false" type="text" placeholder="검색어를 입력해주세요." name="header-search" id="header-search" autocomplete="off">
                        <button type="button" id="header-submit"></button>
                        <div class="autocomplete"></div>
                    </div>
                </div>
            </div>
        </div>
    </header>


<%
    String snsid = (String) request.getAttribute("snsid");
	
	String emailFront = (String) request.getAttribute("emailFront");
	String emailBack = (String) request.getAttribute("emailBack");
	
	String nickname = (String) request.getAttribute("nickname");
	String tel = (String) request.getAttribute("tel");
	String name = (String) request.getAttribute("name");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZEN Cinema</title>
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>  
    <div class="c-signContainer">
<!------------- title ------------------>
        <ul class="c-ul-signup-sns">
            <li class="c-sign-show">
                <div class="c-text-center">
                    <img src="images/icon/pen/Property 1=on.png" alt="penOn"><br>
                    <span>정보입력</span>
                    <span class="c-show"></span>
                </div>
            </li>
            <li class="c-sign-hide">
                <div class="c-text-center">
                    <img src="images/icon/pen/Property 1=off.png" alt="penOn"><br>
                    <span>정보입력</span>
                </div>
            </li>
            <li class="c-sign-show">
                <div class="c-text-center">
                    <img src="images/icon/congratulation/Property 1=on.png" alt="congOn"><br>
                    <span>가입완료</span>
                    <span class="c-show"></span>
                </div>
            </li>
            <li class="c-sign-hide">
                <div class="c-text-center">
                    <img src="images/icon/congratulation/Property 1=off.png" alt="congOn"><br>
                    <span>가입완료</span>
                </div>
            </li>
        </ul>
<!--------------------------- sns 회원가입 ----------------------------------->
        <div class="c-part2-sns">
            <div class="c-text-center c-title">
                <h2>회원가입</h2>
                <h4>EZEN CINEMA의 회원이 되어주세요!</h4>
            </div>
            <p class="c-essential-alert">* 는 필수 입력 정보입니다.</p>
            <div class="c-getMemInfo">
                <div class="c-input-id">
                    <div class="first">
                        * 아이디 
                    </div>
                    <div class="second">
                        <input spellcheck="false" type="text" name="userid" id="userid" oninput="regexIdCheck();">
                        <input type="hidden" id="snsid" name="snsid" value="<%=snsid%>">
                        <span>영문 소문자 또는 영문 대문자, 숫자 조합 6~12자리</span>
                        <span class="c-warning"></span>
                    </div>
                    <div class="third">
                        <a href="javascript:idDupli();" class="idCheck" id="idCheck" oninput="regexIdCheck();">중복확인</a>
                        <input type="hidden" name="idDupliCheck" id="idDupliCheck" value="">
                    </div>
                </div>

<hr class="c-signup">
                <div class="c-input-username">
                    <div class="first">
                        * 이름
                    </div>
                    <div class="second">
                        <input spellcheck="false" type="text" name="username" id="username" placeholder="이름을 입력해주세요." value="<%=name%>">
                        <span class="c-warning"></span>
                    </div>
                    <div class="third">
                    </div>
                </div>

                <div class="c-input-nickname">
                    <div class="first">
                        * 닉네임
                    </div>
                    <div class="second">
                        <input spellcheck="false" type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요." value="<%=nickname%>">
                        <span class="c-warning"></span>
                    </div>
                    <div class="third">
                    </div>
                </div>

                <div class="c-input-birthdate">
                    <div class="first">
                        * 생년월일
                    </div>
                    <div class="second">
                        <div>
                            <span class="c-year">
                                <select name="year" id="year" class="year">
                                    <option value="">년</option>
                                </select>
                            </span>
                            <span class="c-month">
                                <select name="month" id="month" class="month">
                                    <option value="">월</option>
                                </select>
                            </span>
                            <span class="c-day">
                                <select name="day" id="day" class="day">
                                    <option value="">일</option>
                                </select>
                            </span>
                        </div>
                        <span class="c-warning"></span>
                    </div>
                    <div class="third">
                    </div>
                </div>

                <div class="c-input-tel">
                    <div class="first">
                        * 전화번호
                    </div>
                    <div class="second">
                        <input type="number" name="tel" id="tel" placeholder="숫자만 입력해주세요." oninput="regexTelCheckSns();" value="<%=tel%>">
                        <span class="c-warning"></span>
                    </div>
                    <div class="third">
                    </div>
                </div>

                <div class="c-input-addr">
                    <div class="first">
                        * 주소
                    </div>
                    <div class="second">
                        <input spellcheck="false" type="text" name="postcode" readonly id="postcode">
                        <input spellcheck="false" type="text" name="addr" readonly id="addr">
                        <input spellcheck="false" type="text" name="detailaddr" id="detailaddr" placeholder="상세 주소를 입력해주세요." style="margin-bottom: 0;">
                        <span class="c-warning"></span>
                    </div>
                    <div class="third">
                        <a href="javascript:sDaumPostcode();">우편번호 검색</a>
                    </div>
                </div>

                <div class="c-input-email">
                    <div class="first">
                        * 이메일
                    </div>
                    <div class="second">
                        <input readonly spellcheck="false" type="text" name="email1" id="email1" placeholder="이메일" value="<%=emailFront%>">
                        @
                        <input spellcheck="false" readonly type="text" id="email2" name="email2" placeholder="example.com" value="<%=emailBack%>">
                        <select readonly name="selectEmail" id="selectEmail" onchange="getEmail();">
                            <option value="" selected disabled hidden>선택</option>
                            <option value="direct">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="hotmail.com">hotmail.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="yahoo.co.kr">yahoo.co.kr</option>
                            <option value="gmail.com">gmail.com</option>
                        </select>
                        <br>
                        <span class="c-warning"></span>
                    </div>
                    <div class="third">
                    </div>
                </div>
            </div>
            <a href="javascript:cSignUpSns();" class="c-signup-btn">가입하기</a>
    

        </div>

<!----------------------------- 가입완료 ---------------------------------->            
            <div class="c-part3">
                <img class="c-cele-img" src="images/icon/congratulation/celebrate.png" alt="celebrate">
                <div class="c-title c-text-center">
                    <h2>Welcome!</h2>
                    <h1>EZEN CINEMA의 회원이 되신 것을 축하드립니다!</h1>
                </div>
                <div class="c-cele-content c-text-center">
                        <p>로그인 후 다양한 영화와 혜택을 만나보세요.</p>
                        <a href="/ezenCine" class="c-go-main">메인으로 이동</a>
                        <a href="javascript:showLoginPopup();" class="c-go-login" style="color: #fff">로그인하기</a>
                </div>
            </div>
        
    </div>

<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/signup.js"></script>
<%@ include file="include/footer.jsp" %>