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
	}

	function(){
	//perPageNum select 박스 설정
	setPerPageNumSelect();
	
	//prev 버튼 활성화, 비활성화 처리
	var canPrev = '${pageMaker.prev}';
	if(canPrev !== 'true'){
		$('#page-prev').addClass('disabled');
	}
	
	//next 버튼 활성화, 비활성화 처리
	var canNext = '${pageMaker.next}';
	if(canNext !== 'true'){
		$('#page-next').addClass('disabled');
	}
	
	//현재 페이지 파란색으로 활성화
	var thisPage = '${pageMaker.cri.page}';
	//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
	$('#page'+thisPage).addClass('active');
	}

	function setPerPageNumSelect(){
		var perPageNum = "${pageMaker.cri.perPageNum}";
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';
		$perPageSel.val(perPageNum).prop("selected",true);
		//PerPageNum가 바뀌면 링크 이동
		$perPageSel.on('change',function(){
			//pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
			window.location.href = "listPage.co?page="+thisPage+"&perPageNum="+$perPageSel.val();
		})
	}
	function setSearchTypeSelect(){
		var $searchTypeSel = $('#searchTypeSel');
		var $keyword = $('#keyword');
		
		$searchTypeSel.val('${pageMaker.cri.searchType}').prop("selected",true);
		//검색 버튼이 눌리면
		$('#searchBtn').on('click',function(){
			var searchTypeVal = $searchTypeSel.val();
			var keywordVal = $keyword.val();
			//검색 조건 입력 안했으면 경고창 
			if(!searchTypeVal){
				alert("검색 조건을 선택하세요!");
				$searchTypeSel.focus();
				return;
			//검색어 입력 안했으면 검색창
			}else if(!keywordVal){
				alert("검색어를 입력하세요!");
				$('#keyword').focus();
				return;
			}
			var url = "listPage?page=1"
				+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
				+ "&searchType=" + searchTypeVal
				+ "&keyword=" + encodeURIComponent(keywordVal);
			window.location.href = url;
		})
	}

});
</script>

<div class="title">
	<a href="<%= request.getContextPath()%>/admin.co" >관리자 페이지</a>
</div>

<div class="admin-user">
	
	<div class="admin-div">
		<!-- 회원을 닉네임이나 아이디로 검색 가능 -->
		<div class="board-search">
			<form action="<%= request.getContextPath()%>/admin/listPage.co" name="user-search" 
				method ="get" class="user-search" onsubmit="return checkForm();">
				<div class="insertFavorite pull-right">
			    <select name="searchType" class="selectCss">	
			        <option value="mnick">닉네임</option>
			        <option value="mmail">이메일</option> 
			    </select>
			    <input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword }"
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
	        <c:forEach var="member" items="${LIST}">
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
	        
					<!-- 페이지 번호 -->	
				<div class="text-center">
					<nav aria-label="pagination">
						<ul class="pagination">
						
							<!-- prev 버튼 -->
							<li id="page-prev">
								<a href="listPage${pageMaker.makeQuery(pageMaker.startPage-1)}" aria-label="Prev">
									<span aria-hidden="true">«</span>
								</a>
							</li>
							
							<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    <li id="page${idx}">
								    <a href="listPage${pageMaker.makeQuery(idx)}">
								    	<!-- 시각 장애인을 위한 추가 -->
								      	<span>${idx}<span class="sr-only">(current)</span></span>
								    </a>
							    </li>
							</c:forEach>
							
							<!-- next 버튼 -->
							<li id="page-next">
							    <a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}" aria-label="Next">
							    	<span aria-hidden="true">»</span>
							    </a>
							</li>
							
						</ul>
					</nav>
				</div>
				</td>
				</tr>
     </table>
    </div>
</div>