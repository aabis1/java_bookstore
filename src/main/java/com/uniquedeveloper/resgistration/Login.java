package com.uniquedeveloper.resgistration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
    
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// 웹페이지에서 전달한 데이터를 변수로 받고,
		
		String userId = request.getParameter("userId");
		String Password = request.getParameter("password");
		
		
		Connection con = null;
		PrintWriter out = response.getWriter();
	
				
		
		try {
			
	

			String sql = "SELECT userId, Password FROM User";
	
			// 있다면 200을 return
			
			// 없다면 400을 return
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?useSSL=false&allowPublicKeyRetrieval=true","root","qwer1234");
			PreparedStatement pst = con.prepareStatement("select 1 from User where userId=? and password=?");
			pst.setString(1, userId);
			pst.setString(2, Password);
			
			var rowCount = pst.executeQuery();
			

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
