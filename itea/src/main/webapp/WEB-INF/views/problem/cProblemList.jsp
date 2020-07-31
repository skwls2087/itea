<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div>

    <p>내가 낸 문제 (List)</p>
<select>
        <option selected>자격증</option>
        <option>정보처리기사</option>
        <option>정보처리기능사</option>
        <option>정보처리산업기사</option>
    </select>
<table border="1">
    <tr>
        <td>문제번호</td>
        <td>자격증 시험 유형</td>
        <td>문제</td>
        <td>문제유형</td>
        <td>정답률</td>
        <td>좋아요</td>
        <td>싫어요</td>
    </tr>
    <c:forEach items="${LIST}" var="list">
    <tr>
        <td>${list.pno }</td>
        <td>${list.lqclass }</td>
        <td>${list.pcomment }</td>
        <c:if test="${list.ptype==1}">
        <td>객관식</td>
        </c:if>
        <c:if test="${list.ptype==2}">
        <td>단답식</td>
        </c:if>
        <c:if test="${list.ptype==3}">
        <td>서술형</td>
        </c:if>
        <td>${list.pcorrect/list.psolve}%</td>
        <td>${list.plike }</td>
        <td>${list.phate }</td>
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
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/cProblemList.co?nowPage=${PINFO.nowPage-1}">&laquo;</a>
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
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/cProblemList.co?nowPage=${pg}">${pg}</a>
				    </li>
					</c:forEach>
					
					<!-- 다음페이지 -->
					<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
					<li class="page-item">
				      <a class="page-link" href="<%= request.getContextPath()%>/problem/cProblemList?nowPage=${PINFO.nowPage+1}">&raquo;</a>
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

