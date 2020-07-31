<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div class="problemList">
    <p>내가 낸 문제 (List)</p>
    <div>
    
		<div class="form-group">
	    <select id="Ckind" name="Ckind" class="custom-select">
	      <option value="" selected="selected">자격증 종류</option>
	      <c:forEach var="ckind" items="${ckind}">
		      <option value="${ckind.lno}" <c:if test="${field == ckind.lno}">selected='selected'</c:if>>${ckind.lname}</option>
	      </c:forEach>
	    </select>
	  </div>
		  
	<table class="table">
    <tr>
        <td width="5%">번호</td>
        <td width="15%">자격증</td>
        <td width="5%">유형</td>
        <td width="50%">문제</td>
        <td width="10%">유형</td>
        <td width="10%">정답률</td>
        <td width="5%">
        	<img src="${pageContext.request.contextPath}/resources/img/like.png" width="25"/>
        </td>
        <td width="5%">
        	<img src="${pageContext.request.contextPath}/resources/img/hate.png" width="25"/>
        </td>
    </tr>
    <c:forEach items="${LIST}" var="list">
    <tr>
        <td>${list.pno }</td>
        <td>${list.lname }</td>
        <td>${list.lqclass }</td>
        <td><a href="<%= request.getContextPath()%>/problem/selectMyProblem.co?pno=${list.pno}">${list.pdetail }</a></td>
        <c:if test="${list.ptype==1}">
        	<td>객관식</td>
        </c:if>
        <c:if test="${list.ptype==2}">
        	<td>단답식</td>
        </c:if>
        <c:if test="${list.ptype==3}">
        	<td>서술형</td>
        </c:if>
        
        <td>
        <c:if test="${problem.psolve!=0}">
					<fmt:parseNumber var="correct" integerOnly="true" value="${problem.pcorrect/problem.psolve*100}"/>
					${correct}%
				</c:if>
        </td>
        <td>${list.plike}</td>
        <td>${list.phate}</td>
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
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/myProblemList.co?nowPage=${PINFO.nowPage-1}">&laquo;</a>
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
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/myProblemList.co?nowPage=${pg}">${pg}</a>
				    </li>
					</c:forEach>
					
					<!-- 다음페이지 -->
					<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
					<li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/myProblemList?nowPage=${PINFO.nowPage+1}">&raquo;</a>
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

