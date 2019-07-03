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
		
		// 가상주소 뽑아오기 localhost:8282/Model2/BoardWrite.bo
		String requestURI = request.getRequestURI();
		// Model2/BoardWrite.bo
		String contextPath = request.getContextPath();
		// /Model2
		String command = requestURI.substring(contextPath.length());
		// /BOardWrite.bo
		
		System.out.println("uri:" + command);
		
		// 뽑아온 가상주소 비교
		ActionForward forward = null;
		Action action = null;
		if(command.equals("/BoardWrite.bo")) {
			// ./board/writeForm.jsp 이동
			// ActionFOrward 이동정보 저장
			// ActionForward 객체 생성
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/writeForm.jsp");
		}
		else if(command.equals("/BoardWriteAction.bo")){
			// BoardWriteAction java file 만들기 <- Action 을 적용
			// execute() 강제적으로 메서도 오버라이딩, 틀 강제적으로 적용
			// 부모 = BoardWriteAction 객체생성
			// 메서드 호출한 곳에서 예외처리
			// forward 이동정보에 저장 = execute() 메서드 호출
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
			// BoardListAction java파일 Action 인터페이스 상속
			// execute() 강제 오버라이딩
			// execute() 호출
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/list.jsp");
		}
		
		
		
		
		
		// 이동
		if(forward != null) { // forward 정보가 있으면
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
