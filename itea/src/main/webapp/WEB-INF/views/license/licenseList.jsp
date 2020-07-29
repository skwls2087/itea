<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/license.css">

<main role="main">
<form>
  <div class="album py-5">
    <div class="container">
    <h2 class="license-heading">자격증 소개</h2>
      <div class="row">
      <!-- 관리자일때 -->
      <c:if test="${MNICK=='관리자'}">
      <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><title>자격증 등록</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em" id="admin-license-insert">+</text></svg>
            <div class="card-body">
              <p class="card-text"></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="<%= request.getContextPath()%>/license/licenseInsert.co"><button type="button" id="detailBtn" class="btn btn-sm btn-outline-danger" id="admin-license-insert">추가</button></a>
                </div>
              </div>
            </div>
          </div>
        </div>
        </c:if>
      <c:forEach  items="${LIST}" var="dto">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><title>${dto.lname}</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em" id="license-detail">${dto.lname}</text></svg>
            <div class="card-body">
              <p class="card-text"></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="<%= request.getContextPath()%>/license/detailView.co?lno=${dto.lno}"><button type="button" class="btn btn-sm btn-outline-info">상세보기</button></a>
                </div>
              </div>
            </div>
          </div>
        </div><!-- class="col-md-4" -->
       </c:forEach>  
     
    </div>
  </div>
</form>
</main>



