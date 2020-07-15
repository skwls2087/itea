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
	
	//객관식:문제 출제 유효성검사
	$("#create-problem-submit").click(function(){
		if($("#pdetail").val()==""){
			alert("문제를 입력해주세요")
			return false;
		}
		if($("#choice1").val()==""){
			alert("지문을 입력해주세요")
			return false;
		}
		if($("#choice2").val()==""){
			alert("지문을 입력해주세요")
			return false;
		}
		if($("#choice3").val()==""){
			alert("지문을 입력해주세요")
			return false;
		}
		if($("#choice4").val()==""){
			alert("지문을 입력해주세요")
			return false;
		}
		if($(':radio[name="correct"]:checked').length < 1){
		    alert('정답 번호를 선택해주세요'); 
		    return false;
		}
	})
	//주관식,서술형문제 출제 유효성검사
	$("#create-text-problem-submit").submit(function(){
		if($("#pdetail").val()==""){
			alert("문제를 입력해주세요")
			return false;
		}
		if($('#pcomment').val()==""){
		    alert('해설을 입력해주세요'); 
		    return false;
		}
		
		var noword=0;
		
		$('input[type="text"]').each(function(){
			if($(this).val()==""){
				alert("키워드를 전부 입력해주세요")
				noword++
				return;
			}
		})
		if(noword!=0){
			return false;
		}
	})
	
	//키워드 삭제하기
	$(document).on('click','.close-img',function(){
		$(this).parent('div').remove()
	})
	
	//키워드 입력시 텍스트박스 크기 늘어나기
	$(document).on('keydown','input[type="text"]',function(){
		$(this).attr('size', $(this).val().length+5);
	});
	
	//키워드 추가를 누르면 박스 생성
	$("#plus-keyword").click(function(){
		
		div=$('<div>')
		div.attr({'class':'correct-box'})
		
		input=$('<input>')
		input.attr({'class':'form-control form-control-lg','type':'text','name':'correctList','size':'5'})
		
		img=$('<img>')
		img.attr({'src':'../resources/img/close.png','width':'10','class':'close-img'})
		
		div.append(input).append(img)
		
		$('#correct-boxes').append(div)
		
		return false;
	})

});