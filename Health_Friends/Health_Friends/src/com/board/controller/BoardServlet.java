package com.board.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.biz.BoardBiz;
import com.board.biz.BoardBizImpl;
import com.board.biz.ScrapBiz;
import com.board.biz.ScrapBizImpl;
import com.board.dto.BoardDto;
import com.board.dto.ScrapDto;
import com.common.Paging;
import com.login.biz.RegistBiz;
import com.login.biz.RegistBizImpl;
import com.login.dto.RegistDto;
import com.mypage.dto.PaymentDto;

@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		
		String command = request.getParameter("command");
		BoardBiz biz = new BoardBizImpl();
		HttpSession session = request.getSession();
		RegistDto ldto = (RegistDto)session.getAttribute("Ldto");
		
		try {
			if(command.equals("insert")) {
				dispatch(request, response, "./views/board/accompanyBoard_post.jsp");
				
			} else if(command.equals("insertres")) {
				String postLongitude = request.getParameter("postLongitude");
				String postTitle = request.getParameter("postTitle");
				String postCategoryName = request.getParameter("postCategoryName");
				String postContent = request.getParameter("postContent");
				System.out.println("postContent : " + postContent);
				int postUserNo = ldto.getMember_no();
				String postMdate = request.getParameter("postMdate");
				BoardDto dto = new BoardDto();
				dto.setPostUserNo(postUserNo);
				dto.setPostLongitude(postLongitude);
				dto.setPostCategoryName(postCategoryName);
				dto.setPostTitle(postTitle);
				dto.setPostContent(postContent);
				dto.setPostMdate(postMdate);
				int res = biz.accompany_insert(dto);
				if(res > 0) {
					response.sendRedirect("board.do?command=list");
				} else {
					response.sendRedirect("board.do?command=insert");
				}
				
			} else if(command.equals("select")) {
				int postId = Integer.parseInt(request.getParameter("postId"));
				
				BoardDto dto = biz.accompany_selectOne(postId);
				int user_no = dto.getPostUserNo();
				
				RegistBiz rbiz = new RegistBizImpl();
				RegistDto rdto = rbiz.selectByNo(user_no);
				String member_id = rdto.getMember_id();
				
				ScrapBiz sbiz = new ScrapBizImpl();
				
				int scrap_user_no = ldto.getMember_no();
				
				ScrapDto sdto = new ScrapDto();
				sdto.setScrap_post_id(postId);
				sdto.setScrap_user_no(scrap_user_no);
				
				int res = sbiz.scrapChk(sdto);
				
				request.setAttribute("res", res);
				request.setAttribute("dto", dto);
				request.setAttribute("member_id", member_id);
				dispatch(request, response, "./views/board/accompanyBoard_select.jsp");
				
			} else if(command.equals("updateform")) {	
				int postId = Integer.parseInt(request.getParameter("postId"));
				BoardDto dto = biz.accompany_selectOne(postId);
				request.setAttribute("dto", dto);
				dispatch(request, response, "./views/board/accompanyBoard_update.jsp");
			
			} else if(command.equals("updateres")) {
				int postId = Integer.parseInt(request.getParameter("postId"));
				String postLongitude = request.getParameter("postLongitude");
				String postTitle = request.getParameter("postTitle");
				String postCategoryName = request.getParameter("postCategoryName");
				String postContent = request.getParameter("postContent");
				String postMdate = request.getParameter("postMdate");
				BoardDto dto = new BoardDto();
				dto.setPostLongitude(postLongitude);
				dto.setPostCategoryName(postCategoryName);
				dto.setPostTitle(postTitle);
				dto.setPostContent(postContent);
				dto.setPostMdate(postMdate);
				dto.setPostId(postId);
				
				int res = biz.accompany_update(dto);
				if (res > 0) {
					response.sendRedirect("board.do?command=list&postId=" + postId);
				} else {
					response.sendRedirect("./views/board/" );
				}
				
			} else if(command.equals("delete")) {
				int postId = Integer.parseInt(request.getParameter("postId"));
				int res = biz.accompany_delete(postId);
				if (res > 0) {
					response.sendRedirect("board.do?command=list");
				} else {
					response.sendRedirect("board.do?command=select&postId=" + postId);
				}
			} else if(command.equals("list")) {
				
				int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
				System.out.println("서블릿 pageNum : " + pageNum);
				int totalCount = biz.accompanyGetTotalCount();
				System.out.println(totalCount);
				
				Paging paging = new Paging();
				paging.setPageNo(pageNum);
				paging.setPageSize(10);
				paging.setTotalCount(totalCount);
				
				pageNum = (pageNum - 1) * 10;
				
				System.out.println(pageNum);
				System.out.println(paging.getPageSize());
				
				List<BoardDto> list = biz.accompany_selectListPaging(pageNum, paging.getPageSize());
				request.setAttribute("list", list);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("totalCount", totalCount);
				dispatch(request, response, "./views/board/accompanyBoard.jsp");
			} else if(command.equals("scrapSelect")) {
				int postid = Integer.parseInt(request.getParameter("postid"));
				
				int scrap_user_no = ((RegistDto)session.getAttribute("Ldto")).getMember_no();
				
				ScrapBiz sbiz = new ScrapBizImpl();
				
				ScrapDto sdto = new ScrapDto();
				sdto.setScrap_post_id(postid);
				sdto.setScrap_user_no(scrap_user_no);
				
				int res = sbiz.scrapChk(sdto);
				
				BoardDto dto = biz.selectOneByPostId(postid);
				String boardname = dto.getPostBoardName();
				System.out.println(dto.toString());
				System.out.println(boardname);
				if(boardname.equals("ACCOMPANY")) {
					dispatch(request, response, "board.do?command=select&postId="+postid+"&res="+res);
				} else if(boardname.equals("PHOTO")) {
					dispatch(request, response, "review.do?command=select&postId="+postid+"&res="+res);
				}
			}
			
		} catch(Exception e){
			response.sendRedirect("./views/common/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
}