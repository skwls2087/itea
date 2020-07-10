<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- js/css 참조 -->
<script src="${pageContext.request.contextPath}/resources/js/problem.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/problem.css">

<div class="choice-Problem">
	객관식문제
	<textarea class="form-control" placeholder="내용을 입력해주세요" rows="5"></textarea>
	  <div class="form-group">
      <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
    </div>
    <table width="100%">
    	<div class="form-group">
    	<tr>
			<td width="10%">1.</td>
			<td width="80%"><textarea class="form-control" placeholder="내용을 입력해주세요" rows="3"></textarea> </td>
			<td width="10%">
			<div class="custom-control custom-radio">
		      <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
		      <label class="custom-control-label" for="customRadio1"></label>
		    </div>
		    </td>
		</tr>
	    <tr>
			<td>2.</td>
			<td><textarea class="form-control" placeholder="내용을 입력해주세요" rows="3"></textarea> </td>
			<td>
			<div class="custom-control custom-radio">
		      <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
		      <label class="custom-control-label" for="customRadio2"></label>
		    </div>
		    </td>
		</tr><tr>
			<td>3.</td>
			<td><textarea class="form-control" placeholder="내용을 입력해주세요" rows="3"></textarea> </td>
			<td>
			<div class="custom-control custom-radio">
		      <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
		      <label class="custom-control-label" for="customRadio3"></label>
		    </div>
		    </td>
		</tr><tr>
			<td>4.</td>
			<td><textarea class="form-control" placeholder="내용을 입력해주세요" rows="3"></textarea> </td>
			<td>
			<div class="custom-control custom-radio">
		      <input type="radio" id="customRadio4" name="customRadio" class="custom-control-input">
		      <label class="custom-control-label" for="customRadio4"></label>
		    </div>
		    </td>
		</tr>
		</div>
    </table>
    <input type="hidden" name="lqno" value="${lqno}"/>
    <input type="hidden" name="pyear" value="${pyear}"/>
    <input type="hidden" name="ptype" value="${ptype}"/>
    <input type="submit" class="btn btn-primary" value="출제하기">
</div>