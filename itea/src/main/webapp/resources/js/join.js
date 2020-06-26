//회원가입 유효성 검사(태강)
$(function(){
	
	mailCheck=false;
	
	var already="<c:out value='${already}'/>";
	alert(already)
	
	$("#rBtn").click(function(){
		location.href="../index.jsp"
	})
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
})

//이메일 인증(나진)
function sendMail() {
	var email = document.getElementById("memail");
	var email2 = document.getElementById("memail2");
	var content = document.getElementById("authCode");
	if(email.value==''){	
		alert("이메일은 필수입니다");
		email.focus();
		return false;
	}
	
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

	