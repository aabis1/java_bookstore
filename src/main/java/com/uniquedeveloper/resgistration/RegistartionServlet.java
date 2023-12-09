package com.uniquedeveloper.resgistration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistartionServlet
 */
@WebServlet("/register")
public class RegistartionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
    public RegistartionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userName = request.getParameter("name");
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("password");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		PrintWriter out = response.getWriter();
				
		
		try {
			
			// Validate
			  // If Exist UserId, Return BadRequest (400)
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?useSSL=false&allowPublicKeyRetrieval=true","root","qwer1234");
			PreparedStatement pst = con.prepareStatement("Insert into user values(?,?,?) ");
			pst.setString(1, userId);
			pst.setString(2, userName);
			pst.setString(3, userPassword);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("registration.jsp");
			if(rowCount > 0) {
				response.setStatus(201);
				
			} else {
				response.setStatus(400);
			}
		} catch (Exception e) {
			e.printStackTrace();
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	}

}
