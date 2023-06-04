$(function(){
    // header 내비게이션 작동
    $(".gnb>li").hover(function(){
        $(this).find(".lnb").stop().fadeToggle(300);
        $("header.fixed>.subdp").stop().fadeToggle(300);
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
})
/****************************** login & signup *****************************************/
$(document).ready(function(){
    if(getCookies("user")){
        let userid = document.getElementById("userId");
        let idSave = document.getElementById("c-id-save-val");
        document.getElementsByClassName("c-id-not-save")[0].style.display = "none";
        document.getElementsByClassName("c-id-save")[0].style.display = "inline-block";
        $(".c-login-userid .move").css({
            fontSize: "1px",
            transition : "0.3s",
            top: "3px",
        });
        $(".c-login-userid input").css({
            border: "2px solid #5c7ef7",
            transition : "0.3s",
        })
        userid.value = getCookies("user");
        idSave.value = 1;
    }
})
function showLoginPopup(){
    const loginPopup = document.getElementsByClassName("c-login")[0];
    const shadow = document.getElementsByClassName("c-shadow")[0];
    loginPopup.style.display = "block";
    shadow.style.display = "block";
    google.accounts.id.initialize({
        client_id: "523081570143-oanpb57bceggc2v5jnqgf13dc5u86laj.apps.googleusercontent.com",
        ux_mode: "redirect",
        login_uri : "http://localhost:8080/ezenCine/GoogleOauth"
    });
    google.accounts.id.renderButton(document.getElementById("googleBtn"),
    { 
        type : "icon", 
        theme: "outline",
        size : "medium",
        shape: "circle"
    }  // customization attributes
    );
    google.accounts.id.prompt(); // also display the One Tap dialog
}


$(function(){
    $(".c-login-userid").mouseleave(function(){
        const userid = document.getElementById("userId").value;
        // 값이 없으면
        if(userid == ""){
            $(".c-login-userid .move").css({
                fontSize: "14px",
                transition : "0.3s",
                top: "25%",
            });
            $(".c-login-userid input").css({
                border: "2px solid #ccc",
                transition : "0.3s",
            })
            $(".c-login-userid input").blur();
        // 값이 있으면
        }else{
            
        }
    })

    $(".c-login-userpass").mouseleave(function(){
        const userpass = document.getElementById("userPass").value;
        // 값이 없으면
        if(userpass == ""){
            $(".c-login-userpass .move").css({
                fontSize: "14px",
                transition : "0.3s",
                top: "20%",
            });
            $(".c-login-userpass input").css({
                border: "2px solid #ccc",
                transition : "0.3s",
            })
            $(".c-login-userpass input").blur();
        // 값이 있으면
        }else{
        }
    })

    // 아이디 저장 
    $(".c-id-not-save").click(function(){
        document.getElementsByClassName("c-id-not-save")[0].style.display = "none";
        document.getElementsByClassName("c-id-save")[0].style.display = "inline-block";
        let idSave = document.getElementById("c-id-save-val");
        idSave.value = 1;
    })
    $(".c-id-save").click(function(){
        document.getElementsByClassName("c-id-not-save")[0].style.display = "inline-block";
        document.getElementsByClassName("c-id-save")[0].style.display = "none";
        let idSave = document.getElementById("c-id-save-val");
        idSave.value = 0;
    })

    // 배경 선택시 팝업 종료
    $(".c-shadow").click(function(){
        const loginPopup = document.getElementsByClassName("c-login")[0];
        const shadow = document.getElementsByClassName("c-shadow")[0];
        loginPopup.style.display = "none";
        shadow.style.display = "none";
    })


    $(".c-law-hide:eq(1)>a:eq(0)").click(function(){
        const clickAgree = document.getElementsByClassName("c-law-show")[1];
        const clickNotAgree = document.getElementsByClassName("c-law-hide")[1];
        clickAgree.style.display = "flex";
        clickNotAgree.style.display = "none";
    })
    $(".c-law-hide:eq(2)>a:eq(0)").click(function(){
        const clickAgree = document.getElementsByClassName("c-law-show")[2];
        const clickNotAgree = document.getElementsByClassName("c-law-hide")[2];
        clickAgree.style.display = "flex";
        clickNotAgree.style.display = "none";
    })
    $(".c-law-hide:eq(3)>a:eq(0)").click(function(){
        const clickAgree = document.getElementsByClassName("c-law-show")[3];
        const clickNotAgree = document.getElementsByClassName("c-law-hide")[3];
        clickAgree.style.display = "flex";
        clickNotAgree.style.display = "none";
    })
    
    $(".c-law-show:eq(1)>a:eq(0)").click(function(){
        const clickAgree = document.getElementsByClassName("c-law-show")[1];
        const clickNotAgree = document.getElementsByClassName("c-law-hide")[1];
        clickAgree.style.display = "none";
        clickNotAgree.style.display = "flex";
    })
    $(".c-law-show:eq(2)>a:eq(0)").click(function(){
        const clickAgree = document.getElementsByClassName("c-law-show")[2];
        const clickNotAgree = document.getElementsByClassName("c-law-hide")[2];
        clickAgree.style.display = "none";
        clickNotAgree.style.display = "flex";
    })
    $(".c-law-show:eq(3)>a:eq(0)").click(function(){
        const clickAgree = document.getElementsByClassName("c-law-show")[3];
        const clickNotAgree = document.getElementsByClassName("c-law-hide")[3];
        clickAgree.style.display = "none";
        clickNotAgree.style.display = "flex";
    })

    $(".c-law-hide:eq(5)").click(function(){
        const clickAgree = document.getElementsByClassName("c-law-show")[5];
        const clickNotAgree = document.getElementsByClassName("c-law-hide")[5];
        clickAgree.style.display = "inline-block";
        clickNotAgree.style.display = "none";
    })
    
    $(".c-law-hide:eq(6)").click(function(){
        const clickAgree = document.getElementsByClassName("c-law-show")[6];
        const clickNotAgree = document.getElementsByClassName("c-law-hide")[6];
        clickAgree.style.display = "inline-block";
        clickNotAgree.style.display = "none";
    })
    
    $(".c-law-show:eq(5)").click(function(){
        const clickAgree = document.getElementsByClassName("c-law-show")[5];
        const clickNotAgree = document.getElementsByClassName("c-law-hide")[5];
        clickAgree.style.display = "none";
        clickNotAgree.style.display = "inline-block";
    })
    $(".c-law-show:eq(6)").click(function(){
        const clickAgree = document.getElementsByClassName("c-law-show")[6];
        const clickNotAgree = document.getElementsByClassName("c-law-hide")[6];
        clickAgree.style.display = "none";
        clickNotAgree.style.display = "inline-block";
    })
    
    
    $(".c-law-show:eq(4)").click(function(){
    	document.getElementById("emailAgree").value = "1";
    	document.getElementById("SMSAgree").value = "1";
    })
    $(".c-law-show:eq(5)").click(function(){
    	document.getElementById("emailAgree").value = "1";
    })
    $(".c-law-show:eq(6)").click(function(){
    	document.getElementById("SMSAgree").value = "1";
    })
    $(".c-law-hide:eq(4)").click(function(){
    	document.getElementById("emailAgree").value = "0";
    	document.getElementById("SMSAgree").value = "0";
    })
    $(".c-law-hide:eq(5)").click(function(){
    	document.getElementById("emailAgree").value = "0";
    })
    $(".c-law-hide:eq(6)").click(function(){
    	document.getElementById("SMSAgree").value = "0";
    })
	
})

function getEmail(){
    let email2 = document.getElementById("email2");
    const selectEmail = document.getElementById("selectEmail");
    if(selectEmail.value == "direct"){
        email2.value = "";
        email2.readOnly = false;
    }else if(selectEmail.value != ""){
        email2.value = selectEmail.value;
        email2.readOnly = true;
    }
}

function idFunc(){
    $(".c-login-userid .move").css({
        fontSize: "1px",
        transition : "0.3s",
        top: "3px",
    });
    $(".c-login-userid input").css({
        border: "2px solid #5c7ef7",
        transition : "0.3s",
    })
}




function passFunc(){
    $(".c-login-userpass .move").css({
        fontSize: "1px",
        transition : "0.3s",
        top: "3px",
    });
    $(".c-login-userpass input").css({
        border: "2px solid #5c7ef7",
        transition : "0.3s",
    })
}

/********* Cookie!!! *********** */
function setCookie(cname, value, days){
	let exdate = new Date();
	exdate.setDate(exdate.getDate() + days); // 쿠키만료까지의 기간
	let cookie_value = escape(value) + ((days == null)? "" : "; expires=" + exdate.toUTCString());
	document.cookie = cname + "=" + cookie_value;
}
// 쿠키등록 setCookie("user", 아이디, "3")

function getCookies(cname){
    let x, y;
    let val = document.cookie.split(";");
    for(let i = 0; i < val.length ; i++){
        x = val[i].substr(0, val[i].indexOf("="));
        y = val[i].substr(val[i].indexOf("=") + 1);
        // 앞뒤 공백 제거 정규식
        x = x.replace(/^\s+|\s+$/g, '')   // x.replace(" ", "");
        if(x == cname){
            return unescape(y);  // unescape로 디코딩 한 후 리턴
        }
    }
}

function delCookie(cname){
	document.cookie = cname + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}





// 로그인 제출
function loginSubmit(){
    const userid = document.getElementById("userId");
    const userpass = document.getElementById("userPass");
    let idSave = document.getElementById("c-id-save-val");
    const alert = document.getElementById("c-login-alert");
    if(userid.value == "" || userid.value == null){
        alert.style.color = "red";
        alert.innerHTML = "아이디를 입력해주세요.";
    }else if(userpass.value == "" || userpass.value == null){
        alert.style.color = "red";
        alert.innerHTML = "비밀번호를 입력해주세요.";
    }else{
        alert.innerHTML = "";
    }
    if(idSave.value == 1){
		setCookie('user', userid.value, '3');
	}else{
		delCookie('user');
	}
    fetch("/ezenCine/Login", {
        headers : {"Content-Type" : "Application/json"},
        method : "post",
        body : JSON.stringify({
            userid : userid.value, userpass : userpass.value
        })
        }).then((res) => res.json())
        .then((result) =>{
            if(result == 1){      
                if(window.location.href.includes("signup")){
                    location.href = "http://localhost:8080/ezenCine";
                }else{
                    location.reload();
                }
                
            }else{
                alert.style.color = "red";
                alert.innerHTML = "아이디 또는 비밀번호를 잘못 입력했습니다. <br> 입력하신 내용을 다시 확인해주세요.";
            }
        })
}



function cLogout(){
    fetch("/ezenCine/Logout", {
        headers: {"Content-Type" : "application/json"},
        method : "get"
    }).then((res) => res.json())
    .then((result) => {
        if(result == 1){
            location.reload();
        }
        
    })
}
/************************************* sns 로그인 ************************************** */
// 카카오 로그인
function loginWithKakao() {
	Kakao.init('a3c2f415c4d6b740c5c1a27c6b37158f'); // 사용하려는 앱의 JavaScript 키 입력
    Kakao.Auth.authorize({
        redirectUri: 'http://localhost:8080/ezenCine/KakaoOauth',
        scope: 'account_email'
    });
    Kakao.Auth.setAccessToken(token);
}

// 네이버 로그인


// 구글 로그인
/*
window.onload = function () {
    google.accounts.id.initialize({
        client_id: "523081570143-oanpb57bceggc2v5jnqgf13dc5u86laj.apps.googleusercontent.com",
        ux_mode: "redirect",
        login_uri : "http://localhost:8080/ezenCine/GoogleOauth"
    });
    google.accounts.id.renderButton(document.getElementById("googleBtn"),
    { 
        type : "icon", 
        theme: "outline",
        size : "medium",
        shape: "circle"
    }  // customization attributes
    );
  google.accounts.id.prompt(); // also display the One Tap dialog
}
*/
window.onload = function(){
    document.getElementById("url").value = window.location.href;
}




/* *********** 약관동의 *********** */
function cShowLaw(n){
    const shadow = document.getElementById("c-shadow");
    const lawPopup = document.getElementsByClassName("c-showLaw")[n];
    shadow.style.display = "block";
    lawPopup.style.display = "block";
}
function cLawClose(n){
    const shadow = document.getElementById("c-shadow");
    const lawPopup = document.getElementsByClassName("c-showLaw")[n];
    shadow.style.display = "none";
    lawPopup.style.display = "none";
}
function cCheckAll(){
    const clickNotAgree = document.getElementsByClassName("c-law-hide");
    if(clickNotAgree[1].style.display == "flex" 
    && clickNotAgree[2].style.display == "flex" 
    && clickNotAgree[3].style.display == "flex"){
        $(".c-law-hide:eq(0)").css({
            display : "block"
        });
        $(".c-law-show:eq(0)").css({
            display : "none"
        });
        $(".c-signup-agree-btn").css({
            backgroundColor : "#5c7ef7"
        });
    }
}
function cNotCheckAll(){
    const clickAgree = document.getElementsByClassName("c-law-show");
    if(clickAgree[1].style.display == "flex" 
    && clickAgree[2].style.display == "flex" 
    && clickAgree[3].style.display == "flex"){
        
    }else{
        $(".c-law-hide:eq(0)").css({
            display : "none"
        });
        $(".c-law-show:eq(0)").css({
            display : "block"
        });
        $(".c-signup-agree-btn").css({
            backgroundColor : "#ccc"
        });
    }
}


function cEssentialAgreeAll(){
    const clickAgree = document.getElementsByClassName("c-law-show");
    const clickNotAgree = document.getElementsByClassName("c-law-hide");
    for(i = 0; i < 4; i++){
        clickAgree[i].style.display = "none";
        clickNotAgree[i].style.display = "flex";
        $(".c-signup-agree-btn").css({
            backgroundColor : "#5c7ef7"
        });
    }
}
function cEssentialNotAgreeAll(){
    const clickAgree = document.getElementsByClassName("c-law-show");
    const clickNotAgree = document.getElementsByClassName("c-law-hide");
    for(i = 0; i < 4; i++){
        clickAgree[i].style.display = "flex";
        clickNotAgree[i].style.display = "none";
        $(".c-signup-agree-btn").css({
            backgroundColor : "#ccc"
        });
    }
}
function cChoiceAgree(){
    const clickAgree = document.getElementsByClassName("c-law-show");
    const clickNotAgree = document.getElementsByClassName("c-law-hide");
    clickAgree[4].style.display = "none";
    clickNotAgree[4].style.display = "flex";
    for(i = 5; i < 7; i++){
        clickAgree[i].style.display = "none";
        clickNotAgree[i].style.display = "inline-block";
    }
}
function cChoiceNotAgree(){
    const clickAgree = document.getElementsByClassName("c-law-show");
    const clickNotAgree = document.getElementsByClassName("c-law-hide");
    clickAgree[4].style.display = "flex";
    clickNotAgree[4].style.display = "none";
    for(i = 5; i < 7; i++){
        clickAgree[i].style.display = "inline-block";
        clickNotAgree[i].style.display = "none";
    }
}

function cCheckSnsAll(){
    const clickNotAgree = document.getElementsByClassName("c-law-hide");
    if(clickNotAgree[5].style.display == "inline-block" 
    && clickNotAgree[6].style.display == "inline-block" ){
        $(".c-law-hide:eq(4)").css({
            display : "flex"
        });
        $(".c-law-show:eq(4)").css({
            display : "none"
        });
    }
}
function cNotCheckSnsAll(){
    const clickAgree = document.getElementsByClassName("c-law-show");
    if(clickAgree[5].style.display == "inline-block" 
    && clickAgree[6].style.display == "inline-block" ){
        
    }else{
        $(".c-law-hide:eq(4)").css({
            display : "none"
        });
        $(".c-law-show:eq(4)").css({
            display : "flex"
        });
    }
}

function cAgreeAll(){
    const clickNotAgree = document.getElementsByClassName("c-law-hide");
    const alert = document.getElementsByClassName("c-agree-alert")[0];
    
    if(clickNotAgree[1].style.display != "flex" 
    || clickNotAgree[2].style.display != "flex" 
    || clickNotAgree[3].style.display != "flex"){
        alert.style.color = "red";
        alert.innerHTML = "!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EZEN CINEMA 가입을 위해서 [필수] 약관에 동의해주세요.";
    }else{
        alert.innerHTML = "";
        $(".c-signup-agree-btn").css({
            backgroundColor : "#5c7ef7"
        });
        $(".c-part1").css({
            display : "none"
        });
        $(".c-part2").css({
            display : "block"
        });
        $(".c-sign-show:eq(0)").css({
            display: "none"
        });
        $(".c-sign-hide:eq(0)").css({
            display: "block"
        });
        $(".c-sign-show:eq(1)").css({
            display: "block"
        });
        $(".c-sign-hide:eq(1)").css({
            display: "none"
        });
        $(".c-sign-show:eq(1)>div>span:eq(1)").css({
            display: "block"
        })
    }
}
/* *********** 회원가입 *********** */
function regexIdCheck(){    
    let idRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;
    const userid = document.getElementById("userid").value;
    const idDupliBox = document.getElementById("idCheck");
    const alert = document.getElementsByClassName("c-warning");

    if(!idRegex.test(userid)){
        alert[0].style.color = "red";
        alert[0].style.fontWeight = "normal";
        alert[0].innerHTML = "형식에 맞춰 입력해주세요.";
        idDupliBox.style.backgroundColor = "#ccc";
        $("#idCheck").removeAttr("href");
        return false;
    }else{
        alert[0].innerHTML = "";
        idDupliBox.style.backgroundColor = "#5c7ef7";
        $("#idCheck").attr("href", "javascript:idDupli();");
    }    
}

function regexPwCheck(){    
    let passwdRegex = /^(?=.*[a-z])(?=.*\d).{10,}$/;
    const userpass = document.getElementById("userpass").value;

    const alert = document.getElementsByClassName("c-warning");

    if(!passwdRegex.test(userpass)){
        alert[1].style.color = "red";
        alert[1].innerHTML = "형식에 맞춰 입력해주세요.";
        return false;
    }else{
        alert[1].innerHTML = "";
    }

}

function regexTelCheck(){
    const telRegex = /^01([0|1|6|7|8|9/])([0-9]{7,8})$/;
    const tel = document.getElementById("tel").value;

    const alert = document.getElementsByClassName("c-warning");

    if(!telRegex.test(tel)){
        alert[6].style.color = "red";
        alert[6].innerHTML = "형식에 맞춰 입력해주세요.";
        return false;
    }else{
        alert[6].innerHTML = "";
    }
}
function regexTelCheckSns(){
    const telRegex = /^01([0|1|6|7|8|9/])([0-9]{7,8})$/;
    const tel = document.getElementById("tel").value;

    const alert = document.getElementsByClassName("c-warning");

    if(!telRegex.test(tel)){
        alert[4].style.color = "red";
        alert[4].innerHTML = "형식에 맞춰 입력해주세요.";
        return false;
    }else{
        alert[4].innerHTML = "";
    }
}

function cgetDate(){
    const cyear = $("#year").val();
    const cmonth = $("#month").val();
    let cday = new Date(cyear, cmonth, 0).getDate();

    let strDay = "";
    strDay += `<select name="day" id="day">`;
    strDay += `<option value="" selected disabled hidden>일</option>`;
    
    for(i = 1; i < 10; i++){
        strDay +=  `<option value="0${i}">${i}</option>`;
    }
    for(i = 10; i <= cday; i++){
        strDay +=  `<option value="${i}">${i}</option>`;
    }
    strDay += `</select>`;
    document.getElementsByClassName("c-day")[0].innerHTML = strDay;

}
function rePwCheck(){
    const userpass = document.getElementById("userpass").value;
    const reuserpass = document.getElementById("reuserpass").value;
    
    const alert = document.getElementsByClassName("c-warning");

    if(reuserpass != userpass){
        alert[2].style.color = "red";
        alert[2].innerHTML = "비밀번호가 같지 않습니다.";
    }else{
        alert[2].innerHTML = "";
    }
}
function idDupli(){
    const userid = document.getElementById("userid").value;
    const alert = document.getElementsByClassName("c-warning");
    let idDupli = document.getElementById("idDupliCheck");

    fetch("/ezenCine/CheckId", {
        headers : {"Content-Type" : "application/json"},
        method : "post",
        body : JSON.stringify({
            userid : userid
            })
        }).then((res) => res.json())
        .then((result) => {
            if(result == 0){
                alert[0].style.color = "red";
                alert[0].style.fontWeight = "normal";
                alert[0].innerHTML = "중복된 아이디입니다.";
            }else{
                alert[0].style.color = "#5c7ef7";
                alert[0].style.fontWeight = "700";
                alert[0].innerHTML = "&nbsp; [ " + result.result + " ]은 사용가능한 아이디입니다.";
                idDupli.value = 1;
            }
        })
}

function showPasswd(){
	const pwHide = document.getElementById("passwdhide");
	const pwShow = document.getElementById("passwdshow");
	pwHide.classList.toggle("c-active");
	pwShow.classList.toggle("c-active");
	if($("#passwdhide").hasClass("c-active")){
		$("#userpass").attr("type", "password");
	}
	if($("#passwdshow").hasClass("c-active")){
		$("#userpass").attr("type", "text");
	}
}

function showRePasswd(){
	const pwHide = document.getElementById("repasswdhide");
	const pwShow = document.getElementById("repasswdshow");
	pwHide.classList.toggle("c-active");
	pwShow.classList.toggle("c-active");
	if($("#repasswdhide").hasClass("c-active")){
		$("#reuserpass").attr("type", "password");
	}
	if($("#repasswdshow").hasClass("c-active")){
		$("#reuserpass").attr("type", "text");
	}
}

function cSignUp(){
    const userid = document.getElementById("userid").value;
    const idDupli = document.getElementById("idDupliCheck").value;
    const userpass = document.getElementById("userpass").value;
    const reuserpass = document.getElementById("reuserpass").value;
    const username = document.getElementById("username").value;
    const nickname = document.getElementById("nickname").value;
    const year = document.getElementById("year").value;
    const month = document.getElementById("month").value;
    const day = document.getElementById("day").value;
    const tel = document.getElementById("tel").value;
    const postcode = document.getElementById("postcode").value;
    const addr = document.getElementById("addr").value;
    const detailaddr = document.getElementById("detailaddr").value;
    const email1 = document.getElementById("email1").value;
    const email2 = document.getElementById("email2").value;
    
    const emailAgree = document.getElementById("emailAgree").value;
    const SMSAgree = document.getElementById("SMSAgree").value;

    const alert = document.getElementsByClassName("c-warning");

    if(userid == ""){
        alert[0].style.color = "red";
        alert[0].style.fontWeight = "normal";
        alert[0].innerHTML = "아이디를 입력해주세요.";
    }else{
        alert[0].innerHTML = "";
    }
    if(idDupli == ""){
        alert[0].style.color = "red";
        alert[0].style.fontWeight = "normal";
        alert[0].innerHTML = "아이디 중복확인을 해주세요.";
    }else{
        alert[0].innerHTML = "";
    }
    if(userpass == ""){
        alert[1].style.color = "red";
        alert[1].innerHTML = "비밀번호를 입력해주세요.";
    }else{
        alert[1].innerHTML = "";
    }
    if(reuserpass == ""){
        alert[2].style.color = "red";
        alert[2].innerHTML = "비밀번호를 확인해주세요.";
    }else{
        alert[2].innerHTML = "";
    }
    if(username == ""){
        alert[3].style.color = "red";
        alert[3].innerHTML = "이름을 입력해주세요.";
    }else{
        alert[3].innerHTML = "";
    }
    if(nickname == ""){
        alert[4].style.color = "red";
        alert[4].innerHTML = "닉네임을 입력해주세요.";
    }else{
        alert[4].innerHTML = "";
    }
    if(year == "" || month == "" || day == ""){
        alert[5].style.color = "red";
        alert[5].innerHTML = "생년월일을 입력해주세요.";
    }else{
        alert[5].innerHTML = "";
    }
    if(tel == ""){
        alert[6].style.color = "red";
        alert[6].innerHTML = "전화번호를 입력해주세요.";
    }else{
        alert[6].innerHTML = "";
    }
    if(postcode == "" || addr == "" || detailaddr == ""){
        alert[7].style.color = "red";
        alert[7].innerHTML = "주소를 입력해주세요.";
    }else{
        alert[7].innerHTML = "";
    }
    if((email1 == "" && email2 == "") || (email1 == "" && email3 == "")){
        alert[8].style.color = "red";
        alert[8].innerHTML = "이메일을 입력해주세요.";
    }else{
        alert[8].innerHTML = "";
    }

	let birthdate = year + "-" + month + "-" + day;
    let email = email1 + "@" + email2;
    
    let list = [userid, idDupli, userpass, reuserpass, username, nickname, birthdate, tel, addr, detailaddr, email];
    let cnt = 0;
    for(i = 0; i < list.length; i++){
        if(list[i] == ""){
            cnt += 1;
        }
    }

	

    if(cnt == 0){
    	fetch("/ezenCine/Signup", {
            headers : {"Content-Type" : "application/json"},
            method : "post",
            body : JSON.stringify({
                userid : userid, userpass : userpass, username : username, 
                nickname : nickname, birthdate : birthdate, postcode : postcode, 
                addr : addr, detailaddr : detailaddr, email : email, tel : tel, emailAgree : emailAgree, SMSAgree : SMSAgree
            })
        }).then((res) => res.json())
        .then((res) => {
        	console.log(res);
        	
        	if(res == 1){
        		$(".c-part2").css({
                display : "none"
	            });
	            $(".c-part3").css({
	                display : "block"
	            });
	            $(".c-sign-show:eq(1)").css({
	                display: "none"
	            });
	            $(".c-sign-hide:eq(1)").css({
	                display: "block"
	            });
	            $(".c-sign-show:eq(2)").css({
	                display: "block"
	            });
	            $(".c-sign-hide:eq(2)").css({
	                display: "none"
	            });
	            $(".c-sign-show:eq(1)>div>span:eq(1)").css({
	                display: "none"
	            })
	            $(".c-sign-show:eq(2)>div>span:eq(1)").css({
	                display: "block"
	            })
        		
        	}else{
        	
        	}
            
        })
        
    }
    
}

function cSignUpSns(){
    const userid = document.getElementById("userid").value;
    const snsid = document.getElementById("snsid").value;
    const idDupli = document.getElementById("idDupliCheck").value;
    const username = document.getElementById("username").value;
    const nickname = document.getElementById("nickname").value;
    const year = document.getElementById("year").value;
    const month = document.getElementById("month").value;
    const day = document.getElementById("day").value;
    const tel = document.getElementById("tel").value;
    const postcode = document.getElementById("postcode").value;
    const addr = document.getElementById("addr").value;
    const detailaddr = document.getElementById("detailaddr").value;
    const email1 = document.getElementById("email1").value;
    const email2 = document.getElementById("email2").value;

    const alert = document.getElementsByClassName("c-warning");

    if(userid == ""){
        alert[0].style.color = "red";
        alert[0].style.fontWeight = "normal";
        alert[0].innerHTML = "아이디를 입력해주세요.";
    }else{
        alert[0].innerHTML = "";
    }
    if(idDupli == ""){
        alert[0].style.color = "red";
        alert[0].style.fontWeight = "normal";
        alert[0].innerHTML = "아이디 중복확인을 해주세요.";
    }else{
        alert[0].innerHTML = "";
    }
    if(username == ""){
        alert[1].style.color = "red";
        alert[1].innerHTML = "이름을 입력해주세요.";
    }else{
        alert[1].innerHTML = "";
    }
    if(nickname == ""){
        alert[2].style.color = "red";
        alert[2].innerHTML = "닉네임을 입력해주세요.";
    }else{
        alert[2].innerHTML = "";
    }
    if(year == "" || month == "" || day == ""){
        alert[3].style.color = "red";
        alert[3].innerHTML = "생년월일을 입력해주세요.";
    }else{
        alert[3].innerHTML = "";
    }
    if(tel == ""){
        alert[4].style.color = "red";
        alert[4].innerHTML = "전화번호를 입력해주세요.";
    }else{
        alert[4].innerHTML = "";
    }
    if(postcode == "" || addr == "" || detailaddr == ""){
        alert[5].style.color = "red";
        alert[5].innerHTML = "주소를 입력해주세요.";
    }else{
        alert[5].innerHTML = "";
    }
    if(email1 == "" || email2 == ""){
        alert[6].style.color = "red";
        alert[6].innerHTML = "이메일을 입력해주세요.";
    }else{
        alert[6].innerHTML = "";
    }

    let birthdate = year + "-" + month + "-" + day;
    let email = email1 + "@" + email2;

    let list = [userid, idDupli, username, nickname, birthdate, tel, addr, detailaddr, email];
    let cnt = 0;
    for(i = 0; i < list.length; i++){
        if(list[i] == ""){
            cnt += 1;
        }
        
    }
    if(cnt == 0){
        fetch("/ezenCine/SignupSns", {
            headers : {"Content-Type" : "application/json"},
            method : "post",
            body : JSON.stringify({
                userid : userid, snsid : snsid, username : username, 
                nickname : nickname, birthdate : birthdate, postcode : postcode, 
                addr : addr, detailaddr : detailaddr, email : email, tel : tel
            })
        }).then((res) => res.json())
        .then((res) => {
        	console.log(res);

            if(res == 1){
                $(".c-part2-sns").css({
                    display : "none"
                });
                $(".c-part3").css({
                    display : "block"
                });
                $(".c-sign-show:eq(0)").css({
                    display: "none"
                });
                $(".c-sign-hide:eq(0)").css({
                    display: "block"
                });
                $(".c-sign-show:eq(1)").css({
                    display: "block"
                });
                $(".c-sign-hide:eq(1)").css({
                    display: "none"
                });
                $(".c-sign-show:eq(0)>div>span:eq(1)").css({
                    display: "none"
                })
                $(".c-sign-show:eq(1)>div>span:eq(1)").css({
                    display: "block"
                })
            }else{

            }
            
        })
    }
    
}
function sDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var address = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    address = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    address = data.jibunAddress;
                }
                var extraRoadAddr = ""; //참고항목 
                //도로명에 동,로,가가 있는 경우 추가
                if(data.bname !== '' &&/[동|로|가]$/g.test(data.bname)){
               	extraRoadAddr += data.bname;
            	}
            	//건물명, 공동주택 추가
	            if(data.bname !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== ''?','+data.buildingName : data.buildingName);
	            }
	                //표시할 참고항목이 있을 경우
	            if(extraRoadAddr !== ''){
	               extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("addr").value = address;
                document.getElementById("addr").value += extraRoadAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddr").focus();
            }
        }).open();
}

/********************* mypage ***************************/
$(function(){
  //영화 이미지에 hover하면 상세보기와 예매하기가 보이게 한다
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

  //mypage
  $(".h-review-gnb li").click(function(){
    $(".h-review-gnb li").removeClass("active");
    $(this).toggleClass("active");
    $(".h-lnb").css({"display" : "none"});
    $(this).find(".h-lnb").css({"display" : "flex"});
  });

  
  //booking
  
  $(".h-b-movie-btn").click(function(){
    $(".h-b-movie-btn").removeClass("b-on");
    $(this).addClass("b-on");
    $(".h-location-blurbox").css({"display" : "none"});
  });

  $(".h-b-location-btn button").click(function(){
    $(".h-b-location-btn button").removeClass("b-on");
    $(this).addClass("b-on");
    $(".h-date-blurbox").css({"display" : "none"});
  });
  
  $(".h-b-date-btn button").click(function(){
    $(".h-b-date-btn button").removeClass("b-on");
    $(this).addClass("b-on");
    $(".h-time-blurbox").css({"display" : "none"});
  });

  $(".h-b-time-btn button").click(function(){
    $(".h-b-time-btn button").removeClass("b-on");
    $(this).addClass("b-on");
    $(".h-booking-btn-box").css({"display" : "block"});
  });

})//jquery
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




/******************************************************/



let day = dayjs();
let ddd = "";
const dateSlide = document.getElementById('dateSlide');
for(let i = -3 ; i < 30 ; i++){
    ddd = (day.add(i,"day").$d).toString();
    let dt = parseInt(ddd.slice(8,10))
    
    dateSlide.innerHTML 
        += `<div class="date">
                <p class="datenum">${dt}</p>
                <span class="day">${ddd.slice(0,3)}</span>
            </div>`;
}

const dateSlidePrev = () => {
    console.log(dateSlide.style.left -= 10);
    // if(dateSlide.style.left > 0){
    //     dateSlide.style.left
    // }
}


