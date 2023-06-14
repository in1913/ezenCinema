<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="c-find-container">
    <h1 class="c-text-center">아이디 찾기</h1>
    <div class="c-findidInfo">
        <div class="c-input-username">
            <div class="first">
                이름
            </div>
            <div class="second">
                <input spellcheck="false" type="text" name="username" id="username" placeholder="이름을 입력해주세요." oninput="cFindIdCheck();">
            </div>
        </div>
        <div class="c-input-username">
            <div class="first">
                이메일
            </div>
            <div class="second">
                <input spellcheck="false" type="text" name="useremail" id="useremail" placeholder="회원 이메일을 입력해주세요." oninput="cFindIdCheck();">
            </div>
        </div>
    </div>
    <div class="c-findidpw-btnbox">
        <a href="index.jsp?fname=mem/findPw" class="c-find-first-btn">비밀번호 찾기</a>
        <a class="c-find-second-btn">아이디 찾기</a>
    </div>
</div>


<div class="c-find-idpw-popup" id="c-find-idpw-popup">
    <p id="idpw-popup-alert"></p>
    <a href="javascript:cFindIdPwClose();" class="c-find-idpw-popup-close-btn">확인</a>
</div>