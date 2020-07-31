<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang = "ko">
<head>
	<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<!-- jQuery CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/survey.css">

</head>	
<body>

<c:if test="${RESULT==0 }"> 
<div class="survey1">
 <img src="${pageContext.request.contextPath}/resources/img/0.PNG" ><br/>
	당신은 개발자로써의 꿈을 다시한번 생각해보세요.<br/>
	10년뒤 당신의 출근길에 깊은 한숨을 예상합니다. <br/>
	그래도 노력한다면 당신은 만족하는 개발자가 될 것입니다.
	단! 많.은.노.력. 그게 필요합니다.
</div>
</c:if>
<c:if test="${RESULT==1 }">
<div class="survey1">
 <img src="${pageContext.request.contextPath}/resources/img/1.PNG" ><br/>
     미래에서 왔습니다.<br/>   
     개발자로써 당신은 고민이 필요합니다.<br/>
 	지금의 노력에 따라 미래 당신의 직업 만족도가 달려있어요.<br/>
 	돈 때문이 아닌 만족을 하며 일하려면 노력이 필요합니다.<br/>
 	미래는 지금의 행동에 모든 결과를 미칩니다.
</div>
</c:if>
<c:if test="${RESULT==2 }"> 
<div class="survey1">
<img src="${pageContext.request.contextPath}/resources/img/2.PNG" ><br/>
 if(당신!=개발자)는 false<br/>
 당신은~ 개발자가 되기위해  태.어.난. 사람~!<br/>
조금의 노력만 기울인다면, 당신은 미래의 <br/> 
스티브 잡스처럼 이름을 날리겠어요.<br/>
그때, 이 테스트를 기억해주세요.
</div>
</c:if>


 <a href="<%= request.getContextPath()%>/itLab/itLab.co"><input type="button"  class="btn-back" value="되돌아가기"></a>

</body>