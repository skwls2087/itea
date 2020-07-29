$(function(){
		str="";
		$("#test2").hide();
		$("#test3").hide();
		$("#test4").hide();
		$("#test5").hide();
		$("#test6").hide();
		$("#test7").hide();
		$("#test8").hide();
		$("#test9").hide();
		$("#test10").hide();
		$("#test-result").hide();
		
		 $("#answer1_1").click(function(){
			$("#test1").hide();
			str=str+"0,"
			$("#test2").show();
			/* alert(str); */
		})
		$("#answer1_2").click(function(){
			$("#test1").hide();
			str=str+"1,"
			$("#test2").show();
			/* alert(str); */
		}) 
		
		$("#answer2_1").click(function(){
			$("#test2").hide();
			str=str+"0,"
			$("#test3").show();
			/* alert(str); */
		})
		$("#answer2_2").click(function(){
			$("#test2").hide();
			str=str+"1,"
			$("#test3").show();
			/* alert(str); */
		})
		$("#answer3_1").click(function(){
			$("#test3").hide();
			str=str+"0,"
			$("#test4").show();
			/* alert(str); */
		})
		$("#answer3_2").click(function(){
			$("#test3").hide();
			str=str+"1,"
			$("#test4").show();
			/* alert(str); */
		})
		$("#answer4_1").click(function(){
			$("#test4").hide();
			str=str+"0,"
			$("#test5").show();
			/* alert(str); */
		})
		$("#answer4_2").click(function(){
			$("#test4").hide();
			str=str+"1,"
			$("#test5").show();
			/* alert(str); */
		})
		$("#answer5_1").click(function(){
			$("#test5").hide();
			str=str+"0,"
			$("#test6").show();
			/* alert(str); */
		})
		$("#answer5_2").click(function(){
			$("#test5").hide();
			str=str+"1,"
			$("#test6").show();
			/* alert(str); */
		})
		$("#answer6_1").click(function(){
			$("#test6").hide();
			str=str+"0,"
			$("#test7").show();
			/* alert(str); */
		})
		$("#answer6_2").click(function(){
			$("#test6").hide();
			str=str+"1,"
			$("#test7").show();
			/* alert(str); */
		})
		$("#answer7_1").click(function(){
			$("#test7").hide();
			str=str+"0,"
			$("#test8").show();
			/* alert(str); */
		})
		$("#answer7_2").click(function(){
			$("#test7").hide();
			str=str+"1,"
			$("#test8").show();
			/* alert(str); */
		})
		$("#answer8_1").click(function(){
			$("#test8").hide();
			str=str+"0,"
			$("#test9").show();
			/* alert(str); */
		})
		$("#answer8_2").click(function(){
			$("#test8").hide();
			str=str+"1,"
			$("#test9").show();
			/* alert(str); */
		})
		$("#answer9_1").click(function(){
			$("#test9").hide();
			str=str+"0,"
			$("#test10").show();
			/* alert(str); */
		})
		$("#answer9_2").click(function(){
			$("#test9").hide();
			str=str+"1,"
			$("#test10").show();
			/* alert(str); */
		})
		$("#answer10_1").click(function(){
			$("#test10").hide();
			str=str+"0"
			$("#test-result").show();
			alert(str); 
		})
		$("#answer10_2").click(function(){
			$("#test10").hide();
			str=str+"1"
			$("#test-result").show();
			alert(str); 
		})
 	});	