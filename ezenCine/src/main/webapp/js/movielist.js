
const SearchBox = document.querySelector(".h-movie-search-box");
const movieList = document.querySelector(".h-movie-list");
const SearchBoxHeight = SearchBox.offsetTop;
const movieListHight = movieList.offsetTop;
/*
console.log(movieListHight);
*/

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
  /*
  console.log(scroll);
  console.log(movieHeight);
  console.log(upcomingHeight);
  console.log(navTopHeight);
  console.log(animationHeight);
  */

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

/*************** movieList Choi in young ***************** */

var movielist = [];
var movielistData = [];
var movielistHref = [];
$(document).ready(function(){
  fetch("/ezenCine/GetMovieList", {
    headers : {"Content-Type" : "application/json"},
    method : "get"
  }).then((res) => res.json())
  .then((result) => {
    let titles = "";
    let titlesData = "";
    for(i = 0; i < result.length; i++){
      titles = result[i].title + " (" + result[i].title_eng + ")";
      titlesData = result[i].title + " (" + result[i].title_eng.toLowerCase() + ")";
      movielist.push(titles);
      movielistData.push(titlesData);
      movielistHref.push(result[i].id);
    }
  });
});

function cSearchMovie(){
  let search = document.getElementById("h-movie-search");
  let searchbox = document.getElementsByClassName("c-search-complete")[0];
  searchbox.style.display = "block";
  searchbox.innerHTML = "";
  search.style.borderBottomLeftRadius = "25px";
  search.style.borderBottomRightRadius = "25px";
  if(search.value == ""){
    searchbox.innerHTML = "";
    searchbox.style.display = "none";
    search.style.borderBottomLeftRadius = "25px";
    search.style.borderBottomRightRadius = "25px";
  }else{
    let j = 0;
    for(i = 0; i < movielist.length / 2; i++){
      let word_start = movielistData[i].search(search.value.toLowerCase());
      let word_end = search.value.length;
      
      if(word_start != -1){
        search.style.borderBottomLeftRadius = "0px";
        search.style.borderBottomRightRadius = "0px";
        searchbox.insertAdjacentHTML("beforeend", `
        <li class="c-search-content" onmouseover="cHoverInput(${i});">
          <a class="c-search-link" onfocus="cSearchLink(${j});" onfocusout="cSearchNotLink(${j})" href="index.jsp?fname=movie/movieDetail&mov_id=${movielistHref[i]}">${movielist[i].substring(0, word_start)}<span class="c-search-color">${movielist[i].substring(word_start, word_start + word_end)}</span>${movielist[i].substring(word_start + word_end)}
          </a>
        </li>
        `);
        j++;
      }else{
      } 
    }  
  }
}

function cSearchLink(n){
  const searchContent = document.getElementsByClassName("c-search-content")[n];
  searchContent.style.backgroundColor = "#ccc";
}
function cSearchNotLink(n){
  const searchContent = document.getElementsByClassName("c-search-content")[n];
  searchContent.style.backgroundColor = "#fff";
}

function cHoverInput(n){
  let search = document.getElementById("h-movie-search");
  search.value = movielist[n]; 
}

function cGoMovie(){
  const searchInput = document.getElementById("h-movie-search");

  let result = "";
  for(i = 0; i < movielist.length / 2; i++){
    if(movielist[i] == searchInput.value){
      result = movielistHref[i];
      location.href = "index.jsp?fname=movie/movieDetail&mov_id=" + result;
    }
  }
  // 
}

const searchInput = document.querySelector("#h-movie-search");

searchInput.addEventListener("keyup", function(e){
  let nowIndex = 0;
  if(e.keyCode == 40){
    nowIndex = Math.min(nowIndex + 1, (movielist.length / 2) - 1);
  }else if(e.keyCode == 38){
    nowIndex = Math.max(nowIndex - 1, 0);
  }else{
    nowIndex = 0;
  }
})



/*
$search.onkeyup = (event) => {
  // 검색어
  const value = $search.value.trim();
   $autoComplete.style.display = "block";
   if($search.value == null || $search.value == ""){$autoComplete.style.display = "none";}
  // 자동완성 필터링
  const matchDataList = value
    ? movielist.filter((label) => label.includes(value))
    : [];

  switch (event.keyCode) {
    // UP KEY
    case 38:
      nowIndex = Math.max(nowIndex - 1, 0);
      break;

    // DOWN KEY
    case 40:
      nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
      break;

    // ENTER KEY
    case 13:{
      document.querySelector("#header-search").value = matchDataList[nowIndex] || "";
      $autoComplete.style.display = "none";
   }
      // 초기화
      nowIndex = 0;
      matchDataList.length = 0;
      break;
      
    // 그외 다시 초기화
    default:
      nowIndex = 0;
      break;
  }

  // 리스트 보여주기
  showList(matchDataList, value, nowIndex, movietitle);
};
*/