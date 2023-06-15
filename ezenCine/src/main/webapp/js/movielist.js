/*************** movieList Choi in young ***************** */

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
      
        for(i = 0; i < movielist.length; i++){
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
    for(i = 0; i < movielist.length; i++){
        if(movielist[i] == searchInput.value){
            result = movielistHref[i];
            location.href = "index.jsp?fname=movie/movieDetail&mov_id=" + result;
        }
    }
  // 
}