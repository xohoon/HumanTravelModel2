package net.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	
	// �߻�޼ҵ� : �޼��� Ʋ
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// request, response �׻� ������ �ٴϸ鼭 ó��
	// ����ó���� �޼��� ȣ���ϴ� ������ ó��
	// ó���۾� �Ŀ� �̵� -> �̵������� ����(ActionForward) �ؼ� ������ ��
	
	
}
