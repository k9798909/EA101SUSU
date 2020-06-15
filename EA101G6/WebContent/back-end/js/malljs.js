//讀檔的全域變數
var reader = new FileReader();

function showupdate() {
	$("#comm").css({
		"opacity" : "0.5"
	});
	$("#updateDiv").slideDown();
	$("#comm td div").off();
	$("#create-user").text("修改商品");
	$("#create-user").attr("disabled", true);
}

$(document).ready(function() {
	// 新增的按鈕
	$("#create-user").click(function() {
		$("#comm").css({
			"opacity" : "0.5"
		});
		console.log($("#addDiv .showimg"));
		$("#addDiv").slideDown();
		$("#addDiv .showimg").append("<img>");
		$("#create-user").attr('disabled', true);
		$("#comm td div").off();
	});

	// 預覽圖片function
	$("#addDiv .upload").change(function() {
		let myfile = this.files;
		// 獨到檔案啟動
		$(reader).on("load", function(e) {
			// img屬性
			$("#addDiv .showimg img").css({
				"width" : "250",
				"height" : "250px"
			});
			// 設img src
			$("#addDiv .showimg img").attr("src", e.target.result);
		});
		// 讀檔
		reader.readAsDataURL(myfile[0]);
	});

	$("#addDiv .cancel").click(function() {
		// 當開啟時移動最上方
		$("#addDiv, #addDiv form").animate({
			scrollTop : 0
		}, "fast");
		// 收起
		$("#addDiv").slideUp();
		// 清空屬性
		$(".text").val("");
		$(".other input").val("");
		$(".other select").val("0");
		$("#addDiv .showimg img").remove();
		// 停用預覽文字事件
		$("#create-user").attr('disabled', false);
		// 設透明度
		$("#comm").css({
			"opacity" : "1"
		});
		// 啟動事件
		setTimeout(hov, 500);
		$(".erroMsg").remove();
	})
	hov();
	// 預覽事件
	function hov() {
		$("#comm td div").hover(function() {
			$(this).css({
				"color" : "blue"
			});
			$("#comm").css({
				"opacity" : "0.3"
			});
			let intro = document.createElement("div");
			$(intro).attr({
				"id" : "introshow",
			});
			$(intro).text($(this).text());
			$(intro).css({
				"position" : "absolute",
				"width" : "200px",
				"top" : "30%",
				"background-color" : "#ffffff",
				"word-break" : "break-all",
				"word-wrap" : "break-word",
				"margin-left" : "-100px",
				"font-size" : "24px",
				"left" : "50%",
				"color" : "#000000",
			});
			$("body").append(intro);
		}, function() {
			$(this).css({
				"color" : "block"
			});
			$("#comm").css({
				"opacity" : "1"
			});
			$(this).css({
				"color" : "#000000"
			});
			$("#introshow").remove();

		})
	}

	$("#addDiv .addtypebtn").click(function() {
		let gmtype = $("#addDiv .gmtype")[0];
		let clone = $(gmtype).clone();
		$(clone).css({
			"margin" : "0px 3px"
		});
		$(gmtype).after(clone);

	})
	$("#addDiv .removetypebtn").click(function() {
		let gmtype = $("#addDiv .gmtype").last();
		if ($("#addDiv .gmtype").length != 1)
			$(gmtype).remove();
	})

	// 預覽圖片function
	$("#updateDiv .upload").change(function() {
		let myfile = this.files;
		// 獨到檔案啟動
		$(reader).on("load", function(e) {
			// img屬性
			$("#updateDiv .showimg img").css({
				"width" : "250",
				"height" : "250px"
			});
			// 設img src
			$("#updateDiv .showimg img").attr("src", e.target.result);
		});
		// 讀檔
		reader.readAsDataURL(myfile[0]);
	});

	
	
	$("#updateDiv .cancel").click(function() {
		// 當開啟時移動最上方
		$("#updateDiv, #updateDiv form").animate({
			scrollTop : 0
		}, "fast");
		// 收起
		$("#updateDiv").slideUp();
		// 清空屬性
		$(".text").val("");
		$(".other input").val("");
		$(".other select").val("0");
		$("#updateDiv .showimg img").remove();
		// 設透明度
		$("#comm").css({
			"opacity" : "1"
		});
		// 把按鈕便回來
		$("#create-user").text("新增商品");
		$("#create-user").attr("disabled", false);
		// 啟動事件
		setTimeout(hov, 500);
		
		
	})

	$("#updateDiv .addtypebtn").click(function() {
		let gmtype = $("#updateDiv .gmtype")[0];
		let clone = $(gmtype).clone();
		$(clone).css({
			"margin" : "0px 3px"
		});
		$("#d1").before(clone);

	})
	
	
	$("#updateDiv .removetypebtn").click(function() {
		let gmtype = $("#updateDiv .gmtype").last();
		if ($("#updateDiv .gmtype").length != 1)
			$(gmtype).remove();
	})

});
