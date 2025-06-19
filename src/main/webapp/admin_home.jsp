<%@ page import="java.sql.*, com.cms.util.DBUtil" %>
<html>
<body style="font-family:Arial; background:#f4f6f9; padding:20px;">
    <h2>Admin Dashboard</h2>
    <a href="logout" style="padding:8px 12px; background:#dc3545; color:white; border-radius:5px; text-decoration:none;">Logout</a>
    <h3 style="margin-top:20px;">All Complaints</h3>

<%
    // get connection using ServletContext
    try(Connection con = DBUtil.getConnection(application)){ // pass 'application' object
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(
            "SELECT c.id,u.username,c.title,c.status,c.remarks " +
            "FROM complaints c JOIN users u ON c.user_id=u.id"
        );

        while(rs.next()){
%>
        <div style="background:white; padding:15px; margin:10px 0; border-radius:8px; box-shadow:0 0 5px #ccc;">
            <b><%= rs.getString("title") %></b> by <%= rs.getString("username") %><br/>
            <form action="complaint" method="post" style="margin-top:10px;">
                Status: <input type="text" name="status" value="<%=rs.getString("status")%>" style="padding:5px;"/>
                Remarks: <input type="text" name="remarks" value="<%=rs.getString("remarks")%>" style="padding:5px;"/>
                <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                <input type="hidden" name="action" value="update"/>
                <input type="submit" value="Update" style="padding:6px 12px; background:#28a745; color:white; border:none; border-radius:5px;"/>
            </form>
            <form action="complaint" method="post" style="margin-top:5px;">
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
</body>
</html>
