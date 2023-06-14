<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*, java.text.SimpleDateFormat"%>

    <section class="visual">
        <img src="./images/banner/storebanner_1.png" alt="스토어 배너1: 현장에서 티켓 실물을 보여주면 모든 상품 10% 할인해드립니다!">
    </section>
    <section class="store_contents">
        <div class="inner">
            <h3>스토어</h3>

            <ul class="tab">
                <li class="on">콤보</li>
                <li>팝콘/스낵</li>
                <li>음료</li>
            </ul>

            <ul class="product combo">
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/solocombo.png" alt="솔로콤보">
                        <div class="txt">
                            <h4>솔로 콤보</h4>
                            <p>팝콘 (M) 1 + 탄산음료 (R) 1</p>
                            <h3>7,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/couplecombo.png" alt="커플콤보">
                        <div class="txt">
                            <h4>커플 콤보</h4>
                            <p>팝콘 (L) 1 + 탄산음료 (R) 2</p>
                            <h3>11,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/dubcombo.png" alt="더블콤보">
                        <div class="txt">
                            <h4>더블 콤보</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/combo_01.png" alt="더블콤보">
                        <div class="txt">
                            <h4>더블 콤보</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/combo_02.png" alt="더블콤보">
                        <div class="txt">
                            <h4>더블 콤보</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/combo_03.png" alt="더블콤보">
                        <div class="txt">
                            <h4>더블 콤보</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
            </ul>

            <ul class="product snack">
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_01.png" alt="솔로콤보">
                        <div class="txt">
                            <h4>팝콘</h4>
                            <p>팝콘 (M) 1 + 탄산음료 (R) 1</p>
                            <h3>7,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_02.png" alt="커플콤보">
                        <div class="txt">
                            <h4>팝콘</h4>
                            <p>팝콘 (L) 1 + 탄산음료 (R) 2</p>
                            <h3>11,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_03.png" alt="더블콤보">
                        <div class="txt">
                            <h4>팝콘</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_04.png" alt="더블콤보">
                        <div class="txt">
                            <h4>팝콘</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_05.png" alt="더블콤보">
                        <div class="txt">
                            <h4>스낵</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_06.png" alt="더블콤보">
                        <div class="txt">
                            <h4>스낵</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_07.png" alt="더블콤보">
                        <div class="txt">
                            <h4>스낵</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_08.png" alt="더블콤보">
                        <div class="txt">
                            <h4>스낵</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_09.png" alt="더블콤보">
                        <div class="txt">
                            <h4>스낵</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/snack_10.png" alt="더블콤보">
                        <div class="txt">
                            <h4>스낵</h4>
                            <p>팝콘 (M) 2 + 탄산음료 (R) 1</p>
                            <h3>13,000원</h3>
                        </div>
                    </a>
                </li>
            </ul>
            <ul class="product drink">
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/coke.png" alt="콜라">
                        <div class="txt">
                            <h4>탄산음료</h4>
                            <p>콜라(R)</p>
                            <h3>2,600원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/coke.png" alt="콜라">
                        <div class="txt">
                            <h4>탄산음료</h4>
                            <p>콜라(R)</p>
                            <h3>2,600원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/coke.png" alt="콜라">
                        <div class="txt">
                            <h4>탄산음료</h4>
                            <p>콜라(R)</p>
                            <h3>2,600원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/coke.png" alt="콜라">
                        <div class="txt">
                            <h4>탄산음료</h4>
                            <p>콜라(R)</p>
                            <h3>2,600원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/coke.png" alt="콜라">
                        <div class="txt">
                            <h4>탄산음료</h4>
                            <p>콜라(R)</p>
                            <h3>2,600원</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/coke.png" alt="콜라">
                        <div class="txt">
                            <h4>탄산음료</h4>
                            <p>콜라(R)</p>
                            <h3>2,600원</h3>
                        </div>
                    </a>
                </li>

                <li>
                    <a href="javascript:void(0)">
                        <img src="./images/product/icetea.png" alt="콜라">
                        <div class="txt">
                            <h4>캔음료</h4>
                            <p>아이스티</p>
                            <h3>99,999,999원</h3>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </section>
    <%@include file = "../include/advertise.jsp" %>