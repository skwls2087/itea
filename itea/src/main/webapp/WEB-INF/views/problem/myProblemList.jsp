<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div class="problemList">
    <p>내가 낸 문제 (List)</p>
    <div>
    <form name="problemSearch" id="problemSearch" method ="post" class="problemSearch" 
			action="<%= request.getContextPath()%>/problem/myProblemList.co" onsubmit="return checkForm();">
		<div class="form-group">
	    <select id="selectKind" name="lno" class="custom-select" onChange="javascript:problemSearch.submit();">
	      <option value="" selected="selected">자격증 종류</option>
	      <c:forEach var="ckind" items="${ckind}">
		      <option value="${ckind.lqno}" <c:if test="${selectKind == ckind.lqno}">selected='selected'</c:if>>${ckind.lname}
		      <c:if test="${ckind.lqclass!='단독'}">(${ckind.lqclass})</c:if></option>
	      </c:forEach>
	    </select>
	  </div>
	  </form>
	  
	<table class="table" style="table-layout:fixed">
    <tr>
        <td width="5%">번호</td>
        <td width="15%">자격증</td>
        <td width="5%">유형</td>
        <td width="10%">유형</td>
        <td width="50%">문제</td>
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
    </tr>
    <c:forEach items="${LIST}" var="list">
    <tr>
        <td>${list.pno }</td>
        <td style="white-space:nowrap">${list.lname }</td>
        <td>${list.lqclass }</td>
        <td>
        <c:if test="${list.ptype==1}">
        	객관식
        </c:if>
        <c:if test="${list.ptype==2}">
        	단답식
        </c:if>
        <c:if test="${list.ptype==3}">
        	서술형
        </c:if>
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
    </tr>
    </c:forEach>
    <!-- 페이징처리 -->
        
        <tr>
				<td colspan="9">
				<div>
  				<ul class="pagination" id="q-paging">
  				
  				<!-- 이전페이지 -->
  				<c:if test="${PINFO.nowPage ne 1}">
  				  <li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/myProblemList.co?nowPage=${PINFO.nowPage-5}&lno=${selectKind}">&laquo;</a>
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
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/myProblemList.co?nowPage=${pg}&lno=${selectKind}">${pg}</a>
				    </li>
				    
					</c:forEach>
					
					<!-- 다음페이지 -->
					<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
					<li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/myProblemList.co?nowPage=${PINFO.nowPage+5}&lno=${selectKind}">&raquo;</a>
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

