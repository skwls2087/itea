<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	$("#mgradu").val("${mDto.mgradu}").change();
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	if(${mDto.mclass==1}){
	$("input").keyup(function(){
		  var mpw=$("#mpw").val();
		  var mpw1=$("#mpw1").val();
		  if(mpw != "" || mpw1 != ""){ 
			  if(mpw == mpw1){ 
				$("#alert-success").show();
			  $("#alert-danger").hide();
			  }else{ 
				$("#alert-success").hide();
			  $("#alert-danger").show();
			  return false;
			  }  
		 } 
	});
	}
	$("#sBtn").click(function(){
			var inputtedPhoneNumber = $("#mphone").val();
			  // 입력 값이 000-0000-0000 형식인지 확인한다.
		  var phoneNumberRegex = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
			if(!phoneNumberRegex.test(inputtedPhoneNumber)) {
			    alert("형식을 000-0000-0000으로 부탁드립니다.");
			    return false;
			  }
			if(${mDto.mclass==1}){
			var mpw = document.getElementById("mpw");
			var mpw1 = document.getElementById("mpw1");
					if(mpw.value=='' || mpw1.value==''){	
						alert("수정할 비밀번호를 입력하세요");
						mpw.focus();
						return false;
					}
					if(mpw.value == mpw1.value){
					}else {
						alert("수정할 비밀번호를 다시한번 확인부탁드립니다.");
						return false;		
					}
					if(mpw.value.length <4 || mpw.value.length >12){
						alert("비밀번호는 4자리~12자리 이내로 입력해주세요.");
						return false;
					}
					}
					var mnick = document.getElementById("mnick");
					/* if(${mDto.mnick} == mnick.value){  *///DB에 저장된 닉네임과 새롭게 입력한 닉네임이 같지 않다면
						if(${mDto.modifydate}<=30){
						alert("닉네임 변경은 30일 이후에 가능하며 변경없이 저장됩니다.")
						mnick.value equals ${mDto.mnick}
						/* return false; */
						/* } */
					}	
			prompt('지금 입력한 정보로 회원정보를 수정됩니다.');
		$("#modifyFrm").submit();
	});
	$("#rBtn").click(function(){
		 alert('정보수정페이지를 나가시겠습니까?');
		 	$(location).attr("href","../index.jsp");
	});
	$("#dBtn").click(function(){
		 alert('돌아올수 없습니다.');
			
		 	$(location).attr("href","delete.co");
	});
});
</script>
	<div class="">
		<h2>회원 정보 수정</h2>
	</div>
	<form id="modifyFrm" action="../member/modify.co"
											 method="post">
				<input type="hidden" name="mno" value="${mDto.mno}"/>
		<table  class=""  >
			<tbody>
					<tr>
						<th>아이디</th>
            <td>${mDto.mmail}</td>
					</tr>
					<tr>
						<th>mclass</th>
            <td>${mDto.mclass}</td>
					</tr>
					<tr>
						<th>mnickdate</th>
            <td>${mDto.modifydate}</td>
					</tr>
				<c:if test="${mDto.mclass==1}"> 
					<tr>
						<th>비밀번호</th><!-- 변경가능 -->
						<td><input type="password" id="mpw" name="mpw" size="28" placeholder="새로운 비밀번호를 입력해주세요"  /></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th><!-- 변경가능 -->
						<td><input type="password" id="mpw1" name="mpw1" size="28" placeholder="다시한번 입력해주세요" /></td>
					</tr>
					<th class="alert alert-success" id="alert-success" colspan="2">비밀번호가 일치합니다.</th> 
					<th class="alert alert-danger" id="alert-danger" colspan="2">비밀번호가 일치하지 않습니다.</th>
					<tr>
					</c:if>
						<th>이름</th>
						<td>${mDto.mname}</td>
          </tr>
					<tr>
						<th>닉네임</th><!-- 변경가능 -->
						<td><input type="text" id="mnick" name="mnick" size="20" value="${mDto.mnick}"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${mDto.mbirth}</td>
          </tr>
					<tr>
						<th>성별</th>
						<td>${mDto.msex}</td>
          </tr>
					<tr>
						<th>연락처</th><!-- 변경가능 -->
						<td><input type="text" id="mphone" name="mphone" size="20" value="${mDto.mphone}">
					  </td>
					</tr>
					<tr>
						<th>최종학력</th><!-- 변경가능 -->
						<td>
							<select name="mgradu" id="mgradu" class="">
								<option selected >미공개</option>
								<option value="mschool">중학교 졸업</option>
								<option value="hschool">고등학교 졸업</option>
								<option value="tcollege">전문대 졸업</option>
								<option value="university">대학교 졸업</option>
								<option value="graduate">대학원 졸업</option>
							</select>
						</td>
					</tr>
			</tbody>
		</table>
        	 	<button type="button" id="sBtn" class="btn btn-secondary">변경하기</button>
						<button type="button" id="rBtn" class="btn btn-secondary">취소하기</button>
						<button type="button" id="dBtn" class="btn btn-secondary">탈퇴하기</button>
	</form>
	