package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;


@WebServlet("/idCheck.do")
public class idCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		MemberDAO Dao = MemberDAO.getInstance();
		int result = Dao.confirmID(userid);

		request.setAttribute("userid", userid);
		request.setAttribute("result", result);

		request.getRequestDispatcher("member/idCheck.jsp").forward(request, response);
	}

}
