<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <input type="text" name="userid" id="userid">
                <span>영문 소문자 또는 영문 대문자, 숫자 조합 6~12자리</span>
                <span class="c-warning"></span>
            </div>
            <div class="third">
                <a href="javascript:idDupli();" class="idCheck" id="idCheck">중복확인</a>
            </div>
        </div>

<hr class="c-signup">
        <div class="c-input-username">
            <div class="first">
                * 이름
            </div>
            <div class="second">
                <input type="text" name="username" id="username" placeholder="이름을 입력해주세요.">
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
                <input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요.">
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
                <input type="number" name="tel" id="tel" placeholder="숫자만 입력해주세요.">
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
                <input type="text" name="postcode" id="postcode">
                <input type="text" name="addr" id="addr">
                <input type="text" name="detailaddr" id="detailaddr" placeholder="상세 주소를 입력해주세요." style="margin-bottom: 0;">
                <span class="c-warning"></span>
            </div>
            <div class="third">
                <a href="javascript:idDupli();">우편번호 검색</a>
            </div>
        </div>

        <div class="c-input-email">
            <div class="first">
                * 이메일
            </div>
            <div class="second">
                <input type="text" name="email1" id="email1" placeholder="이메일">
                @
                <select name="email2" id="email2">
                    <option value="naver.com">naver.com</option>
                    <option value="naver.com">naver.com</option>
                    <option value="naver.com">naver.com</option>
                    <option value="naver.com">naver.com</option>
                </select><br>
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
                        <a href="javascript:void(0)" class="c-go-main">메인으로 이동</a>
                        <a href="javascript:void(0)" class="c-go-login" style="color: #fff">로그인하기</a>
                </div>
            </div>
        
    </div>


    <div class="c-shadow" id="c-shadow"></div>
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
<script src="js/jquery-1.12.4.min.js"></script>    
<script src="js/signup.js"></script>