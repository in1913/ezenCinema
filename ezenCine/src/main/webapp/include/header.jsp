<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <a href="javascript:void(0)"><img src="images/logo/logo.png" alt="logo"></a>
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
                <span class="r-bar"><a href="javascript:void(0)">Login</a></span>
                <span><a href="javascript:void(0)"><img src="images/ico/ico-user.png" alt="mypage"></a></span>
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
