//회원가입 유효성 검사(태강)
$(function(){
	
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
			alert("아이디를 입력하지 않았습니다.")
			$("#mmail").focus();
			return false;
		}
		
		//아이디 입력여부 검사
		if(mailCheck==false){
			alert("이메일 인증을 완료해주세요")
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
		if($("#mnick").val().length==0){
			alert("닉네임을 입력하지 않았습니다.")
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

	var email = document.getElementById("mmail").value;
	var email2 = document.getElementById("mmail2").value;

	
	//이메일 입력 유효성 확인
	if(email==''||email2==''){	
		alert("이메일을 정확히 입력해주세요");
		email.focus();
		return false;
	}
	
	var mmail = email+"@"+email2;
	
	//이메일 중복확인
	$.ajax({
		url : 'checkMail.co?email='+ mmail,
		type : 'post',
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);							
			
			if (data == 1) {
					//이메일이 이미 존재할 때 -> 사용불가
					alert("이미 사용중인 메일입니다.")
				} else {
					//이메일이 존재하지 않을 때 -> 사용가능
					
					$("#mail-button").click()
				}
			}, error : function() {
					console.log("실패");
			}
		})


	})


//이메일 인증(나진)
/*function sendMail() {

	
	var mid = document.getElementById("mid");
	var memail = document.getElementById("memail");
	var authCode = document.getElementById("authCode");
	var code = "";
	for (var i=0; i < 6; i++) {
		code += Math.floor(Math.random() * 10);
	}
	
	authCode.value = code;

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("auth").className = "";
		}
	}
	xhttp.open("post", "checkMail.co", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("title=메디큐이메일인증&content="+content.value+"&email="+email.value+"@"+email2.value+"&authCode="+code);

	return false;
}

function checkAuthCode() {
	console.log("checkAuthCode()");
	var authCode = document.getElementById("authCode");
	console.log(authCode);
	authCode2 = document.getElementById("authCode2");
	console.log(authCode2);
	var checkAuthCodeResult = document.getElementById("checkAuthCodeResult");
	console.log(checkAuthCodeResult);
	if(authCode.value == authCode2.value){
		checkAuthCodeResult.innerHTML = "인증완료";
	} else {
		checkAuthCodeResult.innerHTML = "인증 번호가 다릅니다";
	}
}

	*/
})