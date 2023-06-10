<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.URLEncoder, java.security.SecureRandom, java.math.BigInteger"%>
   <div class="c-shadow"></div>
    <div class="c-login">
        <h2>로그인</h2>
        <h5>EZEN CINEMA 계정으로 로그인</h5>
        <div class="c-login-userid">
            <input spellcheck="false" type="text" id="userId" class="c-userid" onfocus="idFunc()">
            <span class="move">아이디</span>
        </div>
        <div class="c-login-userpass">
            <input spellcheck="false" type="password" id="userPass" class="c-userpass" onfocus="passFunc()">
            <span class="move">비밀번호</span>
        </div>  
        <a href="#" class="c-id-not-save" style="color: #fff"><img class="c-check c-check-no" id="c-check-no" src="images/icon/describe/check.png" alt="idNo"> &nbsp;아이디 저장</a>
        <a href="#" class="c-id-save" style="color: #5c7ef7; font-weight: 500;"><img class="c-check c-check-yes" id="c-check-yes" src="images/icon/describe/Property 1=yes.png" alt="idYes"> &nbsp;아이디 저장</a>
        <input type="hidden" name="c-id-save-val" id="c-id-save-val" value="0">
        <p id="c-login-alert"></p>
        <a href="javascript:loginSubmit();" class="c-login-btn"><h3>로그인</h3></a>
        <div class="c-meminfo">
            <div>
                <a href="index.jsp?fname=mem/findId">아이디 찾기</a>
                <a href="index.jsp?fname=mem/findPw">비밀번호 찾기</a>
                <a href="/ezenCine/signup.jsp">회원가입</a>
            </div>
        </div>
        <fieldset class="c-login-fieldset">
            <legend align="center">&nbsp;&nbsp; 다른 서비스 계정으로 로그인 &nbsp;&nbsp;</legend>
            <div class="c-login-sns">
                <a href="javascript:loginWithKakao();"><img src="images/sns/login_kakao.png" alt="login_kakao"></a>
<%
    String clientId = "ybgt8eoPV5ELLhZ2LTbP";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("https://localhost:8443/ezenCine/NaverOauth", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    String Query = "";
    if(request.getQueryString() != null){
		Query = request.getQueryString();
    }
    session.setAttribute("Query", Query);
 %>                
                <a href="<%=apiURL%>"><img src="images/sns/login_naver.png" alt="login_naver"></a>
                
                <div id="g_id_onload"
			         data-client_id="523081570143-oanpb57bceggc2v5jnqgf13dc5u86laj.apps.googleusercontent.com"
			         data-login_uri="https://localhost:8443/ezenCine/GoogleOauth"
			         data-ux_mode="redirect"
			         data-auto_prompt="false">
			      </div>
			      <div class="g_id_signin"
			         data-type="icon"
			         data-theme="outline"
			         data-size="medium"
			         data-shape="circle"
			         data-width=16
			         >
			      </div>
            </div>
        </fieldset>
    </div>    
    
    
    
<footer>
    <div class="container">
        <div class="footer-top d-flex">
            <div class="footer-logobox">
                <a href="/ezenCine"><img src="images/logo/footerlogo.png" alt="footer-logo"></a>
            </div>
            <ul class="f-text d-flex">
                <li><a href="javascript:void(0)">회사소개</a></li>
                <li><a href="javascript:void(0)">인재채용</a></li>
                <li><a href="javascript:void(0)">사회공헌</a></li>
                <li><a href="javascript:void(0)">제휴/광고문의</a></li>
                <li><a href="javascript:void(0)">이용약관</a></li>
                <li><a href="javascript:void(0)">위치기반서비스 이용약관</a></li>
                <li><a href="javascript:void(0)"><strong>개인정보처리방침</strong></a></li>
                <li><a href="javascript:void(0)">윤리경영</a></li>
                <li><a href="javascript:void(0)">지속가능경영</a></li>
            </ul>
        </div>
        <div class="footer-bottom">
            <address>
                경기 김포시 김포한강4로 125 월드타워 8층, 10층
            </address>
            <span class="bar">고객센터 0000-0000</span>
            <br>
            <span>대표자 : 서택상</span>
            <span class="bar">사업자 등록번호 000-00-00000</span>
            <span class="bar">통신판매업신고번호 제0000호</span>
            <span class="bar">개인정보보호 책임자 : 서택상</span>
            <br>
            <span>COPYRIGHT&copy; EZEN CINEMA ALL RIGHT RESERVED.</span>
        </div>
    </div>
    <input type="hidden" name="url" id="url" />
</footer>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>


<script src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/dayjs.min.js"></script>
<script src="js/script.js"></script>

</body>
</html>