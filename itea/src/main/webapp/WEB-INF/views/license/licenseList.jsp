<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
  <!-- <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>자격증 소개</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/album/">

    Bootstrap core CSS
<link href="../assets/dist/css/bootstrap.css" rel="stylesheet">
-->
		<script>
		$(function(){
			$("#rBtn").click(function(){
				alert("메인화면으로 이동합니다.");
				 	$(location).attr("href","../index.jsp");
			});
			$("#detailBtn").click(function(){
				alert("상세페이지로 이동합니다..");
				 	$(location).attr("href","");
			});
			
		});
		
		</script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
   <!--  Custom styles for this template
    <link href="album.css" rel="stylesheet">
 </head> -->
  <body>
  <form>
<main role="main">
	
  <div class="album py-5 bg-light">
    <div class="container">
			<a href="<%= request.getContextPath()%>/license/licenseInsert.co"><input type="button" id="iBtn" class="btn btn-secondary" value="등록"/></a>
      <div class="row">
      <c:forEach  items="${LIST}" var="dto">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><title>${dto.lname}</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">${dto.lname}</text></svg>
            <div class="card-body">
              <p class="card-text"></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="<%= request.getContextPath()%>/license/detailView.co?lno=${dto.lno}"><button type="button" id="detailBtn" class="btn btn-sm btn-outline-secondary">View</button></a>
                </div>
              </div>
            </div>
          </div>
        </div><!-- class="col-md-4" -->
       </c:forEach>  
     
      
    </div>
  </div>

</main>
<!-- 
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="../assets/dist/js/bootstrap.bundle.js"></script></body> -->
	<button type="button" id="rBtn" class="btn btn-secondary">메인화면으로</button>
</form>
</html>

