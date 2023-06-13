
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
  search.style.borderBottomLeftRadius = "18px";
  search.style.borderBottomRightRadius = "18px";
  if(search.value == ""){
    searchbox.innerHTML = "";
    searchbox.style.display = "none";
    search.style.borderBottomLeftRadius = "18px";
    search.style.borderBottomRightRadius = "18px";
  }else{
    
    let j = 0;
    for(i = 0; i < movielist.length; i++){
      let word_start = movielistData[i].search(search.value.toLowerCase());
      let word_end = search.value.length;
      if(word_start != -1){
        search.style.borderBottomLeftRadius = "0px";
        search.style.borderBottomRightRadius = "0px";
        searchbox.insertAdjacentHTML("beforeend", `
        <li class="c-search-content"><a class="c-search-link" onfocus="cSearchLink(${j});" onfocusout="cSearchNotLink(${j})" href="index.jsp?fname=movie/movieDetail&mov_id=${movielistHref[i]}">${movielist[i].substring(0, word_start)}<span class="c-search-color">${movielist[i].substring(word_start, word_start + word_end)}</span>${movielist[i].substring(word_start + word_end)}</a></li>
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

const cSearchInput = document.querySelector("#h-movie-search");
cSearchInput.addEventListener('keydown', (e) => {
  
  const searchbox = document.getElementsByClassName("c-search-complete")[0];
  if(searchbox.firstChild){
    const searchContent = document.getElementsByClassName("c-search-content");
    const searchLink = document.getElementsByClassName("c-search-link");
// down 40, up 38, left 37, right 39
// tab 9,
  if(e.keyCode == 40){
    
  }
  
  }
  
})