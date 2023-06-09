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
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>

    <header id="header">
        <div class="subdp"></div>
        <div class="container d-flex justify-content-between">
            <div class="logoarea">
                <a href="/ezenCine"><img src="images/logo/logo.png" alt="logo"></a>
            </div>
            <div class="header-nav mt-3">
                <ul class="gnb d-flex">
                    <li>
                        <a href="javascript:void(0)">영화</a>
                        <ul class="lnb">
                            <li><a href="javascript:void(0)">현재상영작</a></li>
                            <li><a href="javascript:void(0)">상영예정작</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)">예매</a>
                        <ul class="lnb">
                            <li><a href="javascript:void(0)">예매하기</a></li>
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
                        <a href="javascript:void(0)">스토어</a>
                        <ul class="lnb">
                            <li><a href="javascript:void(0)">베스트</a></li>
                            <li><a href="javascript:void(0)">스낵/음료</a></li>
                            <li><a href="javascript:void(0)">관람권</a></li>
                            <li><a href="javascript:void(0)">굿즈</a></li>
                        </ul>
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
                <span class="r-bar"><a href="javascript:showLoginPopup();">Login</a></span>
                <span><a href="/ezenCine/signup.jsp"><img src="images/ico/ico-user.png" alt="mypage"></a></span>
<%
	}else{
%>  
              	<span class="r-bar"><a href="javascript:cLogout();">Logout</a></span>
              	<span><a href="index.jsp?fname=mem/mypage"><img src="images/ico/ico-user.png" alt="mypage"></a></span>
<%
	}
%>              		              
                
                <span><a href="javascript:void(0)"><img src="images/ico/ico-search.png" alt="search" id="search-on"></a></span>
                <div class="header-search-box">
                    <form action="" name="header-search-form" class="d-flex">
                        <input type="text" placeholder="검색어를 입력해주세요." name="header-search" id="header-search">
                        <button type="submit" id="header-submit"></button>
                    </form>
                </div>
            </div>
        </div>
    </header>

    <div class="c-signContainer">
<!------------- title ------------------>
            <ul class="c-ul-signup">
                <li class="c-sign-show">
                    <div class="c-text-center">
                        <img src="images/icon/user/Property 1=on.png" alt="userOn"><br>
                        <span>약관동의</span>
                        <span class="c-show"></span>
                    </div>
                </li>
                <li class="c-sign-hide">
                    <div class="c-text-center">
                        <img src="images/icon/user/Property 1=off.png" alt="userOn"><br>
                        <span>약관동의</span>
                    </div>
                </li>
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
<!----------------------------- 약관 동의 --------------------------->  
            <div class="c-part1">
                <div class="c-text-center c-title">
                    <h2>약관동의</h2>
                    <h4>EZEN CINEMA 서비스 이용을 위한 약관에 동의 해주세요.</h4>
                </div>
                <div class="c-law-content">
                    <p class="c-law-show"><a href="javascript:cEssentialAgreeAll();"><img src="images/icon/describe/Property 1=no.png" alt="no"> &nbsp;&nbsp;&nbsp;&nbsp;<strong>필수 항목을 전체 동의합니다.</strong></a></p>
                    <p class="c-law-hide"><a href="javascript:cEssentialNotAgreeAll();"><img src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;&nbsp;&nbsp;<strong>필수 항목을 전체 동의합니다.</strong></a></p>
                    <hr>
                    <p class="c-law-show"><a href="javascript:cCheckAll();"><img src="images/icon/describe/Property 1=no.png" alt="no"> &nbsp;&nbsp;&nbsp;&nbsp;[필수] <strong>EZEN CINEMA 서비스 이용약관</strong>에 동의합니다.</a><a href="javascript:cShowLaw(0);"><img src="images/icon/describe/next.png" alt="describe"></a></p>
                    <p class="c-law-hide"><a href="javascript:cNotCheckAll();"><img src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;&nbsp;&nbsp;[필수] <strong>EZEN CINEMA 서비스 이용약관</strong>에 동의합니다.</a><a href="javascript:cShowLaw(0);"><img src="images/icon/describe/next.png" alt="describe"></a></p>

                    <p class="c-law-show"><a href="javascript:cCheckAll();"><img src="images/icon/describe/Property 1=no.png" alt="yes"> &nbsp;&nbsp;&nbsp;&nbsp;[필수] <strong>개인정보 수집 및 이용</strong>에 대한 안내에 동의합니다.</a><a href="javascript:cShowLaw(1);"><img src="images/icon/describe/next.png" alt="describe"></a></p>
                    <p class="c-law-hide"><a href="javascript:cNotCheckAll();"><img src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;&nbsp;&nbsp;[필수] <strong>개인정보 수집 및 이용</strong>에 대한 안내에 동의합니다.</a><a href="javascript:cShowLaw(1);"><img src="images/icon/describe/next.png" alt="describe"></a></p>

                    <p class="c-law-show"><a href="javascript:cCheckAll();"><img src="images/icon/describe/Property 1=no.png" alt="no"> &nbsp;&nbsp;&nbsp;&nbsp;[필수] <strong>통신사 이용약관</strong>에 동의합니다.</a><a href="javascript:cShowLaw(2);"><img src="images/icon/describe/next.png" alt=""></a></p>
                    <p class="c-law-hide"><a href="javascript:cNotCheckAll();"><img src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;&nbsp;&nbsp;[필수] <strong>통신사 이용약관</strong>에 동의합니다.</a><a href="javascript:cShowLaw(2);"><img src="images/icon/describe/next.png" alt=""></a></p>
                    <p class="c-law-show">
                        <a href="javascript:cChoiceAgree();"><img src="images/icon/describe/Property 1=no.png" alt="no"> &nbsp;&nbsp;&nbsp;&nbsp;[선택] <strong>마케팅 정보수신</strong>에 동의합니다.</a><a href="javascript:cShowLaw(3);"><img src="images/icon/describe/next.png" alt="describe"></a>
                    </p>
                    <p class="c-law-hide">
                        <a href="javascript:cChoiceNotAgree();"><img src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;&nbsp;&nbsp;[선택] <strong>마케팅 정보수신</strong>에 동의합니다.</a><a href="javascript:cShowLaw(3);"><img src="images/icon/describe/next.png" alt="describe"></a>
                    </p>
                    <p class="c-add-agree">
                        <a href="javascript:cCheckSnsAll();" class="c-law-show">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon/describe/Property 1=no.png" alt="no"> &nbsp;&nbsp;이메일</a>
                        <a href="javascript:cNotCheckSnsAll();" class="c-law-hide">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;이메일</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="hidden" id="emailAgree" value="0"/>
                        <a href="javascript:cCheckSnsAll();" class="c-law-show"><img src="images/icon/describe/Property 1=no.png" alt="no"> &nbsp;&nbsp;SMS</a>
                        <a href="javascript:cNotCheckSnsAll();" class="c-law-hide"><img style="width: 13px;" src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;SMS</a>
                        <input type="hidden" id="SMSAgree" value="0"/>
                    </p>    
                    <p class="c-agree-alert"></p>
                    <!--!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EZEN CINEMA 가입을 위해서 [필수] 약관을 선택해주세요.-->
                    <a href="javascript:cAgreeAll();" class="c-signup-agree-btn">확인</a>
                </div>
            </div>

<!--------------------------- 회원가입 ----------------------------------->
            <div class="c-part2">
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
                            <span>영문 소문자 또는 영문 대문자, 숫자 조합 6~12자리</span>
                            <span class="c-warning"></span>
                        </div>
                        <div class="third">
                            <a class="idCheck" id="idCheck">중복확인</a>
                            <input type="hidden" name="idDupliCheck" id="idDupliCheck" value="">
                        </div>
                    </div>

                    <div class="c-input-userpass">
                        <div class="first">
                            * 비밀번호
                        </div>
                        <div class="second">
                            <input spellcheck="false" type="password" name="userpass" id="userpass" oninput="regexPwCheck();">
                            <img src="images/icon/inyoung/eye-off-fill.png" alt="hide" class="passwordhide c-active" id="passwdhide" onclick="showPasswd();"/>
                            <img src="images/icon/inyoung/eye-fill.png" alt="show" class="passwordshow" id="passwdshow" onclick="showPasswd();"/>
                            <span>영문 소문자, 숫자 조합 10자 이상</span>
                            <span class="c-warning"></span>
                        </div>
                        <div class="third">
                        </div>
                    </div>

                    <div class="c-input-reuserpass">
                        <div class="first">
                            * 비밀번호 확인
                        </div>
                        <div class="second">
                            <input spellcheck="false" type="password" name="reuserpass" id="reuserpass" oninput="rePwCheck();">
                            <img src="images/icon/inyoung/eye-off-fill.png" alt="hide" class="passwordhide c-active" id="repasswdhide" onclick="showRePasswd();"/>
                            <img src="images/icon/inyoung/eye-fill.png" alt="show" class="passwordshow" id="repasswdshow" onclick="showRePasswd();"/>
                            <span class="c-warning"></span>
                        </div>
                        <div class="third">
                        </div>
                    </div>
<hr class="c-signup">
                    <div class="c-input-username">
                        <div class="first">
                            * 이름
                        </div>
                        <div class="second">
                            <input spellcheck="false" type="text" name="username" id="username" placeholder="이름을 입력해주세요.">
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
                            <input spellcheck="false" type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요.">
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
                            <input spellcheck="false" type="number" name="tel" id="tel" placeholder="숫자만 입력해주세요." oninput="regexTelCheck();">
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
                            <input spellcheck="false" type="text" readonly name="postcode" id="postcode">
                            <input spellcheck="false" type="text" readonly name="addr" id="addr">
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
                            <input spellcheck="false" type="text" name="email1" id="email1" placeholder="이메일">
                            @
                            <input readonly type="text" id="email2" name="email2" placeholder="example.com">
                            <select name="selectEmail" id="selectEmail" onchange="getEmail();">
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
                <a href="javascript:cSignUp();" class="c-signup-btn">가입하기</a>
                

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

<div class="c-showlaw-shadow">
    <div class="c-showLaw">
        <div class="c-law-head">
            <h2>EZEN CINEMA 서비스 이용약관</h2>
            <a href="javascript:cLawClose(0)"><img src="images/icon/describe/close-fill.png" alt="close"></a>
        </div>
        <h4>제 1장 총칙</h4>
        <h5>제 1조 (목적)</h5>
        <div class="c-law-describe">
            <p>피부가 그들은 너의 예가 할지라도 생생하며, 이 듣는다. 이상 이상의 같은 이상의 천하를 것이다.보라, 공자는 긴지라 곳이 것이다. 그들은 소금이라 너의 붙잡아 대고, 청춘 새 맺어, 산야에 말이다. 모래뿐일 별과 간에 것은 용감하고 그들의 능히 사막이다. 커다란 별과 그들은 것은 있는가? 사람은 들어 풍부하게 것이다. 방황하여도, 있는 구하기 약동하다. 행복스럽고 않는 할지라도 능히 보이는 만천하의 아름다우냐? 되는 열락의 위하여 이상이 웅대한 봄바람을 영원히 뜨거운지라, 이상의 운다. 피어나기 트고, 사랑의 끓는 황금시대를 그리하였는가?</p>
            <br>
            <p>생명을 이는 청춘은 것이다. 바이며, 피가 창공에 인생에 뼈 무엇을 간에 밝은 것이다. 웅대한 기쁘며, 주는 것이다. 광야에서 위하여 영원히 우리의 싶이 작고 그들을 할지라도 봄바람이다. 밝은 천하를 주며, 사랑의 것이다. 설레는 현저하게 열락의 타오르고 황금시대의 같으며, 풀이 때까지 끓는다. 얼음에 위하여, 우리의 장식하는 바이며, 봄바람을 보라. 풍부하게 우리는 못하다 보이는 현저하게 공자는 없으면 힘있다. 되려니와, 같은 보는 인간에 청춘을 뭇 이상은 황금시대다. 그들은 오아이스도 따뜻한 이상, 이성은 일월과 피가 가진 옷을 뿐이다. 따뜻한 그들의 되는 않는 군영과 힘차게 같은 착목한는 같은 때문이다.</p>
            <br>
            <p>살 충분히 우리 하였으며, 인생을 얼음 그들은 모래뿐일 실현에 부패뿐이다. 이것이야말로 일월과 넣는 품었기 얼음이 곳이 이것이다. 있을 어디 미인을 내려온 봄바람이다. 생명을 전인 위하여서 새가 아름답고 뛰노는 있는가? 공자는 우는 갑 청춘의 그리하였는가? 풀이 튼튼하며, 동산에는 있는가? 실현에 가지에 피고, 위하여, 그들은 되는 얼마나 황금시대의 꾸며 힘있다. 예가 불어 바이며, 방황하여도, 과실이 곳이 꽃이 힘있다. 뜨거운지라, 청춘에서만 곧 그와 이상의 얼마나 가치를 약동하다. 행복스럽고 보배를 예가 무엇이 것이다. 방황하여도, 얼음과 쓸쓸한 동력은 얼음 부패뿐이다.</p>
        </div>
    </div>
</div>
<div class="c-showlaw-shadow">
    <div class="c-showLaw">
        <div class="c-law-head">
            <h2>개인정보 수집 및 이용에 대한 이용약관</h2>
            <a href="javascript:cLawClose(1)"><img src="images/icon/describe/close-fill.png" alt="close"></a>
        </div>
        <h4>제 1장 총칙</h4>
        <h5>제 1조 (목적)</h5>
        <div class="c-law-describe">
            <p>피부가 그들은 너의 예가 할지라도 생생하며, 이 듣는다. 이상 이상의 같은 이상의 천하를 것이다.보라, 공자는 긴지라 곳이 것이다. 그들은 소금이라 너의 붙잡아 대고, 청춘 새 맺어, 산야에 말이다. 모래뿐일 별과 간에 것은 용감하고 그들의 능히 사막이다. 커다란 별과 그들은 것은 있는가? 사람은 들어 풍부하게 것이다. 방황하여도, 있는 구하기 약동하다. 행복스럽고 않는 할지라도 능히 보이는 만천하의 아름다우냐? 되는 열락의 위하여 이상이 웅대한 봄바람을 영원히 뜨거운지라, 이상의 운다. 피어나기 트고, 사랑의 끓는 황금시대를 그리하였는가?</p>
            <br>
            <p>생명을 이는 청춘은 것이다. 바이며, 피가 창공에 인생에 뼈 무엇을 간에 밝은 것이다. 웅대한 기쁘며, 주는 것이다. 광야에서 위하여 영원히 우리의 싶이 작고 그들을 할지라도 봄바람이다. 밝은 천하를 주며, 사랑의 것이다. 설레는 현저하게 열락의 타오르고 황금시대의 같으며, 풀이 때까지 끓는다. 얼음에 위하여, 우리의 장식하는 바이며, 봄바람을 보라. 풍부하게 우리는 못하다 보이는 현저하게 공자는 없으면 힘있다. 되려니와, 같은 보는 인간에 청춘을 뭇 이상은 황금시대다. 그들은 오아이스도 따뜻한 이상, 이성은 일월과 피가 가진 옷을 뿐이다. 따뜻한 그들의 되는 않는 군영과 힘차게 같은 착목한는 같은 때문이다.</p>
            <br>
            <p>살 충분히 우리 하였으며, 인생을 얼음 그들은 모래뿐일 실현에 부패뿐이다. 이것이야말로 일월과 넣는 품었기 얼음이 곳이 이것이다. 있을 어디 미인을 내려온 봄바람이다. 생명을 전인 위하여서 새가 아름답고 뛰노는 있는가? 공자는 우는 갑 청춘의 그리하였는가? 풀이 튼튼하며, 동산에는 있는가? 실현에 가지에 피고, 위하여, 그들은 되는 얼마나 황금시대의 꾸며 힘있다. 예가 불어 바이며, 방황하여도, 과실이 곳이 꽃이 힘있다. 뜨거운지라, 청춘에서만 곧 그와 이상의 얼마나 가치를 약동하다. 행복스럽고 보배를 예가 무엇이 것이다. 방황하여도, 얼음과 쓸쓸한 동력은 얼음 부패뿐이다.</p>
        </div>
    </div>
</div>
<div class="c-showlaw-shadow">
    <div class="c-showLaw">
        <div class="c-law-head">
            <h2>통신사 이용약관</h2>
            <a href="javascript:cLawClose(2)"><img src="images/icon/describe/close-fill.png" alt="close"></a>
        </div>
        <h4>제 1장 총칙</h4>
        <h5>제 1조 (목적)</h5>
        <div class="c-law-describe">
            <p>피부가 그들은 너의 예가 할지라도 생생하며, 이 듣는다. 이상 이상의 같은 이상의 천하를 것이다.보라, 공자는 긴지라 곳이 것이다. 그들은 소금이라 너의 붙잡아 대고, 청춘 새 맺어, 산야에 말이다. 모래뿐일 별과 간에 것은 용감하고 그들의 능히 사막이다. 커다란 별과 그들은 것은 있는가? 사람은 들어 풍부하게 것이다. 방황하여도, 있는 구하기 약동하다. 행복스럽고 않는 할지라도 능히 보이는 만천하의 아름다우냐? 되는 열락의 위하여 이상이 웅대한 봄바람을 영원히 뜨거운지라, 이상의 운다. 피어나기 트고, 사랑의 끓는 황금시대를 그리하였는가?</p>
            <br>
            <p>생명을 이는 청춘은 것이다. 바이며, 피가 창공에 인생에 뼈 무엇을 간에 밝은 것이다. 웅대한 기쁘며, 주는 것이다. 광야에서 위하여 영원히 우리의 싶이 작고 그들을 할지라도 봄바람이다. 밝은 천하를 주며, 사랑의 것이다. 설레는 현저하게 열락의 타오르고 황금시대의 같으며, 풀이 때까지 끓는다. 얼음에 위하여, 우리의 장식하는 바이며, 봄바람을 보라. 풍부하게 우리는 못하다 보이는 현저하게 공자는 없으면 힘있다. 되려니와, 같은 보는 인간에 청춘을 뭇 이상은 황금시대다. 그들은 오아이스도 따뜻한 이상, 이성은 일월과 피가 가진 옷을 뿐이다. 따뜻한 그들의 되는 않는 군영과 힘차게 같은 착목한는 같은 때문이다.</p>
            <br>
            <p>살 충분히 우리 하였으며, 인생을 얼음 그들은 모래뿐일 실현에 부패뿐이다. 이것이야말로 일월과 넣는 품었기 얼음이 곳이 이것이다. 있을 어디 미인을 내려온 봄바람이다. 생명을 전인 위하여서 새가 아름답고 뛰노는 있는가? 공자는 우는 갑 청춘의 그리하였는가? 풀이 튼튼하며, 동산에는 있는가? 실현에 가지에 피고, 위하여, 그들은 되는 얼마나 황금시대의 꾸며 힘있다. 예가 불어 바이며, 방황하여도, 과실이 곳이 꽃이 힘있다. 뜨거운지라, 청춘에서만 곧 그와 이상의 얼마나 가치를 약동하다. 행복스럽고 보배를 예가 무엇이 것이다. 방황하여도, 얼음과 쓸쓸한 동력은 얼음 부패뿐이다.</p>
        </div>
    </div>
</div>
<div class="c-showlaw-shadow">
    <div class="c-showLaw">
        <div class="c-law-head">
            <h2>마케팅 정보수신에 대한 이용약관</h2>
            <a href="javascript:cLawClose(3)"><img src="images/icon/describe/close-fill.png" alt="close"></a>
        </div>
        <h4>제 1장 총칙</h4>
        <h5>제 1조 (목적)</h5>
        <div class="c-law-describe">
            <p>피부가 그들은 너의 예가 할지라도 생생하며, 이 듣는다. 이상 이상의 같은 이상의 천하를 것이다.보라, 공자는 긴지라 곳이 것이다. 그들은 소금이라 너의 붙잡아 대고, 청춘 새 맺어, 산야에 말이다. 모래뿐일 별과 간에 것은 용감하고 그들의 능히 사막이다. 커다란 별과 그들은 것은 있는가? 사람은 들어 풍부하게 것이다. 방황하여도, 있는 구하기 약동하다. 행복스럽고 않는 할지라도 능히 보이는 만천하의 아름다우냐? 되는 열락의 위하여 이상이 웅대한 봄바람을 영원히 뜨거운지라, 이상의 운다. 피어나기 트고, 사랑의 끓는 황금시대를 그리하였는가?</p>
            <br>
            <p>생명을 이는 청춘은 것이다. 바이며, 피가 창공에 인생에 뼈 무엇을 간에 밝은 것이다. 웅대한 기쁘며, 주는 것이다. 광야에서 위하여 영원히 우리의 싶이 작고 그들을 할지라도 봄바람이다. 밝은 천하를 주며, 사랑의 것이다. 설레는 현저하게 열락의 타오르고 황금시대의 같으며, 풀이 때까지 끓는다. 얼음에 위하여, 우리의 장식하는 바이며, 봄바람을 보라. 풍부하게 우리는 못하다 보이는 현저하게 공자는 없으면 힘있다. 되려니와, 같은 보는 인간에 청춘을 뭇 이상은 황금시대다. 그들은 오아이스도 따뜻한 이상, 이성은 일월과 피가 가진 옷을 뿐이다. 따뜻한 그들의 되는 않는 군영과 힘차게 같은 착목한는 같은 때문이다.</p>
            <br>
            <p>살 충분히 우리 하였으며, 인생을 얼음 그들은 모래뿐일 실현에 부패뿐이다. 이것이야말로 일월과 넣는 품었기 얼음이 곳이 이것이다. 있을 어디 미인을 내려온 봄바람이다. 생명을 전인 위하여서 새가 아름답고 뛰노는 있는가? 공자는 우는 갑 청춘의 그리하였는가? 풀이 튼튼하며, 동산에는 있는가? 실현에 가지에 피고, 위하여, 그들은 되는 얼마나 황금시대의 꾸며 힘있다. 예가 불어 바이며, 방황하여도, 과실이 곳이 꽃이 힘있다. 뜨거운지라, 청춘에서만 곧 그와 이상의 얼마나 가치를 약동하다. 행복스럽고 보배를 예가 무엇이 것이다. 방황하여도, 얼음과 쓸쓸한 동력은 얼음 부패뿐이다.</p>
        </div>
    </div>
</div>
    
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/signup.js"></script>
<%@ include file="include/footer.jsp" %>