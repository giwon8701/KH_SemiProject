<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<%-- 결제페이지인데 추후에 조금더 자세하게 수정해야함! --%>
<% RegistDto dto = (RegistDto) session.getAttribute("dto"); %>
<%
	int Price = 9900;
%>

    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp30454386'); // 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'Health Friends Premium',
            amount : <%=Price%>,
            member_email : '<%=dto.getMember_email()%>',
            member_name : '<%=dto.getMember_name()%>',
            member_tel : '<%=dto.getMember_phone()%>',
            member_addr : '<%=dto.getMember_addr()%>'
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                $.ajax({
                    url: '../../payment.do?command=paymentUpdate', //cross-domain error가 발생하지 않도록 주의
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid,
                        amount : <%=Price%>,
                        member_email : '<%=dto.getMember_email()%>',
                        member_name : '<%=dto.getMember_name()%>',
                        member_tel : '<%=dto.getMember_phone()%>',
                        member_addr : '<%=dto.getMember_addr()%>'
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                alert('결제가 완료되었습니다.');
                location="mypage.jsp"
                //window.close();
            } else {
                msg = '결제에 실패하였습니다.\n';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                alert(msg);
                location.href="paymentGuide.jsp";
                //window.close();
            }
        });
        
    });
    </script>
</body>
</html>