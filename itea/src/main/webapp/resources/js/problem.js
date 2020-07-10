$(function(){
	
	$('#ctype-select').css('display','none');
	var c
	
	//회원이 질문 등록할 때
	$("#Ckind").change(function(){
		
		var lno=$(this).val()
		
		$.ajax({
			url : 'testType.co?lno='+ lno,
			type : 'post',
			contentType:"application/json; charset=utf-8;",
			dataType:"json",
			success : function(data) {					
				
				if(typeof data.first!="undefined"){
					$('#ctype-select').css('display','');
					
					$('#type1').val(data.first);
					$('#type1').text(data.first);
					$('#type2').val(data.second);
					$('#type2').text(data.second);
					
				}
				if(typeof data.first=="undefined"){
					$('#ctype-select').css('display','none');
					$('#type0').val("단일");
				}
			}
		})
	});
	
	$("#select-test-button").click(function(){
		if($("#Ckind").val()==""){
			alert("자격증 종류를 입력해주세요")
			return false;
		}
		if($("#Ctype").val()==""){
			alert("자격증 유형를 입력해주세요")
			return false;
		}
		if($("#Qtype").val()==""){
			alert("출제 유형을 입력해주세요")
			return false;
		}
		if($("#Qyear").val()==""){
			alert("출제 년도를 입력해주세요")
			return false;
		}
	});
	
});