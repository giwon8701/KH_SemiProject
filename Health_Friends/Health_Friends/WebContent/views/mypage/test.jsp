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
function click(){
    var curDate = new Date();
    var from_date = new Date(Date.parse(curDate) - 5 * 1000 * 60 * 60 * 24);  //before 5days
    var to_date = new Date(Date.parse(curDate) + 5 * 1000 * 60 * 60 * 24);  //after 5days
  
    
    eval('document.frm.from_date').value =
      timeSt(from_date).substring(0,4)+'/'
      +timeSt(from_date).substring(5,7)+'/'
      +timeSt(from_date).substring(8,10); 
    eval('document.frm.to_date').value =
      timeSt(to_date).substring(0,4)+'/'
      +timeSt(to_date).substring(5,7)+'/'
      +timeSt(to_date).substring(8,10);   
  }

  function timeSt(dt) {
    var d = new Date(dt);
    var yyyy = d.getFullYear();
    var MM = d.getMonth()+1;
    var dd = d.getDate();
    var hh = d.getHours();
    var mm = d.getMinutes();
    var ss = d.getSeconds();
    return (yyyy + '-' + addzero(MM) + '-' + addzero(dd) + ' '
              + addzero(hh) + ':' + addzero(mm) + ':' + addzero(ss));
  }
  //10보다 작으면 앞에 0을 붙임
  function addzero(n) {
    return n < 10 ? "0" + n : n;
  } 
</script>
</head>
<body>

</body>
</html>