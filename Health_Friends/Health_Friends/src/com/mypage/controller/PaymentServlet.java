package com.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.Paging;
import com.login.dto.RegistDto;
import com.mypage.biz.PaymentBiz;
import com.mypage.biz.PaymentBizImpl;
import com.mypage.dto.PaymentDto;

@WebServlet("/payment.do")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		PaymentBiz biz = new PaymentBizImpl();
		
		if(command.equals("payment")){
			response.sendRedirect("./views/mypage/payment.jsp");
			
			
		} else if(command.equals("paymentRoleUp")) {
			String member_role = request.getParameter("member_role");
			
			if(member_role.equals("PREMIUM")) {
				jsResponse(response, "./views/mypage/mypage.jsp", "이미 프리미엄 회원입니다!");
			} else if(member_role.equals("USER")) {
				jsResponse(response, "./views/mypage/paymentGuide.jsp", "프리미엄 회원 등록 전 약관을 잘 읽어주세요!");
			} else {
				jsResponse(response, "./views/mypage/mypage.jsp", "관리자입니다! 관리자가 아니라면 관리자에게 문의해주세요!");
			}
			
			
			
		} else if(command.equals("paymentRoleDown")) {
			String member_role = request.getParameter("member_role");
			
			if(member_role.equals("USER")) {
				jsResponse(response, "./views/mypage/mypage.jsp", "프리미엄 회원이 아닙니다!");
			} else if(member_role.equals("PREMIUM")) {
				jsResponse(response, "./views/mypage/paymentCancel.jsp", "프리미엄 회원 탈퇴 전 약관을 잘 읽어주세요!");
			} else {
				jsResponse(response, "./views/mypage/myapge.jsp", "관리자입니다! 관리자가 아니라면 관리자에게 문의해주세요!");
			}
			
			
		} else if(command.equals("paymentUpdate")) {
			
			
			String member_email = request.getParameter("member_email");
			
			RegistDto dto = new RegistDto();
			dto.setMember_email(member_email);
			
			int res = biz.paymentUpdate(dto);
			
			if( res > 0 ) {
				
				int payment_account = Integer.parseInt(request.getParameter("amount"));
				
				PaymentDto payDto = new PaymentDto();
				payDto.setMember_email(member_email);
				payDto.setPayment_account(payment_account);
				
				int cnt = biz.paymentInsert(payDto);
				
				if(cnt > 0) {
					HttpSession session = request.getSession();
					RegistDto paymentDto = (RegistDto)session.getAttribute("Ldto");
					paymentDto.setMember_role("PREMIUM");
					session.setAttribute("Ldto", paymentDto);
					jsResponse(response, "./views/mypage/mypage.jsp", "프리미엄 회원이 되신걸 환영합니다!");
				}else {
					jsResponse(response, "./views/mypage/mypage.jsp", "오루발생!");
				}
			} else {
				jsResponse(response, "./views/mypage/mypage.jsp", "프리미엄 등록에 실패하였습니다! 다시 시도해주세요!");
			}
			

			
		} else if(command.equals("paymentDowndate")) {
			
			String member_email = request.getParameter("member_email");
			
			RegistDto dto = new RegistDto();
			dto.setMember_email(member_email);
			
			int res = biz.paymentDowndate(dto);
			
			if(res > 0) {
				
				HttpSession session = request.getSession();
				RegistDto paymentDto = (RegistDto)session.getAttribute("Ldto");
				paymentDto.setMember_role("USER");
				session.setAttribute("Ldto", paymentDto);
				
				jsResponse(response, "./views/mypage/mypage.jsp", "프리미엄이 탈퇴되었습니다!");
				
			} else {
				jsResponse(response, "./views/mypage/mypage.jsp", "탈퇴에 실패하셨습니다! 다시 시도 해주세요.");
			}
		} else if(command.equals("paymentList")) {
			
			List<PaymentDto> list = biz.paymentList();
			
			request.setAttribute("list", list);
			
			dispatch(request, response, "./views/mypage/paymentList.jsp");
			
		} else if(command.equals("paymentListMy")) {
			
			String member_email = request.getParameter("member_email");
			
			List<PaymentDto> list = biz.paymentListMy(member_email);
			
			request.setAttribute("list", list);
			
			dispatch(request, response, "./views/mypage/paymentListMy.jsp");
			
		}
		else if(command.equals("paymentListPaging")) {
			
			
			int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			
			int totalCount = biz.getTotalCount();
			
			Paging paging = new Paging();
			paging.setPageNo(pageNum);
			paging.setPageSize(10);
			paging.setTotalCount(totalCount);
			
			pageNum = (pageNum - 1) * 10;// 1 이면 0, 2이면 10, 3이면 20...
			
			// 어디부터 어디까지 가져올 건지 쓰는것 -> 쿼리 안쪽에서 계산해줌
			List<PaymentDto> list = biz.paymentListPaging(pageNum, paging.getPageSize());
			System.out.println("서블릿"+list);
			request.setAttribute("list", list);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("totalCount", totalCount);
			dispatch(request, response, "./views/mypage/paymentList.jsp");
		}
	}
	
	private void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('"+ msg +"');"
				+ "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().print(s);
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
}
