<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problemList.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div>
	<div class="problemList">
    <span id="problem-header">신고된 문제</span><br/><br/>
   	<div class="ptype-search">
</div>
	  
	<table class="table" style="table-layout:fixed">
    <tr>
        <td width="10%">번호</td>
        <td width="40%">신고내용</td>
        <td width="5%">
        	<img src="${pageContext.request.contextPath}/resources/img/like.png" width="20"/>
        </td>
        <td width="5%">
        	<img src="${pageContext.request.contextPath}/resources/img/hate.png" width="20"/>
        </td>
        <td width="5%">
        	<img src="${pageContext.request.contextPath}/resources/img/errorhover.png" width="25"/>
        </td>
        <td width="5%"></td>
        <td width="5%"></td>
    </tr>
    <c:forEach items="${LIST}" var="list" varStatus="status">
    <tr>
        <td>
        	<a href="${pageContext.request.contextPath}/ask/problemBoard.co?pno=${list.pno}" id="problem-board" target="_blank">
        		${list.pno}
       		</a>
        </td>
        <td>${list.econtent}</td>
		<td>${list.cnt}</td>
        <td>${list.plike}</td>
        <td>${list.phate}</td>
		<td></td>
		<td></td>
    </tr>
    </c:forEach>
    <!-- 페이징처리 -->
        
        <tr>
				<td colspan="7">
				<div>
  				<ul class="pagination" id="q-paging">
  				
  				<!-- 이전페이지 -->
  				<c:if test="${PINFO.nowPage ne 1}">
  				  <li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/myProblemList.co?nowPage=${PINFO.nowPage-5}&lqno=${lqno}&search=${search}&scontent=${scontent}">&laquo;</a>
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
							<li id="q-nowpage" class="page-item active">
						</c:if>
						<c:if test="${PINFO.nowPage!=pg}">
							<li id="q-nowpage" class="page-item">
						</c:if>
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/myProblemList.co?nowPage=${pg}&lqno=${lqno}&search=${search}&scontent=${scontent}">${pg}</a>
				    </li>
				    
					</c:forEach>
					
					<!-- 다음페이지 -->
					<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
					<li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/myProblemList.co?nowPage=${PINFO.nowPage+5}&lqno=${lqno}&search=${search}&scontent=${scontent}">&raquo;</a>
				    </li>
					</c:if>
					<c:if test="${PINFO.nowPage eq PINFO.totalPage}">
					<li class="page-item disabled">
						<a class="page-link" href="#}">&raquo;</a>
				    </li>
					</c:if>

				  </ul>
					</div>
				</td>
			</tr> 
	</table>
</div>
</div>

