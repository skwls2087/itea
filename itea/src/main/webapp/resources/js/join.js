//회원가입 유효성 검사(태강)
$(function(){
	
	var isnick=false;

	//취소눌렀을때
	$("#rBtn").click(function(){
		location.href="../index.jsp"
	})
	
	//가입눌렀을때
	$("#join").submit(function(){
		var mphone1=$("#mphone1").val();
		var mphone2=$("#mphone2").val();
		var mphone3=$("#mphone3").val();
		var mphone=mphone1+"-"+mphone2+"-"+mphone3
		document.getElementById("mphone").value=mphone;
		
		//아이디 입력여부 검사
		if($("#mmail").val().length==0){
			alert("메일 인증을 완료해주세요")
			$("#mmail").focus();
			return false;
		}
		
		//비밀번호 입력여부
		if($("#mpw").val().length==0){
			alert("비밀번호를 입력하지 않았습니다.")
			$("#mpw").focus();
			return false;
		}
		
		//비밀번호 길이 체크
		if($("#mpw").val().length<4 || $("#mpw").val().length>12){
			alert("비밀번호는 4~12자리입니다.")
			$("#mpw").focus();
			return false;
		}
		
		//비밀번호 일치여부
		if($("#mpw").val()!=$("#mpw1").val()){
			alert("비밀번호가 일치하지 않습니다.")
			$("#mpw1").val("");
			$("#mpw1").focus();
			return false;
		}
		
		//이름 입력 여부
		if($("#mname").val().length==0){
			alert("이름을 입력하지 않았습니다.")
			$("#mname").focus();
			return false;
		}
		
		//닉네임 입력 여부
		if(!isnick){
			alert("닉네임 중복확인을 해주세요")
			$("#mnick").focus();
			return false;
		}
		
		//전화번호 입력여부 
		if($("#mphone1").val().length==0){
			alert("전화번호를 입력하지 않았습니다.")
			$("#mphone1").focus();
			return false;
		}
		
		if($("#mphone2").val().length==0){
			alert("전화번호를 입력하지 않았습니다.")
			$("#mphone2").focus();
			return false;
		}
		
		if($("#mphone3").val().length==0){
			alert("전화번호를 입력하지 않았습니다.")
			$("#mphone3").focus();
			return false;
		}
		//생년월일 입력 여부
		if($("#mbirth").val().length==0){
			alert("생년월일을 입력하지 않았습니다.")
			$("#mbirth").focus();
			return false;
		}
		
		//성별 입력 여부
		if ( ! $('input[name="msex"]:checked').val() ){
			alert("성별을 선택하지 않았습니다.")
			return false;
		}
	})


	//이메일 인증 눌렀을때(나진)
	$("#check_mail").click(function() {

		var email = document.getElementById("email").value;
		var email2 = document.getElementById("email2").value;
	
		
		//이메일 입력 유효성 확인
		if(email==''||email2==''){	
			alert("이메일을 정확히 입력해주세요");
			email.focus();
			return false;
		}
		
		var mmail = email+"@"+email2;
		
		//이메일 중복확인 후 코드 전송
		$.ajax({
			url : 'checkMail.co?email='+ mmail,
			type : 'post',
			success : function(data) {					
				
				if (data == 1) {
						//이메일이 이미 존재할 때 -> 사용불가
						alert("이미 사용중인 메일입니다.")
					} else {
						//이메일이 존재하지 않을 때 -> 사용가능(코드값 data로 받기)
						
						$("#checkCODE").css('display','');
						$("#check_mail").html('재전송');
						$("#realcode").val(data);
					}
				}, error : function() {
						console.log("실패");
				}
		})
	})

	//인증번호 확인 눌렀을 때(나진)
	$("#check_code").click(function() {
	
		var realcode = document.getElementById("realcode").value;
		var usercode = document.getElementById("usercode").value;
	
		//이메일 입력 유효성 확인
		if(realcode!=usercode){	
			alert("인증코드가 다릅니다");
			usercode.focus();
			return false;
		}else{
			
			var mail=$("#email").val()+"@"+$("#email2").val();
			$("#mmail").val(mail);
			$("#mmail").attr("readonly",true);
			$("#mmail").css('display','');
			$("#email-input").css('display','none');
			
			alert("인증이 완료되었습니다");
		}
	
	})
	
	//닉네임 중복확인(나진)
	$("#check_nickname").click(function() {
	
		var nick = document.getElementById("mnick").value;
		
		//이메일 입력 유효성 확인
		if(nick==''){	
			alert("닉네임을 정확히 입력해주세요");
			email.focus();
			return false;
		}
		
		//닉네임 DB확인
		$.ajax({
			url : 'checkNick.co?nick='+ nick,
			type : 'post',
			success : function(data) {					
				
				if (data == 1) {
						//닉네임 이미 사용중일 때
						alert("이미 사용중인 닉네임입니다.")
					} else {
						//닉네임을 사용 가능할때
						var result = confirm('사용가능한 닉네임입니다. 사용하시겠습니까?'); 
						
						if(result) { //yes 
							$("#mnick").attr("readonly",true);
							$("#check_nickname").css('display','none');
							
							isnick=true;
						} else {
							//no 
							return false;
						}

					}
				}, error : function() {
						console.log("실패");
				}
		})
	
	})
})