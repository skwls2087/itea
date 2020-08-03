<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problemList.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div>
	<div class="problemList">
    <span id="problem-header">내가 낸 문제</span><br/><br/>
    <div class="ptype-search">
    <form name="problemSearch" id="problemSearch" method ="post" class="problemSearch" 
			action="<%= request.getContextPath()%>/problem/myProblemList.co">
		<div>
	    <select id="selectKind" name="lqno" class="custom-select" onChange="javascript:problemSearch.submit();">
	      <option value="" selected="selected">자격증 종류</option>
	      <c:forEach var="ckind" items="${ckind}">
		      <option value="${ckind.lqno}" <c:if test="${lqno == ckind.lqno}">selected='selected'</c:if>>${ckind.lname}
		      <c:if test="${ckind.lqclass!='단독'}">(${ckind.lqclass})</c:if></option>
	      </c:forEach>
	    </select>
	  </div>
	  </form>
  </div>
	  <div class="pcontent-search">
	  <form name="problemContentSearch" id="problemContentSearch"
	  	action="<%= request.getContextPath()%>/problem/myProblemList.co" method ="post" onsubmit="return checkForm();">
	  <select id="selectSearch" name="search" class="custom-select">
	      <option value="pno" selected="selected">#</option>
	      <option value="pdetail" selected="">내용</option>
	    </select>
	  	<input type="text" name="scontent" class="form-control"/>
	  	<input type="hidden" name="lqno" value="${lqno}"/>
	  	<img src="${pageContext.request.contextPath}/resources/img/search.png" id="problemContentSearchClick" 
	  		style="cursor:pointer" width="20" onclick="document.getElementById('problemContentSearch').submit();"/>
	  </form>
	  </div>
	  
	<table class="table" style="table-layout:fixed">
    <tr>
        <td width="10%">번호</td>
        <td width="20%">자격증</td>
        <td width="40%">문제</td>
        <td width="10%">정답률</td>
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
    </tr>
    <c:forEach items="${LIST}" var="list" varStatus="status">
    <tr>
        <td>
        	<a href="${pageContext.request.contextPath}/ask/problemBoard.co?pno=${list.pno }" id="problem-board" target="_blank">
        		${list.pno }
       		</a>
        </td>
        <td>
        ${list.lname}<c:if test="${list.lqclass!='단독'}">_${list.lqclass}</c:if>
        </td>
        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
        <a href="<%= request.getContextPath()%>/problem/selectMyProblem.co?pno=${list.pno}">Q.${list.pdetail }</a></td>
        
        <td>
        <c:if test="${problem.psolve!=0}">
					<fmt:parseNumber var="correct" integerOnly="true" value="${problem.pcorrect/problem.psolve*100}"/>
					${correct}%
				</c:if>
        </td>
        <td>${list.plike}</td>
        <td>${list.phate}</td>
        <td>${list.perror}</td>
        <td>
     			<a href="problemDelete.co?pno=${list.pno}&nowPage=${PINFO.nowPage}&lqno=${lqno}&search=${search}&scontent=${scontent}" 
     				onclick="alert('해당 문제가 삭제되었습니다.')">
     			<img src="${pageContext.request.contextPath}/resources/img/trash.png" width="20"/></a>
       	</td>
    </tr>
    </c:forEach>
    <!-- 페이징처리 -->
        
        <tr>
				<td colspan="8">
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

