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
	
	<script>
	$(function(){

	});
	</script>
</head>	
<body>
	  <div >
        <table border="1">
            <td><h1>당신은 개발자로써 만족하며 살수 있을까요?</h1>
               		<h2>당신이 스스로를 바라볼때,<br/>
                                         해당 질문에 대해 동의한다면 "맞다"를 비동의 한다면 "아니다"를 선택해주세요. </h2>
                <a href="<%= request.getContextPath()%>/itLab/itTestDetail.co"><input type="button" id="startBtn" name="startBtn" class="" value="시작하기"/></a>
								<br/><br/><br/><br/>
                <h5>(해당 자료는 Stack overflow 의 2017년 SURVEY에서  사용되었던 문제입니다.<br/>
  						    5만명의 조사에  참여해주신 분들중 개발자로써 활동을 하고 있는 사람들이 자신들의 성향에 대한 응답을 했고, 그와 함께  자신들의 직업 만족도를 표시한 것을 응용하였습니다.)</h5>                
            </td>
        </table>
    </div>
	 
</body>