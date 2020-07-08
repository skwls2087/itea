<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
function checkForm() {
    if(document.getElementById("member-content").value==""){
    	alert("회원정보를 입력해주세요")
    	return false;
    }
}
	
function checkDelete(nick){
	result=confirm(nick+"님을 강제탈퇴하시겠습니까?")
	if(result){
		return true;
	}else{
		return false;
	}
}
</script>

<div class="title">
	<a href="<%= request.getContextPath()%>/admin.co" >관리자 페이지</a>
</div>

<a href="<%= request.getContextPath()%>/userList.co" class="user-button">회원관리</a>

<div class="admin-user">
	
	<div class="admin-div">
		<!-- 회원을 닉네임이나 아이디로 검색 가능 -->
		<div class="board-search">
			<form action="<%= request.getContextPath()%>/userList.do" name="user-search" 
				method ="post" class="user-search" onsubmit="return checkForm();">
				<div class="insertFavorite">
			    <select name="search" class="selectCss">	
			        <option value="mnick">닉네임</option>
			        <option value="mmail">이메일</option> 
			    </select>
			    <input type="text" name="user-inform" id="member-content"/>
			    <input type="submit" value="검색" class="button"/>
		    </div>
			</form>
		</div>
		<!-- 검색된 회원 리스트 -->
		<table class="myT">
	        <tr>
	        	<th>닉네임</th>
	        	<th>이메일</th>
	        	<th>로그인경로</th>
	        	<th>회원명</th>
	        	<th style="text-align:center">전화번호</th>
	        	<th style="text-align:center">가입일</th>
	        	<th>강제탈퇴</th>
	        </tr>
	        
	        <c:forEach var="member" items="${memberPage.content}">
	         <c:if test='${member.nickname ne "관리자"}'>
		        <tr class="member-list">
		        	<td>${member.mnick}</td>
		        	<td>${member.mmail}</td>
		        	<td>${member.mclass}</td>
		        	<td>${member.mname}</td>
		        	<td>${member.mphone}</td>
		        	<td style="text-align:center">${member.mdate}</td>
		        	<td>
		        	<form name="delete" method="post" action="<%= request.getContextPath()%>/checkAdminPw.co"
		        		onsubmit="return checkDelete('${member.mnick}');">
		        		<input type="hidden" name="userNick" value="${member.mnick}"/>
						<input type="hidden" name="service" value="deleteMember"/>
						<input type="submit" value="탈퇴" class="button2">
					</form>
		        	</td>
		        </tr>
	        </c:if>
	        </c:forEach>
	        
			 <!-- 회원목록 페이징 -->		
	     <c:if test="${memberPage.total>0}">
				<tr>
					<td colspan="7" class="center2">
					<!-- 검색조건이 없을 때는 페이지넘버만 파라미터로 보내기 -->
					<c:if test="${null eq content}">
						<%-- [이전prev]출력 --%>
						<c:if test="${memberPage.currentPage>5}">
							<a href="userList.do?page=${memberPage.startPage-5}">[이전]</a>
						</c:if>
						
						<%-- 페이지출력 [이전] [1] [2] [3] [4] [5] --%>
						<c:forEach var="pNo" begin="${memberPage.startPage}" end="${memberPage.endPage}">
							<a href="userList.do?page=${pNo}">[${pNo}]</a>
						</c:forEach>
						
						<%-- [다음next]출력 --%>
						<c:if test="${memberPage.endPage<memberPage.totalPages}">
							<a href="userList.do?page=${memberPage.startPage+5}">[다음]</a>
						</c:if>
					</c:if>
				
					<!-- 검색조건이 있을 때는 페이지넘버와 검색조건도 파라미터로 보내기 -->
						<c:if test="${null ne content}">
							<%-- [이전prev]출력 --%>
							<c:if test="${memberPage.currentPage>5}">
								<a href="userList.do?page=${memberPage.startPage-5}&search=${search}&inform=${content}">
									[이전]</a>
							</c:if>
							
							<%-- 페이지출력 [이전] [1] [2] [3] [4] [5] --%>
							<c:forEach var="pNo" begin="${memberPage.startPage}" end="${memberPage.endPage}">
								<a href="userList.do?page=${pNo}&search=${search}&inform=${content}">
									[${pNo}]</a>
							</c:forEach>
							
							<%-- [다음next]출력 --%>
							<c:if test="${memberPage.endPage<memberPage.totalPages}">
								<a href="userList.do?page=${memberPage.startPage+5}&search=${search}&inform=${content}">
									[다음]</a>
							</c:if>
						</c:if>
					</td>
				</tr>
			</c:if>
     </table>
    </div>
</div>