<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <input type="text" name="userid" id="userid" onfocusout="regexIdCheck();">
                        <input type="hidden" id="snsid" name="snsid" value="<%=snsid%>">
                        <span>영문 소문자 또는 영문 대문자, 숫자 조합 6~12자리</span>
                        <span class="c-warning"></span>
                    </div>
                    <div class="third">
                        <a href="javascript:idDupli();" class="idCheck" id="idCheck" onfocusout="regexIdCheck();">중복확인</a>
                        <input type="hidden" name="idDupliCheck" id="idDupliCheck" value="">
                    </div>
                </div>

<hr class="c-signup">
                <div class="c-input-username">
                    <div class="first">
                        * 이름
                    </div>
                    <div class="second">
                        <input type="text" name="username" id="username" placeholder="이름을 입력해주세요." value="<%=name%>">
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
                        <input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요." value="<%=nickname%>">
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
                        <input type="number" name="tel" id="tel" placeholder="숫자만 입력해주세요." onfocusout="regexTelCheckSns();" value="<%=tel%>">
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
                        <input type="text" name="postcode" readonly id="postcode">
                        <input type="text" name="addr" readonly id="addr">
                        <input type="text" name="detailaddr" id="detailaddr" placeholder="상세 주소를 입력해주세요." style="margin-bottom: 0;">
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
                        <input readonly type="text" id="email2" name="email2" placeholder="example.com" value="<%=emailBack%>">
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