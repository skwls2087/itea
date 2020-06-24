<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
	$(function(){
		$("#rBtn").click(function(){
			location.href="../index.jsp"
		})
		$("#join").submit(function(){
			var mphone1=$("#mphone1").val();
			var mphone2=$("#mphone2").val();
			var mphone3=$("#mphone3").val();
			var mphone=mphone1+"-"+mphone2+"-"+mphone3
			document.getElementById("mphone").value=mphone;
			
			
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
			if(!($("#msex1").checked) && !($("#msex2").checked)){
				alert("성별을 선택하지 않았습니다.")
				return false;
			}
			
		})
		
	})
	

</script>

    
<div class="container">
<table class="table">
	<form id="join" method="post" action="../member/joinProcSNS.co">
		<input type="hidden" id="mmail" name="mmail" value="${mmail}"/>
		<tr>
			<th><label for="mname">이름</label></th>
			<td><input type="text" id="mname" name="mname"/></td>
		</tr>
		<tr>
			<th><label for="mnick">닉네임</label></th>
			<td><input type="text" id="mnick" name="mnick"/></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="hidden" id="mphone" name="mphone"/>
				<input type="text" id="mphone1" name="mphone1" maxlength="3"/>
				-<input type="text" id="mphone2" name="mphone2" maxlength="4"/>-
				<input type="text" id="mphone3" name="mphone3" maxlength="4"/>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="date" id="mbirth" name="mbirth"/></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" id="msex1" name="msex" value="남"/>남
				<input type="radio" id="msex2" name="msex" value="여"/>여
			</td>
		</tr>
		<tr>
			<th>최종학력(선택)</th>
			<td>
				<select name="mgradu">
					<option value="" selected>선택</option>
					<option value="mschool">중학교 졸업</option>
					<option value="hschool">고등학교 졸업</option>
					<option value="tcollege">전문대 졸업</option>
					<option value="university">일반대학 졸업</option>
					<option value="graduate">대학원 졸업</option>			
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="text-center">
				<input type="submit" id="sBtn" value="가입"/>
				<input type="button" id="rBtn" value="취소"/>
			</td>
		</tr>
	</form>
</table>
</div>