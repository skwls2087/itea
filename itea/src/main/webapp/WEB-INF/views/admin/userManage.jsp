<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 방문자수 그래프를 위한 구글차트 사용 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css">

<script>
function checkForm() {
    if(document.getElementById("member-content").value==""){
    	alert("회원정보를 입력해주세요")
    	return false;
    }
}
	
function checkDelete(mnick){
	result=confirm(mnick+"님을 강제탈퇴하시겠습니까?")
	if(result){
		return true;
	}else{
		return false;
	}
}

$( document ).ready(function() {

	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(drawCurveTypes);

	function drawCurveTypes() {
    var data = new google.visualization.DataTable();
    
    data.addColumn('string', '날짜');
    data.addColumn('number', '가입자 수');

   
		<c:forEach items="${member}" var="member">
		 data.addRow(['${member.week}',${member.weekCnt}])
		</c:forEach>	
				
    var options = {
    	legend:'none',
    	vAxis:{
    		format:'#',
    		viewWindow:{
    			min:0
    		}
    	},
      lineWidth: 2,
      series: {
    	  legend:{position: 'none'},
      	0: { color: '#166ADC' },
    	  1: {curveType: 'function'}
      }
    };
    var chart = new google.visualization.LineChart(document.getElementById('chart_div1'));
    chart.draw(data, options);
  	}
	});
//--------------------------------------------------------------------------------------------	
$( document ).ready(function() {

	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(drawCurveTypes);

	function drawCurveTypes() {
    var data = new google.visualization.DataTable();
    
    data.addColumn('string', '날짜');
    data.addColumn('number', '방문자 수');

    <c:forEach items="${visitors}" var="visitor">
 			data.addRow(['${visitor.week}',${visitor.vscount}])
 		</c:forEach>
   
    var options = {
   		legend:'none',
   		lineWidth: 2,
   	      series: {
   	    	  legend:{position: 'none'},
   	      	0: { color: '#CF2F11' },
   	    	  1: {curveType: 'function'}
   	      }
   	    };
    var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));
    chart.draw(data, options);
  	}
});

$(function(){
	$("#memberSearch").click(function(){
		$("#memberSearchFrm").submit();
	})
	$("#memberOut").click(function(){
		$("#memberOutFrm").submit();
	})
})

</script>

<div class="admin-heading">관리자 페이지</div>

<div id="admin" class="admin">
<!-- 기간별 회원 추이 그래프 -->

<div class="member-graph">
	<b>누적 회원 수</b>
	  <!-- 기간별 방문자 차트  -->
	  <div id="chart_div1"></div>
</div>
 	<!-- 기간별 방문자 추이 그래프 -->
<div class="visitor-graph">
	<b>누적 방문자 수</b>
	  <!-- 기간별 방문자 차트  -->
	  <div id="chart_div2"></div>
</div>
</div>
<div class="admin-user">
	<div class="admin-div">
		<!-- 회원을 닉네임이나 아이디로 검색 가능 -->
		<div class="board-search text-right">
			<form action="<%= request.getContextPath()%>/admin/memberList.co" name="user-search"  id="memberSearchFrm"
				method ="get" class="user-search" onsubmit="return checkForm();">
				<div class="insertFavorite pull-right">
			    <select name="column" class="custom-select" id="admin-user-select">	
			        <option value="mnick">닉네임</option>
			        <option value="mmail">이메일</option> 
			    </select>
			    <input type="text" name="value" class="form-control" id="member-content" placeholder="검색어를 입력하세요."/>
			    <img src="${pageContext.request.contextPath}/resources/img/search.png" id="memberSearch" width="20" style="cursor:pointer;">
		    </div>
			</form>
		</div>
		<!-- 검색된 회원 리스트 -->
		<table class="table" id="admin-table">
       <thead class="thead-light">
       	<tr>
        	<th width="10%">닉네임</th>
        	<th width="30%">이메일</th>
        	<th width="10%">로그인경로</th>
        	<th width="10%">회원명</th>
        	<th width="20%" style="text-align:center">전화번호</th>
        	<th width="10%" style="text-align:center">가입일</th>
        	<th width="10%">강제탈퇴</th>
       	<tr>
       </thead>
       <c:forEach var="member" items="${PINFO.content}">
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
        	<form name="delete" method="post" action="<%= request.getContextPath()%>/admin/deleteMember.co" id="memberOutFrm"
        		onsubmit="return checkDelete('${member.mnick}');">
        		<input type="hidden" name="userNick" value="${member.mnick}"/>
						<input type="hidden" name="deleteMember" value="deleteMember"/>
						<img src="${pageContext.request.contextPath}/resources/img/logout.png" id="memberOut" width="20" style="cursor:pointer;">
					</form>
        	</td>
        </tr>
      </c:forEach>
	        
			 <!-- 회원목록 페이징 -->		
			 <c:if test="${PINFO.totalCount>0}">
				<tr>
				<td colspan="7">
				<div>
  			<ul class="pagination" id="a-paging">
				<!-- 검색조건이 없을 때는 페이지넘버만 파라미터로 보내기 -->
					<c:if test="${null eq value}">
	  				<!-- 이전페이지 -->
	  				<c:if test="${PINFO.nowPage ne 1}">
	  				    <li class="page-item">
					      <a class="page-link" href="<%= request.getContextPath()%>/admin/memberList.co?nowPage=${PINFO.nowPage-1}">&laquo;</a>
					    </li>
						</c:if>
						<c:if test="${PINFO.nowPage eq 1}">
	  				    <li class="page-item disabled">
	  				    	<a class="page-link" href="#">&laquo;</a>
					    </li>
						</c:if>
						
						<!-- 페이지 -->
							<c:forEach var="pg"	 begin="${PINFO.startPage}" end="${PINFO.endPage}">
								<c:if test="${PINFO.nowPage==pg}">
									<li id="q-nowPage" class="page-item active">
								</c:if>
								<c:if test="${PINFO.nowPage!=pg}">
									<li id="q-nowPage" class="page-item">
								</c:if>
						      <a class="page-link" href="<%= request.getContextPath()%>/admin/memberList.co?nowPage=${pg}">${pg}</a>
						    </li>
							</c:forEach>
							
							<!-- 다음페이지 -->
							<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
							<li class="page-item">
						      <a class="page-link" href="<%= request.getContextPath()%>/admin/memberList.co?nowPage=${PINFO.nowPage+1}">&raquo;</a>
						    </li>
							</c:if>
							<c:if test="${PINFO.nowPage eq PINFO.totalPage}">
							<li class="page-item disabled">
								<a class="page-link" href="#}">&raquo;</a>
						    </li>
							</c:if>
						</c:if>
					
					<!-- 검색조건이 있을 때는 페이지넘버와 검색조건도 파라미터로 보내기 -->
					<c:if test="${null ne value}">
							<%-- [이전prev]출력 --%>
							<c:if test="${PINFO.nowPage ne 1}">
	  				    <li class="page-item">
					      <a class="page-link" href="<%= request.getContextPath()%>/admin/memberList.co?nowPage=${PINFO.nowPage-1}&column=${column}&value=${value}">&laquo;</a>
					    </li>
						</c:if>
						<c:if test="${PINFO.nowPage eq 1}">
	  				    <li class="page-item disabled">
	  				    	<a class="page-link" href="#">&laquo;</a>
					    </li>
						</c:if>
						
						<!-- 페이지 -->
						<c:forEach var="pg"	 begin="${PINFO.startPage}" end="${PINFO.endPage}">
							<c:if test="${PINFO.nowPage==pg}">
								<li id="q-nowPage" class="page-item active">
							</c:if>
							<c:if test="${PINFO.nowPage!=pg}">
								<li id="q-nowPage" class="page-item">
							</c:if>
					      <a class="page-link" href="<%= request.getContextPath()%>/admin/memberList.co?nowPage=${pg}&column=${column}&value=${value}">${pg}</a>
					    </li>
						</c:forEach>
						
							<!-- 다음페이지 -->
						<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
						<li class="page-item">
					      <a class="page-link" href="<%= request.getContextPath()%>/admin/memberList.co?nowPage=${PINFO.nowPage+1}&column=${column}&value=${value}">&raquo;</a>
					    </li>
						</c:if>
						<c:if test="${PINFO.nowPage eq PINFO.totalPage}">
						<li class="page-item disabled">
							<a class="page-link" href="#}">&raquo;</a>
					    </li>
						</c:if>
						</c:if>
				  </ul>
				</div>
				</td>
				</tr>
				</c:if>
     </table>
    </div>

</div>