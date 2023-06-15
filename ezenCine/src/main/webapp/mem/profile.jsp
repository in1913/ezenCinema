<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, ezenCine.*"%>
<%
	String userid = (String) session.getAttribute("userid");
	Vector <MemberDTO> mld = MemberDDL.select(userid);
	
	for(MemberDTO ml : mld){
%>
<div class="c-profile-background">
<div class="c-profile-container">
    <h1>내 정보  수정</h1>
    <div class="c-profile-photo">
        <div class="first">
            사진
        </div>
        <div class="second">
            <div class="c-profile-user-img">
<%
	if(ml.getPhoto() == null){
%>
	           <img src="images/icon/user/user.png" alt="user" id="c-profile-user-img">
               <input type="hidden" name="isBasicPhoto" id="isBasicPhoto" value="1">
<%		
	}else {
%>
                <img src="/ezenCine/ShowMemPhoto" alt="user" id="c-profile-user-img">
                <input type="hidden" name="isBasicPhoto" id="isBasicPhoto" value="0">
<%		
	}
%>            
                
            </div>
        </div>
        <div class="third">
            <a href="javascript:cProfileShow(0);" class="c-profile-btn">사진 변경</a>
        </div>
    </div>

    <div class="c-profile-userid">
        <div class="first">
            아이디
        </div>
        <div class="second">
            <%=userid %>
        </div>
        <div class="third">
            
        </div>
    </div>
<%
	if(ml.getPassword() == null){	
	}else{
%>
    <div class="c-profile-userpass">
        <div class="first">
            비밀번호
        </div>
        <div class="second userpass-length">
<%
			int len = 0;
			String star = ""; 
			len = ml.getPassword().length();
			for(int i = 0; i < len; i++){
				star += "*";	
			}
%>        
            <%=star %>
        </div>
        <div class="third">
            <a href="javascript:cProfileShow(1);" class="c-profile-btn">비밀번호 변경</a>
        </div>
    </div>
<%
	}
%>    
    <div class="c-profile-username">
        <div class="first">
            이름
        </div>
        <div class="second" id="c-profile-show-username">
            <%=ml.getUsername() %>
        </div>
   		<div class="third">
            <a href="javascript:cProfileShow(2);" class="c-profile-btn">이름 변경</a>
        </div>
    </div>
    <div class="c-profile-nickname">
        <div class="first">
            닉네임
        </div>
        <div class="second" id="c-profile-show-nickname">
            <%=ml.getNickname() %>
        </div>
        <div class="third">
            <a href="javascript:cProfileShow(3);" class="c-profile-btn">닉네임 변경</a>
        </div>
    </div>
    <div class="c-profile-email">
        <div class="first">
            이메일
        </div>
        <div class="second" id="c-profile-show-useremail">
            <%=ml.getEmail() %>
        </div>
        <div class="third">
            <a href="javascript:cProfileShow(4);" class="c-profile-btn">이메일 변경</a>
        </div>
    </div>
    <div class="c-profile-tel">
        <div class="first">
            전화번호
        </div>
        <div class="second" id="c-profile-show-tel">
<%
	String tel = ml.getTel();
	if(tel.length() == 12){
		tel = tel.substring(0, 3) + "-***-" + tel.substring(8);
		
	}else if(tel.length() == 13){
		tel = tel.substring(0, 3) + "-****-" + tel.substring(9);
	}
%>        
            <%=tel %>
        </div>
        <div class="third">
            <a href="javascript:cProfileShow(5);" class="c-profile-btn">전화번호 변경</a>
        </div>
    </div>
    <div class="c-profile-postcode">
        <div class="first">
            주소
        </div>
        <div class="second">
            <input type="text" name="postcode" id="postcode" readonly spellcheck="false" value="<%=ml.getPostcode()%>">
        </div>
        <div class="third">
            <a href="javascript:sDaumPostcode();" class="c-profile-btn">주소 변경</a>
        </div>
    </div>
    <div class="c-profile-addr">
        <div class="first">
            
        </div>
        <div class="second">
            
            <input type="text" name="addr" id="addr" readonly  spellcheck="false" value="<%=ml.getAddress()%>">
            
        </div>
        <div class="third">
            
        </div>
    </div>
    <div class="c-profile-detailaddr">
        <div class="first">

        </div>
        <div class="second">
            
            <input type="text" name="detailaddr" id="detailaddr" placeholder="상세주소를 입력해주세요."  spellcheck="false" value="<%=ml.getDetail_address()%>">
        </div>
        <div class="third">
            
        </div>
    </div>
    <div class="c-profile-receive">
        <div class="first">
            정보 수신
        </div>
        <div class="second">
<%
	if(ml.getEmail_agree() == 0){
%>		
		<a href="javascript:cProfileEmailCheck();" class="c-profile-law-show c-profile-active">&nbsp;&nbsp;<img src="images/icon/describe/Property 1=no.png" alt="no"> &nbsp;&nbsp;이메일</a>
        <a href="javascript:cProfileEmailNotCheck();" class="c-profile-law-hide">&nbsp;&nbsp;<img src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;이메일</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="hidden" id="emailAgree" value="0"/>        
<%        	
	}else{
%>
		<a href="javascript:cProfileEmailCheck();" class="c-profile-law-show">&nbsp;&nbsp;<img src="images/icon/describe/Property 1=no.png" alt="no"> &nbsp;&nbsp;이메일</a>
        <a href="javascript:cProfileEmailNotCheck();" class="c-profile-law-hide c-profile-active">&nbsp;&nbsp;<img src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;이메일</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="hidden" id="emailAgree" value="1"/>
<%			
	}
	if(ml.getSms_agree() == 0){
%>
		<a href="javascript:cProfileSMSCheck();" class="c-profile-law-show c-profile-active"><img src="images/icon/describe/Property 1=no.png" alt="no"> &nbsp;&nbsp;SMS</a>
        <a href="javascript:cProfileSMSNotCheck();" class="c-profile-law-hide"><img src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;SMS</a>
        <input type="hidden" id="SMSAgree" value="0"/>            

<%		
	}else{
%>
		<a href="javascript:cProfileSMSCheck();" class="c-profile-law-show"><img src="images/icon/describe/Property 1=no.png" alt="no"> &nbsp;&nbsp;SMS</a>
        <a href="javascript:cProfileSMSNotCheck();" class="c-profile-law-hide c-profile-active"><img src="images/icon/describe/Property 1=yes.png" alt="yes"> &nbsp;&nbsp;SMS</a>
        <input type="hidden" id="SMSAgree" value="1"/>            

<%		
	}
%>

        </div>
        <div class="third">
            <a href="javascript:cProfileShow(7);" class="c-profile-law-show-btn">약관 보기 ></a>
        </div>
    </div>
    <div class="c-profile-submit-box">
        <div class="first">

        </div>
        <div class="second">
            <a href="javascript:history.back();" class="c-profile-reset-btn">취소</a>
            <a href="javascript:cProfileSubmit();" class="c-profile-submit-btn">수정 완료</a>
        </div>
    </div>
</div>
</div>

<!-- 사진 팝업 -->
<div class="c-profile-shadow-photo c-profile-shadow">
    <div class="c-profile-popup">
        <h2>프로필 사진 변경</h2>
        <div class="c-profile-popup-content">
            <div class="c-profile-popup-img">
<%
	if(ml.getPhoto() == null){
%>
	
                <img src="images/icon/user/user.png" alt="user-img" id="c-profile-popup-user-img">
<%		
		
	}else{
%>
                <img src="/ezenCine/ShowMemPhoto" alt="user-img" id="c-profile-popup-user-img">
<%		
		
	}
%>            
     
            </div>
            <div class="c-profile-popup-text">
                <p>회원님의 프로필 사진을 등록해주세요.</p>
                <div class="c-profile-photo-btn">
                    <a href="javascript:cProfileBasicPhoto();" class="c-profile-origin-photo-btn">기본 이미지로 변경</a>
                    <a href="javascript:cProfileModiPhoto();" class="c-profile-modi-photo-btn">사진 변경</a>
                    <input type="file" name="c-profile-get-photo" id="c-profile-get-photo" onchange="cProfileShowUserPhoto();" accept="images/*">
                </div>
            </div>
        </div>
        <div class="c-profile-popup-photo-btnbox">
            <a href="javascript:cProfilePopupCancel(0);" class="c-profile-popup-photo-reset-btn">취소</a>
            <a href="javascript:cProfilePopupModi(0);" class="c-profile-popup-photo-submit-btn">수정 완료</a>
        </div>
    </div>
</div>
<!-- 비번 팝업 -->
<div class="c-profile-shadow-userpass c-profile-shadow">
    <div class="c-profile-popup">
        <h2>비밀번호 변경</h2>
        <div class="c-profile-popup-content">
            <div class="c-profile-current-userpass">
                <div class="first">
                    현재 비밀번호
                </div>
                <div class="second">
                    <input spellcheck="false" type="password" name="curuserpass" id="curuserpass" placeholder="현재 비밀번호를 입력해주세요." oninput="regexCurPwCheck();"><br>
                    <img src="images/icon/inyoung/eye-off-fill.png" alt="hide" class="passwordhide c-active" id="curpasswdhide" onclick="showCurPasswd();"/>
                  <img src="images/icon/inyoung/eye-fill.png" alt="show" class="passwordshow" id="curpasswdshow" onclick="showCurPasswd();"/>
                  <span class="c-warning"></span>
              </div>
          </div>
          <div class="c-profile-new-userpass">
              <div class="first">
                  새 비밀번호
              </div>
              <div class="second">
                  <input spellcheck="false" type="password" name="userpass" id="userpass" placeholder="새 비밀번호를 입력해주세요." oninput="regexPwCheck();"><br>
                  <img src="images/icon/inyoung/eye-off-fill.png" alt="hide" class="passwordhide c-active" id="passwdhide" onclick="showPasswd();"/>
                  <img src="images/icon/inyoung/eye-fill.png" alt="show" class="passwordshow" id="passwdshow" onclick="showPasswd();"/>
                  <span>영문 소문자, 숫자 조합 10자 이상</span>
                  <span class="c-warning"></span>
              </div>
          </div>
          <div class="c-profile-new-reuserpass">
              <div class="first">
                  새 비밀번호 확인
              </div>
              <div class="second">
                  <input spellcheck="false" type="password" name="reuserpass" id="reuserpass" placeholder="새 비밀번호를 확인해주세요." oninput="regexRePwCheck();"><br>
                  <img src="images/icon/inyoung/eye-off-fill.png" alt="hide" class="passwordhide c-active" id="repasswdhide" onclick="showRePasswd();"/>
                  <img src="images/icon/inyoung/eye-fill.png" alt="show" class="passwordshow" id="repasswdshow" onclick="showRePasswd();"/>
                    <span class="c-warning"></span>
                </div>
            </div>
        </div>
        <div class="c-profile-popup-photo-btnbox">
            <a href="javascript:cProfilePopupCancel(1);" class="c-profile-popup-photo-reset-btn">취소</a>
            <a href="javascript:cProfilePopupModi(1);" class="c-profile-popup-photo-submit-btn">수정 완료</a>
        </div>
    </div>
</div>
<!-- 이름 팝업 -->
<div class="c-profile-shadow-username c-profile-shadow">
    <div class="c-profile-popup">
        <h2>이름 변경</h2>
        <div class="c-profile-popup-content">
            <div class="first">
                이름
            </div>
            <div class="second">
                <input spellcheck="false" type="text" name="username" id="username" placeholder="이름을 입력해주세요." value="<%=ml.getUsername()%>">
            </div>
        </div>
        <div class="c-profile-popup-photo-btnbox">
            <a href="javascript:cProfilePopupCancel(2);" class="c-profile-popup-photo-reset-btn">취소</a>
            <a href="javascript:cProfilePopupModi(2);" class="c-profile-popup-photo-submit-btn">수정 완료</a>
        </div>
    </div>
</div>
<!-- 닉네임 팝업 -->
<div class="c-profile-shadow-nickname c-profile-shadow">
    <div class="c-profile-popup">
        <h2>닉네임 변경</h2>
        <div class="c-profile-popup-content">
            <div class="first">
                닉네임
            </div>
            <div class="second">
                <input spellcheck="false" type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요." value="<%=ml.getNickname()%>">
            </div>
        </div>
        <div class="c-profile-popup-photo-btnbox">
            <a href="javascript:cProfilePopupCancel(3);" class="c-profile-popup-photo-reset-btn">취소</a>
            <a href="javascript:cProfilePopupModi(3);" class="c-profile-popup-photo-submit-btn">수정 완료</a>
        </div>
    </div>
</div>
<!-- 이메일 팝업 -->
<div class="c-profile-shadow-useremail c-profile-shadow">
    <div class="c-profile-popup">
        <h2>이메일 변경</h2>
        <div class="c-profile-popup-content">
            <div class="first">
                이메일
            </div>
            <div class="second">
<%
    String[] emailArr = ml.getEmail().split("@");
    String emailFront = emailArr[0];
    String emailBack = emailArr[1];
%>                
                <input spellcheck="false" type="text" name="useremail" id="email1" value="<%=emailFront%>">
                @
                <input spellcheck="false" readonly type="text" name="useremail" id="email2" placeholder="example.com" value="<%=emailBack%>">
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
                
            </div>
        </div>
        <div class="c-profile-popup-photo-btnbox">
            <a href="javascript:cProfilePopupCancel(4);" class="c-profile-popup-photo-reset-btn">취소</a>
            <a href="javascript:cProfilePopupModi(4);" class="c-profile-popup-photo-submit-btn">수정 완료</a>
        </div>
    </div>
</div>
<!-- 전화번호 팝업 -->
<div class="c-profile-shadow-tel c-profile-shadow">
    <div class="c-profile-popup">
        <h2>전화번호 변경</h2>
        <div class="c-profile-popup-content">
            <div class="first">
                전화번호
            </div>
            <div class="second">
<%
    String originTel = ml.getTel();
    if(originTel.length() == 12){
        originTel = originTel.substring(0,3) + originTel.substring(4,7) + originTel.substring(8);
    }else if(originTel.length() == 13){
        originTel = originTel.substring(0,3) + originTel.substring(4,8) + originTel.substring(9);
    }
%>                
                <input spellcheck="false" type="number" name="tel" id="tel" placeholder="숫자만 입력해주세요." oninput="regexProfileTelCheck();" value="<%=originTel%>"><br>
                <span class="c-warning"></span>
            </div>
        </div>
        <div class="c-profile-popup-photo-btnbox">
            <a href="javascript:cProfilePopupCancel(5);" class="c-profile-popup-photo-reset-btn">취소</a>
            <a href="javascript:cProfilePopupModi(5);" class="c-profile-popup-photo-submit-btn">수정 완료</a>
        </div>
    </div>
</div>

<!-- 완료 알림 팝업 -->
<div class="c-profile-shadow-complete c-profile-shadow">
    <div class="c-profile-popup">
        <h2 class="c-text-center">알림</h2>
        <h1 class="c-text-center c-profile-submit-alert"></h1>
        <a href="javascript:cProfilePopupCancel(6);" class="c-profile-complete-btn">확인</a>
    </div>
</div>

<!-- 약관 보기 팝업 -->
<div class="c-profile-shadow-law c-profile-shadow">
    <div class="c-profile-popup">
        <h3>마케팅 정보 수신에 대한 이용 약관</h3>
        <h4>제 1장 총칙</h4>
        <h5>제 1조(목적)</h5>
        <div class="c-profile-popup-content">
			<p>
				그들의 내는 그러므로 길을 가치를 이것이다. 풀밭에 무엇을 있는 이성은 몸이 봄바람이다. 있는 찾아다녀도, 천하를 끓는다. 싸인 풀밭에 청춘에서만 있는 그들을 몸이 그들은 주는 내려온 보라. 이상의 피가 앞이 되는 꽃이 갑 대중을 사랑의 있으랴? 위하여 인생을 그들의 어디 봄바람이다. 새 가장 날카로우나 그들은 크고 아니다. 역사를 이것을 살 있는 물방아 쓸쓸하랴? 사랑의 소금이라 황금시대를 소리다.이것은 행복스럽고 할지니, 이것이다.
			</p>
			<p>
				광야에서 생명을 실현에 황금시대다. 목숨이 것이다.보라, 가는 몸이 속에 그들에게 인생에 사막이다. 투명하되 그들의 평화스러운 있다. 피고, 끝에 피고 가슴에 피다. 인간은 청춘은 인간에 얼마나 든 봄바람이다. 품으며, 사랑의 길지 같으며, 거선의 자신과 그리하였는가? 이상 물방아 놀이 희망의 천자만홍이 뜨고, 되는 우리 봄바람이다. 못할 것은 길지 얼마나 인생을 듣기만 주는 따뜻한 있는가? 내는 위하여서, 가지에 시들어 길지 이것이다.
			</p>
			<p>
				주며, 위하여 사라지지 사람은 사랑의 것이다. 끝까지 수 설레는 대중을 찾아다녀도, 가지에 것이다. 꽃 끝에 같은 살 두기 끝까지 피다. 가치를 뜨고, 피어나기 그들은 것은 품으며, 황금시대를 못할 주며, 것이다. 따뜻한 얼음 길지 품었기 얼마나 열락의 하는 굳세게 심장의 말이다. 너의 얼마나 온갖 없으면, 그들은 싹이 우리는 꽃 길을 있는가? 품었기 동력은 그것을 얼마나 불러 품고 것이다. 이상의 많이 우리 장식하는 새가 이상 위하여서, 아니다. 노래하며 생생하며, 그들은 있을 그것은 목숨을 설레는 칼이다. 뼈 피가 아름답고 것이다.
			</p>
		</div>
        <a href="javascript:cProfilePopupCancel(7);" class="c-profile-complete-btn">확인</a>
    </div>
</div>
<input type="hidden" name="originPhoto" id="originPhoto" value="<%=ml.getPhoto() %>" />
<input type="hidden" name="originUsername" id="originUsername" value="<%=ml.getUsername()%>">
<input type="hidden" name="originNickname" id="originNickname" value="<%=ml.getNickname()%>">
<input type="hidden" name="originEmail1" id="originEmail1" value="<%=emailFront%>">
<input type="hidden" name="originEmail2" id="originEmail2" value="<%=emailBack%>">
<input type="hidden" name="originTel" id="originTel" value="<%=originTel%>">
<%
	}
%>

