$(function(){
	$(".checkAll").click(function(){
		if($(".checkAll").is(":checked") == true) {
			$(".check").prop('checked', true);
		}else{
			$(".check").prop('checked', false);
		}
	});
	$(".check").click(function(){
		let check = $(".check");
		let num = 0;
		for(let i = 0; i < check.length; i++){
			if(check[i].checked == true){
				++num;
			}
		}
		console.log(num);
		console.log(check.length);
		if(num == check.length){
			$(".checkAll").prop("checked", true);
		}else{
			$(".checkAll").prop("checked", false);
		}
	});
});

//스토어 페이지
$(document).on("click", "#cart", function(){
		let list = $(this).parents("#item");
        let num = list.find("#num").val();
		let count = list.find("#count").val();

		$.ajax({
            url: "/ezenCine/StoreCart",
            type: "post",
            data : {
				itemnum : num,
				count : count
			},
            success: function(result) {
               	if(result == 0){
               		alert("장바구니 등록을 실패했습니다");
               	}else{
               		alert("장바구니에 등록했습니다.");
               		window.location.href = `index.jsp?fname=store/store`;
               	}
            }
        });
});
$(document).on("click", "#delete", function(){
		let list = $(this).parents(".cart_list");
        let itemnum = list.find(".itemnum").val();

		$.ajax({
            url: "/ezenCine/StoreCartDelete",
            type: "post",
            data : {
				itemnum : itemnum,
			},
            success: function(result) {
               	if(result != 0){
               		window.location.href = `index.jsp?fname=store/store`;					
               	}
            }
        });
});

function cartAlready(){
	alert("이미 장바구니에 있습니다.");
}

$(document).on("click", ".countUp", function(){
	let list = $(this).parents(".cart_list");
	let count = list.find(".count");
	let num = list.find(".itemnum").val();
	const dCost = list.find(".dCost").val();
	let cart = list.parents(".store_cart");
	let total = cart.find("#list_total_cost");
	let listTotal = cart.find("#list_total");
	let tResult = parseInt(listTotal.val());
	let rs = count.val();
	if(rs < 9){		
		rs++;
		count.val(rs);
    	const cResult = rs * dCost;
	    list.find("#total_cost").html(makeComma(cResult));
		tResult += parseInt(dCost);
		listTotal.val(tResult);
		total.html(makeComma(tResult));
		$.ajax({
	            url: "/ezenCine/StoreCartUpdate",
	            type: "post",
	            data : {
					itemnum : num,
					count : count.val()
				},
	            success: function(result) {
	               	if(result == 0){
	               		alert("장바구니 업데이트를 실패했습니다");
	               	}else{
	               		window.location.href = `index.jsp?fname=store/store`;
	               	}
	            }
	        });
	}
});

$(document).on("click", ".countDown", function(){
	let list = $(this).parents(".cart_list");
	let count = list.find(".count");
	let num = list.find(".itemnum").val();
	const dCost = list.find(".dCost").val();
	let cart = list.parents(".store_cart");
	let total = cart.find("#list_total_cost");
	let listTotal = cart.find("#list_total");
	let tResult = parseInt(listTotal.val());
	let rs = count.val();
	
	if(rs > 1){		
		rs--;
		count.val(rs);
    	const cResult = rs * dCost;
	    list.find("#total_cost").html(makeComma(cResult));
		tResult -= parseInt(dCost);
		listTotal.val(tResult);
		total.html(makeComma(tResult));
		$.ajax({
	            url: "/ezenCine/StoreCartUpdate",
	            type: "post",
	            data : {
					itemnum : num,
					count : count.val()
				},
	            success: function(result) {
	               	if(result == 0){
	               		alert("장바구니 업데이트를 실패했습니다");
	               	}else{
	               		window.location.href = `index.jsp?fname=store/store`;
	               	}
	            }
	        });
	}
});

//스토어 디테일 페이지
//카운트 업
$(document).on("click", ".countbtn.up", function(){
	let detail = $(this).parents(".sd_detail");
	let count = detail.find("#count");
	const num = detail.find("#num").val();
	let cost = detail.find("#cost");
	const dCost = detail.find("#dCost").val();
	let rs = count.val();
	if(rs < 9){		
		rs++;
		count.val(rs);
    	const cResult = rs * dCost;
	    cost.html(makeComma(cResult));

		$.ajax({
			url: "/ezenCine/StoreCartUpdate",
			type: "post",
			data : {
				itemnum : num,
				count : count.val()
			},
			success: function(result) {
				   if(result == 0){
					   alert("장바구니 업데이트를 실패했습니다");
				   }else{
					   window.location.href = `index.jsp?fname=store/storeDetail&num=`+num;
				   }
			}
		});
	}
});
//카운트 down
$(document).on("click", ".countbtn.down", function(){
	let detail = $(this).parents(".sd_detail");
	let count = detail.find("#count");
	const num = detail.find("#num").val();
	let cost = detail.find("#cost");
	const dCost = detail.find("#dCost").val();
	let rs = count.val();
	if(rs > 1){		
		rs--;
		count.val(rs);
    	const cResult = rs * dCost;
	    cost.html(makeComma(cResult));

		$.ajax({
			url: "/ezenCine/StoreCartUpdate",
			type: "post",
			data : {
				itemnum : num,
				count : count.val()
			},
			success: function(result) {
				   if(result == 0){
					   alert("장바구니 업데이트를 실패했습니다");
				   }else{
					   window.location.href = `index.jsp?fname=store/storeDetail&num=`+num;
				   }
			}
		});
	}
});

$(document).on("click", "#topay", function(){
		let list = $(this).parents(".store_detail");
        let num = list.find("#num").val();
		let count = list.find("#count").val();

		$.ajax({
            url: "/ezenCine/StoreCart",
            type: "post",
            data : {
				itemnum : num,
				count : count
			},
            success: function(result) {
               	if(result == 1){
               		window.location.href = `index.jsp?fname=store/storePay`;
               	}
            }
        });
});


//결제 페이지
//카운트 up
$(document).on("click", ".count.up", function(){
	let tr = $(this).parents(".tr");
	let count = tr.find("#count");
	const num = tr.find(".itemnum").val();
	let cost = tr.find("#cost");
	const dCost = tr.find(".dCost").val();
	let pay = tr.parents(".store_pay");
	let total = pay.find("span.total_cost");
	let payTotal = pay.find("#total_cost");
	let tResult = parseInt(payTotal.val());
	let rs = count.val();
	if(rs < 9){		
		rs++;
		count.val(rs);
    	const cResult = rs * dCost;
	    cost.html(makeComma(cResult));
		tResult += parseInt(dCost);
		payTotal.val(tResult);
		total.html(makeComma(tResult));

		$.ajax({
			url: "/ezenCine/StoreCartUpdate",
			type: "post",
			data : {
				itemnum : num,
				count : count.val()
			},
			success: function(result) {
				   if(result == 0){
					   alert("장바구니 업데이트를 실패했습니다");
				   }else{
					   window.location.href = `index.jsp?fname=store/storePay`;
				   }
			}
		});
	}
});
//카운트 down
$(document).on("click", ".count.down", function(){
	let tr = $(this).parents(".tr");
	let count = tr.find("#count");
	const num = tr.find(".itemnum").val();
	let cost = tr.find("#cost");
	const dCost = tr.find(".dCost").val();
	let pay = tr.parents(".store_pay");
	let total = pay.find("span.total_cost");
	let payTotal = pay.find("#total_cost");
	let tResult = parseInt(payTotal.val());
	let rs = count.val();
	if(rs > 1){		
		rs--;
		count.val(rs);
    	const cResult = rs * dCost;
	    cost.html(makeComma(cResult));
		tResult -= parseInt(dCost);
		payTotal.val(tResult);
		total.html(makeComma(tResult));

		$.ajax({
			url: "/ezenCine/StoreCartUpdate",
			type: "post",
			data : {
				itemnum : num,
				count : count.val()
			},
			success: function(result) {
				   if(result == 0){
					   alert("장바구니 업데이트를 실패했습니다");
				   }else{
					   window.location.href = `index.jsp?fname=store/storePay`;
				   }
			}
		});
	}
});

//결제페이지 목록 삭제
$(document).on("click", "#list_delete", function(){
	let list = $(this).parents(".tr");
	let itemnum = list.find(".itemnum").val();

	$.ajax({
		url: "/ezenCine/StoreCartDelete",
		type: "post",
		data : {
			itemnum : itemnum,
		},
		success: function(result) {
			   if(result != 0){
				   window.location.href = `index.jsp?fname=store/storePay`;					
			   }
		}
	});
});

//결제하기
$(document).on("click", "#buy_btn", function(){
	const items = $("#items").val();
	const totalcost = $("#total_cost").val()
	console.log(totalcost);
	$.ajax({
		url: "/ezenCine/Pay",
		type: "post",
		data : {
			items : items,
			totalcost: totalcost
		},
		success: function(result) {
			   if(result != 0){
					alert("결제가 완료되었습니다.");
				   window.location.href = `index.jsp?fname=store/store`;				
				}
			}
		});
});

//선택 삭제
$(document).on("click", ".cdel", function(){
	let snum = "";
	let num = 0;
	const checkbox = $(this).parents(".store_pay").find(".check");
	const itemnum = $(this).parents(".store_pay").find(".itemnum");
	for(let i = 0; i < checkbox.length; i++){
		if(checkbox[i].checked == true){
			snum += itemnum[i].value + ",";
			num += 1;
		}
	}

	if(num > 0 && checkbox.length > num){
		$.ajax({
			url: "/ezenCine/PayDelete",
			type: "post",
			data : {
				itemnum : snum,
			},
			success: function(result) {
				   if(result != 0){
					   window.location.href = `index.jsp?fname=store/storePay`;					
				   }
			}
		});
	}else if(num > 0 && checkbox.length <= num){
		$.ajax({
			url: "/ezenCine/PayDelete",
			type: "post",
			data : {
				itemnum : snum,
			},
			success: function(result) {
				   if(result != 0){
					   window.location.href = `index.jsp?fname=store/store`;					
				   }
			}
		});
	}
});

// 금액 표현
function makeComma(str) {
   str = String(str);
   return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}