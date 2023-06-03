/**
 * 
 */
 
let day = dayjs();
let ddd = "";
const dateSlide = document.getElementById('dateSlide');
for(let i = -3 ; i <= 30 ; i++){
    ddd = (day.add(i,"day").$d).toString();
    let dt = parseInt(ddd.slice(8,10))
    
    dateSlide.innerHTML 
        += `<div class="date">
                <p class="datenum">${dt}</p>
                <span class="day">${ddd.slice(0,3)}</span>
            </div>`;
}


let ps = 0;
const dateSlidePrev = () => {
    ps = dateSlide.offsetLeft;
    if(ps < 0){
        ps += 100;
        dateSlide.style.left = ps + "px";
    }
    console.log(ps);
}
const dateSlideNext = () => {
    ps = dateSlide.offsetLeft;
    if(ps > -1500){
        ps -= 100;
        dateSlide.style.left = ps + "px";
    }
    
    console.log(ps);
}

 