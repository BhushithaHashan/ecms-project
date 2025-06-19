<%@ page import="java.sql.*, com.cms.util.DBUtil" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if(userId == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<body style="font-family:Arial; background:#fafafa; padding:20px;">
    <h2>Employee Dashboard</h2>
    <p>
        <a href="complaint_form.jsp" style="padding:8px 12px; background:#007BFF; color:white; text-decoration:none; border-radius:5px;">Submit Complaint</a>
        <a href="logout" style="padding:8px 12px; background:#dc3545; color:white; text-decoration:none; border-radius:5px;">Logout</a>
    </p>

    <h3>Your Complaints</h3>
    <div style="margin-top:15px;">
    <%
        try(Connection con = DBUtil.getConnection(application)){
            PreparedStatement ps = con.prepareStatement(
                "SELECT id, title, status FROM complaints WHERE user_id=?"
            );
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
    %>
        <div style="background:white; padding:15px; margin:10px 0; border-radius:8px; box-shadow:0 0 5px #ccc;">
            <b><%= rs.getString("title") %></b> — <%= rs.getString("status") %>
            <form action="complaint" method="post" style="margin-top:8px;">
                <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                <input type="hidden" name="action" value="delete"/>
                <input type="submit" value="Delete" style="padding:6px 12px; background:#dc3545; color:white; border:none; border-radius:5px;"/>
            </form>
        </div>
    <%
            }
        } catch(Exception e){
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        }
    %>
    </div>
</body>
</html>
