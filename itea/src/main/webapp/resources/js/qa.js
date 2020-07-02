//q&a 게시판(나진)
$(function(){
	
	//회원이 질문 등록할 때
	$("#q-submit").click(function(){
		
		var qclass=document.getElementById('qa-select').value
		var qcont=document.getElementById('questionTextarea').value

		if(qclass==0){
			alert("질문 유형을 선택해주세요")
			return false;
		}
		if(qcont==""){
			alert("질문 내용을 입력해주세요")
			return false;
		}
	});
	//비회원이 질문 등록할 때
	$("#q-login").click(function(){
		alert("로그인 후 이용해주세요")
		return false;
	});
});