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
	$("button#callGmType").attr('disabled', true);
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
		$("button#callGmType").attr('disabled', true);
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
		$("button#callGmType").attr('disabled', false);
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
				"width" : "400px",
				"top" : "15%",
				"background-color" : "#ffffff",
				"word-break" : "break-all",
				"word-wrap" : "break-word",
				"margin-left" : "-200px",
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
		$("button#callGmType").attr('disabled', false);
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
	
	//叫出遊戲類型
	$("button#callGmType").click(function(){
		  $("div.gmtypezone").slideToggle();
		  $("#create-user").attr('disabled', true);
		  $("button#callGmType").attr('disabled', true);
		  $("input.upda").attr('disabled', true);
		  $("#comm td div").off();
	  })
	  //隱藏遊戲類型
	 $("button.typecancel").click(function(){
		  $("div.gmtypezone").slideToggle();
		  $("#create-user").attr('disabled', false);
		  $("button#callGmType").attr('disabled', false);
		  $("input.upda").attr('disabled', false);
		  $("div.gmtypezone button.confirm").attr('disabled', false);
		  $("div#delalert").hide();
		  setTimeout(hov, 500);
		  
	  })
	  var typeNo="";
	  //刪除按鈕
	  $("button.deltypebtn").click(function(){
		  typeNo=$(this).val();
		  $("div#delalert").toggle();
		  $("div.gmtypezone button.confirm").attr('disabled', true);
		  		  
	  });
	//遊戲類型警告確定
	  $("div#delalert button.confirm").click(function(){
		  $("div#delalert").toggle();
		  $("div.gmtypezone input.confirm").attr('disabled', false);
		  $("div.gmtypezone button.confirm").attr('disabled', false);
		  $.post(ctx+"/GmType/GmTypeServlet",
					{
			  			action:"delete",
			  			typeNo:typeNo
					},
					function(data,status){
						if(status=="success"){
							$("div."+typeNo+"").remove();
							swal({text:data });
						}	
					}
			)
		}
	  
	  );
  
	   //遊戲類型警告取消
	  $("div#delalert button.cnacel").click(function(){
			  $("div#delalert").toggle()
			  $("div.gmtypezone button.confirm").attr('disabled', false);
		});
	//遊戲類型確定
	  $("div.gmtypezone button.confirm").click(function(){
		  
		  $.ajax({
			  dataType: "json",
			  url: ctx+"/GmType/GmTypeServlet",
			  type: "POST",
			  data: {
		  			action:"add",
		  			typeName:$("#typeNameInput").val()
				},
			  success:function(data){
						swal({text:data.msg});
						let tampDiv=document.createElement("div");
						let tampP=document.createElement("p");
						let tampButton=document.createElement("button");
						$(tampDiv).addClass(data.typeNo);
						$(tampButton).val(data.typeNo);
						$(tampButton).addClass("deltypebtn");
						$(tampButton).text("刪除");
						$(tampP).text(data.typeName);
						$("#tampAddDiv").before(tampDiv);
						$(tampDiv).prepend(tampButton);
						$(tampDiv).prepend(tampP);
						$("input#typeNameInput").val("");
						 $("button.deltypebtn").click(function(){
							  typeNo=$(this).val();
							  $("div#delalert").toggle();
							  $("div.gmtypezone button.confirm").attr('disabled', true);
							  		  
						  });
				} 
			});
		    
	  })
	  

});
