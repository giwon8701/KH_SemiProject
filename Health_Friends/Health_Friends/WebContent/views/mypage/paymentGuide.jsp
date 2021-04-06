<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
*{margin: 0;padding: 0;box-sizing: border-box}
body{background-color: #f7f7f7;}
ul>li{list-style: none}
a{text-decoration: none;}
.clearfix::after{content: "";display: block;clear: both;}

#joinForm{width: 460px;margin: 50px auto;}
ul.join_box{border: 1px solid #ddd;background-color: #fff;}
.checkBox,.checkBox>ul{position: relative;}
.checkBox>ul>li{float: left;}
.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none; resize:none;}
.footBtwrap{margin-top: 15px;}
.footBtwrap>li{float: left;width: 50%;height: 60px;}
.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}
.fpmgBt1{background-color: #fff;color:#888}
.fpmgBt2{background-color: lightsalmon;color: #fff}

#mpage01 {
border:none;
background-Color:FireBrick;
border: 1px solid FireBrick;  
font-size:16px;        
color: white;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#mpage02 {
border:none;
background-Color: white;
border: 1px solid FireBrick;  
font-size:16px;       
color: FireBrick;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}



</style>

<script type="text/javascript">
	
</script>
</head>
<body>

<form action="" id="joinForm">
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(선택), 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의</li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.
우리동네 운동메이트(이하 ‘서비스’)를 이용해 주셔서 감사합니다. 본 약관은 다양한  서비스의 이용과 관련하여 우리 동네 운동 메이트 서비스를 제공하는 우리 동네 운동 메이트 주식회사(이하 ‘우리 동네 운동 메이트’)와 이를 이용하는 우리 동네 운동 메이트 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 우리 동네 운동 메이트 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내</li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
우리 동네 운동 메이트 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 우리 동네 운동 메이트 서비스의 이용과 관련하여 우리 동네 운동 메이트 서비스를 제공하는 우리 동네 운동 메이트 주식회사(이하 ‘우리 동네 운동 메이트’)와 이를 이용하는 우리 동네 운동 메이트 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 우리 동네 운동 메이트 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의</li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
우리 동네 운동 메이트 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 우리 동네 운동 메이트 서비스의 이용과 관련하여 우리 동네 운동 메이트 서비스를 제공하는 우리 동네 운동 메이트 주식회사(이하 ‘우리 동네 운동 메이트’)와 이를 이용하는 우리 동네 운동 메이트 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 우리 동네 운동 메이트 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
              
            </ul>
           <div style="text-align:center"><br>
           <input type="button" id="mpage01" onclick="location.href='../../payment.do?command=payment'" value="결제하기">
			<input type="button" id="mpage02" onclick="location.href='mypage.jsp'" value="돌아가기">
			</div>
        </form>


<%-- 결제 전 안내 페이지... --%>


<!--  
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
-->
</body>
</html>