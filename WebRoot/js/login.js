$(document).ready(function() {
	$("#show1").click(function() {
		$("#register").show("fast");/* <!--点击show1出现login的界面--> */
		$("#login").hide("fast")
		$("#show1").removeClass("#show1")
		$("#show1").toggleClass("important")
		$("#show2").removeClass("important")

	});

	$("#show2").click(function() {
		$("#login").show("fast");/* <!--点击show2出现login2的界面--> */
		$("#register").hide("fast");
		$("#show2").toggleClass("important")
		$("#show1").removeClass("important show1")
	});
	$("#qq").click(function() {

		$("#show3").slideToggle("fast");

	});
	$("#b2").click(function() {

		$("#show4").slideToggle("fast");

	});
	$("#b3").click(function() {

		$("#show5").slideToggle("fast");

	});
});
