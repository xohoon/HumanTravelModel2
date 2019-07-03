package net.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.BoardListAction;
import net.board.action.BoardWriteAction;

public class BoardFrontController extends HttpServlet{

	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// �����ּ� �̾ƿ��� localhost:8282/Model2/BoardWrite.bo
		String requestURI = request.getRequestURI();
		// Model2/BoardWrite.bo
		String contextPath = request.getContextPath();
		// /Model2
		String command = requestURI.substring(contextPath.length());
		// /BOardWrite.bo
		
		System.out.println("uri:" + command);
		
		// �̾ƿ� �����ּ� ��
		ActionForward forward = null;
		Action action = null;
		if(command.equals("/BoardWrite.bo")) {
			// ./board/writeForm.jsp �̵�
			// ActionFOrward �̵����� ����
			// ActionForward ��ü ����
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/writeForm.jsp");
		}
		else if(command.equals("/BoardWriteAction.bo")){
			// BoardWriteAction java file ����� <- Action �� ����
			// execute() ���������� �޼��� �������̵�, Ʋ ���������� ����
			// �θ� = BoardWriteAction ��ü����
			// �޼��� ȣ���� ������ ����ó��
			// forward �̵������� ���� = execute() �޼��� ȣ��
			action = new BoardWriteAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/BoardListAction.bo")) {
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/BoardList.bo")) {
			// BoardListAction java���� Action �������̽� ���
			// execute() ���� �������̵�
			// execute() ȣ��
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/list.jsp");
		}
		
		
		
		
		
		// �̵�
		if(forward != null) { // forward ������ ������
			if(forward.isRedirect() == true) {
				// true -> sendRedirect()
				response.sendRedirect(forward.getPath());
			} else {
				// false -> forward()
				RequestDispatcher dispt = request.getRequestDispatcher(forward.getPath());
				dispt.forward(request, response);
			}
			
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	

}
