<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function popUp(){
		var _width = '500';
		var _height = '600';

		var _left = Math.ceil(( window.screen.width - _width )/2);
		var _top = Math.ceil(( window.screen.width - _height )/2); 

		window.open('../../payment.do?command=payment', 'premium payment', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
	}
	
</script>
</head>
<body>
<%-- 결제 전 안내 페이지... --%>



<table border="1">
	<tr>
		<th colspan="2">이용약관</th>
	</tr>
	<tr>
		<td colspan="2">저희 health friends를 이용해주셔서 감사합니다....</td>
		
	</tr>
	<tr>
		<td align="center">
			<input type="button" onclick="location.href='../../payment.do?command=payment'" value="결제하기">
			<input type="button" onclick="location.href='mypage.jsp'" value="돌아가기">
		</td>
	</tr>
</table>

</body>
</html>