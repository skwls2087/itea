<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- css참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modify.css">
    
<script>
$(function(){
	
	var isnick=true;
	
	$("#mgradu").val("${mDto.mgradu}").change();
	$("#alert-success").hide(); 
	$("#alert-danger").hide();
	
	$("#checkNick").css('display','none');
	$("#mnick").attr("readonly",true);
	
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
	};
	$("#sBtn").click(function(){
			//가입눌렀을때
			var mphone1=$("#mphone1").val();
			var mphone2=$("#mphone2").val();
			var mphone3=$("#mphone3").val();
			var mphone=mphone1+"-"+mphone2+"-"+mphone3
			document.getElementById("mphone").value=mphone;
			
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

			if(${mDto.mclass==1}){
			var mpw = document.getElementById("mpw");
			var mpw1 = document.getElementById("mpw1");
					if(mpw.value=='' || mpw1.value==''){	
						alert("수정할 비밀번호를 입력하세요");
						mpw.focus();
						return false;
					};
					if(mpw.value == mpw1.value){
					}else {
						alert("수정할 비밀번호를 다시한번 확인부탁드립니다.");
						return false;		
					};
					if(mpw.value.length <4 || mpw.value.length >12){
						alert("비밀번호는 4자리~12자리 이내로 입력해주세요.");
						return false;
					};
					};
					if(${mDto.modifydate>=30}){}
					//닉네임 입력 여부
					if(!isnick){
						alert("닉네임 중복확인을 해주세요")
						$("#mnick").focus();
						return false;
					}
					
			
		$("#modifyFrm").submit();
	}); //sBtn 끝
	$("#rBtn").click(function(){
		 alert('정보수정페이지를 나가시겠습니까?');
		 	$(location).attr("href","../index.jsp");
	});
	$("#dBtn").click(function(){
		 var result=confirm("탈퇴하시면 활동내역이 모두 삭제됩니다. 정말 탈퇴하시겠습니까?");
		 if(result){
			 $(location).attr("href","delete.co");
		 }
		 else{
			 return false;
		 }
		 	
	});
	
	$("#changeNick").click(function() {
		
		isnick=false;
		$("#changeNick").css('display','none');
		$("#checkNick").css('display','');
		$(".myNick").css('display','none');
		$(".modifyNick").css('display','');
		$("#mnick").attr("readonly",false);
		
	});
	
	$("#checkNick").click(function() {
		
		var nick = document.getElementById("mnick").value;
		
		//닉네임 입력 유효성 확인
		if(nick==''){	
			alert("닉네임을 정확히 입력해주세요");
			email.focus();
			return false;
		}
		
		
		
		//닉네임 DB확인
		$.ajax({
			url : 'checkmyNick.co?nick='+ nick,
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
							$("#checkNick").css('display','none');
							
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
	
});
</script>
	<div class="container">
		<form id="modifyFrm" class="form-signup" method="post" action="../member/modify.co">
		<h2 class="form-signup-heading">회원 정보 수정</h2>
		<table id="modify-table" class="table">
			<input type="hidden" name="mno" value="${mDto.mno}"/>
			<tbody>
					<tr>
						<th>아이디</th>
            <td>${mDto.mmail}</td>
					</tr>
					<%-- <tr>
						<th>mclass</th>
            <td>${mDto.mclass}</td>
					</tr>
					<tr>
						<th>mnickdate</th>
            <td>${mDto.modifydate}</td>
					</tr> --%>
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
	          <c:if test="${mDto.modifydate<30}"><!-- 변경불가능 닉네임 변경일이 30일 이전 -->
					<tr>
						<th>닉네임</th>
						<td>${mDto.mnick} <br/>
						<span id="change-date">닉네임 변경은 마지막 변경일로부터 30일 이후에 가능합니다<br/>(마지막 변경일 : ${mDto.modifydate}일 전)</span></td>
						
						<input type="hidden" id="mnick" name="mnick"  value="${mDto.mnick}">
						<input type="hidden" id="mnickdate" name="mnickdate" value="${mDto.mnickdate}"/>
					</tr>
					</c:if>
					<c:if test="${mDto.modifydate>=30}"><!-- 변경가능 닉네임 변경일이 30일 이후  -->
					<tr>
						<th>닉네임</th>
						<td>
						<span class="myNick">${mDto.mnick}</span>
						<input type="text" id="mnick" name="mnick" size="20" value="${mDto.mnick}" class="modifyNick" style="display:none;">
						<button class="btn btn-outline-secondary" type="button" id="changeNick">변경</button>
						<button class="btn btn-outline-secondary" type="button" id="checkNick">중복확인</button></td>
					</tr>
					</c:if>
					<tr>
						<th>생년월일</th>
						<td>${mDto.mbirth}</td>
		            </tr>
					<tr>
						<th>성별</th>
						<td>${mDto.msex}</td>
		            </tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type="hidden" id="mphone" name="mphone")/>
							<input type="text"  id="mphone1" name="mphone1" size=5 maxlength="3" value="${mphone[0]}"/>
							- <input type="text"  id="mphone2" name="mphone2" size=5 maxlength="4" value="${mphone[1]}"/> -
							<input type="text"  id="mphone3" name="mphone3" size=5 maxlength="4" value="${mphone[2]}"/>
						</td>
					</tr>
					<tr>
						<th>최종학력</th><!-- 변경가능 -->
						<td>
							<select name="mgradu" id="mgradu">
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
		<div id="modify-buttons">
   	 	<button type="button" id="sBtn" class="btn btn-secondary">변경하기</button>
			<button type="button" id="rBtn" class="btn btn-secondary">취소하기</button>
			<button type="button" id="dBtn" class="btn btn-outline-danger float-right">탈퇴하기</button>
		</div>
	</form>
	