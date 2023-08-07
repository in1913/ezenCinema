<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="c-find-container">
    <h1 class="c-text-center">비밀번호 찾기</h1>
    <div class="c-findpwInfo">
        <div class="c-input-userid">
            <div class="first">
                회원 아이디
            </div>
            <div class="second">
                <input spellcheck="false" type="text" name="userid" id="userid" placeholder="아이디를 입력해주세요." oninput="cFindPwCheck();">
            </div>
        </div>
        <div class="c-input-useremail">
            <div class="first">
                회원 이메일
            </div>
            <div class="second">
                <input spellcheck="false" type="text" name="useremail" id="useremail" placeholder="회원정보에 입력된 이메일 주소를 입력해주세요." oninput="cFindPwCheck();">
            </div>
        </div>
        <div class="c-oauth-d-none">
            <div class="c-input-oauth">
                <div class="first">
                    인증번호
                </div>
                <div class="second">
                    <input spellcheck="false" type="text" name="oauthnum" id="oauthnum" placeholder="인증번호를 입력해주세요." oninput="cOauthCheck();">
                    <span class="c-find-time" id="c-find-time"></span>
                    <span class="c-warning"></span>
                </div>
                <div class="third">
                    <a class="c-find-pw-oauth-btn">인증확인</a>
                </div>
            </div>
        </div>
        <div class="c-userpass-d-none">
            <div class="c-input-userpass"> 
                <div class="first">
                    비밀번호
                </div>
                <div class="second">
                    <input spellcheck="false" type="password" name="userpass" id="userpass" placeholder="변경할 비밀번호를 입력해주세요." oninput="regexFindPwCheck();">
                    <span class="c-find-info">영문 소문자, 숫자 조합 10자 이상</span>
                    <span class="c-warning"></span>
                </div>
            </div>
            <div class="c-input-reuserpass">
                <div class="first">
                    비밀번호 확인
                </div>
                <div class="second">
                    <input spellcheck="false" type="password" name="reuserpass" id="reuserpass" placeholder="비밀번호를 확인해주세요." oninput="reFindPwCheck();">
                    <span class="c-warning"></span>
                </div>    
            </div>
        </div>
    </div>
    <div class="c-findidpw-btnbox">
        <a href="index.jsp?fname=mem/findId" class="c-find-first-btn">아이디 찾기</a>
        <a class="c-find-second-btn">비밀번호 찾기</a>
    </div>
</div>

<div class="c-find-idpw-popup" id="c-find-idpw-popup">
    <p id="idpw-popup-alert"></p>
    <a href="javascript:cFindIdPwClose();" class="c-find-idpw-popup-close-btn">확인</a>
</div>