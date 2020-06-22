<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="">
		<h2>회원 정보 수정</h2>
	</div>
	<form id="modifyFrm" action="../member/modify.co"
											 method="get">
		<table  class=""  >
			<tbody>
					<tr>
						<th>아이디</th>
            <td></td>
					</tr>
					<tr>
						<th>비밀번호</th><!-- 변경가능 -->
						<td><input type="password" id="" name="" size="15"/></td>
						<td>새롭게 변경할 비밀번호를 입력하세요</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th><!-- 변경가능 -->
						<td><input type="password" id="" name="" size="15"/></td>
						<td>비밀번호를 다시한번 입력하세요</td>
					</tr>
					<hr>
					<tr>
						<th>이름</th>
						<td></td>
          </tr>
					<tr>
						<th>닉네임</th>
						<td></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td></td>
          </tr>
					<tr>
						<th>성별</th>
						<td></td>
          </tr>
					<tr>
						<th>연락처</th><!-- 변경가능 -->
						<td><select name="">
										<option>010</option>
										<option>016</option>
										<option>018</option>
								</select>-
								<input type="text" id="" name="" size="5">-
								<input type="text" id="" name="" size="5">
					  </td>
					</tr>
					<tr>
						<th>최종학력</th><!-- 변경가능 -->
						<td>
							<select name="">
								<option>중학교 졸업</option>
								<option>고등학교 졸업</option>
								<option>전문대 졸업</option>
								<option>대학교 졸업</option>
								<option>대학원 졸업</option>
							</select>
						</td>
					</tr>
			</tbody>
		</table>
        	 	<button type="button" id="sBtn" class="btn btn-secondary">변경하기</button>
						<button type="button" id="rBtn" class="btn btn-secondary">취소하기</button>
	</form>