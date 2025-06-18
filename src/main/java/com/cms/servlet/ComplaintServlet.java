package com.cms.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/complaint")
public class ComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        int userId = (int) session.getAttribute("userId");

        try(Connection con = DBUtil.getConnection(getServletContext())) {
            if("add".equals(action)){
                PreparedStatement ps = con.prepareStatement("INSERT INTO complaints(user_id,title,description) VALUES(?,?,?)");
                ps.setInt(1,userId);
                ps.setString(2,req.getParameter("title"));
                ps.setString(3,req.getParameter("description"));
                ps.executeUpdate();
                resp.sendRedirect("employee_home.jsp");

            } else if("update".equals(action)){
                PreparedStatement ps = con.prepareStatement("UPDATE complaints SET status=?, remarks=? WHERE id=?");
                ps.setString(1, req.getParameter("status"));
                ps.setString(2, req.getParameter("remarks"));
                ps.setInt(3, Integer.parseInt(req.getParameter("id")));
                ps.executeUpdate();
                resp.sendRedirect("admin_home.jsp");

            } else if("delete".equals(action)){
                PreparedStatement ps = con.prepareStatement("DELETE FROM complaints WHERE id=?");
                ps.setInt(1,Integer.parseInt(req.getParameter("id")));
                ps.executeUpdate();
                if("admin".equals(session.getAttribute("role"))) resp.sendRedirect("admin_home.jsp");
                else resp.sendRedirect("employee_home.jsp");
            }
        } catch(Exception e){ e.printStackTrace(); resp.sendRedirect("error.jsp"); }
    }
}
