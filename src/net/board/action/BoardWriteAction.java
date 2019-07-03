package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.controller.Action;
import net.board.controller.ActionForward;
import net.board.db.BoardDAO;
import net.board.db.BoardDTO;

public class BoardWriteAction implements Action{
	
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardWriteAction execute()");
		ActionForward forward = new ActionForward();
		
		// 데이터저장해서 전송 자바빈파일 패키지 net.board.db 파일이름 BoardBean
		// java.sql.Date 형지정
		// mysql 현시스템날짜 가져오는 함수 now()
		// boardBean bb 객체생성
		// 폼파라미터 -> 자바빈 멤버변수 저장
		
		// BoardDAO bdao 객체생성
		// 메서드호출 insertBoard(폼 파라미터 저장된 자바빈 주소)
		// 이동 ./BoardList.bo
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		BoardDTO bdto = new BoardDTO();

		bdto.setSubject(subject);
		bdto.setContent(content);
		
		BoardDAO bdao = new BoardDAO();
		bdao.insertBoard(bdto);
		
		
		
		
		
		forward.setRedirect(true);
		forward.setPath("./BoardListAction.bo");
		
		
		return forward;
	}

	

}
