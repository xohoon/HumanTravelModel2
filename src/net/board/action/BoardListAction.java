package net.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("BoardListAction execute()");
		ActionForward forward = new ActionForward();
		
		// count pageSize pageNum startRow endRow currentPage 
		// boardList startPage endPage pageBlock
		
		// 저장 count pageNum boardList
		// pageCount pageBlock startPage endPage
		
		BoardDTO bdto = new BoardDTO();
		BoardDAO bdao = new BoardDAO();
		int count = bdao.getBoardCount();
		request.setAttribute("count", count);
		
		int pageSize = 3;
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		boardList = bdao.getBoardList(startRow, pageSize);
		
		// 이동 ./board/list.jsp

		forward.setRedirect(true);
		forward.setPath("./BoardList.bo");
		
		return forward;
	}
	
	

}
