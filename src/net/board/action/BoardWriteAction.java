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
		
		// �����������ؼ� ���� �ڹٺ����� ��Ű�� net.board.db �����̸� BoardBean
		// java.sql.Date ������
		// mysql ���ý��۳�¥ �������� �Լ� now()
		// boardBean bb ��ü����
		// ���Ķ���� -> �ڹٺ� ������� ����
		
		// BoardDAO bdao ��ü����
		// �޼���ȣ�� insertBoard(�� �Ķ���� ����� �ڹٺ� �ּ�)
		// �̵� ./BoardList.bo
		
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
