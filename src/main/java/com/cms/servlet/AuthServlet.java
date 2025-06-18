package com.cms.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

import com.cms.util.DBUtil;

@WebServlet("/login")
public class AuthServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String u = req.getParameter("username");
        String p = req.getParameter("password");

        try(Connection con = DBUtil.getConnection(getServletContext())) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1,u);
            ps.setString(2,p);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                HttpSession session = req.getSession();
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("role", rs.getString("role"));

                if("admin".equals(rs.getString("role"))) resp.sendRedirect("admin_home.jsp");
                else resp.sendRedirect("employee_home.jsp");
            } else resp.sendRedirect("error.jsp");
        } catch(Exception e){ e.printStackTrace(); resp.sendRedirect("error.jsp"); }
    }
}
