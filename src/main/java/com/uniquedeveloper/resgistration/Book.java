package com.uniquedeveloper.resgistration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uniquedeveloper.Model.BookItem;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Login
 */
@WebServlet("/book")
public class Book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		try {
		
        	int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
            int pageSize = request.getParameter("pageSize") == null ? 24 : Integer.parseInt(request.getParameter("pageSize"));
            String keyword = request.getParameter("keyword");
            
            Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?useSSL=false&allowPublicKeyRetrieval=true","root","qwer1234");
    		
    		String query = "Select * from book";
    		if(keyword != null && !keyword.isEmpty()) {
    			query += " where keyword='" + keyword + "' ";
    		}
    		query += " limit " + (pageNo -1) * pageSize + ", " + ((pageNo -1) * pageSize) + pageSize;
    		
    		PreparedStatement pst = con.prepareStatement(query);
    		
    		var rs = pst.executeQuery();
    		
    		List<BookItem> books = new ArrayList<>();

    		
    		while(rs.next()) {
				
    			
    			var id = rs.getInt(1);
    			var title = rs.getString(2);
    			var author = rs.getString(3);
    			var price = rs.getInt(4);
    			var description = rs.getString(5);
    			var imageUrl = rs.getString(6);
    			
    			BookItem bookItem = new BookItem(id, title, author, description, price, imageUrl);
    			books.add(bookItem);
			}
    		
    		
    		// 여기서 데이터 Json으로 변환 후 return
    		JSONArray jsonA = JSONArray.fromObject(books);
    		
    		response.setContentType("application/x-json; charset=utf-8");
            response.getWriter().print(jsonA);
    		
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
