var initReview = "";
document.addEventListener("click", function(e){
    let reviewAllnum = document.getElementById("review-all-num");
    // 마이페이지 리뷰 삭제
    if(e.target.classList.contains("c-mypage-del")){
        const num = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-mypage-review-modi-num").value;
        const movieid = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-mypage-review-modi-mov-id").value;
        const reviewbox = e.target.closest(".c-mypage-review-num");
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
                    reviewbox.style.display = "none";
                    reviewAllnum.value = Number(reviewAllnum.value) - 1;
                }else{
                }
            })
        }

    // 수정 팝업 보이기
    }else if(e.target.classList.contains("c-mypage-modi")){
        const popup = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-mypage-modi-popup-shadow");
        popup.style.display = "block";

        const modiReview = e.target.closest(".c-mypage-review-num")
        .querySelector(".c-mypage-textarea");

        initReview = modiReview.value;

        const rating = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-mypage-popup-rate");
        const radioRate = e.target.closest(".c-mypage-review-num")
            .querySelectorAll(".c-rating")[10 - Number(rating.innerText)];
        radioRate.checked = true;

    // 수정 팝업 닫기
    }else if(e.target.classList.contains("c-mypage-popup-close")){
        const popup = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-mypage-modi-popup-shadow");

        const modiReview = e.target.closest(".c-mypage-review-num")
        .querySelector(".c-mypage-textarea");
        modiReview.value = initReview;

        initReview = modiReview.value;
        
        popup.style.display = "none";

    }else if(e.target.classList.contains("c-mypage-popup-review-send")){
        const num = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-mypage-review-modi-num").value;
        const movieid = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-mypage-review-modi-mov-id").value;
        const review = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-mypage-textarea").value;
        const rating = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-mypage-popup-rate").innerText;
        let ratingBox = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-score");
        const popup = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-mypage-modi-popup-shadow");
        const modireview = e.target.closest(".c-mypage-review-num")
            .querySelector(".c-comment");
        fetch("/ezenCine/ReviewModi", {
            headers : {"Content-Type": "application/json"},
            method : "post",
            body : JSON.stringify({
                reviews_num : num, movie_id : movieid, review : review, rating: rating
            })
        }).then((res) => res.json())
        .then((result) => {
            if(result == 1){
                ratingBox.innerHTML = rating;
                modireview.innerHTML = review;
                popup.style.display = "none";
            }
        })
        
    }
})