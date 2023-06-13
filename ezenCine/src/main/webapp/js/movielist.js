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
  searchbox.innerHTML = "";
  if(search.value == ""){
    searchbox.innerHTML = "";
  }else{
    let j = 0;
    for(i = 0; i < movielist.length; i++){
      let word_start = movielistData[i].search(search.value.toLowerCase());
      let word_end = search.value.length;
      if(word_start != -1){
        searchbox.insertAdjacentHTML("beforeend", `
        <li class="c-search-content"><a class="c-search-link" onfocus="cSearchLink(${j});" onfocusout="cSearchNotLink(${j})" href="index.jsp?fname=movie/movieDetail&mov_id=${movielistHref[i]}">${movielist[i].substring(0, word_start)}<span class="c-search-color">${movielist[i].substring(word_start, word_start + word_end)}</span>${movielist[i].substring(word_start + word_end)}</a></li>
        `)
        j++;
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
    let contentLength = searchContent.length;
// down 40, up 38, left 37, right 39
// tab 9,
    
    if(e.keyCode == 40){
      for(let i = 0 ; i < contentLength ; i++){
        searchContent[i].focus();
        console.log(searchContent[i].innerHTML);
      }
    }
  
  }
  
})