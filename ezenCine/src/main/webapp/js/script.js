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
                if(window.location.href.includes("signup") || window.location.href.includes("fname=mem")){
                    location.href = "index.jsp";
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
            if(window.location.href.includes("signup") || window.location.href.includes("fname=mem")){
                location.href = "index.jsp";
            }else{
                location.reload();
            }
            
        }
        
    })
}
/************************************* sns 로그인 ************************************** */
// 카카오 로그인
function loginWithKakao() {
	Kakao.init('a3c2f415c4d6b740c5c1a27c6b37158f'); // 사용하려는 앱의 JavaScript 키 입력
    Kakao.Auth.authorize({
        redirectUri: 'https://localhost:8443/ezenCine/KakaoOauth',
        scope: 'account_email'
    });
    Kakao.Auth.setAccessToken(token);
}

window.onload = function(){
    document.getElementById("url").value = window.location.href;
}




/* *********** 약관동의 *********** */
function cShowLaw(n){
    const shadow = document.getElementsByClassName("c-showlaw-shadow")[n];
    shadow.style.display = "block";
}
function cLawClose(n){
    const shadow = document.getElementsByClassName("c-showlaw-shadow")[n];
    shadow.style.display = "none";
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
    || clickNotAgree[6].style.display == "inline-block" ){
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
    || clickAgree[6].style.display == "inline-block" ){
        $(".c-law-hide:eq(4)").css({
            display : "none"
        });
        $(".c-law-show:eq(4)").css({
            display : "flex"
        });
    }else{
        
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

    const idRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;
    const passwdRegex = /^(?=.*[a-z])(?=.*\d).{10,}$/;
    const telRegex = /^01([0|1|6|7|8|9/])([0-9]{7,8})$/;

    if(userid == ""){
        alert[0].style.color = "red";
        alert[0].style.fontWeight = "normal";
        alert[0].innerHTML = "아이디를 입력해주세요.";
    }else{
        alert[0].innerHTML = "";
    }
    if(!idRegex.test(userid)){
        alert[0].style.color = "red";
        alert[0].style.fontWeight = "normal";
        alert[0].innerHTML = "형식에 맞춰 입력해주세요.";
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
    if(!passwdRegex.test(userpass)){
        alert[1].style.color = "red";
        alert[1].innerHTML = "형식에 맞춰 입력해주세요.";
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
    if(!telRegex.test(tel)){
        alert[6].style.color = "red";
        alert[6].innerHTML = "형식에 맞춰 입력해주세요.";
        return false;
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

    const idRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;
    const telRegex = /^01([0|1|6|7|8|9/])([0-9]{7,8})$/;

    if(userid == ""){
        alert[0].style.color = "red";
        alert[0].style.fontWeight = "normal";
        alert[0].innerHTML = "아이디를 입력해주세요.";
    }else{
        alert[0].innerHTML = "";
    }
    if(!idRegex.test(userid)){
        alert[0].style.color = "red";
        alert[0].style.fontWeight = "normal";
        alert[0].innerHTML = "형식에 맞춰 입력해주세요.";
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
    if(!telRegex.test(tel)){
        alert[4].style.color = "red";
        alert[4].innerHTML = "형식에 맞춰 입력해주세요.";
        return false;
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
/*
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
*/

function cMyPageBottom(n){
    const content = document.getElementsByClassName("c-mypage-content");
    const tab = document.getElementsByClassName("c-mypage-tab");
    for(i = 0; i < content.length; i++){
        content[i].classList.remove("c-mypage-content-active");
        tab[i].classList.remove("c-mypage-li-active");
    }
    content[n].classList.add("c-mypage-content-active");
    tab[n].classList.add("c-mypage-li-active");
}
function dayToKor(n){
    if(n == 1){
        return "일";
    }else if(n == 2){
        return "월";
    }else if(n == 3){
        return "화";
    }else if(n == 4){
        return "수";
    }else if(n == 5){
        return "목";
    }else if(n == 6){
        return "금";
    }else if(n == 7){
        return "토";
    }
}
function cMyPageMore(n){
    if(n == 0){
        const plusbtn = document.getElementById("c-mypage-plus-booking-btn");
        const bookingAllnum = document.getElementById("booking-all-num").value;
        const num = document.getElementsByClassName("c-mypage-booking-num").length;
        const insert = document.getElementById("c-mypage-booking-insert");
        fetch("/ezenCine/MyPageMore", {
            headers : {"Content-Type" : "application/json"},
            method : "post",
            body : JSON.stringify({
                myPageNum: n, num : num
            })
        }).then((res) => res.json())
        .then((result) => {
            for(i = 0; i < result.length; i++){
                const alpha = result[i].seat_num[0];
                const seats = result[i].seat_num[1];
                const ticket_year = result[i].ticket_date.substring(0, 4);
                const ticket_month = result[i].ticket_date.substring(5, 7);
                const ticket_day = result[i].ticket_date.substring(8, 10);
                const ticket_hour = result[i].ticket_date.substring(11, 13);
                const ticket_min = result[i].ticket_date.substring(14, 16);
                const screen_year = result[i].screen_date.substring(0, 4);
                const screen_month = result[i].screen_date.substring(5, 7);
                const screen_day = result[i].screen_date.substring(8, 10);
                insert.insertAdjacentHTML("beforeend",`
                    <div class="col-6 c-mypage-booking-num">
                        <img src="${result[i].poster_url}" alt="${result[i].title}">
                        <div class="c-content">
                            <p class="c-title">${result[i].title}</p>
                            <p>예매번호 <span>${result[i].ticket_num}</span></p>
                            <p>상영관/관람좌석 <span>${result[i].room_num}/${alpha}열 ${seats}</span></p>
                            <!--  <p>관람인원 <span>성인 1명</span></p>-->
                            <p>결제일시 <span>${ticket_year}.${ticket_month}.${ticket_day}(${dayToKor(result[i].ticket_day)}) ${ticket_hour}:${ticket_min}</span></p>
                            <p>관람일시 <span>${screen_year}.${screen_month}.${screen_day}(${dayToKor(result[i].screen_day)}) ${result[i].screen_time}</span></p>
                        </div>
                    </div>
                `);
            }
            if(num == bookingAllnum - 1 || num == bookingAllnum - 2){
                plusbtn.style.display = "none";
            }
        })
    }else if(n == 1){
        const plusbtn = document.getElementById("c-mypage-plus-review-btn");
        const reviewAllnum = document.getElementById("review-all-num").value;
        const num = document.getElementsByClassName("c-mypage-review-num").length;
        const insert = document.getElementById("c-mypage-review-insert");
        fetch("/ezenCine/MyPageMore", {
            headers : {"Content-Type" : "application/json"},
            method : "post",
            body : JSON.stringify({
                myPageNum: n, num : num
            })
        }).then((res) => res.json())
        .then((result) => {
            for(i = 0; i < result.length; i++){
                const review_date = new Date(result[i].date);
                const today_date = new Date() ;
                const diffSec = today_date - review_date;
                const diff = Math.ceil(diffSec / (1000 * 3600 * 24));
                
                insert.insertAdjacentHTML("beforeend",`
                    <div class="col-6 c-mypage-review-num">
                        <img src="${result[i].poster_url}" alt="${result[i].title}">
                        <div class="c-content">
                            <p class="c-title">${result[i].title}</p>
                            <p>평점<span class="c-score">${result[i].rating}.0</span></p>
                            <p class="c-comment">${result[i].comments}</p>
                            <p class="c-bottom">
                                <span class="first">
                                    <img class="c-like-img" class="" src="images/h-button/like.png" alt="like">
                                    <span>${diff}일 전</span>
                                </span>
                                <span class="second">
                                    <a href="javascript:void(0);">수정</a>
                                    <a href="javascript:void(0);">삭제</a>
                                </span></p>
                        </div>
                    </div>
                `);
            }
            if(num == reviewAllnum - 1 || num == reviewAllnum - 2){
                plusbtn.style.display = "none";
            }
        })
    }else if(n == 2){
        const plusbtn = document.getElementById("c-mypage-plus-like-btn");
        const likeAllnum = document.getElementById("like-all-num").value;
        const num = document.getElementsByClassName("c-mypage-like-num").length;
        const insert = document.getElementById("c-mypage-like-insert");
        fetch("/ezenCine/MyPageMore", {
            headers : {"Content-Type" : "application/json"},
            method : "post",
            body : JSON.stringify({
                myPageNum: n, num : num
            })
        }).then((res) => res.json())
        .then((result) => {
            for(i = 0; i < result.length; i++){
                insert.insertAdjacentHTML = ("breforeend", `
            <div class="col-3  c-mypage-like-num">
                <img src="${result.img}" alt="${result.title}">
                <span class="c-title">${result.title}</span>
                <span class="c-engtitle">${result.engtitle}</span>
            </div>
            `);
            }
            if(num == likeAllnum - 1 || num == likeAllnum - 2){
                plusbtn.style.display = "none";
            }
        })
    }
}
/************ findid & findpw ************ */
function cFindIdCheck(){
    const username = document.getElementById("username");
    const useremail = document.getElementById("useremail");
    const findIdBtn = document.getElementsByClassName("c-find-second-btn")[0];
    if(username.value != "" && useremail.value != ""){
        findIdBtn.style.backgroundColor = "#5c7ef7";
        $(".c-find-second-btn").attr("href", "javascript:cFindId();");
    }else{
        findIdBtn.style.backgroundColor = "#aeaeae";
        $(".c-find-second-btn").removeAttr("href");
    }
}
function cFindPwCheck(){
    const userid = document.getElementById("userid");
    const useremail = document.getElementById("useremail");
    const findIdBtn = document.getElementsByClassName("c-find-second-btn")[0];
    if(userid.value != "" && useremail.value != ""){
        findIdBtn.style.backgroundColor = "#5c7ef7";
        $(".c-find-second-btn").attr("href", "javascript:cFindPw();");
    }else{
        findIdBtn.style.backgroundColor = "#aeaeae";
        $(".c-find-second-btn").removeAttr("href");
    }
}
function cFindId(){
    const username = document.getElementById("username").value;
    const useremail = document.getElementById("useremail").value;
    const popup_alert = document.getElementById("idpw-popup-alert");
    const popup = document.getElementById("c-find-idpw-popup");
    fetch("/ezenCine/FindId", {
        headers: {"Content-Type" : "application/json"},
        method: "post",
        body: JSON.stringify({
            username : username, useremail: useremail
        })
    }).then((res) => res.json())
    .then((result) => {
        if(result.result == 0){
            popup.style.display = "block";
            popup_alert.innerHTML = "입력된 정보와 일치하는 아이디가 없습니다.";
        }else{
            popup.style.display = "block";
            popup_alert.innerHTML = username + "님의 아이디는 " + result.result + "입니다.";
        }
    })
}

function cThreeMinTimer(){
    const Timer = document.getElementById("c-find-time");
    let time = 180000;
    let min = 3;
    let sec = 60;

    Timer.value = min + ":" + "00";

    playTime = setInterval(function() {
        time = time - 1000;
        min = time / (60 * 1000);
        if(sec > 0){
            sec = sec - 1;
            Timer.innerHTML = Math.floor(min) + ":" +sec;
        }
        if(sec === 0){
            sec = 60;
            Timer.innerHTML = Math.floor(min) + ":" + "00";
        }
    }, 1000);
}


var oauthCode = "";
var compTime;
function cFindPw(){
    const userid = document.getElementById("userid").value;
    const sendemail = document.getElementById("useremail").value;
    const popup_alert = document.getElementById("idpw-popup-alert");
    const popup = document.getElementById("c-find-idpw-popup");
    let oauthnum = document.getElementById("oauthnum");
    const warning = document.getElementsByClassName("c-warning")[0];
    oauthnum.readOnly = false;
    warning.innerHTML = "";
    fetch("/ezenCine/FindPw", {
        headers: {"Content-Type" : "application/json"},
        method: "post",
        body: JSON.stringify({
            userid : userid, sendemail : sendemail
        })
    }).then((res) => res.json())
    .then((result) => {
        if(result.result == 0){
            popup.style.display = "block";
            popup_alert.innerHTML = "입력된 정보와 일치하는 회원정보가 없습니다.";
        }else{
            oauthCode = result.result;
            popup.style.display = "block";
            popup_alert.innerHTML = "입력하신 이메일로 인증번호가 전송되었습니다. 시간 내에 인증확인을 해주세요.";
            $(".c-oauth-d-none").slideDown();
            cThreeMinTimer();
            compTime = setTimeout(function(){
                clearInterval(playTime);
                oauthnum.readOnly = true;
                warning.innerHTML = "시간이 초과되었습니다.";
            }, 180000);
        }
    })
}
function regexFindPwCheck(){    
    let passwdRegex = /^(?=.*[a-z])(?=.*\d).{10,}$/;
    const userpass = document.getElementById("userpass").value;
    const reuserpass = document.getElementById("reuserpass").value;
    const alert = document.getElementsByClassName("c-warning");
    const findBtn = document.getElementsByClassName("c-find-second-btn")[0];
    if(!passwdRegex.test(userpass)){
        alert[1].style.color = "red";
        alert[1].innerHTML = "형식에 맞춰 입력해주세요.";
        return false;
    }else{
        alert[1].innerHTML = "";
    }
    if(passwdRegex.test(userpass) && reuserpass == userpass){
        findBtn.style.backgroundColor = "#5c7ef7";
        $(".c-find-second-btn").attr("href", "javascript:cUpdatePw();");
    }

}
function reFindPwCheck(){
    let passwdRegex = /^(?=.*[a-z])(?=.*\d).{10,}$/;
    const userpass = document.getElementById("userpass").value;
    const reuserpass = document.getElementById("reuserpass").value;
    const alert = document.getElementsByClassName("c-warning");
    const findBtn = document.getElementsByClassName("c-find-second-btn")[0];
    if(reuserpass != userpass){
        alert[2].style.color = "red";
        alert[2].innerHTML = "비밀번호가 같지 않습니다.";
    }else{
        alert[2].innerHTML = "";
    }
    if(passwdRegex.test(userpass) && reuserpass == userpass){
        findBtn.style.backgroundColor = "#5c7ef7";
        $(".c-find-second-btn").attr("href", "javascript:cUpdatePw();");
    }
}
function cOauthCheck(){
    const oauthnum = document.getElementById("oauthnum");
    const oauthBtn = document.getElementsByClassName("c-find-pw-oauth-btn")[0];
    if(oauthnum.value != ""){
        oauthBtn.style.backgroundColor = "#5c7ef7";
        $(".c-find-pw-oauth-btn").attr("href", "javascript:cOauthNum();");
    }else{
        oauthBtn.style.backgroundColor = "#aeaeae";
        $(".c-find-pw-oauth-btn").removeAttr("href");
    }
}
function cOauthNum(){
    const oauthnum = document.getElementById("oauthnum").value;
    const warning = document.getElementsByClassName("c-warning")[0];
    const findSecondbtn = document.getElementsByClassName("c-find-second-btn")[0];

    if(oauthnum == oauthCode){
            clearInterval(playTime);
            clearTimeout(compTime);
            warning.innerHTML = "";
            $(".c-userpass-d-none").slideDown("slow", "swing", function(){
                findSecondbtn.style.backgroundColor = "#aeaeae";
                findSecondbtn.innerHTML = "비밀번호 변경";
                $(".c-find-second-btn").removeAttr("href");
            });
    }else{
        warning.innerHTML = "전송코드가 일치하지 않습니다.";
    }
}
function cUpdatePw(){
    const userid = document.getElementById("userid").value;
    const userpass = document.getElementById("userpass").value;
    const popup_alert = document.getElementById("idpw-popup-alert");
    const popup = document.getElementById("c-find-idpw-popup");
    fetch("/ezenCine/UpdatePw", {
        headers : {"Content-Type" : "application/json"},
        method : "post",
        body : JSON.stringify({
            userid : userid, userpass : userpass
        })
    }).then((res) => res.json())
    .then((result) => {
        if(result.result == 0){
            popup.style.display = "block";
            popup_alert.innerHTML = "오류가 발생했습니다. 다시 한번 시도해주세요.";
        }else{
            popup.style.display = "block";
            popup_alert.innerHTML = "입력하신 비밀번호로 비밀번호가 변경되었습니다.";
        }
    })
}

function cFindIdPwClose(){
    location.href = "index.jsp";
}
/********************* profile *********************** */
function regexCurPwCheck(){    
    let passwdRegex = /^(?=.*[a-z])(?=.*\d).{10,}$/;
    const curuserpass = document.getElementById("curuserpass").value;
    const userpass = document.getElementById("userpass").value;
    const reuserpass = document.getElementById("reuserpass").value;
    const profileBtn = document.getElementsByClassName("c-profile-popup-photo-submit-btn")[1];
    if(passwdRegex.test(userpass) && reuserpass == userpass && curuserpass != ""){
        profileBtn.style.backgroundColor = "#5c7ef7";
        $(".c-profile-popup-photo-submit-btn:eq(1)").attr("href", "javascript:cProfilePopupModi(1);");
    }else{
        profileBtn.style.backgroundColor = "#ccc";
        $(".c-profile-popup-photo-submit-btn:eq(1)").removeAttr("href");
    }

}
function regexProPwCheck(){    
    let passwdRegex = /^(?=.*[a-z])(?=.*\d).{10,}$/;
    const curuserpass = document.getElementById("curuserpass").value;
    const userpass = document.getElementById("userpass").value;
    const reuserpass = document.getElementById("reuserpass").value;
    const alert = document.getElementsByClassName("c-warning");
    const profileBtn = document.getElementsByClassName("c-profile-popup-photo-submit-btn")[1];
    if(!passwdRegex.test(userpass)){
        alert[1].style.color = "red";
        alert[1].innerHTML = "형식에 맞춰 입력해주세요.";
        return false;
    }else{
        alert[1].innerHTML = "";
    }
    if(passwdRegex.test(userpass) && reuserpass == userpass && curuserpass != ""){
        profileBtn.style.backgroundColor = "#5c7ef7";
        $(".c-profile-popup-photo-submit-btn:eq(1)").attr("href", "javascript:cProfilePopupModi(1);");
    }else{
        profileBtn.style.backgroundColor = "#ccc";
        $(".c-profile-popup-photo-submit-btn:eq(1)").removeAttr("href");
    }

}
function regexRePwCheck(){
    let passwdRegex = /^(?=.*[a-z])(?=.*\d).{10,}$/;
    const curuserpass = document.getElementById("curuserpass").value;
    const userpass = document.getElementById("userpass").value;
    const reuserpass = document.getElementById("reuserpass").value;
    const alert = document.getElementsByClassName("c-warning");
    const profileBtn = document.getElementsByClassName("c-profile-popup-photo-submit-btn")[1];
    if(reuserpass != userpass){
        alert[2].style.color = "red";
        alert[2].innerHTML = "비밀번호가 같지 않습니다.";
    }else{
        alert[2].innerHTML = "";
    }
    if(passwdRegex.test(userpass) && reuserpass == userpass && curuserpass != ""){
        profileBtn.style.backgroundColor = "#5c7ef7";
        $(".c-profile-popup-photo-submit-btn:eq(1)").attr("href", "javascript:cProfilePopupModi(1);");
    }else{
        profileBtn.style.backgroundColor = "#ccc";
        $(".c-profile-popup-photo-submit-btn:eq(1)").removeAttr("href");
    }
}
function regexProfileTelCheck(){
    const telRegex = /^01([0|1|6|7|8|9/])([0-9]{7,8})$/;
    const tel = document.getElementById("tel").value;
    const profileBtn = document.getElementsByClassName("c-profile-popup-photo-submit-btn")[5];
    const alert = document.getElementsByClassName("c-warning");

    if(!telRegex.test(tel)){
        alert[3].style.color = "red";
        alert[3].innerHTML = "형식에 맞춰 입력해주세요.";
        profileBtn.style.backgroundColor = "#ccc";
        $(".c-profile-popup-photo-submit-btn:eq(5)").removeAttr("href");
    }else{
        alert[3].innerHTML = "";
        profileBtn.style.backgroundColor = "#5c7ef7";
        $(".c-profile-popup-photo-submit-btn:eq(5)").attr("href", "javascript:cProfilePopupModi(5);");
    }
}
function showCurPasswd(){
	const pwHide = document.getElementById("curpasswdhide");
	const pwShow = document.getElementById("curpasswdshow");
	pwHide.classList.toggle("c-active");
	pwShow.classList.toggle("c-active");
	if($("#curpasswdhide").hasClass("c-active")){
		$("#curuserpass").attr("type", "password");
	}
	if($("#curpasswdshow").hasClass("c-active")){
		$("#curuserpass").attr("type", "text");
	}
}

/****** 이메일 활성화 및 0 1 값 입력 ***** */
function cProfileEmailCheck(){
    const clickNotAgree = document.getElementsByClassName("c-profile-law-show")[0];
    const clickAgree = document.getElementsByClassName("c-profile-law-hide")[0];
    let emailAgree = document.getElementById("emailAgree");
    clickNotAgree.classList.remove("c-profile-active");
    clickAgree.classList.add("c-profile-active");
    emailAgree.value = 1;
}
function cProfileEmailNotCheck(){
    const clickNotAgree = document.getElementsByClassName("c-profile-law-show")[0];
    const clickAgree = document.getElementsByClassName("c-profile-law-hide")[0];
    let emailAgree = document.getElementById("emailAgree");
    clickNotAgree.classList.add("c-profile-active");
    clickAgree.classList.remove("c-profile-active");
    emailAgree.value = 0;
}
function cProfileSMSCheck(){
    const clickNotAgree = document.getElementsByClassName("c-profile-law-show")[1];
    const clickAgree = document.getElementsByClassName("c-profile-law-hide")[1];
    let smsAgree = document.getElementById("SMSAgree");
    clickNotAgree.classList.remove("c-profile-active");
    clickAgree.classList.add("c-profile-active");
    smsAgree.value = 1;
}
function cProfileSMSNotCheck(){
    const clickNotAgree = document.getElementsByClassName("c-profile-law-show")[1];
    const clickAgree = document.getElementsByClassName("c-profile-law-hide")[1];
    let smsAgree = document.getElementById("SMSAgree");
    clickNotAgree.classList.add("c-profile-active");
    clickAgree.classList.remove("c-profile-active");
    smsAgree.value = 0;
}

function cProfileShow(n){
    const profilePopup = document.getElementsByClassName("c-profile-shadow")[n];
    profilePopup.style.display = "block";
}
function cProfilePopupCancel(n){
    if(n == 0){
        // 이미지 파일 업로드 삭제 및 input file 태그 다시 만들기
        const photobtnBox = document.getElementsByClassName("c-profile-photo-btn")[0];
        const inputImg = document.getElementById("c-profile-get-photo");
        inputImg.remove();
        photobtnBox.insertAdjacentHTML("beforeend", `
            <input type="file" name="c-profile-get-photo" id="c-profile-get-photo" onchange="cProfileShowUserPhoto();" accept="images/*">
        `);
        // 이미지 파일 사용자에게 보이기 및 팝업 이미지 바꾸기
        let userPopupImgShow = document.getElementById("c-profile-popup-user-img");
        const imgUrl = "/ezenCine/ShowMemPhoto";
	    userPopupImgShow.src = imgUrl;
    }else if(n == 1){
        const curuserpass = document.getElementById("curuserpass");
        const userpass = document.getElementById("userpass");
        const reuserpass = document.getElementById("reuserpass");
        const warning = document.getElementsByClassName("c-warning");

        curuserpass.value = "";
        userpass.value = "";
        reuserpass.value = "";
        for(i = 0; i < 3; i++){
            warning[i].innerHTML = "";
        }
    }else if(n == 2){
        let username = document.getElementById("username");
        let originUsername = document.getElementById("originUsername");
        username.value = originUsername.value;
    }else if(n == 3){
        let nickname = document.getElementById("nickname");
        let originNickname = document.getElementById("originNickname");
        nickname.value = originNickname.value;
    }else if(n == 4){
        let email1 = document.getElementById("email1");
        let email2 = document.getElementById("email2");
        let originEmail1 = document.getElementById("originEmail1");
        let originEmail2 = document.getElementById("originEmail2");

        email1.value = originEmail1.value;
        email2.value = originEmail2.value;
    }else if(n == 5){
        let tel = document.getElementById("tel");
        let originTel = document.getElementById("originTel");
        const warning = document.getElementsByClassName("c-warning");
        tel.value = originTel.value;
        warning[3].innerHTML = "";
    }else if(n == 6){
    }
    const profilePopup = document.getElementsByClassName("c-profile-shadow")[n];
    profilePopup.style.display = "none";
}

function cProfilePopupModi(n){
    const profilePopup = document.getElementsByClassName("c-profile-shadow")[n];
    if(n == 0){
        const userImg = document.getElementById("c-profile-user-img");
        const userProfileImg = document.getElementById("c-profile-popup-user-img");
        userImg.src = userProfileImg.src;
        profilePopup.style.display = "none";

        // 기본이미지로 변경한 것인지 나타내는 input hidden
        let isBasicPhoto = document.getElementById("isBasicPhoto");
        if(userProfileImg.src.includes("images/icon/user/user.png")){
            isBasicPhoto.value = 1;
        }else{
            isBasicPhoto.value = 0;
        }
        
    }else if(n == 1){
        const curuserpass = document.getElementById("curuserpass").value;
        const userpass = document.getElementById("userpass").value;
        const warning = document.getElementsByClassName("c-warning");
        let cShowPassLen = document.getElementsByClassName("userpass-length")[0];
        fetch("/ezenCine/MatchPw", {
            headers : {"Content-Type" : "application/json"},
            method : "post",
            body : JSON.stringify({
                curuserpass : curuserpass
            })
        }).then((res) => res.json())
        .then((result) => {
            if(result == 0){
                warning[0].innerHTML = "비밀번호가 틀렸습니다.";
            }else if(result == 1){
                let starLen = "";
                for(i = 0; i < userpass.length; i++){
                    starLen += "*";
                }
                cShowPassLen.innerHTML = starLen;
                profilePopup.style.display = "none";
            }
        })
    }else if(n == 2){
        const username = document.getElementById("username");
        const showUsername = document.getElementById("c-profile-show-username");
        showUsername.innerHTML = username.value;
        profilePopup.style.display = "none";
    }else if(n == 3){
        const nickname = document.getElementById("nickname");
        const showNickname = document.getElementById("c-profile-show-nickname");
        showNickname.innerHTML = nickname.value;
        profilePopup.style.display = "none";
    }else if(n == 4){
        const email1 = document.getElementById("email1");
        const email2 = document.getElementById("email2");
        const email = email1.value + "@" + email2.value;
        const showUseremail = document.getElementById("c-profile-show-useremail");
        showUseremail.innerHTML = email;
        profilePopup.style.display = "none";
    }else if(n == 5){
        const tel = document.getElementById("tel");
        let comTel = "";
        if(tel.value.length == 10){
            comTel = tel.value.substring(0,3) + "-***-" + tel.value.substring(6);
        }else if(tel.value.length == 11){
            comTel = tel.value.substring(0,3) + "-****-" + tel.value.substring(7);
        }
        const showtel = document.getElementById("c-profile-show-tel");
        showtel.innerHTML = comTel;
        profilePopup.style.display = "none";
    }
    
}

function cProfileModiPhoto(){
    const getPhotobtn = document.getElementById("c-profile-get-photo");
    getPhotobtn.click();
}

function cProfileBasicPhoto(){
    // 이미지 파일 업로드 삭제 및 input file 태그 다시 만들기
    const photobtnBox = document.getElementsByClassName("c-profile-photo-btn")[0];
    const inputImg = document.getElementById("c-profile-get-photo");
    inputImg.remove();
    photobtnBox.insertAdjacentHTML("beforeend", `
        <input type="file" name="c-profile-get-photo" id="c-profile-get-photo" onchange="cProfileShowUserPhoto();" accept="images/*">
    `);
    // 이미지 파일 사용자에게 보이기 및 팝업 이미지 바꾸기
    let userPopupImgShow = document.getElementById("c-profile-popup-user-img");
    const imgUrl = "images/icon/user/user.png";
    userPopupImgShow.src = imgUrl;
}

function cProfileShowUserPhoto(){
	const img = document.querySelector("#c-profile-get-photo");
	let userImg = document.getElementById("c-profile-popup-user-img");
	const imgName = img.files[0];
	const imgUrl = URL.createObjectURL(imgName);
	userImg.src = imgUrl;
}
function cProfileSubmit(){
    const userImg = document.getElementById("c-profile-get-photo").files[0];
    const userpass = document.getElementById("userpass").value;
    const username = document.getElementById("username").value;
    const nickname = document.getElementById("nickname").value;
    const email1 = document.getElementById("email1").value;
    const email2 = document.getElementById("email2").value;
    const email = email1 + "@" + email2;
    const tel = document.getElementById("tel").value;
    const postcode = document.getElementById("postcode").value;
    const addr = document.getElementById("addr").value;
    const detailaddr = document.getElementById("detailaddr").value;
    const emailAgree = document.getElementById("emailAgree").value;
    const smsAgree = document.getElementById("SMSAgree").value;
    const isBasicPhoto = document.getElementById("isBasicPhoto").value;

    const completePopup = document.getElementsByClassName("c-profile-shadow-complete")[0];
    const completeAlert = document.getElementsByClassName("c-profile-submit-alert")[0];

    const formData = new FormData();
    formData.append("userImg", userImg);
    formData.append("password", userpass);
    formData.append("username", username);
    formData.append("nickname", nickname);
    formData.append("email", email);
    formData.append("tel", tel);
    formData.append("postcode", postcode);
    formData.append("addr", addr);
    formData.append("detailaddr", detailaddr);
    formData.append("emailAgree", emailAgree);
    formData.append("smsAgree", smsAgree);
    formData.append("isBasicPhoto", isBasicPhoto);
    fetch("/ezenCine/ModiProfile", {
        method : "post",
        body : formData
    }).then((res) => res.json())
    .then((result) => {
        if(result == 0){
            completePopup.style.display = "block";
            completeAlert.innerHTML = "오류가 발생했습니다. 다시 한번 시도해주세요.";

        }else if(result == 1){
            completePopup.style.display = "block";
            completeAlert.innerHTML = "변경이 성공적으로 완료되었습니다.";
            $(".c-profile-complete-btn").attr("href", "index.jsp?fname=mem/mypage");
        }
    })
}
