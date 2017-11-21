$(document).ready(function() {

	$("#select1 dd").click(function() {
		//点击动态添加selected属性
		//sibl过滤函数查找select1下的所有ed
		$(this).addClass("selected").siblings().removeClass("selected");
		if($(this).hasClass("select-all")) {//如果这个是选择了all属性其余的选择都移除
			$("#selectA").remove();
		} else {//不是的话就判断是否有值在其中再添加到result中
			var copyThisA = $(this).clone();
			if($("#selectA").length > 0) {
				$("#selectA a").html($(this).text());
			
			} else {
				$(".select-result dl").append(copyThisA.attr("id", "selectA"));
			}
		}
	});

	$("#select2 dd").click(function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		if($(this).hasClass("select-all")) {
			$("#selectB").remove();
		} else {
			var copyThisB = $(this).clone();
			if($("#selectB").length > 0) {
				$("#selectB a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisB.attr("id", "selectB"));
			}
		}
	});

	$("#select3 dd").click(function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		if($(this).hasClass("select-all")) {
			$("#selectC").remove();
		} else {
			var copyThisC = $(this).clone();
			if($("#selectC").length > 0) {
				$("#selectC a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectC"));
			}
		}
	});

	$("#selectA").live("click", function() {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$("#selectB").live("click", function() {
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$("#selectC").live("click", function() {
		$(this).remove();
		$("#select3 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$(".select dd").live("click", function() {
		if($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});

});