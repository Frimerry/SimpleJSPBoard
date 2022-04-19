package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;


@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="login.jsp";
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")!=null) {
			// 로그인 된 상태
			url = "main.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String url = "login.jsp";
		MemberVO member = null;
		MemberDAO Dao = MemberDAO.getInstance();	
		PrintWriter out = response.getWriter();

		int result = Dao.userCheck(userid, pwd);

		switch (result) {
		case 1: // id와 pwd가 일치
			member = Dao.getUser(userid);
			String name = member.getName();
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", member);
			session.setAttribute("name", name);	// 게시판 작성자명용 세션유지
			request.setAttribute("message", "로그인에 성공하였습니다.");
			url = "main.jsp";	// 로그인 성공하여 메인 이동
			break;
		case 0: // id 일치 pwd 불일치
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
			break;
		case -1: // id가 존재하지 않음
			out.print(userid);
			request.setAttribute("message", "존재하지않는 회원입니다.");
			break;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
