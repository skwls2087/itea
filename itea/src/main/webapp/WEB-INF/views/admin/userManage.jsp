<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 방문자수 그래프를 위한 구글차트 사용 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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

$(document).ready(function() {
	 
    
    var chartLabels = []; // 받아올 데이터를 저장할 배열 선언
    var chartData = []; 
    var month="";

    var cooContractNo = '<c:out value="${no}"/>';
    
    function createChart() {
        
        var ctx = document.getElementById("canvas").getContext("2d");
        LineChartDemo = Chart.Line(ctx, {
            data : lineChartData,
            options : {
                scales : {
                    yAxes : [ {
                        ticks : {
                            beginAtZero : true
                        }
                    } ]
                }
            }
        });
    }


    
    //selectList로 월을 선택해서 ajax로 받는다.
    $('#selectMonth').change(function() {
        var changeMonth = $('#selectMonth option:selected').val();
        month = changeMonth;
        console.log('month:'+month);
        
        
         
    });
    
    //버튼을 클릭하면 차트가 그려진다. createChart()함수를 안에다 선언해야지 차트값을 받더라...
    $('#btn').click(function(){
        
        chartLabels = [];
        chartData=[];
        
        //getJson으로 데이터 
        $.getJSON("./getDailyVisitor", {
            cooContractNo : cooContractNo,
            month : month
        }, function(data) {
            $.each(data, function(key, value) {
                
                chartLabels.push(value.statsDate);
                chartData.push(value.statsAmount);
            });
            
            lineChartData = {
                    labels : chartLabels,
                    datasets : [ {
                        label : "일별 방문자 수",
                        backgroundColor:"#bfdaf9",
                        borderColor: "#80b6f4",
                        pointBorderColor: "#80b6f4",
                        pointBackgroundColor: "#80b6f4",
                        pointHoverBackgroundColor: "#80b6f4",
                        pointHoverBorderColor: "#80b6f4",
                        fill: false,
                        borderWidth: 4,
                        data : chartData
                    } ]

                }
            createChart();
            
        });
    })

    
})
</script>

<div class="admin" id="admin">
	<!-- 기간별 회원 추이 그래프 -->
	<div class="member-graph">
		가입자 통계 그래프
		<form name="memberForm" action="<%=request.getContextPath()%>/admin/memberList.co" method="post"
			onChange="javascript:visitForm.submit();">
	  </form>
	  <!-- 기간별 방문자 차트  -->
	  <div id="chart_div"></div>
  </div>
	
	<!-- 기간별 방문자 추이 그래프 -->
	<div class="visitor-graph">
		방문자 통계 그래프
		<form name="visitForm" action="<%=request.getContextPath()%>/admin/memberList.co" method="post"
			onChange="javascript:visitForm.submit();">
	  </form>
	  <!-- 기간별 방문자 차트  -->
	  <div id="chart_div"></div>
  </div>
  
</div>

<div class="admin-user">
	<div class="admin-div">
		<!-- 회원을 닉네임이나 아이디로 검색 가능 -->
		<div class="board-search text-right">
			<form action="<%= request.getContextPath()%>/admin/memberList.co" name="user-search" 
				method ="get" class="user-search" onsubmit="return checkForm();">
				<div class="insertFavorite pull-right">
			    <select name="column" class="selectCss">	
			        <option value="mnick">닉네임</option>
			        <option value="mmail">이메일</option> 
			    </select>
			    <input type="text" name="value" id="member-content" placeholder="검색어를 입력하세요."/>
			    <input type="submit" value="검색" class="btn btn-secondary"/>
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
		        	<form name="delete" method="post" action="<%= request.getContextPath()%>/admin/deleteMember.co"
		        		onsubmit="return checkDelete('${member.mnick}');">
		        		<input type="hidden" name="userNick" value="${member.mnick}"/>
								<input type="hidden" name="deleteMember" value="deleteMember"/>
								<input type="submit" value="탈퇴" class="button2">
							</form>
		        	</td>
		        </tr>
	       </c:forEach>
	        
			 <!-- 회원목록 페이징 -->		
			 <c:if test="${PINFO.totalCount>0}">
				<tr>
				<td colspan="7" class="text-center">
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
						<c:if test="${PINFO.nowPage ne 1}">
  				    <li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/admin/memberList.co?nowPage=${PINFO.nowPage-1}&column=${column}&value=${value}">&laquo;</a>
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