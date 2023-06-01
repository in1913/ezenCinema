$(document).ready(function(){
        let strYear = "";
        strYear += `<select name="year" id="year" class="year">`;
        strYear += `<option value="">년</option>`;
        for(i = 2002; i > 1910; i--){
            strYear +=  `<option value="${i}">${i}</option>`;
        }
        strYear += `</select>`;
        document.getElementsByClassName("c-year")[0].innerHTML = strYear;
    
        let strMonth = "";
        strMonth += `<select name="month" id="month" class="month" onchange="cgetDate();">`;
        strMonth += `<option value="">월</option>`;
        for(i = 1; i < 10; i++){
            strMonth +=  `<option value="0${i}">${i}</option>`;
        }
        for(i = 10; i < 13; i++){
            strMonth +=  `<option value="${i}">${i}</option>`;
        }
        strMonth += `</select>`;
        document.getElementsByClassName("c-month")[0].innerHTML = strMonth;
    })