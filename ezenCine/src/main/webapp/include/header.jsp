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
                        <input type="text" placeholder="검색어를 입력해주세요." name="header-search" id="header-search" autocomplete="off">
                        <button type="button" id="header-submit"></button>
                        <div class="autocomplete"></div>
                    </div>
                </div>
            </div>
        </div>
    </header>
