$(function(){
	const count = $(".cdel").find("span");
	
	$(".check").click(function(){
		let check = $(".check");
		let dcost = parseInt($("#total_cost").val());
		let cost = parseInt($(this).parents(".tr").find(".dCost").val());
		let num = 0;
		for(let i = 0; i < check.length; i++){
			if(check[i].checked == true){
				++num;
			}
		}
		count.html(num);
		if(num == check.length){
			$(".checkAll").prop("checked", true);
		}else{
			$(".checkAll").prop("checked", false);
		}
		
		if($(this).is(":checked") == true){
			$("span.total_cost").html(makeComma(dcost + cost));
			$("#total_cost").val(dcost + cost);
		}else{
			$("span.total_cost").html(makeComma(dcost - cost));
			$("#total_cost").val(dcost - cost);
		}
	});

	$(".checkAll").click(function(){
		let cost = $(".dCost");
		if($(".checkAll").is(":checked") == true) {
			total = 0;
			$(".check").prop('checked', true);
			count.html($(".check").length);
			for(let i = 0; i < cost.size(); i++){
				total += parseInt(cost[i].value);
			}
			$("span.total_cost").html(makeComma(total));
			$("#total_cost").val(total);
		}else{
			$(".check").prop('checked', false);
			count.html(0);
			$("span.total_cost").html(makeComma(0));
			$("#total_cost").val(0);
		}
	});
});

//스토어 페이지
$(document).on("click", ".getCart", function(){
		const list = $(this).parents(".item");
        const itemnum = list.find(".num").val();
		const count = list.find(".hcount").val();
		const title = list.find(".stitle").html();
		const cost = list.find(".cost").val();
		const cCost = $("#list_total_cost");
		const total = $("#list_total");
		const cart_listbox = $(".cart_listbox");
		const cart = $(".store_cart");
		const val = list.find(".cartget");
		const box = `<div class="cart_list">
						<p><span id="ctitle">${title}</span><span class="total_cost"><span class="total">${makeComma(cost)}</span>원</span></p>
						<input type="hidden" class="dCost" name="dCost" value="${cost}">
						<div class="count_box">
							<input type="number" class="count" name="count" min="1" max="9" value="${count}" readonly>
							<input type="hidden" class="itemnum" name="itemnum" value="${itemnum}">
							<a class="count_btn countUp"></a>
							<a class="count_btn countDown"></a>
							<a href="javascript:void(0)" class="cart_list_close delete"></a>
						</div>
					</div>`;
		
		let totalcost = parseInt(total.val());
		totalcost += parseInt(cost);
		
		if(val.val() == 1){
			cartAlready();
		}else{
			val.val(1);
			$.ajax({
			    url: "/ezenCine/StoreCart",
			    type: "post",
			    data : {
					itemnum : itemnum,
					count : count
				},
			    success: function(result) {
			       	if(result == 0){
			       		alert("장바구니 등록을 실패했습니다");
			       	}else{
						if(cart.hasClass("d-none")){
							cart.removeClass("d-none");
							cart.html(`
							<h4 class="cart_title">담은 품목</h4>
									<div class="cartbox">
										<div class="cart_listbox">
											<div class="cart_list">
												<p><span id="ctitle">${title}</span><span class="total_cost"><span class="total">${makeComma(cost)}</span>원</span></p>
												<input type="hidden" class="dCost" name="dCost" value="${cost}">
												<div class="count_box">
													<input type="number" class="count" name="count" min="1" max="9" value="${count}" readonly>
													<input type="hidden" class="itemnum" name="itemnum" value="${itemnum}">
													<a class="count_btn countUp"></a>
													<a class="count_btn countDown"></a>
													<a href="javascript:void(0)" class="cart_list_close delete"></a>
												</div>
											</div>
										</div>
									</div>
									<div class="cart_total">
										<p>총 상품 금액<span class="list_total_cost"><span id="list_total_cost">${makeComma(cost)}</span>원</span></p>
										<input type="hidden" id="list_total" name="list_total" value="${cost}">
									</div>
									<a href="index.jsp?fname=store/storePay" class="pay_btn" id="topay"></a>
							`);
						}else{
							cart_listbox.append(box);
							cCost.html(makeComma(totalcost));
							total.val(totalcost);
						}
			       	}
			    }
			});
		}
});
$(document).on("click", ".delete", function(){
		const list = $(this).parents(".cart_list");
        const itemnum = list.find(".itemnum").val();
		const cost = list.find(".dCost").val();
		const cCost = $("#list_total_cost");
		const total = $("#list_total");
		const cart = $(".store_cart");
		const item = $(".item."+itemnum);
		const val = item.find(".cartget");

		let totalcost = parseInt(total.val());
		totalcost -= parseInt(cost);

		$.ajax({
			url: "/ezenCine/StoreCartDelete",
			type: "post",
			data : {
				itemnum : itemnum,
			},
			success: function(result) {
					if(result != 0){
						list.css({"display" : "none"});
						cCost.html(makeComma(totalcost));
						total.val(totalcost);
						if(total.val() == 0){
							cart.addClass("d-none");
						}
						val.val(0);
					}
			}
		});
});

function cartAlready(){
	alert("이미 장바구니에 있습니다.");
}

$(document).on("click", ".countUp", function(){
	const list = $(this).parents(".cart_list");
	const count = list.find(".count");
	const num = list.find(".itemnum");
	const dCost = list.find(".dCost");
	const cart = list.parents(".store_cart");
	const total = cart.find("#list_total_cost");
	const listTotal = cart.find("#list_total");
	
	const item = $(".item."+num.val());
	const price = item.find(".cost").val();
	console.log(price);
	
	let tResult = parseInt(listTotal.val());
	let rs = count.val();
	if(rs < 9){		
		rs++;
		count.val(rs);
    	let cResult = rs * parseInt(price);
		tResult += parseInt(price);
		
		$.ajax({
			url: "/ezenCine/StoreCartUpdate",
			type: "post",
			data : {
				itemnum : num.val(),
				count : count.val()
			},
			success: function(result) {
				if(result == 0){
					alert("장바구니 업데이트를 실패했습니다");
				}else{
						list.find(".total").html(makeComma(cResult));
						dCost.val(cResult);
						total.html(makeComma(tResult));
						listTotal.val(tResult);
	               	}
	            }
	        });
	
	}
});

$(document).on("click", ".countDown", function(){
	const list = $(this).parents(".cart_list");
	const count = list.find(".count");
	const num = list.find(".itemnum");
	const dCost = list.find(".dCost");
	const cart = list.parents(".store_cart");
	const total = cart.find("#list_total_cost");
	const listTotal = cart.find("#list_total");
	let tResult = parseInt(listTotal.val());
	let rs = count.val();

	const item = $(".item."+num.val());
	const price = item.find(".cost").val();
	
	if(rs > 1){		
		rs--;
		count.val(rs);
    	let cResult = rs * parseInt(price);
		tResult -= parseInt(price);
		
		$.ajax({
			url: "/ezenCine/StoreCartUpdate",
			type: "post",
			data : {
				itemnum : num.val(),
				count : count.val()
			},
			success: function(result) {
				if(result == 0){
					alert("장바구니 업데이트를 실패했습니다");
				}else{
						list.find(".total").html(makeComma(cResult));
						dCost.val(cResult);
						total.html(makeComma(tResult));
						listTotal.val(tResult);
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
	const num = detail.find(".num").val();
	let cost = detail.find("#cost");
	const dCost = detail.find("#dCost").val();
	let rs = count.val();
	const userid = detail.find("#userid").val();
	const exist = detail.find("#exist").val();
	if(rs < 9){		
		rs++;
    	const cResult = rs * dCost;
		count.val(rs);
		cost.html(makeComma(cResult));
		if(userid != null && userid != "" && exist != "no"){
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
						cost.html(makeComma(cResult));
					   }
				}
			});
		}
	}
});
//카운트 down
$(document).on("click", ".countbtn.down", function(){
	let detail = $(this).parents(".sd_detail");
	let count = detail.find("#count");
	const num = detail.find(".num").val();
	let cost = detail.find("#cost");
	const dCost = detail.find("#dCost").val();
	let rs = count.val();
	const userid = detail.find("#userid").val();
	const exist = detail.find("#exist").val();
	if(rs > 1){		
		rs--;
    	const cResult = rs * dCost;
		count.val(rs);
		cost.html(makeComma(cResult));
		if(userid != null && userid != "" && exist != "no"){
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
						cost.html(makeComma(cResult));
					   }
				}
			});
		}
	}
});
$(document).on("click", ".getCartDetail", function(){
		const list = $(this).parents(".item");
        const itemnum = list.find(".num").val();
		const count = list.find(".hcount").val();
		console.log(itemnum);
		console.log(count);
		
			$.ajax({
			    url: "/ezenCine/StoreCart",
			    type: "post",
			    data : {
					itemnum : itemnum,
					count : count
				},
			    success: function(result) {
			       	if(result == 0){
			       		alert("장바구니 등록을 실패했습니다");
			       	}else{
			       		alert("장바구니에 등록했습니다");						   
						window.location.href = `index.jsp?fname=store/store`;
			       	}
			    }
			});
});
$(document).on("click", "#topay", function(){
		let list = $(this).parents(".store_detail");
        let num = list.find(".num").val();
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
	let count = tr.find(".ct");
	const num = tr.find(".itemnum").val();
	let cost = tr.find(".costs");
	const dCost = tr.find(".dCost");
	let rs = count.val();
	let check = tr.find(".check");
	let ctotal = $("span.total_cost");
	let dtotal = $("#total_cost");

	if(rs < 9){
		let plus = (dCost.val() / rs);
		rs++;
    	const cResult = parseInt(dCost.val()) + plus;
		count.val(rs);
		dCost.val(cResult);
		dtotal.val(parseInt(dtotal.val()) + plus);
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
					   cost.html(makeComma(cResult));
					   if(check.is(":checked")){
						ctotal.html(makeComma(parseInt(dtotal.val())));
					   }
				   }
			}
		});
	}
});
//카운트 down
$(document).on("click", ".count.down", function(){
	let tr = $(this).parents(".tr");
	let count = tr.find(".ct");
	const num = tr.find(".itemnum").val();
	let cost = tr.find(".costs");
	const dCost = tr.find(".dCost");
	let rs = count.val();
	let check = tr.find(".check");
	let ctotal = $("span.total_cost");
	let dtotal = $("#total_cost");

	if(rs > 1){
		let minus = (dCost.val() / rs);
		rs--;
    	const cResult = dCost.val() - minus;
		count.val(rs);
		dCost.val(cResult);
		dtotal.val(dtotal.val() - minus);
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
					   cost.html(makeComma(cResult));
					   if(check.is(":checked")){
							ctotal.html(makeComma(dtotal.val()));
					   }
				   }
			}
		});
	}
});

//결제페이지 목록 삭제
$(document).on("click", ".list_delete", function(){
	const list = $(this).parents(".tr");
	const check = list.find(".check");
	const count = $(".cdel").find("span");
	const cost = list.find(".dCost");
	const total = $("#total_cost");
	const totalcost = $("span.total_cost");
	const itemnum = list.find(".itemnum").val();
	const size = parseInt($(".tbody .tr").size());
	let num = size;
	num -= 1;

	$.ajax({
		url: "/ezenCine/StoreCartDelete",
		type: "post",
		data : {
			itemnum : itemnum,
		},
		success: function(result) {
				if(result != 0){
					if(num > 0){
						if(check.is(":checked")){
							check.prop('checked', false)
							count.html(count.html() - 1);
							total.val(total.val() - cost.val());
							totalcost.html(makeComma(total.val()));
						}
						list.css({"display" : "none"});
					}else{
						window.location.href = `index.jsp?fname=store/store`;	
					}
				}
		}
	});
});

//결제하기
$(document).on("click", "#buy_btn", function(){
	const inner = $(this).parents(".inner");
	const check = inner.find(".check")
	const itemnum = $(".itemnum");
	const costAll = $(".dCost");
	const countAll = $(".ct");
	let items = "";
	let cost = "";
	let count = "";
	for(let i = 0; i < itemnum.length; i++){
		if(check[i].checked){
			items += itemnum[i].value + ",";
			cost += costAll[i].value + ",";
			count += countAll[i].value + ",";
		}
	}
	items = items.substring(0, items.length - 1);
	cost = cost.substring(0, cost.length - 1)
	count = count.substring(0, count.length - 1);
	if(items != ""){
		$.ajax({
			url: "/ezenCine/Pay",
			type: "post",
			data : {
				items : items,
				cost: cost,
				count: count
			},
			success: function(result) {
				   if(result != 0){
						alert("결제가 완료되었습니다.");
					   window.location.href = `index.jsp?fname=store/store`;				
					}
				}
			});
	}
});

//선택 삭제
$(document).on("click", ".cdel", function(){
	let list = $(".check");
	
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
					   for(let i = 0; i < list.size(); i++){
						   if(list[i].checked){
								$(`.tr.${i}`).css({"display" : "none"});
								$("span.total_cost").html(makeComma(0));
								$("#total_cost").val(0);
								$(".cdel").find("span").html("0");
							}
						}
						list.prop("checked", false);
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