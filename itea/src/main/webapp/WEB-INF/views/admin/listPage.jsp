<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
$(function(){

	function checkDelete(nick){
		result=confirm(nick+"님을 강제탈퇴하시겠습니까?")
		if(result){
			return true;
		}else{
			return false;
		}
		
		$(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
			var url = "${getMemberList}";
			url = url + "?searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
			console.log(url);
		});	
}

</script>
<c:url var="getMemberListURL" value="/admin/getMemberList.co"></c:url>
<div class="title">
	<a href="<%= request.getContextPath()%>/admin.co" >관리자 페이지</a>
</div>

<div class="admin-user">
	
	<div class="admin-div">
		<!-- 회원을 닉네임이나 아이디로 검색 가능 -->
		<div class="board-search">
			<form action="<%= request.getContextPath()%>/admin/getMemberList.co" name="user-search" 
				method ="get" class="user-search" onsubmit="return checkForm();">
				<div class="insertFavorite pull-right">
			    <select name="searchType" class="selectCss">	
			        <option value="mnick">닉네임</option>
			        <option value="mmail">이메일</option> 
			    </select>
			    <input type="text" name="keyword" id="keyword"
			    placeholder="검색어를 입력하세요"/>
			    <input type="submit" value="검색" class="btn pull-right"/>
		    </div>
			</form>
		</div>
		<!-- 검색된 회원 리스트 -->
		<table class="table">
	        <thead class="thead-light">
	        	<tr>
		        	<th>닉네임</th>
		        	<th>이메일</th>
		        	<th>로그인경로</th>
		        	<th>회원명</th>
		        	<th style="text-align:center">전화번호</th>
		        	<th style="text-align:center">가입일</th>
		        	<th>강제탈퇴</th>
	        	<tr>
	        </thead>
	        <c:forEach var="member" items="${memberList}">
	         <c:if test='${member.mnick ne "관리자"}'>
		        <tr class="member-list">
		        	<td>${member.mnick}</td>
		        	<td>${member.mmail}</td>
		        	<td>
		        	<c:choose >
							<c:when test="${member.mclass==1}">일반
							</c:when>
							<c:when test="${member.mclass==2}">
								&nbsp<img src="${pageContext.request.contextPath}/resources/img/naver-logo2.png" 
								width="20"/>
							</c:when>
							<c:when test="${member.mclass==3}">
								&nbsp<img src="${pageContext.request.contextPath}/resources/img/kakao-logo3.png"
								width="20"/>
							</c:when>
							<c:when test="${member.mclass==4}">
								&nbsp<img src="${pageContext.request.contextPath}/resources/img/google-logo2.png"
								width="20"/>
							</c:when>
						</c:choose>
						</td>
		        	<td>${member.mname}</td>
		        	<td>${member.mphone}</td>
		        	<td style="text-align:center">${member.mdate}</td>
		        	<td>
		        	<form name="delete" method="post" action="<%= request.getContextPath()%>/admin/checkAdminPw.co"
		        		onsubmit="return checkDelete('${member.mnick}');">
		        		<input type="hidden" name="userNick" value="${member.mnick}"/>
						<input type="hidden" name="service" value="deleteMember"/>
						<input type="submit" value="탈퇴" class="button2">
					</form>
		        	</td>
		        </tr>
	   		 </c:if>
	       </c:forEach>
	        
			<!-- pagination{s} -->
				<div id="paginationBox">
					<ul class="pagination">
						<c:if test="${pagination.prev}">
							<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
						</c:if>
			
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
							<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
						</c:forEach>
						<c:if test="${pagination.next}">
							<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
			'${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
						</c:if>
					</ul>
				</div>

	<!-- pagination{e} -->
				</td>
				</tr>
     </table>
    </div>
</div>