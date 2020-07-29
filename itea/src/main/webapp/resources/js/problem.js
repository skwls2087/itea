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
	
	//파일첨부 미리보기
	var sel_file;
	$(document).ready(function(){
		$("#problemFile").on("change",handleImgFileSelect);
	})
	function handleImgFileSelect(e){
		
		var files=e.target.files;
		var filesArr=Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지만 첨부 가능합니다.")
				return;
			}
			
			sel_file=f;
			
			var reader=new FileReader();
			reader.onload=function(e){
				$("#img").attr("src",e.target.result);
				$('#img_wrap').css('display','');
			}
			reader.readAsDataURL(f);
		})
	}
	
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
	
	//텍스트박스 크기 자동조절
	$("#choice-problem-create").find("textarea").on('keydown keyup', function () {
		$(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	});
	
	
	$("#problem-scoring").click(function(){
		
		$.ajax({
			url : 'problemScore.co?lno='+ lno,
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
	
	$("#nextProblem").submit(function(){
		if($("#psolve").html()==$("#ptotal").html()){
			alert("마지막 문제입니다.")
			return false;
		}
		
	});
	
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
	
	//선지를 눌렀을때 체크한거 표시하고 정답체크 class부여하기
	$("#solveChoice1").click(function(){
		$(this).css('color','red');
		$("#solveChoice2").css('color','black')
		$("#solveChoice3").css('color','black')
		$("#solveChoice4").css('color','black')
		$(this).addClass('select1');
		$("#solveChoice2").removeClass();
		$("#solveChoice3").removeClass();
		$("#solveChoice4").removeClass();
	});
	$("#solveChoice2").click(function(){
		$(this).css('color','red');
		$("#solveChoice1").css('color','black')
		$("#solveChoice3").css('color','black')
		$("#solveChoice4").css('color','black')
		$(this).addClass('correct');
		$("#solveChoice1").removeClass();
		$("#solveChoice3").removeClass();
		$("#solveChoice4").removeClass();
	});
	$("#solveChoice3").click(function(){
		$(this).css('color','red');
		$("#solveChoice1").css('color','black')
		$("#solveChoice2").css('color','black')
		$("#solveChoice4").css('color','black')
		$(this).addClass('correct');
		$("#solveChoice1").removeClass();
		$("#solveChoice2").removeClass();
		$("#solveChoice4").removeClass();
	});
	$("#solveChoice4").click(function(){
		$(this).css('color','red');
		$("#solveChoice1").css('color','black')
		$("#solveChoice2").css('color','black')
		$("#solveChoice3").css('color','black')
		$(this).addClass('correct');
		$("#solveChoice1").removeClass();
		$("#solveChoice2").removeClass();
		$("#solveChoice3").removeClass();
	});
	
	//채점하기 눌렀을 때
	$("#problemScoring").click(function(){
		
		//정답번호와 선택한 번호를 가져오기
		correct=$("#problem-choice-correct").html();
		select=$("#solveChoice"+correct).attr('class');
		
		if($("#solveChoice").attr("class")!="")
				
		
		pno=$("#problemPNO").html();
		
		//선택과 정답이 일치하는지 확인
		if(select=='correct'){
			correct=1;
		}else{
			correct=0;
		}
		
		//해당 문제의 정답률에 반영
		$.ajax({
			url : 'problemScore.co?pno='+ pno+'&correct='+correct ,
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
		$("#problemScore").css('display','')
	});
});