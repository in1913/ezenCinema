var initReview = "";
document.addEventListener("click", function (e) {
    const userid = document.querySelector("#userid").value;
    const movieid = document.querySelector("#movie-id").value;
    
    if(e.target.classList.contains("c-show-modi")) {
        const comment = e.target.closest(".k-reviewlist").querySelector(".k-review-info");
        const modiBox = e.target.closest(".k-reviewlist").querySelector(".c-modi-reviewbox");
        const modiReview = e.target.closest(".k-reviewlist").querySelector(".c-modi-review");
        comment.style.display = "none";
        modiBox.style.display = "block";
        initReview = modiReview.value;

        const rating = e.target.closest(".k-reviewlist").querySelector(".k-review-starsnum");
        if(rating.innerText != 0){
            const radioRate = e.target.closest(".k-reviewlist").querySelectorAll(".c-m-rating")[10 - Number(rating.innerText)];
            radioRate.checked = true;
        }
    }else if(e.target.classList.contains("k-declaration")) {
        const tooltips = document.querySelectorAll(".c-review-cur-tooltip");
        const comments = document.querySelectorAll(".k-review-info");
        const modiBoxs = document.querySelectorAll(".c-modi-reviewbox");
        const tooltip = e.target.querySelector(".c-review-cur-tooltip");

        if(tooltip.classList.contains("c-review-active")) {
            tooltip.classList.remove("c-review-active");
        }else{
            tooltips.forEach(function (res) {
            res.classList.remove("c-review-active");
            });
            comments.forEach(function (res) {
            res.style.display = "block";
            });
            modiBoxs.forEach(function (res) {
            res.style.display = "none";
            });
            tooltip.classList.add("c-review-active");
        }
    }else if(e.target.classList.contains("c-modi-reset")) {
        const comment = e.target.closest(".k-reviewlist").querySelector(".k-review-info");
        const modibox = e.target.closest(".k-reviewlist").querySelector(".c-modi-reviewbox");
        let modiReview = e.target.closest(".k-reviewlist").querySelector(".c-modi-review");
        modiReview.value = initReview;
        comment.style.display = "block";
        modibox.style.display = "none";
    }else if(e.target.classList.contains("c-modi-complete")) {
        const review = e.target.closest(".k-reviewlist").querySelector(".c-modi-review");
        const rating = e.target.closest(".k-reviewlist").querySelector(".c-rating-number").innerText;
        const ratingBox = e.target.closest(".k-reviewlist").querySelector(".k-review-starsnum");
        const modireview = e.target.closest(".k-reviewlist").querySelector(".k-review-info");
        const starBox = e.target.closest(".k-reviewlist").querySelector(".k-review-stars");
        const modibox = e.target.closest(".k-reviewlist").querySelector(".c-modi-reviewbox");
        const num = e.target.closest(".k-reviewlist").querySelector(".c-review-num").value;

        fetch("/ezenCine/ReviewModi", {
            headers: { "Content-Type": "application/json" },
            method: "post",
            body: JSON.stringify({
                reviews_num: num,
                movie_id: movieid,
                review: review.value,
                rating: rating
            })
        }).then(function (res) {
            return res.json();
        })
        .then(function (result) {
            if(result == 1) {
                modibox.style.display = "none";
                modireview.style.display = "block";
                modireview.innerHTML = review.value;
                let fill = 0;
                let half = 0;
                let empty = 0;
            if(rating % 2 != 0) {
                fill = (rating - 1) / 2;
                half = 1;
                empty = 5 - half - fill;
            }else{
                fill = rating / 2;
                empty = 5 - fill;
            }
            let stars = "";
            if (fill == 0) {
                if (half == 0) {
                    for (let k = 0; k < empty; k++) {
                        stars += '<img src="images/icon/inyoung/empty.png" alt="stars" />';
                    }
                }else{
                    stars += '<img src="images/icon/inyoung/half.png" alt="stars" />';
                    for (let k = 0; k < empty; k++) {
                        stars += '<img src="images/icon/inyoung/empty.png" alt="stars" />';
                    }
                }
                } else {
                    if (half == 0) {
                        for (let k = 0; k < fill; k++) {
                            stars += '<img src="images/icon/inyoung/fill.png" alt="stars" />';
                        }
                        for (let k = 0; k < empty; k++) {
                            stars += '<img src="images/icon/inyoung/empty.png" alt="stars" />';
                        }
                    } else {
                        for (let k = 0; k < fill; k++) {
                            stars += '<img src="images/icon/inyoung/fill.png" alt="stars" />';
                        }
                        stars += '<img src="images/icon/inyoung/half.png" alt="stars" />';
                        for (let k = 0; k < empty; k++) {
                            stars += '<img src="images/icon/inyoung/empty.png" alt="stars" />';
                        }
                    }
                }
            starBox.innerHTML = stars;
            ratingBox.innerHTML = rating;
            }
        })
        
    }else if(e.target.classList.contains("k-like2")) {
        const reviews_num = e.target.closest(".k-reviewlist").querySelector(".c-review-num").value;
        let like = e.target;
        const insert = e.target.nextElementSibling;
        let isLike = e.target.querySelector(".review-like");

        if(userid == null || userid == "null" || userid == "") {
            alert("로그인이 필요한 서비스입니다.");
        }else {
            if (isLike.value == 1) {
            fetch("/ezenCine/DeleteLike", {
                headers: { "Content-Type": "application/json" },
                method: "post",
                body: JSON.stringify({
                    movieid: movieid,
                    reviews_num: reviews_num
                })
            })
            .then(function (res) {
                return res.json();
            })
            .then(function (result) {
                if (result.result == -1) {
                    // handle error
                } else {
                    insert.innerHTML = result.result;
                    like.classList.remove("on");
                    isLike.value = 0;
                }
            })
            .catch(function (error) {
              // handle error
            });
            } else {
                fetch("/ezenCine/UpdateLike", {
                    headers: { "Content-Type": "application/json" },
                    method: "post",
                    body: JSON.stringify({
                        movieid: movieid,
                        reviews_num: reviews_num
                    })
                })
                .then(function (res) {
                    return res.json();
                })
                .then(function (result) {
                    if (result.result == -1) {
                        // handle error
                    } else {
                        insert.innerHTML = result.result;
                        like.classList.add("on");
                        isLike.value = 1;
                    }
                })
                .catch(function (error) {
                // handle error
                });
            }
        }
    }else if(e.target.classList.contains("c-comment-del")) {
        const num = e.target.closest(".k-reviewlist").querySelector(".c-review-num").value;
        const reviewbox = e.target.closest(".k-reviewlist");
        const reviewTab = document.querySelector("#reviewTab");
        const reviewTab2 = document.querySelector("#c-reviewlist-cnt");
        const len = document.getElementById("reviewAllNum");
        if(confirm("정말 삭제하시겠습니까?")){
            fetch("/ezenCine/ReviewDel", {
                headers : {"Content-Type": "application/json"},
                method : "post",
                body : JSON.stringify({
                    reviews_num : num, movie_id : movieid
                })
            }).then((res) => res.json())
            .then((result) => {
                if(result.result == 1){
                    reviewbox.remove();
                    reviewTab.innerHTML = result.cnt;
                    reviewTab2.innerHTML = result.cnt;
                    len.value = result.cnt;
                    /* 
                    if(len.value < 7){
                        btn[0].classList.remove("c-review-active");
                        btn[1].classList.remove("c-review-active");
                    } */
                    
                }else{

                }
            })
        }
    // 최신순
    }else if(e.target.classList.contains("k-score_1")){
        let insert = document.getElementsByClassName("k-reviewlist_all")[0];
        const btn = document.getElementsByClassName("k-list_btn");
        const allNum = document.getElementById("reviewAllNum").value;
        fetch("/ezenCine/ClickLikeOrder", {
            headers : {"Content-Type" : "application/json"},
            method : "post",
            body : JSON.stringify({
                movieid : movieid, isCurrent : 1
            })
        }).then((res) => res.json())
        .then((result1) => {
            fetch("/ezenCine/CheckLikeUser", {
                headers : {"Content-Type" : "application/json"},
                method : "post",
                body : JSON.stringify({
                movieid : movieid
                })
            }).then((res) => res.json())
            .then((result2) => {
                insert.innerHTML = "";
                const timezoneOffset = new Date().getTimezoneOffset() * 60000;
                const today = new Date(Date.now() - timezoneOffset).toISOString().substring(0, 10).replace(/-/g, ".");
                for(i = 0; i < result1.length; i++){
                    let likeCnt = 0;
                    for(j = 0; j < result2.length; j++){
                        if(result2[j].num == result1[i].num){
                            if(userid == result2[j].userid){
                                likeCnt = 1; 
                            }
                        }
                    }
                    let utilBox = `<ul class="c-review-cur-tooltip not-user">
                                <li><a href="javascript:void(0)">신고</a>
                                </li>
                            </ul>`;
                    if(userid == result1[i].userid){
                        utilBox = `<ul class="c-review-cur-tooltip">
                        <li><a href="javascript:void(0)" class="c-show-modi">수정</a></li>
                        <li><a href="javascript:void(0)" class="c-comment-del">삭제</a></li>
                    </ul>`
                    }
                    let active = ``;
                    if(likeCnt == 0){
                    }else if(likeCnt == 1){
                        active = `on`;
                    }
                    let img = `<img src='upload/users/${result1[i].photo}' alt='프로필'/> `;
                    if(result1[i].photo === undefined){
                        if(i % 2 == 0){
                            img = `<img src='images/icon/user/profile_dark.png' alt='프로필'/> `;
                        }else{
                            img = `<img src='images/icon/user/profile.png' alt='프로필'/> `;
                        }
                    }
                    let dbDate = result1[i].date.substring(0, 10).replace(/-/g, ".");
                    if(dbDate == today){
                        dbDate = `${result1[i].date.substring(10, 16)}`;
                    }
                    let fill = 0;
                    let half = 0;
                    let empty = 0;
                    if(result1[i].rating % 2 != 0){
                        fill = (result1[i].rating - 1) / 2;
                        half = 1;
                        empty = 5 - half - fill;
                    }else{
                        fill = result1[i].rating / 2;
				        empty = 5 - fill;
                    }
                    let stars = "";
                    if(fill == 0){
                        if(half == 0){
                            for(k = 0; k < empty; k++){
                                stars += `<img src="images/icon/inyoung/empty.png" alt="stars" />`;
                            }
                        }else{
                            stars += `<img src="images/icon/inyoung/half.png" alt="stars" />`;
                            for(k = 0; k < empty; k++){
                                stars += `<img src="images/icon/inyoung/empty.png" alt="stars" />`;
                            }
                        }
                    }else{
                        if(half == 0){
                            for(k = 0; k < fill; k++){
                                stars += `<img src="images/icon/inyoung/fill.png" alt="stars" />`;
                            }
                            for(k = 0; k < empty; k++){
                                stars += `<img src="images/icon/inyoung/empty.png" alt="stars" />`;
                            }
                        }else{
                            for(k = 0; k < fill; k++){
                                stars += `<img src="images/icon/inyoung/fill.png" alt="stars" />`;
                            }
                            stars += `<img src="images/icon/inyoung/half.png" alt="stars" />`;
                            for(k = 0; k < empty; k++){
                                stars += `<img src="images/icon/inyoung/empty.png" alt="stars" />`;
                            }
                        }
                    }
                    insert.insertAdjacentHTML("beforeend", `
                    <div class="k-reviewlist c-currentlist">
                    <input type="hidden" value="${result1[i].num}"  class="c-current-num c-review-num"/>
                    <div class="k-listleft col-1">
                        <div class="c-list-img">
                            ${img}
                        </div>
                    </div>
                    <div class="k-listright col-11">
                        <ul id="k-listbox">
                            <li id="k-listtext">
                                <div class="k-listtext_box">
                                    <span class="k-review-name">${result1[i].nickname}</span>
                                    <span class="k-review-stars">${stars}</span>
                                    <span class="k-review-starsnum">${result1[i].rating}</span>
                                    <span class="k-review-date">${dbDate}</span>
                                </div>
                                <div class="c-review-bottom-content">
                                    <p class="k-review-info">${result1[i].comments}</p>
                                    <div class="c-modi-reviewbox">
                                        <div class="c-mvrate">
                                            <div class="c-rate">
                                                <input type="radio" id="c-rating10${i}" name="c-rating${i}" value="10"  class="c-m-rating"  ><label for="c-rating10${i}" title="10점"></label>
                                                <input type="radio" id="c-rating9${i}" name="c-rating${i}" value="9"  class="c-m-rating"  ><label class="c-half" for="c-rating9${i}" title="9점"></label>
                                                <input type="radio" id="c-rating8${i}" name="c-rating${i}" value="8"  class="c-m-rating"  ><label for="c-rating8${i}" title="8점"></label>
                                                <input type="radio" id="c-rating7${i}" name="c-rating${i}" value="7"  class="c-m-rating"  ><label class="c-half" for="c-rating7${i}" title="7점" ></label>
                                                <input type="radio" id="c-rating6${i}" name="c-rating${i}" value="6"   class="c-m-rating" ><label for="c-rating6${i}" title="6점" ></label>
                                                <input type="radio" id="c-rating5${i}" name="c-rating${i}" value="5"  class="c-m-rating" ><label class="c-half" for="c-rating5${i}" title="5점" ></label>
                                                <input type="radio" id="c-rating4${i}" name="c-rating${i}" value="4"  class="c-m-rating" ><label for="c-rating4${i}" title="4점" ></label>
                                                <input type="radio" id="c-rating3${i}" name="c-rating${i}" value="3" class="c-m-rating"  ><label class="c-half" for="c-rating3${i}" title="3점" ></label>
                                                <input type="radio" id="c-rating2${i}" name="c-rating${i}" value="2"  class="c-m-rating" ><label for="c-rating2${i}" title="2점"></label>
                                                <input type="radio" id="c-rating1${i}" name="c-rating${i}" value="1"  class="c-m-rating" ><label class="c-half" for="c-rating1${i}" title="1점" ></label>
                                            </div>
                                            <span class="c-rating-number">${result1[i].rating}</span>
                                        </div>
                                        <textarea name="c-modi-review" class="c-modi-review" cols="30" rows="10">${result1[i].comments}</textarea>
                                        <div class="c-modi-btn">
                                            <a href="javascript:void(0);" class="c-modi-reset">취소</a>
                                            <a href="javascript:void(0);" class="c-modi-complete">수정완료</a>
                                        </div>
                                    </div>
                                    <div class="k-utilbox">
                                        <span class="k-like2 c-current-like ${active}">
                                            <input type="hidden" class="review-like" value="${likeCnt}" />                                                    
                                        </span>  
                                        <span class="c-current-like-num">${result1[i].likes}</span>
                                        <span class="k-declaration">
                                        ${utilBox}
                                        </span>
                                    </div> 
                                </div> 
                            </li>
                        </ul>
                    </div>
                </div>
                `)
                }
                if(allNum > 6){
                    btn[0].classList.add("c-review-active");
                    btn[1].classList.remove("c-review-active");
                }
                
            })
        })
    // 추천순
    }else if(e.target.classList.contains("k-score_2")){
        let insert = document.getElementsByClassName("k-reviewlist_all")[0];
        const btn = document.getElementsByClassName("k-list_btn");
        const allNum = document.getElementById("reviewAllNum").value;
        fetch("/ezenCine/ClickLikeOrder", {
            headers : {"Content-Type" : "application/json"},
            method : "post",
            body : JSON.stringify({
                movieid : movieid, isCurrent : 0
            })
        }).then((res) => res.json())
        .then((result1) => {
            fetch("/ezenCine/CheckLikeUser", {
                headers : {"Content-Type" : "application/json"},
                method : "post",
                body : JSON.stringify({
                movieid : movieid
                })
            }).then((res) => res.json())
            .then((result2) => {
                insert.innerHTML = "";
                const timezoneOffset = new Date().getTimezoneOffset() * 60000;
                const today = new Date(Date.now() - timezoneOffset).toISOString().substring(0, 10).replace(/-/g, ".");
                for(i = 0; i < result1.length; i++){
                    let likeCnt = 0;
                    for(j = 0; j < result2.length; j++){
                        if(result2[j].num == result1[i].num){
                            if(userid == result2[j].userid){
                                likeCnt = 1; 
                            }
                        }
                    }
                    let utilBox = `<ul class="c-review-cur-tooltip not-user">
                                <li><a href="javascript:void(0)">신고</a>
                                </li>
                            </ul>`;
                    if(userid == result1[i].userid){
                        utilBox = `<ul class="c-review-cur-tooltip">
                        <li><a href="javascript:void(0)" class="c-show-modi">수정</a></li>
                        <li><a href="javascript:void(0)" class="c-comment-del">삭제</a></li>
                    </ul>`
                    }
                    let active = ``;
                    if(likeCnt == 0){
                    }else if(likeCnt == 1){
                        active = `on`;
                    }
                    let img = `<img src='upload/users/${result1[i].photo}' alt='프로필'/> `;
                    if(result1[i].photo === undefined){
                        if(i % 2 == 0){
                            img = `<img src='images/icon/user/profile_dark.png' alt='프로필'/> `;
                        }else{
                            img = `<img src='images/icon/user/profile.png' alt='프로필'/> `;
                        }
                    }
                    let dbDate = result1[i].date.substring(0, 10).replace(/-/g, ".");
                    if(dbDate == today){
                        dbDate = `${result1[i].date.substring(10, 16)}`;
                    }
                    let fill = 0;
                    let half = 0;
                    let empty = 0;
                    if(result1[i].rating % 2 != 0){
                        fill = (result1[i].rating - 1) / 2;
                        half = 1;
                        empty = 5 - half - fill;
                    }else{
                        fill = result1[i].rating / 2;
				        empty = 5 - fill;
                    }
                    let stars = "";
                    if(fill == 0){
                        if(half == 0){
                            for(k = 0; k < empty; k++){
                                stars += `<img src="images/icon/inyoung/empty.png" alt="stars" />`;
                            }
                        }else{
                            stars += `<img src="images/icon/inyoung/half.png" alt="stars" />`;
                            for(k = 0; k < empty; k++){
                                stars += `<img src="images/icon/inyoung/empty.png" alt="stars" />`;
                            }
                        }
                    }else{
                        if(half == 0){
                            for(k = 0; k < fill; k++){
                                stars += `<img src="images/icon/inyoung/fill.png" alt="stars" />`;
                            }
                            for(k = 0; k < empty; k++){
                                stars += `<img src="images/icon/inyoung/empty.png" alt="stars" />`;
                            }
                        }else{
                            for(k = 0; k < fill; k++){
                                stars += `<img src="images/icon/inyoung/fill.png" alt="stars" />`;
                            }
                            stars += `<img src="images/icon/inyoung/half.png" alt="stars" />`;
                            for(k = 0; k < empty; k++){
                                stars += `<img src="images/icon/inyoung/empty.png" alt="stars" />`;
                            }
                        }
                    }
                    insert.insertAdjacentHTML("beforeend", `
                    <div class="k-reviewlist c-likelist">
                        <input type="hidden" value="${result1[i].num}"  class="c-current-num c-review-num"/>
                    <div class="k-listleft col-1">
                        <div class="c-list-img">
                            ${img}
                        </div>
                    </div>
                    <div class="k-listright col-11">
                        <ul id="k-listbox">
                            <li id="k-listtext">
                                <div class="k-listtext_box">
                                    <span class="k-review-name">${result1[i].nickname}</span>
                                    <span class="k-review-stars">${stars}</span>
                                    <span class="k-review-starsnum">${result1[i].rating}</span>
                                    <span class="k-review-date">${dbDate}</span>
                                </div>
                                <div class="c-review-bottom-content">
                                    <p class="k-review-info">${result1[i].comments}</p>
                                    <div class="c-modi-reviewbox">
                                        <div class="c-mvrate">
                                            <div class="c-rate">
                                                <input type="radio" id="c-rating10${i}" name="c-rating${i}" value="10"  class="c-m-rating"  ><label for="c-rating10${i}" title="10점"></label>
                                                <input type="radio" id="c-rating9${i}" name="c-rating${i}" value="9"  class="c-m-rating"  ><label class="c-half" for="c-rating9${i}" title="9점"></label>
                                                <input type="radio" id="c-rating8${i}" name="c-rating${i}" value="8" class="c-m-rating"  ><label for="c-rating8${i}" title="8점"></label>
                                                <input type="radio" id="c-rating7${i}" name="c-rating${i}" value="7" class="c-m-rating"  ><label class="c-half" for="c-rating7${i}" title="7점" ></label>
                                                <input type="radio" id="c-rating6${i}" name="c-rating${i}" value="6" class="c-m-rating"  ><label for="c-rating6${i}" title="6점"></label>
                                                <input type="radio" id="c-rating5${i}" name="c-rating${i}" value="5" class="c-m-rating"  ><label class="c-half" for="c-rating5${i}" title="5점"></label>
                                                <input type="radio" id="c-rating4${i}" name="c-rating${i}" value="4" class="c-m-rating"  ><label for="c-rating4${i}" title="4점"></label>
                                                <input type="radio" id="c-rating3${i}" name="c-rating${i}" value="3" class="c-m-rating"  ><label class="c-half" for="c-rating3${i}" title="3점"></label>
                                                <input type="radio" id="c-rating2${i}" name="c-rating${i}" value="2" class="c-m-rating"  ><label for="c-rating2${i}" title="2점"></label>
                                                <input type="radio" id="c-rating1${i}" name="c-rating${i}" value="1" class="c-m-rating"  ><label class="c-half" for="c-rating1${i}" title="1점"></label>
                                            </div>
                                            <span class="c-rating-number">${result1[i].rating}</span>
                                        </div>
                                        <textarea name="c-modi-review" class="c-modi-review" cols="30" rows="10">${result1[i].comments}</textarea>
                                        <div class="c-modi-btn">
                                            <a href="javascript:void(0);" class="c-modi-reset">취소</a>
                                            <a href="javascript:void(0);" class="c-modi-complete">수정완료</a>
                                        </div>
                                    </div>
                                    <div class="k-utilbox">
                                        <span class="k-like2 c-current-like ${active}">
                                            <input type="hidden" class="review-like" value="${likeCnt}" />                                                    
                                        </span>  
                                        <span class="c-current-like-num">${result1[i].likes}</span>
                                        <span class="k-declaration">
                                        ${utilBox}
                                        </span>
                                    </div> 
                                </div>    
                            </li>
                        </ul>
                    </div>
                </div>
                `)
                }
                if(allNum > 6){
                    btn[0].classList.remove("c-review-active");
                    btn[1].classList.add("c-review-active");
                }
                
            })
        })
    }
  });